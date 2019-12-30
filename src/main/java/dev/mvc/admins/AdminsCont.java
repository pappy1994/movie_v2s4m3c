package dev.mvc.admins;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import dev.mvc.members.MembersProcInter;
import dev.mvc.members.MembersVO;

@Controller
public class AdminsCont {
  @Autowired
  @Qualifier("dev.mvc.admins.AdminsProc") // 이름 지정
  private AdminsProcInter adminsProc;
  
  @Autowired
  @Qualifier("dev.mvc.members.MembersProc") // 이름 지정
  private MembersProcInter membersProc;
  
  public AdminsCont(){
    System.out.println("--> AdminsCont created.");
  }
  
  /**
   * 관리자 목록
   * @return
   */
  // http://localhost:9090/ojt/admin/list.do
  @ResponseBody
  @RequestMapping(value = "/admins/list.do", 
                             method = RequestMethod.GET,
                             produces = "text/plain;charset=UTF-8")
  public String list(String id, String passwd) {
    return adminsProc.list();
  }
  
  /**
   * 관리자 로그인 폼
   * @return
   */
  // http://localhost:9090/ojt/admin/login.do 
  @RequestMapping(value = "/admins/login.do", 
                             method = RequestMethod.GET)
  public ModelAndView login(HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/admins/login_form");
    return mav;
  }
  
  /**
   * 관리자 로그인 처리
   * @return
   */
  // http://localhost:9090/ojt/admins/login.do 
  @RequestMapping(value = "/admins/login.do", 
                             method = RequestMethod.POST)
  public ModelAndView login_proc(HttpServletRequest request,
                                                 HttpServletResponse response,
                                                 HttpSession session,
                                                 String id_admins, 
                                                 String passwd_admins) {
    ModelAndView mav = new ModelAndView();
    
    boolean sw = adminsProc.login(id_admins, passwd_admins);
    if (sw == true) { // 로그인 성공
      session.setAttribute("id_admins", id_admins);
      session.setAttribute("passwd_admins", passwd_admins);
      
      // 관리 목적으로 1번 회원 로그인 처리
      MembersVO membersVO = membersProc.read(1); 
      session.setAttribute("mno", membersVO.getMno());
      session.setAttribute("id", membersVO.getId());
      session.setAttribute("mname", membersVO.getMname());
      
      mav.setViewName("redirect:/index.do");  
    } else {
      mav.setViewName("redirect:/admins/login_fail_msg.jsp");
    }
        
    return mav;
  }
  
  /**
   * 관리자 로그아웃 처리
   * @param session
   * @return
   */
  @RequestMapping(value="/admins/logout.do", 
                             method=RequestMethod.GET)
  public ModelAndView logout(HttpSession session){
    ModelAndView mav = new ModelAndView();
    session.invalidate(); // 모든 session 변수 삭제
    
    mav.setViewName("redirect:/admins/logout_msg.jsp");
    
    return mav;
  }
  
}




