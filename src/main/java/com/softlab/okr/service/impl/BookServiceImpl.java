package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.entity.Book;
import com.softlab.okr.entity.BookTag;
import com.softlab.okr.entity.Tag;
import com.softlab.okr.mapper.BookMapper;
import com.softlab.okr.model.dto.BookChangeDTO;
import com.softlab.okr.model.dto.BookQueryDTO;
import com.softlab.okr.model.enums.BookEnum;
import com.softlab.okr.model.exception.BusinessException;
import com.softlab.okr.model.vo.BookVO;
import com.softlab.okr.security.IAuthenticationService;
import com.softlab.okr.service.IBookService;
import com.softlab.okr.service.IBookTagService;
import com.softlab.okr.service.IBookUserService;
import com.softlab.okr.service.ITagService;
import com.softlab.okr.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;

@Service
public class BookServiceImpl extends ServiceImpl<BookMapper, Book> implements
        IBookService {

    @Autowired
    private BookMapper bookMapper;

    @Autowired
    private IAuthenticationService authenticationService;

    @Autowired
    private IBookTagService bookTagService;

    @Autowired
    private ITagService tagService;

    @Autowired
    private IBookUserService bookUserService;

    @Override
    public void saveBook(String bookName) {
        Book book = new Book(null, bookName, null, null, 0);
        if (bookMapper.insert(book) != 1) {
            throw new BusinessException("??????????????????");
        }
    }

    @Override
    public void removeBook(int bookId) {
        if (bookMapper.deleteById(bookId) != 1) {
            throw new BusinessException("??????????????????");
        }
    }

    @Override
    @Transactional
    public void borrowBook(int bookId) {
        Book book = bookMapper.selectOne(new QueryWrapper<Book>().eq("book_id", bookId));
        if (book.getStatus() == 1) {
            throw new BusinessException("??????????????????");
        }
        book.setStatus(BookEnum.BORROW.code());
        Integer userId = authenticationService.getUserId();
        if (bookMapper.updateById(book) != 1 || bookUserService. (BookId, userId);){
            throw new BusinessException("????????????");
        }
    }

    @Override
    public int returnBook(int bookId) {
        return bookMapper
                .update(null, new UpdateWrapper<Book>().eq("book_id", bookId).set("user_id", null));
    }

    @Override
    @Transactional
    public void modifyBook(BookChangeDTO dto) {
        Book book = bookMapper.selectById(dto.getBookId());
        if (null == book) {
            throw new BusinessException("??????????????????");
        }
        book.setBookName(dto.getBookName());
        book.setPublisher(dto.getPublisher());
        book.setStatus(BookEnum.getCode(dto.getStatusName()));
        if (bookMapper.updateById(book) != 1) {
            throw new BusinessException("????????????????????????");
        }

        List<Tag> tagList = tagService.list();
        bookTagService.remove(new QueryWrapper<BookTag>().eq("book_id", dto.getBookId()));
        List<BookTag> bookTagList = new ArrayList<>();
        dto.getTagList().forEach(tagName -> {
            BookTag bookTag = new BookTag();
            bookTag.setBookId(dto.getBookId());
            tagList.forEach(tag -> {
                if (tag.getName().equals(tagName)) {
                    bookTag.setTagId(tag.getTagId());
                    bookTagList.add(bookTag);
                }
            });
        });
        List<BookTag> result =
                bookTagList.stream().filter(distinctByKey(BookTag::getTagId)).collect(Collectors.toList());
        if (result.size() != dto.getTagList().size()) {
            throw new BusinessException("???????????????????????????????????????");
        }
        if (!result.isEmpty() && !bookTagService.saveBatch(result)) {
            throw new BusinessException("??????????????????");
        }
    }

    @Override
    public void modifyBookImg(int bookId, MultipartFile file) {
        // ??????base64???????????????
        String img = null;
        byte[] data;
        try {
            data = file.getBytes();
            if (data.length > 1024000) {
                throw new BusinessException("??????????????????????????????1M?????????");
            }
            Base64.Encoder encoder = Base64.getEncoder();
            img = "data:image/png;base64," + encoder.encodeToString(file.getBytes());
        } catch (IOException e) {
            throw new BusinessException("?????????????????????");
        }
        if (bookMapper.update(null, new UpdateWrapper<Book>().eq("book_id", bookId)
                .set("img", img)) != 1) {
            throw new BusinessException("???????????????????????????");
        }
    }

    @Override
    public Result getBookList(BookQueryDTO dto) {
        Page<Book> page = new Page<>(dto.getIndex(), dto.getPageSize());
        Page<BookVO> voPage = bookMapper.selectBookList(page, dto.getBookName(),
                dto.getPublisher());
        voPage.getRecords().forEach(vo -> {
            vo.setStatusName(BookEnum.getMessage(vo.getStatus()));
        });
        return Result.success(voPage.getRecords(), voPage.getCurrent(), voPage.getTotal());
    }

    @Override
    public BookVO getBook(int bookId) {
        BookVO vo = bookMapper.selectBook(bookId);
        if (null == vo) {
            throw new BusinessException("????????????????????????");
        }
        vo.setStatusName(BookEnum.getMessage(vo.getStatus()));
        return vo;
    }

    private static <T> Predicate<T> distinctByKey(Function<? super T, ?> keyExtractor) {
        Set<Object> seen = ConcurrentHashMap.newKeySet();
        return t -> seen.add(keyExtractor.apply(t));
    }
}
