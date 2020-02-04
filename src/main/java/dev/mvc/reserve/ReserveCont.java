package dev.mvc.reserve;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.area.AreaProcInter;
import dev.mvc.area.AreaVO;
import dev.mvc.contentsbd.ContentsbdProcInter;
import dev.mvc.contentsbd.ContentsbdVO;
import dev.mvc.movie_time.Movie_timeProcInter;
import dev.mvc.movie_time.Movie_timeVO;
import dev.mvc.theater.TheaterProcInter;
import dev.mvc.theater.TheaterVO;

@Controller
public class ReserveCont {
  @Autowired
  @Qualifier("dev.mvc.reserve.ReserveProc")
  private ReserveProcInter reserveProc;
  
  @Autowired
  @Qualifier("dev.mvc.contentsbd.ContentsbdProc") 
  private ContentsbdProcInter contentsbdProc;
  
  @Autowired
  @Qualifier("dev.mvc.area.AreaProc") 
  private AreaProcInter areaProc;
  
  @Autowired
  @Qualifier("dev.mvc.theater.TheaterProc")
  private TheaterProcInter theaterProc;
  
  @Autowired
  @Qualifier("dev.mvc.movie_time.Movie_timeProc")
  private Movie_timeProcInter movie_timeProc;
  
  
  public ReserveCont() {
    System.out.println("--> ReserveCont created");
  }

  @RequestMapping(value = "/reserve/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();

    List<ContentsbdVO> list_movie = contentsbdProc.list_all();
    mav.addObject("list_movie", list_movie);
    
    List<AreaVO> list_area = areaProc.list();
    mav.addObject("list_area", list_area);
    
    List<TheaterVO> list_theater = theaterProc.list();
    mav.addObject("list_theater", list_theater);

    List<Movie_timeVO> list_movie_time = movie_timeProc.list_seqno_asc();
    mav.addObject("list_movie_time", list_movie_time);
    
    
    mav.setViewName("/reserve/list");// /webapp/categrp/list.jsp

    return mav;
  }
  
}
