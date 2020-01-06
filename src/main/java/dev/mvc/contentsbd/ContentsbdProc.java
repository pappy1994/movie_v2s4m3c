package dev.mvc.contentsbd;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.contentsbd.ContentsbdProc")
public class ContentsbdProc implements ContentsbdProcInter {
  @Autowired
  private ContentsbdDAOInter contentsbdDAO;
  
  @Override
  public int create(ContentsbdVO contentsbdVO) {
    int cnt = contentsbdDAO.create(contentsbdVO);
    return cnt;
  }

  @Override
  public List<ContentsbdVO> list_all() {
    List<ContentsbdVO> list = contentsbdDAO.list_all();
    return list;
  }

  @Override
  public List<ContentsbdVO> list_by_boardgrpno(int boardgrpno) {
    List<ContentsbdVO> list = contentsbdDAO.list_by_boardgrpno(boardgrpno);
    return list;
  }

  @Override
  public int total_count() {
    int cnt = contentsbdDAO.total_count();
    return cnt;
  }

  @Override
  public ContentsbdVO read(int contentsbdno) {
    ContentsbdVO contentsbdVO = contentsbdDAO.read(contentsbdno);
    return contentsbdVO;
  }

  @Override
  public int update(ContentsbdVO contentsbdVO) {
   int cnt = contentsbdDAO.update(contentsbdVO);
    return cnt;
  }

  @Override
  public int delete(int contentsbdno) {
   int cnt = contentsbdDAO.delete(contentsbdno);
    return cnt;
  }

  @Override
  public int count_by_boardgrpno(int boardgrpno) {
    int cnt = contentsbdDAO.count_by_boardgrpno(boardgrpno);
    return cnt;
  }

  @Override
  public int delete_by_boardgrpno(int boardgrpno) {
    int cnt = contentsbdDAO.delete_by_boardgrpno(boardgrpno);
    return cnt;
  }

  @Override
  public int increaseReplycnt(int contentsno) {
   int cnt = contentsbdDAO.increaseReplycnt(contentsno);
    return cnt;
  }

  @Override
  public int decreaseReplycnt(int contentsno) {
   int cnt = contentsbdDAO.decreaseReplycnt(contentsno);
    return cnt;
  }

  @Override
  public int liketo(int contentsbdno) {
   int cnt = contentsbdDAO.liketo(contentsbdno);
    return cnt;
  }

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
