package dev.mvc.qnagrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

// 빈의 이름 지정
@Component("dev.mvc.qnagrp.QnagrpProc")
public class QnagrpProc implements QnagrpProcInter {
  // CategrpDAOInter가 MyBATIS를 호출하는 코드가 자동구현됨.
  // 자동 구현된 클래스의 객체가 자동 할당됨.
  @Autowired
  private QnagrpDAOInter qnagrpDAO; 
  
  @Override
  public int create(QnagrpVO qnagrpVO) {
    int cnt = qnagrpDAO.create(qnagrpVO);
    return cnt;
  }

  @Override
  public List<QnagrpVO> list_seqno_asc() {
    List<QnagrpVO> list = qnagrpDAO.list_seqno_asc();
    
    return list;
  }
  
  @Override
  public int update(QnagrpVO qnagrpVO) {
    int count = qnagrpDAO.update(qnagrpVO);
    return count;
  }
  
  @Override
  public QnagrpVO read(int qnagrpno) {
    QnagrpVO qnagrpVO = qnagrpDAO.read(qnagrpno);
    return qnagrpVO;
  }
  
  @Override
  public int delete(int qnagrpno) {
    int cnt = qnagrpDAO.delete(qnagrpno);
    return cnt;
  }

  @Override
  public int update_seqno_up(int qnagrpno) {
    int count = qnagrpDAO.update_seqno_up(qnagrpno);

    return count;
  }

  @Override
  public int update_seqno_down(int qnagrpno) {
    int count = qnagrpDAO.update_seqno_down(qnagrpno);
    
    return count;
  }
  

}



