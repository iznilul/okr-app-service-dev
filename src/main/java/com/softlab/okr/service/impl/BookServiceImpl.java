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
import com.softlab.okr.model.enums.BookUserEnum;
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
            throw new BusinessException("书籍添加失败");
        }
    }

    @Override
    public void removeBook(int bookId) {
        if (bookMapper.deleteById(bookId) != 1) {
            throw new BusinessException("书籍删除失败");
        }
    }

    @Override
    @Transactional
    public void borrowBook(int bookId) {
        Book book = bookMapper.selectOne(new QueryWrapper<Book>().eq("book_id", bookId));
        if (book.getStatus() == 1) {
            throw new BusinessException("此书已被借走");
        }
        if (book.getStatus() == 2) {
            throw new BusinessException("此书已丢失");
        }
        book.setStatus(BookEnum.BORROW.code());
        Integer userId = authenticationService.getUserId();
        if (bookMapper.updateById(book) != 1) {
            throw new BusinessException("借书失败");
        }
        bookUserService.saveBookUser(bookId, userId, BookUserEnum.NOT_RETURN.code());
    }

    @Override
    public void returnBook(int bookId) {
        Book book = bookMapper.selectOne(new QueryWrapper<Book>().eq("book_id", bookId));
        if (book.getStatus() == 0) {
            throw new BusinessException("此书未被借走");
        }
        if (book.getStatus() == 2) {
            throw new BusinessException("此书已丢失");
        }
        book.setStatus(BookEnum.FREE.code());
        Integer userId = authenticationService.getUserId();
        if (bookMapper.updateById(book) != 1) {
            throw new BusinessException("还书失败");
        }
        bookUserService.modifyBookUser(bookId, userId, BookUserEnum.RETURNED.code());
    }

    @Override
    @Transactional
    public void modifyBook(BookChangeDTO dto) {
        Book book = bookMapper.selectById(dto.getBookId());
        if (null == book) {
            throw new BusinessException("书籍查找错误");
        }
        book.setBookName(dto.getBookName());
        book.setPublisher(dto.getPublisher());
        book.setStatus(BookEnum.getCode(dto.getStatusName()));
        if (bookMapper.updateById(book) != 1) {
            throw new BusinessException("书籍信息更新失败");
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
            throw new BusinessException("标签规范不一致，请重新操作");
        }
        if (!result.isEmpty() && !bookTagService.saveBatch(result)) {
            throw new BusinessException("标签更新失败");
        }
    }

    @Override
    public void modifyBookImg(int bookId, MultipartFile file) {
        // 通过base64来转化图片
        String img = null;
        byte[] data;
        try {
            data = file.getBytes();
            if (data.length > 1024000) {
                throw new BusinessException("文件太大，请上传小于1M的图片");
            }
            Base64.Encoder encoder = Base64.getEncoder();
            img = "data:image/png;base64," + encoder.encodeToString(file.getBytes());
        } catch (IOException e) {
            throw new BusinessException("文件流转换出错");
        }
        if (bookMapper.update(null, new UpdateWrapper<Book>().eq("book_id", bookId)
                .set("img", img)) != 1) {
            throw new BusinessException("持久化到数据库错误");
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
            throw new BusinessException("获取书籍信息失败");
        }
        vo.setStatusName(BookEnum.getMessage(vo.getStatus()));
        return vo;
    }

    private static <T> Predicate<T> distinctByKey(Function<? super T, ?> keyExtractor) {
        Set<Object> seen = ConcurrentHashMap.newKeySet();
        return t -> seen.add(keyExtractor.apply(t));
    }
}
