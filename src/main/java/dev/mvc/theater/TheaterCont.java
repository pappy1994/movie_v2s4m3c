package dev.mvc.theater;

import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
     areaProc.increaseCnt(theaterVO.getAreano()); // ī�װ� �ۼ� ����
   }
   
   ra.addAttribute("count", count);
   ra.addAttribute("areano", theaterVO.getAreano());
   mav.setViewName("redirect:/theater_list_admins/create_msg.jsp");

   return mav;
 }
 
//������ + ��ȸ
@RequestMapping(value="/theater_list_admins/update.do", method=RequestMethod.GET)
public ModelAndView update(int areano, int theaterno) {
  ModelAndView mav = new ModelAndView();
  
  AreaVO areaVO = areaProc.read(areano);
  mav.addObject("areaVO", areaVO);
  
  TheaterVO theaterVO = theaterProc.read(theaterno);
  mav.addObject("theaterVO", theaterVO);
  
  mav.setViewName("/theater_list_admins/update"); // /webapp/movie/update.jsp
  
  return mav;
}

 @RequestMapping(value = "/theater_list_admins/update.do", method = RequestMethod.POST)
 public ModelAndView update(RedirectAttributes ra, TheaterVO theaterVO, int nowPage) {
   ModelAndView mav = new ModelAndView();

   int count = theaterProc.update(theaterVO);

   ra.addAttribute("count", count);
   ra.addAttribute("areano", theaterVO.getAreano());
   ra.addAttribute("theaterno", theaterVO.getTheaterno());
   ra.addAttribute("nowPage", nowPage);

   mav.setViewName("redirect:/theater_list_admins/update_msg.jsp");

   return mav;
 }
 
 // ������
 @RequestMapping(value="/theater_list_admins/delete.do", method=RequestMethod.GET)
 public ModelAndView delete(int theaterno, int areano) {
   ModelAndView mav = new ModelAndView();
   
   TheaterVO theaterVO = theaterProc.read(theaterno);
   
   AreaVO areaVO = areaProc.read(areano);
   
   mav.addObject("areaVO", areaVO);
   mav.addObject("theaterVO", theaterVO);
   mav.setViewName("/theater_list_admins/delete"); 
       
   return mav;
 }
 
 // ���� ó��
 @RequestMapping(value="/theater_list_admins/delete.do", method=RequestMethod.POST)
 public ModelAndView delete_proc(int theaterno, 
                                            int areano, 
                                            @RequestParam(value="theater", defaultValue="") String theater,
                                            @RequestParam(value="nowPage", defaultValue="1") int nowPage) {
   ModelAndView mav = new ModelAndView();
   
   int count = theaterProc.delete(theaterno);
   
   if (count == 1) {
     areaProc.decreaseCnt(areano);// �� ���� ����
     
     // -------------------------------------------------------------------------------------
     // ������ �������� ���ڵ� �������� ������ ��ȣ -1 ó��
     HashMap<String, Object> map = new HashMap<String, Object>();
     map.put("areano", areano);
     map.put("theater", theater);
     if (theaterProc.search_count(map) % Contents_th.RECORD_PER_PAGE == 0) {
       nowPage = nowPage - 1;
       if (nowPage < 1) {
         nowPage = 1;
       }
     }
     // -------------------------------------------------------------------------------------
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

  @RequestMapping(value = "/theater_list_admins/theater_list_areano.do", method = RequestMethod.GET)
  public ModelAndView theater_list_areano(int areano) {
    ModelAndView mav = new ModelAndView();

    List<TheaterVO> list = theaterProc.theater_list_areano(areano);
    mav.addObject("list", list);

    mav.setViewName("/theater_list_admins/theater_list_areano"); // /webapp/reply/list.jsp

    return mav;
  }

  @RequestMapping(value = "/theater_list_admins/list_by_areano_search_paging.do", method = RequestMethod.GET)
  public ModelAndView list_by_areano_search_paging(
      @RequestParam(value = "areano", defaultValue = "1") int areano,
      @RequestParam(value = "theater", defaultValue = "") String theater,
      @RequestParam(value = "nowPage", defaultValue = "1") int nowPage) {
    System.out.println("--> nowPage: " + nowPage);

    ModelAndView mav = new ModelAndView();
// /contents/list_by_categrpno_search_paging.jsp
    mav.setViewName("/theater_list_admins/list_by_areano_search_paging");

// ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("areano", areano); // #{areano}
    map.put("theater", theater); // #{theater}
    map.put("nowPage", nowPage);

// �˻� ���
    List<TheaterVO> list_by_areano_search_paging = theaterProc.list_by_areano_search_paging(map);
    mav.addObject("list_by_areano_search_paging", list_by_areano_search_paging);

// �˻��� ���ڵ� ����
    int search_count = theaterProc.search_count(map);
    mav.addObject("search_count", search_count);

    AreaVO areaVO = areaProc.read(areano);
    mav.addObject("areaVO", areaVO);

    /*
     * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� ���� ������: 11 / 22 [����] 11 12 13 14 15 16 17
     * 18 19 20 [����]
     * 
     * @param listFile ��� ���ϸ�
     * 
     * @param categrpno ī�װ���ȣ
     * 
     * @param search_count �˻�(��ü) ���ڵ��
     * 
     * @param nowPage ���� ������
     * 
     * @param theater �˻���
     * 
     * @return ����¡ ���� ���ڿ�
     */
    String paging = theaterProc.pagingBox("list_by_areano_search_paging.do", areano, search_count, nowPage, theater);
    mav.addObject("paging", paging);

    mav.addObject("nowPage", nowPage);

    return mav;
  }

/**
 * http://localhost:9090/team7/theater_list_admins/list_theater_select2.do?theaterno=1
 * {"areano":0,"theater":"����CGV","theaterno":1}
 * @param theaterno
 * @return
 */
@ResponseBody
@RequestMapping(value = "/theater_list_admins/list_theater_select2.do",
                            method = RequestMethod.GET,
                            produces = "text/plain;charset=UTF-8")
public String list_movie_select(int theaterno) {
  // String msg="JSON ���";
  // return msg;
  
  TheaterVO theaterVO = theaterProc.read(theaterno);
  
  JSONObject obj = new JSONObject(theaterVO);

  return obj.toString();     
}

}
