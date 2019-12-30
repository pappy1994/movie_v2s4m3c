package dev.mvc.eventgrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EventgrpCont {
  @Autowired
  @Qualifier("dev.mvc.eventgrp.EventgrpProc")
  private EventgrpProcInter eventgrpProc;

  public EventgrpCont() {
    System.out.println("--> EventgrpCont created.");
  }

  //http://localhost:9090/team7/eventgrp/create.do
  @RequestMapping(value = "/eventgrp/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/eventgrp/create"); // /webapp/categrp/create.jsp

    return mav;
  }

  // 등록 처리
  @RequestMapping(value = "/eventgrp/create.do", method = RequestMethod.POST)
  public ModelAndView create(EventgrpVO eventgrpVO) {
    ModelAndView mav = new ModelAndView();

    int count = eventgrpProc.create(eventgrpVO);

    if (count == 0) {
      mav.setViewName("redirect:/eventgrp/create_msg.jsp?count=" + count);
    } else {
      mav.setViewName("redirect:/eventgrp/list.do"); // list.jsp X
    }

    return mav;
  }

  // 목록
  @RequestMapping(value = "/eventgrp/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();

    List<EventgrpVO> list = eventgrpProc.list_eventgrpno_asc();

    mav.addObject("list", list);
    mav.setViewName("/eventgrp/list"); //
    // webapp/categrp/list.jsp

    // mav.setViewName("redirect:/eventgrp/create_msg.jsp?count=" + count);

    return mav;
  }

  // 수정폼 + 조회
  @RequestMapping(value = "/eventgrp/update.do", method = RequestMethod.GET)
  public ModelAndView update(int eventgrpno) {
    ModelAndView mav = new ModelAndView();

    EventgrpVO eventgrpVO = eventgrpProc.read(eventgrpno);

    mav.addObject("eventgrpVO", eventgrpVO);
    mav.setViewName("/eventgrp/update"); // /webapp/categrp/update.jsp

    // mav.setViewName("redirect:/categrp/create_msg.jsp?count=" + count);

    return mav;
  }

  // 수정 처리
  @RequestMapping(value = "/eventgrp/update.do", method = RequestMethod.POST)
  public ModelAndView update(EventgrpVO eventgrpVO) {
    ModelAndView mav = new ModelAndView();

    int count = eventgrpProc.update(eventgrpVO);
    String url = "redirect:/eventgrp/update_msg.jsp?count=" + count + "&eventgrpno=" + eventgrpVO.getEventgrpno();
    mav.setViewName(url);

    return mav;
  }

  // 삭제폼
  @RequestMapping(value = "/eventgrp/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int eventgrpno) {
    ModelAndView mav = new ModelAndView();

    EventgrpVO eventgrpVO = eventgrpProc.read(eventgrpno);

    mav.addObject("eventgrpVO", eventgrpVO);
    mav.setViewName("/eventgrp/delete"); // /webapp/categrp/delete.jsp

    // mav.setViewName("redirect:/categrp/create_msg.jsp?count=" + count);

    return mav;
  }

  // 삭제 처리
  @RequestMapping(value = "/eventgrp/delete.do", method = RequestMethod.POST)
  public ModelAndView delete_proc(int eventgrpno) {
    ModelAndView mav = new ModelAndView();

    int count = eventgrpProc.delete(eventgrpno);
    String url = "redirect:/eventgrp/delete_msg.jsp?count=" + count + "&eventgrpno=" + eventgrpno;
    mav.setViewName(url);

    return mav;
  }

}
