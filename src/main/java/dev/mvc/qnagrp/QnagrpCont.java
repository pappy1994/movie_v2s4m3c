package dev.mvc.qnagrp;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



@Controller
public class QnagrpCont {
  @Autowired
  @Qualifier("dev.mvc.qnagrp.QnagrpProc") // �̸� ����
  private QnagrpProcInter qnagrpProc;
  
  public QnagrpCont() {
    System.out.println("--> QnagrpCont created.");
  }
  
  // http://localhost:9090/team7/qnagrp/create.do
  @RequestMapping(value="/qnagrp/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/qnagrp/create"); // /webapp/qnagrp/create.jsp
    
    return mav;
  }
  
  // ��� ó��
  @RequestMapping(value="/qnagrp/create.do", method=RequestMethod.POST)
  public ModelAndView create(QnagrpVO qnagrpVO) {
    ModelAndView mav = new ModelAndView();
    
    int count = qnagrpProc.create(qnagrpVO);
    
    // type 1
    // mav.addObject("count", count);
    // mav.setViewName("/qnagrp/create_msg"); // /webapp/qnagrp/create_msg.jsp

    // type 2
    // mav.setViewName("redirect:/qnagrp/create_msg.jsp?count=" + count);
    
    // type 3: ����ó��: list.do, ������ �߻�: create_msg.jsp�� ��� 
    if (count == 0) {
      mav.setViewName("redirect:/qnagrp/create_msg.jsp?count=" + count);
    } else {
      mav.setViewName("redirect:/qnagrp/list.do"); // list.jsp X
    }
        
    return mav;
  }
  
 /* // ���
  @RequestMapping(value="/qnagrp/list.do", method=RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    List<QnagrpVO> list = qnagrpProc.list();
    
    mav.addObject("list", list);
    mav.setViewName("/qnagrp/list"); // /webapp/qnagrp/list.jsp

    // mav.setViewName("redirect:/qnagrp/create_msg.jsp?count=" + count);
        
    return mav;
  }*/
  
  // ������ + ��ȸ
  @RequestMapping(value="/qnagrp/update.do", method=RequestMethod.GET)
  public ModelAndView update(int qnagrpno) {
    ModelAndView mav = new ModelAndView();
    
    QnagrpVO qnagrpVO = qnagrpProc.read(qnagrpno);
    
    mav.addObject("qnagrpVO", qnagrpVO);
    mav.setViewName("/qnagrp/update"); // /webapp/qnagrp/update.jsp

    // mav.setViewName("redirect:/categrp/create_msg.jsp?count=" + count);
        
    return mav;
  }
  
  //���� ó��
  @RequestMapping(value = "/qnagrp/update.do", method = RequestMethod.POST)
  public ModelAndView update(QnagrpVO qnagrpVO) {
    ModelAndView mav = new ModelAndView();

    int count = qnagrpProc.update(qnagrpVO);
    String url = "redirect:/qnagrp/update_msg.jsp?count=" + count + "&qnagrpno=" + qnagrpVO.getQnagrpno();
    mav.setViewName(url);

    return mav;
  }
  
  @RequestMapping(value="/qnagrp/delete.do", method=RequestMethod.GET)
  public ModelAndView delete(int qnagrpno) {
    ModelAndView mav = new ModelAndView();
    
    QnagrpVO qnagrpVO = qnagrpProc.read(qnagrpno);
    
    mav.addObject("qnagrpVO", qnagrpVO);
    mav.setViewName("/qnagrp/delete"); // /webapp/qnagrp/delete.jsp

    // mav.setViewName("redirect:/qnagrp/create_msg.jsp?count=" + count);
        
    return mav;
  }
  
  // ���� ó��
  @RequestMapping(value="/qnagrp/delete.do", method=RequestMethod.POST)
  public ModelAndView delete_proc(int qnagrpno) {
    ModelAndView mav = new ModelAndView();
    
    int count = qnagrpProc.delete(qnagrpno);
    String url = "redirect:/qnagrp/delete_msg.jsp?count=" + count +
                      "&qnagrpno=" + qnagrpno;
    mav.setViewName(url);
                               
    return mav;
  }
  
  // seqno �������� ��� ���
  @RequestMapping(value="/qnagrp/list.do", method=RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
      List<QnagrpVO> list = qnagrpProc.list_seqno_asc();
      
      mav.addObject("list", list);
      mav.setViewName("/qnagrp/list"); // /webapp/categrp/list.jsp      
        
    return mav;
  }
  
  /**
   * �켱���� ����
   * @param qnagrpno
   * @return
   */
  @RequestMapping(value="/qnagrp/update_seqno_up.do", 
                             method=RequestMethod.GET)
  public ModelAndView update_seqno_up(int qnagrpno) {
    ModelAndView mav = new ModelAndView();
    
    int count = qnagrpProc.update_seqno_up(qnagrpno);
    String url = "redirect:/qnagrp/list.do";
    mav.setViewName(url);
                               
    return mav;
  }
  
  /**
   * �켱���� ����
   * @param qnagrpno
   * @return
   */
  @RequestMapping(value="/qnagrp/update_seqno_down.do", 
                             method=RequestMethod.GET)
  public ModelAndView update_seqno_down(int qnagrpno) {
    ModelAndView mav = new ModelAndView();
    
    int count = qnagrpProc.update_seqno_down(qnagrpno);
    String url = "redirect:/qnagrp/list.do";
    mav.setViewName(url);
                               
    return mav;
  }
  
  
  
}


























