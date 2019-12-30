package dev.mvc.econtents;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.eventgrp.EventgrpProcInter;
import dev.mvc.eventgrp.EventgrpVO;

@Controller
public class EcontentsCont {
  @Autowired
  @Qualifier("dev.mvc.econtents.EcontentsProc")
  private EcontentsProcInter econtentsProc;
  
  @Autowired
  @Qualifier("dev.mvc.eventgrp.EventgrpProc")
  private EventgrpProcInter eventgrpProc;

  public EcontentsCont() {
    System.out.println("--> EcontentsCont created.");
  }

  // ��� http://localhost:9090/team7/econtents/create.do
  @RequestMapping(value = "/econtents/create.do", method = RequestMethod.GET)
  public ModelAndView create(int eventgrpno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/econtents/create"); // /webapp/categrp/create.jsp
    
    EventgrpVO eventgrpVO = eventgrpProc.read(eventgrpno);
    mav.addObject("eventgrpVO", eventgrpVO);
    
    mav.setViewName("/econtents/create");

    return mav;
  }

  // ��� ó��
  @RequestMapping(value = "/econtents/create.do", method = RequestMethod.POST)
  public ModelAndView create(RedirectAttributes ra,EcontentsVO econtentsVO) {
    ModelAndView mav = new ModelAndView();

    int count = econtentsProc.create(econtentsVO);

    ra.addAttribute("count", count); // redirect parameter ����
    ra.addAttribute("eventgrpno", econtentsVO.getEventgrpno());

    mav.setViewName("redirect:/econtents/create_msg.jsp");

    return mav;
  }

  //���
  @RequestMapping(value = "/econtents/list.do", method = RequestMethod.GET)
  public ModelAndView list(int eventgrpno) {
    ModelAndView mav = new ModelAndView();

    List<EcontentsVO> list = econtentsProc.list();
    mav.addObject("list", list);

    EventgrpVO eventgrpVO = eventgrpProc.read(eventgrpno);
    mav.addObject("eventgrpVO", eventgrpVO);

    mav.setViewName("/econtents/list"); // ī�װ� �׷캰 ���

    return mav;
  }
  
  // ��ȸ
  @RequestMapping(value = "/econtents/read.do", method = RequestMethod.GET)
  public ModelAndView read(int econtentsno) {
    ModelAndView mav = new ModelAndView();

    EcontentsVO econtentsVO = econtentsProc.read(econtentsno);
    mav.addObject("econtentsVO", econtentsVO);

    EventgrpVO eventgrpVO = eventgrpProc.read(econtentsVO.getEventgrpno());
    mav.addObject("eventgrpVO", eventgrpVO);

    mav.setViewName("/econtents/read");

    return mav;
  }
  
  @RequestMapping(value = "/econtents/update.do", method = RequestMethod.GET)
  public ModelAndView update(int eventgrpno, int econtentsno) {
    ModelAndView mav = new ModelAndView();

    EventgrpVO eventgrpVO = eventgrpProc.read(eventgrpno);
    mav.addObject("eventgrpVO", eventgrpVO);

    EcontentsVO econtentsVO = econtentsProc.read(econtentsno);
    mav.addObject("econtentsVO", econtentsVO);

    mav.setViewName("/econtents/update"); // /webapp/econtents/update.jsp

    return mav;
  }
  
  @RequestMapping(value = "/econtents/update.do", method = RequestMethod.POST)
  public ModelAndView update(RedirectAttributes ra, EcontentsVO econtentsVO) {
    ModelAndView mav = new ModelAndView();

    int count = econtentsProc.update(econtentsVO);

    // mav.setViewName("/contents/create"); // /webapp/contents/create.jsp
    // redirect: form���� ���� ������ ��� ������, ���ΰ�ħ �ߺ� ��� ������.
    ra.addAttribute("count", count);
    ra.addAttribute("eventgrpno", econtentsVO.getEventgrpno());
    ra.addAttribute("econtentsno", econtentsVO.getEcontentsno());

    mav.setViewName("redirect:/econtents/update_msg.jsp");

    return mav;
  }
  
  @RequestMapping(value = "/econtents/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int eventgrpno, int econtentsno) {
    ModelAndView mav = new ModelAndView();

    EventgrpVO eventgrpVO = eventgrpProc.read(eventgrpno);
    mav.addObject("eventgrpVO", eventgrpVO);

    EcontentsVO econtentsVO = econtentsProc.read(econtentsno);
    mav.addObject("econtentsVO", econtentsVO);

    mav.setViewName("/econtents/delete"); // /webapp/contents/delete.jsp

    return mav;
  }
  
  @RequestMapping(value = "/econtents/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(HttpSession session, 
                             RedirectAttributes ra, 
                             int eventgrpno, int econtentsno) {
    ModelAndView mav = new ModelAndView();

    int count = econtentsProc.delete(econtentsno);

      ra.addAttribute("count", count);
      ra.addAttribute("eventgrpno", eventgrpno);
      ra.addAttribute("econtentsno", econtentsno);

      mav.setViewName("redirect:/econtents/delete_msg.jsp");

    return mav;
  }

}
