package com.softlab.okr.service.ServiceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.softlab.okr.mapper.BookMapper;
import com.softlab.okr.mapper.UserInfoMapper;
import com.softlab.okr.model.bo.BookTagBo;
import com.softlab.okr.model.dto.BookDTO;
import com.softlab.okr.model.enums.statusCode.BookStatus;
import com.softlab.okr.model.vo.BookVO;
import com.softlab.okr.service.BookService;
import com.softlab.okr.service.TagService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BookServiceImpl implements BookService {

  @Autowired
  private BookMapper bookMapper;

  @Autowired
  private UserInfoMapper userInfoMapper;

  @Autowired
  private TagService tagService;

  @Override
  @Transactional(
      propagation = Propagation.REQUIRED,
      isolation = Isolation.READ_COMMITTED,
      rollbackFor = Exception.class,
      readOnly = false)
  public int saveBook(BookVO vo) {
    BookTagBo bookTagBo = new BookTagBo(vo.getBookId(), vo.getTagIdList());
    bookMapper.insertBookTag(bookTagBo);
    return bookMapper.insertBook(vo);
  }

  @Override
  @Transactional(
      propagation = Propagation.REQUIRED,
      isolation = Isolation.READ_COMMITTED,
      rollbackFor = Exception.class,
      readOnly = false)
  public int removeById(int bookId) {
    bookMapper.deleteBookTagByBookId(bookId);
    return bookMapper.deleteById(bookId);
  }

  @Override
  public int borrowBook(int bookId, int userId) {
    return bookMapper.borrowBook(bookId, userId);
  }

  @Override
  public int returnBook(int bookId, int userId) {
    return bookMapper.returnBook(bookId, userId);
  }

  @Override
  @Transactional(
      propagation = Propagation.REQUIRED,
      isolation = Isolation.READ_COMMITTED,
      rollbackFor = Exception.class,
      readOnly = false)
  public int modifyById(BookVO vo) {
    List<Integer> tagIdList = vo.getTagIdList();
    BookTagBo bookTagBo = new BookTagBo(vo.getBookId(), tagIdList);
    bookMapper.deleteBookTagByBookId(vo.getBookId());
    bookMapper.insertBookTag(bookTagBo);
    vo.setStatus(BookStatus.getCode(vo.getStatusName()));
    return bookMapper.updateById(vo);
  }

  @Override
  public int modifyBookImg(int bookId, String img) {
    return bookMapper.updateImg(bookId, img);
  }

  @Override
  public List<BookVO> list() {
    return bookMapper.selectList();
  }

  @Override
  public PageInfo<BookVO> getByCond(BookDTO dto) {
    PageHelper.startPage(dto.getIndex(), dto.getPageSize());
    List<BookVO> list = bookMapper.selectByCond(dto.getBookName(), dto.getPublisher(),
        BookStatus.getCode(dto.getStatusName()));
    list.forEach(vo -> {
      vo.setStatusName(BookStatus.getMessage(vo.getStatus()));
      vo.setTagIdList(bookMapper.selectTagIdByBookId(vo.getBookId()));
    });
    return new PageInfo<>(list);
  }
}
