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

import dev.mvc.area.AreaProcInter;
import dev.mvc.area.AreaVO;
import dev.mvc.contentsbd.ContentsbdVO;

@Controller
public class TheaterCont {
  @Autowired
  @Qualifier("dev.mvc.theater.TheaterProc")
  private TheaterProcInter theaterProc;
  
  @Autowired
  @Qualifier("dev.mvc.area.AreaProc")
  private AreaProcInter areaProc;

  public TheaterCont() {
    System.out.println("--> TheaterCont created");
  }

 @RequestMapping(value = "/theater_list_admins/create.do", method = RequestMethod.GET)
 public ModelAndView create() {
   ModelAndView mav = new ModelAndView();
   
   mav.setViewName("/theater_list_admins/create"); // /webapp/theater/create.jsp

   return mav;

 }

 @RequestMapping(value = "/theater_list_admins/create.do", method = RequestMethod.POST)
 public ModelAndView create(RedirectAttributes ra, TheaterVO theaterVO) {
   ModelAndView mav = new ModelAndView();

   int count = theaterProc.create(theaterVO);

   if (count == 1) {
     areaProc.increaseCnt(theaterVO.getAreano()); // 카테고리 글수 증가
   }
   
   ra.addAttribute("count", count);
   ra.addAttribute("areano", theaterVO.getAreano());
   mav.setViewName("redirect:/theater_list_admins/create_msg.jsp");

   return mav;
 }
 
//수정폼 + 조회
@RequestMapping(value="/theater_list_admins/update.do", method=RequestMethod.GET)
public ModelAndView update(int theaterno) {
  ModelAndView mav = new ModelAndView();
  
  TheaterVO theaterVO = theaterProc.read(theaterno);
  mav.addObject("theaterVO", theaterVO);
  
  mav.setViewName("/theater_list_admins/update"); // /webapp/movie/update.jsp
  
  return mav;
}

 @RequestMapping(value = "/theater_list_admins/update.do", method = RequestMethod.POST)
 public ModelAndView update(RedirectAttributes ra, TheaterVO theaterVO) {
   ModelAndView mav = new ModelAndView();

   int count = theaterProc.update(theaterVO);

   ra.addAttribute("count", count);
   ra.addAttribute("theaterno", theaterVO.getTheaterno());

   mav.setViewName("redirect:/theater_list_admins/update_msg.jsp");

   return mav;
 }
 
 // 삭제폼
 @RequestMapping(value="/theater_list_admins/delete.do", method=RequestMethod.GET)
 public ModelAndView delete(int theaterno) {
   ModelAndView mav = new ModelAndView();
   
   TheaterVO theaterVO = theaterProc.read(theaterno);
   
   mav.addObject("theaterVO", theaterVO);
   mav.setViewName("/theater_list_admins/delete"); 
       
   return mav;
 }
 
 // 삭제 처리
 @RequestMapping(value="/theater_list_admins/delete.do", method=RequestMethod.POST)
 public ModelAndView delete_proc(int theaterno, int areano) {
   ModelAndView mav = new ModelAndView();
   
   int count = theaterProc.delete(theaterno);
   
   if (count == 1) {
     areaProc.decreaseCnt(areano);// 글 갯수 감소
   }
   
   String url = "redirect:/theater_list_admins/delete_msg.jsp?count=" + count +
                     "&theaterno=" + theaterno;
   mav.setViewName(url);
                              
   return mav;
 }
 
 @RequestMapping(value = "/theater_list_admins/read.do", method = RequestMethod.GET)
 public ModelAndView read(int theaterno) {
   ModelAndView mav = new ModelAndView();

   TheaterVO theaterVO = theaterProc.read(theaterno);
   mav.addObject("theaterVO", theaterVO);

   AreaVO areaVO = areaProc.read(theaterVO.getAreano());
   mav.addObject("areaVO", areaVO);

   return mav;
 }
 
@RequestMapping(value="/theater_list_admins/list.do", method=RequestMethod.GET)
 public ModelAndView list() {
   ModelAndView mav = new ModelAndView();
   
     List<TheaterVO> list = theaterProc.list();
     mav.addObject("list", list);
     
     mav.setViewName("/theater_list_admins/list"); // /webapp/reply/list.jsp
   
   return mav;
 }

@RequestMapping(value="/theater_list_admins/theater_list_areano.do", method=RequestMethod.GET)
public ModelAndView list(int areano) {
  ModelAndView mav = new ModelAndView();
  
    List<TheaterVO> list = theaterProc.theater_list_areano(areano);
    mav.addObject("list", list);
    
    AreaVO areaVO = areaProc.read(areano);
    mav.addObject("areaVO", areaVO);
    
    mav.setViewName("/theater_list_admins/theater_list_areano"); // /webapp/reply/list.jsp
  
  return mav;
}

/**
 * http://localhost:9090/team7/theater_list_admins/list_theater_select2.do?theaterno=1
 * {"areano":0,"theater":"강남CGV","theaterno":1}
 * @param theaterno
 * @return
 */
@ResponseBody
@RequestMapping(value = "/theater_list_admins/list_theater_select2.do",
                            method = RequestMethod.GET,
                            produces = "text/plain;charset=UTF-8")
public String list_movie_select(int theaterno) {
  // String msg="JSON 출력";
  // return msg;
  
  TheaterVO theaterVO = theaterProc.read(theaterno);
  
  JSONObject obj = new JSONObject(theaterVO);

  return obj.toString();     
}

}
