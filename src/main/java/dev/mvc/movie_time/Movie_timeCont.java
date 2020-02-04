package dev.mvc.movie_time;

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

import dev.mvc.contentsbd.ContentsbdVO;

@Controller
public class Movie_timeCont {
  @Autowired
  @Qualifier("dev.mvc.movie_time.Movie_timeProc")
  private Movie_timeProcInter movie_timeProc;
  
  
  public Movie_timeCont() {
    System.out.println("--> Movie_timeCont created");
  }
  
  @RequestMapping(value = "/movie_time_admins/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/movie_time_admins/create"); // /webapp/theater/create.jsp

    return mav;

  }

  @RequestMapping(value = "/movie_time_admins/create.do", method = RequestMethod.POST)
  public ModelAndView create(RedirectAttributes ra, Movie_timeVO movie_timeVO) {
    ModelAndView mav = new ModelAndView();

    int count = movie_timeProc.create(movie_timeVO);

    ra.addAttribute("count", count);

    mav.setViewName("redirect:/movie_time_admins/create_msg.jsp");

    return mav;
  }
  
 //수정폼 + 조회
 @RequestMapping(value="/movie_time_admins/update.do", method=RequestMethod.GET)
 public ModelAndView update(int movie_timeno) {
   ModelAndView mav = new ModelAndView();
   
   Movie_timeVO movie_timeVO = movie_timeProc.read(movie_timeno);
   mav.addObject("movie_timeVO", movie_timeVO);
   
   mav.setViewName("/movie_time_admins/update"); // /webapp/movie/update.jsp
   
   return mav;
 }
 
 /**
  * 우선순위 상향
  * @param categrpno
  * @return
  */
 @RequestMapping(value="/movie_time_admins/update_seqno_up.do", 
                            method=RequestMethod.GET)
 public ModelAndView update_seqno_up(int movie_timeno) {
   ModelAndView mav = new ModelAndView();
   
   int count = movie_timeProc.update_seqno_up(movie_timeno);
   String url = "redirect:/movie_time_admins/list.do";
   mav.setViewName(url);
                              
   return mav;
 }
 
 /**
  * 우선순위 하향
  * @param categrpno
  * @return
  */
 @RequestMapping(value="/movie_time_admins/update_seqno_down.do", 
                            method=RequestMethod.GET)
 public ModelAndView update_seqno_down(int movie_timeno) {
   ModelAndView mav = new ModelAndView();
   
   int count = movie_timeProc.update_seqno_down(movie_timeno);
   String url = "redirect:/movie_time_admins/list.do";
   mav.setViewName(url);
                              
   return mav;
 }

  @RequestMapping(value = "/movie_time_admins/update.do", method = RequestMethod.POST)
  public ModelAndView update(RedirectAttributes ra, Movie_timeVO movie_timeVO) {
    ModelAndView mav = new ModelAndView();

    int count = movie_timeProc.update(movie_timeVO);

    ra.addAttribute("count", count);
    ra.addAttribute("movie_timeno", movie_timeVO.getMovie_timeno());

    mav.setViewName("redirect:/movie_time_admins/update_msg.jsp");

    return mav;
  }
  
  // 삭제폼
  @RequestMapping(value="/movie_time_admins/delete.do", method=RequestMethod.GET)
  public ModelAndView delete(int movie_timeno) {
    ModelAndView mav = new ModelAndView();
    
    Movie_timeVO movie_timeVO = movie_timeProc.read(movie_timeno);
    
    mav.addObject("movie_timeVO", movie_timeVO);
    mav.setViewName("/movie_time_admins/delete"); 
        
    return mav;
  }
  
  // 삭제 처리
  @RequestMapping(value="/movie_time_admins/delete.do", method=RequestMethod.POST)
  public ModelAndView delete_proc(int movie_timeno) {
    ModelAndView mav = new ModelAndView();
    
    int count = movie_timeProc.delete(movie_timeno);
    String url = "redirect:/movie_time_admins/delete_msg.jsp?count=" + count +
                      "&movie_timeno=" + movie_timeno;
    mav.setViewName(url);
                               
    return mav;
  }
  
  @RequestMapping(value = "/movie_time_admins/read.do", method = RequestMethod.GET)
  public ModelAndView read(int movie_timeno) {
    ModelAndView mav = new ModelAndView();

    Movie_timeVO movie_timeVO = movie_timeProc.read(movie_timeno);
    mav.addObject("movie_timeVO", movie_timeVO);

    return mav;
  }
  
 @RequestMapping(value="/movie_time_admins/list.do", method=RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
      List<Movie_timeVO> list = movie_timeProc.list_seqno_asc();
      mav.addObject("list", list);
      
      mav.setViewName("/movie_time_admins/list"); // /webapp/reply/list.jsp
    
    return mav;
  }
 
 /**
  * http://localhost:9090/team7/movie_time_admins/list_movie_time_select.do?movie_timeno=1
  * @param movie_timeno
  * @return
  */
 @ResponseBody
 @RequestMapping(value = "/movie_time_admins/list_movie_time_select.do",
                             method = RequestMethod.GET,
                             produces = "text/plain;charset=UTF-8")
 public String read_json(int movie_timeno) {
   // String msg="JSON 출력";
   // return msg;
   
   Movie_timeVO movie_timeVO = movie_timeProc.read(movie_timeno);
   
   JSONObject obj = new JSONObject(movie_timeVO);

   return obj.toString();     
 }
}
