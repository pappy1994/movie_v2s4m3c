package dev.mvc.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.qna.QnaVO;
import dev.mvc.qnagrp.QnagrpProcInter;
import dev.mvc.qnagrp.QnagrpVO;



@Controller
public class QnaCont {
  @Autowired
  @Qualifier("dev.mvc.qna.QnaProc")
  private QnaProcInter qnaProc;
  
  @Autowired
  @Qualifier("dev.mvc.qnagrp.QnagrpProc") // 이름 지정
  private QnagrpProcInter qnagrpProc;


  public QnaCont() {
    System.out.println("--> QnaCont created.");
  }
  
  // http://localhost:9090/ojt/qna/create.do?qnagrpno=1
  @RequestMapping(value = "/qna/create.do", method = RequestMethod.GET)
  public ModelAndView create(int qnagrpno) {
    ModelAndView mav = new ModelAndView();

    QnagrpVO qnagrpVO = qnagrpProc.read(qnagrpno);
    mav.addObject("qnagrpVO", qnagrpVO);

    mav.setViewName("/qna/create"); // /webapp/qna/create.jsp

    return mav;
  }
  
  @RequestMapping(value = "/qna/create.do", method = RequestMethod.POST)
  public ModelAndView create(RedirectAttributes ra,
                                    QnaVO qnaVO) {
    ModelAndView mav = new ModelAndView();

    int count = qnaProc.create(qnaVO);

    // mav.setViewName("/qna/create"); // /webapp/qna/create.jsp
    // redirect: form에서 보낸 데이터 모두 삭제됨, 새로고침 중복 등록 방지용.
    
    ra.addAttribute("count", count); // redirect parameter 적용
    ra.addAttribute("qnagrpno", qnaVO.getQnagrpno());
    
    mav.setViewName("redirect:/qna/create_msg.jsp");

    return mav;
  }

  @RequestMapping(value = "/qna/list_all.do", method = RequestMethod.GET)
  public ModelAndView list_all() {
    ModelAndView mav = new ModelAndView();

    List<QnaVO> list = qnaProc.list_all();
    mav.addObject("list", list);
    mav.setViewName("/qna/list_all"); // /webapp/qna/list_all.jsp

    return mav;
  }
  
  /**
   * 카테고리 그룹별 목록
   * http://localhost:9090/team7/qna/list_by_qnagrpno.do?qnagrpno=1
   * http://localhost:9090/team7/qna/list_by_qnagrpno.do?qnagrpno=2
   * http://localhost:9090/team7/qna/list_by_qnagrpno.do?qnagrpno=3
   * 
   * @param categrpno
   * @return
   */
  @RequestMapping(value = "/qna/list.do", method = RequestMethod.GET)
  public ModelAndView list_by_qnagrpno(int qnagrpno) {
    ModelAndView mav = new ModelAndView();

    List<QnaVO> list = qnaProc.list_by_qnagrpno(qnagrpno);
    mav.addObject("list", list);
    // /webapp/contents/list.jsp

    QnagrpVO qnagrpVO = qnagrpProc.read(qnagrpno);
    mav.addObject("qnagrpVO", qnagrpVO);

    mav.setViewName("/qna/list"); // 카테고리 그룹별 목록

    return mav;
  }
  
  /**
   * 조회 http://localhost:9090/team7/qna/read.do?qnano=1
   * 
   * @param qnano
   * @return
   */
  @RequestMapping(value = "/qna/read.do", method = RequestMethod.GET)
  public ModelAndView read(int qnano) {
    ModelAndView mav = new ModelAndView();

    QnaVO qnaVO = qnaProc.read(qnano);
    System.out.println("--> qnaVO : "+ qnaVO);
    
    mav.addObject("qnaVO", qnaVO);
    
    QnagrpVO qnagrpVO = qnagrpProc.read(qnaVO.getQnagrpno());
    mav.addObject("qnagrpVO", qnagrpVO);
    
    mav.setViewName("/qna/read");

    return mav;
  }
  
  // http://localhost:9090/ojt/contents/update.do?memberno=1&categrpno=1
  @RequestMapping(value = "/qna/update.do", method = RequestMethod.GET)
  public ModelAndView update(int qnagrpno, int qnano) {
    ModelAndView mav = new ModelAndView();

    QnagrpVO qnagrpVO = qnagrpProc.read(qnagrpno);
    mav.addObject("qnagrpVO", qnagrpVO);

    QnaVO qnaVO = qnaProc.read(qnano);
    mav.addObject("qnaVO", qnaVO);

    mav.setViewName("/qna/update"); // /webapp/contents/update.jsp

    return mav;
  }
  
  /**
   * 수정 처리
   * @param qnaVO
   * @return
   */
  @RequestMapping(value = "/qna/update.do", 
                             method = RequestMethod.POST)
  public ModelAndView update(RedirectAttributes ra,
                                            QnaVO qnaVO) {
    ModelAndView mav = new ModelAndView();

    int count = qnaProc.update(qnaVO);

    // mav.setViewName("/qna/create"); // /webapp/qna/create.jsp
    // redirect: form에서 보낸 데이터 모두 삭제됨, 새로고침 중복 등록 방지용.
    ra.addAttribute("count", count);
    ra.addAttribute("qnagrpno", qnaVO.getQnagrpno());
    ra.addAttribute("qnano", qnaVO.getQnano());
    
    mav.setViewName("redirect:/qna/update_msg.jsp");

    return mav;
  }
  
 // http://localhost:9090/ojt/contents/delete.do?categrpno=1&contentsno=1
 @RequestMapping(value = "/qna/delete.do", 
                            method = RequestMethod.GET)
 public ModelAndView delete(int qnagrpno, int qnano) {
   ModelAndView mav = new ModelAndView();

   QnagrpVO qnagrpVO = qnagrpProc.read(qnagrpno);
   mav.addObject("qnagrpVO", qnagrpVO);

   QnaVO qnaVO = qnaProc.read(qnano);
   mav.addObject("qnaVO", qnaVO);
   
   mav.setViewName("/qna/delete"); // /webapp/contents/delete.jsp

   return mav;
 }
 
  // 삭제 처리
  @RequestMapping(value="/qna/delete.do", method=RequestMethod.POST)
  public ModelAndView delete_proc(int qnano) {
    ModelAndView mav = new ModelAndView();
  
    int count = qnaProc.delete(qnano);
    /*System.out.println("--> qnano : " + qnano);
    System.out.println("--> count : " + count);*/
    String url = "redirect:/qna/delete_msg.jsp?count=" + count +
                    "&qnano=" + qnano;
    mav.setViewName(url);
                             
    return mav;
  }
 
  
  

}




