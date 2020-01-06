package dev.mvc.customgrp;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;






 
@Controller
public class CustomgrpCont {
  @Autowired
  @Qualifier("dev.mvc.customgrp.CustomgrpProc") //이름지정
  private CustomgrpProcInter customgrpProc;  
  
  //http://localhost:9090/team7/customgrp/create.do
  @RequestMapping(value="/customgrp/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/customgrp/create"); // /webapp/categrp/create.jsp
    
    return mav;    
  }
  
  
//http://localhost:9090/team7/customgrp/create.do
  @RequestMapping(value="/customgrp/create.do", method=RequestMethod.POST)
  public ModelAndView create(CustomgrpVO customgrpVO) {
    ModelAndView mav = new ModelAndView();
    //System.out.println("create 호출됨");
    int count = customgrpProc.create(customgrpVO);           
    mav.setViewName("redirect:/customgrp/create_msg.jsp?count=" + count + "&customgrpno=" + customgrpVO.getCustomgrpno());   
    
    return mav;    
  }
  
  //목록
 @RequestMapping(value= "/customgrp/list.do", method=RequestMethod.GET)
 public ModelAndView list() {
   ModelAndView mav = new ModelAndView();
   
   List<CustomgrpVO> list = customgrpProc.list();
   
   mav.addObject("list", list);
   mav.setViewName("/customgrp/list");// /webapp/customgrp/list.jsp
   
   return mav;
 }
//수정폼 + 조회
@RequestMapping(value="/customgrp/update.do", method=RequestMethod.GET)
public ModelAndView update(int customgrpno) {
  ModelAndView mav = new ModelAndView();
  
  CustomgrpVO customgrpVO = customgrpProc.read(customgrpno);
  
  mav.addObject("CustomgrpVO", customgrpVO);
  mav.setViewName("/customgrp/update"); // /webapp/categrp/update.jsp

  // mav.setViewName("redirect:/categrp/create_msg.jsp?count=" + count);
      
  return mav;
}

// 수정 처리
@RequestMapping(value="/customgrp/update.do", method=RequestMethod.POST)
public ModelAndView update(CustomgrpVO customgrpVO) {
  ModelAndView mav = new ModelAndView();
  
  int count = customgrpProc.update(customgrpVO);
  String url = "redirect:/customgrp/update_msg.jsp?count=" + count +
                    "&customgrpno=" + customgrpVO.getCustomgrpno();
  mav.setViewName(url);
                             
  return mav;
}
//삭제폼
@RequestMapping(value="/customgrp/delete.do", method=RequestMethod.GET)
public ModelAndView delete(int customgrpno) {
 ModelAndView mav = new ModelAndView();
 
 CustomgrpVO customgrpVO = customgrpProc.read(customgrpno); 
 mav.addObject("customgrpVO", customgrpVO);
 mav.setViewName("/customgrp/delete"); // /webapp/categrp/delete.jsp

 // mav.setViewName("redirect:/categrp/create_msg.jsp?count=" + count);
     
 return mav;
}

// 삭제 처리
@RequestMapping(value="/customgrp/delete.do", method=RequestMethod.POST)
public ModelAndView delete_proc(int customgrpno) {
 ModelAndView mav = new ModelAndView();
 
 int count = customgrpProc.delete(customgrpno);
 String url = "redirect:/customgrp/delete_msg.jsp?count=" + count +
                   "&customgrpno=" + customgrpno;
 mav.setViewName(url);
                            
 return mav;
}





}

 