package dev.mvc.theater;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class TheaterCont {
  @Autowired
  @Qualifier("dev.mvc.theater.TheaterProc")
  private TheaterProcInter theaterProc;
  

  public TheaterCont() {
    System.out.println("--> TheaterCont created");
  }

 @RequestMapping(value = "/theater/create.do", method = RequestMethod.GET)
 public ModelAndView create_area() {
   ModelAndView mav = new ModelAndView();

   mav.setViewName("/theater/create"); // /webapp/theater/create.jsp

   return mav;

 }

 @RequestMapping(value = "/theater/create.do", method = RequestMethod.POST)
 public ModelAndView create_area(TheaterVO theaterVO) {
   ModelAndView mav = new ModelAndView();

   int count = theaterProc.create_area(theaterVO);

   if (count == 0) {
     mav.setViewName("redirect:/theater/create_msg.jsp?count=" + count);
   } else {
     mav.setViewName("redirect:/movie/list.do"); 
   }

   return mav;
 }
 
 @RequestMapping(value = "/theater/create.do", method = RequestMethod.GET)
 public ModelAndView create_theater() {
   ModelAndView mav = new ModelAndView();

   mav.setViewName("/theater/create"); // /webapp/theater/create.jsp

   return mav;

 }

 @RequestMapping(value = "/theater/create.do", method = RequestMethod.POST)
 public ModelAndView create_theater(TheaterVO theaterVO) {
   ModelAndView mav = new ModelAndView();

   int count = theaterProc.create_theater(theaterVO);

   if (count == 0) {
     mav.setViewName("redirect:/theater/create_msg.jsp?count=" + count);
   } else {
     mav.setViewName("redirect:/movie/list.do"); 
   }

   return mav;
 }
 
//수정폼 + 조회
@RequestMapping(value="/theater/update.do", method=RequestMethod.GET)
public ModelAndView update(int theaterno) {
  ModelAndView mav = new ModelAndView();
  
  TheaterVO theaterVO = theaterProc.read(theaterno);
  mav.addObject("theaterVO", theaterVO);
  
  mav.setViewName("/theater/update"); // /webapp/movie/update.jsp
  
  return mav;
}

 @RequestMapping(value = "/theater/update.do", method = RequestMethod.POST)
 public ModelAndView update(RedirectAttributes ra, TheaterVO theaterVO) {
   ModelAndView mav = new ModelAndView();

   int count = theaterProc.update(theaterVO);

   ra.addAttribute("count", count);
   ra.addAttribute("theaterno", theaterVO.getTheaterno());

   mav.setViewName("redirect:/theater/update_msg.jsp");

   return mav;
 }
 
 // 삭제폼
 @RequestMapping(value="/theater/delete.do", method=RequestMethod.GET)
 public ModelAndView delete(int theaterno) {
   ModelAndView mav = new ModelAndView();
   
   TheaterVO theaterVO = theaterProc.read(theaterno);
   
   mav.addObject("theaterVO", theaterVO);
   mav.setViewName("/theater/delete"); 
       
   return mav;
 }
 
 // 삭제 처리
 @RequestMapping(value="/theater/delete.do", method=RequestMethod.POST)
 public ModelAndView delete_proc(int theaterno) {
   ModelAndView mav = new ModelAndView();
   
   int count = theaterProc.delete(theaterno);
   String url = "redirect:/theater/delete_msg.jsp?count=" + count +
                     "&theaterno=" + theaterno;
   mav.setViewName(url);
                              
   return mav;
 }
 
 @RequestMapping(value="/theater/list.do", method=RequestMethod.GET)
 public ModelAndView list() {
   ModelAndView mav = new ModelAndView();
   
     List<TheaterVO> list = theaterProc.list();
     
     mav.addObject("list", list);
     mav.setViewName("/theater/list"); // /webapp/reply/list.jsp
   
   return mav;
 }
 
 @ResponseBody
 @RequestMapping(value = "/theater/list_theater_select.do",
                             method = RequestMethod.GET,
                             produces = "text/plain;charset=UTF-8")
 public String list_theater_select() {
   // String msg="JSON 출력";
   // return msg;
   
   List<TheaterVO> list = theaterProc.list();
   
   JSONObject obj = new JSONObject();
   obj.put("list", list);

   return obj.toString();     
 }
}
