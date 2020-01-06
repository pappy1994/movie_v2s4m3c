package dev.mvc.boardgrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

//빈의 이름 지정
@Component("dev.mvc.boardgrp.BoardgrpProc")
public class BoardgrpProc implements BoardgrpProcInter {
  // CategrpDAOInter가 MyBatis를 호출하는 코드가 자동 구현됨.
  // 자동 구현된 class의 객체가 자동 할당됨.
  @Autowired
  private BoardgrpDAOInter boardgrpDAO;

  @Override
  public int create(BoardgrpVO boardgrpVO) {
    int cnt = boardgrpDAO.create(boardgrpVO);
    return cnt;
  }

  @Override
  public List<BoardgrpVO> list() {
    List<BoardgrpVO> list = boardgrpDAO.list();
    return list;
  }

  @Override
  public int update_seqno_up(int boardgrpno) {
   int cnt = boardgrpDAO.update_seqno_up(boardgrpno);
    return cnt;
  }

  @Override
  public int update_seqno_down(int boardgrpno) {
    int cnt = boardgrpDAO.update_seqno_down(boardgrpno);
    return cnt;
  }

  @Override
  public BoardgrpVO read(int boardgrpno) {
    BoardgrpVO boardgrpVO = boardgrpDAO.read(boardgrpno);
    return boardgrpVO;
  }

  @Override
  public int update(BoardgrpVO boardgrpVO) {
    int cnt = boardgrpDAO.update(boardgrpVO);
    return cnt;
  }

  @Override
  public int delete(int boardgrpno) {
    int cnt = boardgrpDAO.delete(boardgrpno);
    return cnt;
  }

  @Override
  public int increaseCnt(int boardgrpno) {
   int cnt = boardgrpDAO.increaseCnt(boardgrpno);
    return cnt;
  }

  @Override
  public int decreaseCnt(int boardgrpno) {
   int cnt = boardgrpDAO.decreaseCnt(boardgrpno);
    return cnt;
  }

  @Override
  public int cnt_zero(int boardgrpno) {
   int cnt = boardgrpDAO.cnt_zero(boardgrpno);
    return cnt;
  }

  
  
}
