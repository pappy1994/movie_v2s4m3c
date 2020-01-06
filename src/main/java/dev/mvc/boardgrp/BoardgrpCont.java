package dev.mvc.boardgrp;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.contentsbd.ContentsbdProc;
import dev.mvc.contentsbd.ContentsbdProcInter;

@Controller
public class BoardgrpCont {
  @Autowired
  @Qualifier("dev.mvc.boardgrp.BoardgrpProc") // 이름 지정
  private BoardgrpProcInter boardgrpProc;
  
  @Autowired
  @Qualifier("dev.mvc.contentsbd.ContentsbdProc") // 이름 지정
  private ContentsbdProcInter contentsbdProc;
  
  public BoardgrpCont() {
    System.out.println("---> BoardgrpCont create.");
  }

  // http://localhost:9090/team7/boardgrp/create.do
  @RequestMapping(value="/boardgrp/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/boardgrp/create"); // /webapp/boardgrp/create.jsp
    return mav;
  }
  
  // 등록 처리
  @RequestMapping(value="/boardgrp/create.do", method=RequestMethod.POST)
  public ModelAndView create(BoardgrpVO boardgrpVO) {
    ModelAndView mav = new ModelAndView();
  
    int count = boardgrpProc.create(boardgrpVO);
    
    // type 1
    // mav.setViewName("/boardgrp/create_msg"); // /webapp/boardgrp/create_msg.jsp
    // mav.addObject("count", count);

    // type 2 -> 새로고침 해도 중복호출 안 됨!
    // mav.setViewName("redirect:/boardgrp/create_msg.jsp?count=" + count); // request 객체 안에 있던 내용들이 날아감

    // type 3 -> 문제가 없으면 list do 정상처리, 문제가 발생하면 create_msg.jsp에 출력
    if (count == 0) {
      mav.setViewName("redirect:/boardgrp/create_msg.jsp?count=" + count);
    } else {
      mav.setViewName("redirect:/boardgrp/list.do"); // list.jsp X
    }
    
    return mav;
  }
  
  // 우선 순위(seqno)에 따른 오름차순 출력 목록
  @RequestMapping(value= "/boardgrp/list.do", method=RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if (adminsProc.isAdmins(session)) {
      List<BoardgrpVO> list = boardgrpProc.list();
      
      mav.addObject("list", list);
      mav.setViewName("/boardgrp/list");// /webapp/boardgrp/list.jsp
    } else {
      mav.setViewName("/admins/login_need");// /webapp/boardgrp/list.jsp
    }

    return mav;
  }
  
  // 우선 순위(seqno)에 따른 오름차순 출력 목록
  @RequestMapping(value= "/boardgrp/update_seqno_up.do", method=RequestMethod.GET)
  public ModelAndView update_seqno_up(int boardgrpno) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = boardgrpProc.update_seqno_up(boardgrpno);
    
    if (cnt != 0) {
      mav.setViewName("redirect:/boardgrp/list.do"); // list.jsp X
    }
   
    return mav;
  }
  
  // 우선 순위(seqno)에 따른 오름차순 출력 목록
  @RequestMapping(value= "/boardgrp/update_seqno_down.do", method=RequestMethod.GET)
  public ModelAndView update_seqno_down(int boardgrpno) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = boardgrpProc.update_seqno_down(boardgrpno);
    
    if (cnt != 0) {
      mav.setViewName("redirect:/boardgrp/list.do"); // list.jsp X
    }
   
    return mav;
  }
  
  // 수정폼+조회
  @RequestMapping(value= "/boardgrp/update.do", method=RequestMethod.GET)
  public ModelAndView update(int boardgrpno) {
    ModelAndView mav = new ModelAndView(); 
    
    BoardgrpVO boardgrpVO = boardgrpProc.read(boardgrpno);
    
    mav.addObject("boardgrpVO", boardgrpVO);
    mav.setViewName("/boardgrp/update");// /webapp/boardgrp/list.jsp
    
    return mav;
  }
  
  // 수정 처리
  @RequestMapping(value= "/boardgrp/update.do", method=RequestMethod.POST)
  public ModelAndView update(BoardgrpVO boardgrpVO) {
    ModelAndView mav = new ModelAndView(); 
    
    int count = boardgrpProc.update(boardgrpVO);
    String url = "redirect:/boardgrp/update_msg.jsp?count=" + count + 
                 "&boardgrpno=" + boardgrpVO.getBoardgrpno();   
    mav.setViewName(url);
    
    return mav;
  }
  
  // 삭제폼
  @RequestMapping(value= "/boardgrp/delete.do", method=RequestMethod.GET)
  public ModelAndView delete(int boardgrpno) {
    ModelAndView mav = new ModelAndView(); 
    
    BoardgrpVO boardgrpVO = boardgrpProc.read(boardgrpno);
    int count_by_boardgrpno = contentsbdProc.count_by_boardgrpno(boardgrpno);
    mav.addObject("count_by_boardgrpno", count_by_boardgrpno);
    
    mav.addObject("boardgrpVO", boardgrpVO);
    mav.setViewName("/boardgrp/delete");// /webapp/boardgrp/delete.jsp
    
    // mav.setViewName("redirect:/boardgrp/create_msg.jsp?count=" + count); 
    
    return mav;
  }
  
  // 삭제 처리
  @RequestMapping(value= "/boardgrp/delete.do", method=RequestMethod.POST)
  public ModelAndView delete_proc(int boardgrpno) { // 똑같이(95line) delete라고 하면 오류남. delete_proc로 바꿔줌. 
    ModelAndView mav = new ModelAndView(); 
    
    int count = boardgrpProc.delete(boardgrpno);
    String url = "redirect:/boardgrp/delete_msg.jsp?count=" + count + 
                 "&boardgrpno=" + boardgrpno;  // pk : boardgrpno 
    mav.setViewName(url);
    
    return mav;
  }
  
 
  
  
  
  
  
  
  
  
  
  
}
