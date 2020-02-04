package dev.mvc.area;

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

import dev.mvc.theater.TheaterProcInter;
import dev.mvc.theater.TheaterVO;


@Controller
public class AreaCont {
  @Autowired
  @Qualifier("dev.mvc.area.AreaProc")
  private AreaProcInter areaProc;
  
  @Autowired
  @Qualifier("dev.mvc.theater.TheaterProc")
  private TheaterProcInter theaterProc;
  
  public AreaCont() {
    System.out.println("--> AreaCont created");
  }
  
  @RequestMapping(value = "/area_list_admins/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();

    mav.setViewName("/area_list_admins/create"); // /webapp/area/create.jsp

    return mav;

  }

  @RequestMapping(value = "/area_list_admins/create.do", method = RequestMethod.POST)
  public ModelAndView create(RedirectAttributes ra, AreaVO areaVO) {
    ModelAndView mav = new ModelAndView();

    int count = areaProc.create(areaVO);

    ra.addAttribute("count", count);
    ra.addAttribute("areano", areaVO.getAreano());

    mav.setViewName("redirect:/area_list_admins/create_msg.jsp");

    return mav;
  }
  
 //수정폼 + 조회
 @RequestMapping(value="/area_list_admins/update.do", method=RequestMethod.GET)
 public ModelAndView update(int areano) {
   ModelAndView mav = new ModelAndView();
   
   AreaVO areaVO = areaProc.read(areano);
   mav.addObject("areaVO", areaVO);
   
   mav.setViewName("/area_list_admins/update"); // /webapp/movie/update.jsp
   
   return mav;
 }

  @RequestMapping(value = "/area_list_admins/update.do", method = RequestMethod.POST)
  public ModelAndView update(RedirectAttributes ra, AreaVO areaVO) {
    ModelAndView mav = new ModelAndView();

    int count = areaProc.update(areaVO);

    ra.addAttribute("count", count);
    ra.addAttribute("areano", areaVO.getAreano());

    mav.setViewName("redirect:/area_list_admins/update_msg.jsp");

    return mav;
  }
  
  // 삭제폼
  @RequestMapping(value="/area_list_admins/delete.do", method=RequestMethod.GET)
  public ModelAndView delete(int areano) {
    ModelAndView mav = new ModelAndView();
    
    AreaVO areaVO = areaProc.read(areano);
    
    mav.addObject("areaVO", areaVO);
    mav.setViewName("/area_list_admins/delete"); 
        
    return mav;
  }
  
  // 삭제 처리
  @RequestMapping(value="/area_list_admins/delete.do", method=RequestMethod.POST)
  public ModelAndView delete_proc(int areano) {
    ModelAndView mav = new ModelAndView();
    
    int count = areaProc.delete(areano);
    String url = "redirect:/area_list_admins/delete_msg.jsp?count=" + count +
                      "&areano=" + areano;
    mav.setViewName(url);
                               
    return mav;
  }
  
 @RequestMapping(value="/area_list_admins/list.do", method=RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
      List<AreaVO> list = areaProc.list();
      
      mav.addObject("list", list);
      mav.setViewName("/area_list_admins/list"); // /webapp/reply/list.jsp
    
    return mav;
  }
 
 /**
  * {
   "list_theater_select":[
     {"area":"서울","theater":"신촌CGV","theaterno":1},
     {"area":"대구","theater":"신촌CGV","theaterno":2},
     {"area":"부산","theater":"신촌CGV","theaterno":3}
   ]
 }
  * @return
  */
 @ResponseBody
  @RequestMapping(value = "/theater_list_admins/list_theater_select.do",
                              method = RequestMethod.GET,
                              produces = "text/plain;charset=UTF-8")
  public String list_theater_select(int areano) {
    // String msg="JSON 출력";
    // return msg;
    
    List<TheaterVO> list_theater_select = theaterProc.theater_list_areano(areano);
    
    JSONObject obj = new JSONObject();
    obj.put("list_theater_select", list_theater_select);

    return obj.toString();     
  }
}
