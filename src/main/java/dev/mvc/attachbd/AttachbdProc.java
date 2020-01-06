package dev.mvc.attachbd;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

// 빈의 이름 지정
@Component("dev.mvc.attachbd.AttachbdProc")
public class AttachbdProc implements AttachbdProcInter {
  @Autowired
  private AttachbdDAOInter attachbdDAO;

  @Override
  public int create(AttachbdVO attachbdVO) {
   int cnt = attachbdDAO.create(attachbdVO);
    return cnt;
  }

  @Override
  public List<Contentsbd_AttachbdVO> list() {
    List<Contentsbd_AttachbdVO> list =  attachbdDAO.list();
    return list;
  }

  @Override
  public List<AttachbdVO> list_by_contentsbdno(int contentsbdno) {
    List<AttachbdVO> list = attachbdDAO.list_by_contentsbdno(contentsbdno);
    return list;
  }

  @Override
  public int delete(int attachbdno) {
    int cnt = attachbdDAO.delete(attachbdno);
    return cnt;
  }

  @Override
  public int count_by_contentsbdno(int contentsbdno) {
   int cnt = attachbdDAO.count_by_contentsbdno(contentsbdno);
    return cnt;
  }

  @Override
  public int delete_by_contentsbdno(int contentsbdno) {
   int cnt = attachbdDAO.delete_by_contentsbdno(contentsbdno);
    return cnt;
  } 
  
}




