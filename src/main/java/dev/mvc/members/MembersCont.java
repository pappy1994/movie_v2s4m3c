package dev.mvc.members;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

@Controller
public class MembersCont {
  @Autowired
  @Qualifier("dev.mvc.members.MembersProc") // �̸� ����
  private MembersProcInter membersProc;

  public MembersCont() {
    System.out.println("--> MembersCont created.");
  }

  /**
   * ȸ�� ���� ��
   * 
   * @return
   */
  // http://localhost:9090/ojt/members/create.do
  @RequestMapping(value = "/members/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/members/create"); // /webapp/member/create.jsp

    return mav;
  }

  /**
   * �ߺ� ID �˻� http://localhost:9090/ojt/member/checkId.do?id=user1 ���: {"count":1}
   * 
   * @param id
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/members/checkId.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
  public String checkId(String id) {
    // System.out.println("--> id: " + id);
    int count = membersProc.checkId(id);

    JSONObject obj = new JSONObject();
    obj.put("count", count);

    return obj.toString(); // {"count":1}

  }

  @RequestMapping(value = "/members/create.do", method = RequestMethod.POST)
  public ModelAndView create(RedirectAttributes ra, HttpServletRequest request, MembersVO membersVO) {
    ModelAndView mav = new ModelAndView();

    int count = membersProc.create(membersVO);
    ra.addAttribute("count", count); // redirect parameter ����
    mav.setViewName("redirect:/members/create_msg.jsp");

    return mav;
  }

  @RequestMapping(value = "/members/list.do", method = RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();

    if (membersProc.isMembers(session) == false) {
      mav.setViewName("redirect:/members/login_need.jsp"); // /webapp/member/login_need.jsp
    } else {
      List<MembersVO> list = membersProc.list();

      mav.addObject("list", list);
      mav.setViewName("/members/list"); // /webapp/member/list.jsp
    }
    return mav;
  }

  @RequestMapping(value = "/members/read.do", method = RequestMethod.GET)
  public ModelAndView read(int mno) {
    ModelAndView mav = new ModelAndView();

    MembersVO membersVO = membersProc.read(mno);
    mav.addObject("membersVO", membersVO);

    mav.setViewName("/members/read");

    return mav;
  }

  @RequestMapping(value = "/members/update.do", method = RequestMethod.POST)
  public ModelAndView update(RedirectAttributes ra, MembersVO membersVO) {
    ModelAndView mav = new ModelAndView();

    int count = membersProc.update(membersVO);
    ra.addAttribute("count", count);
    ra.addAttribute("memberno", membersVO.getMno());
    mav.setViewName("redirect:/members/update_msg.jsp");

    return mav;
  }

  @RequestMapping(value = "/members/passwd_update.do", method = RequestMethod.GET)
  public ModelAndView passwd_update(int mno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/members/passwd_update");

    return mav;
  }

  @RequestMapping(value = "/members/passwd_update.do", method = RequestMethod.POST)
  public ModelAndView passwd_update(RedirectAttributes ra, int mno, String passwd, String new_passwd) {
    ModelAndView mav = new ModelAndView();

// ���� �н����� �˻�
    HashMap<Object, Object> map = new HashMap<Object, Object>();
    map.put("mno", mno);
    map.put("passwd", passwd);

    int count = membersProc.passwd_check(map);
    int update_count = 0; // ����� �н����� ��

    if (count == 0) { // ���� �н����尡 ��ġ���� �ʴ� ���
      ra.addAttribute("count", count);
      mav.setViewName("redirect:/members/passwd_update_fail_msg.jsp");
    } else { // ���� �н����尡 ��ġ�ϴ� ���
      map.put("passwd", new_passwd);
      update_count = membersProc.passwd_update(map);
      ra.addAttribute("update_count", update_count);
      mav.setViewName("redirect:/members/passwd_update_success_msg.jsp");
    }

    return mav;
  }

  @RequestMapping(value = "/members/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int mno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/members/delete");

    MembersVO membersVO = membersProc.read(mno);
    mav.addObject("membersVO", membersVO);

    return mav;
  }

  @RequestMapping(value = "/members/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(RedirectAttributes ra, int mno) {
    ModelAndView mav = new ModelAndView();

    String mname = membersProc.read(mno).getMname();
    ra.addAttribute("mname", mname);

    int count = membersProc.delete(mno);
    ra.addAttribute("count", count);

    mav.setViewName("redirect:/members/delete_msg.jsp?count=" + count);

    return mav;
  }

  @RequestMapping(value = "/members/login.do", method = RequestMethod.GET)
  public ModelAndView login(HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();

    Cookie[] cookies = request.getCookies();
    Cookie cookie = null;

    String ck_id = ""; // id ���� ����
    String ck_id_save = ""; // id ���� ���θ� üũ�ϴ� ����
    String ck_passwd = ""; // passwd ���� ����
    String ck_passwd_save = ""; // passwd ���� ���θ� üũ�ϴ� ����

    if (cookies != null) {
      for (int i = 0; i < cookies.length; i++) {
        cookie = cookies[i]; // ��Ű ��ü ����

        if (cookie.getName().equals("ck_id")) {
          ck_id = cookie.getValue();
        } else if (cookie.getName().equals("ck_id_save")) {
          ck_id_save = cookie.getValue(); // Y, N
        } else if (cookie.getName().equals("ck_passwd")) {
          ck_passwd = cookie.getValue(); // 1234
        } else if (cookie.getName().equals("ck_passwd_save")) {
          ck_passwd_save = cookie.getValue(); // Y, N
        }
      }
    }

    mav.addObject("ck_id", ck_id);
    mav.addObject("ck_id_save", ck_id_save);
    mav.addObject("ck_passwd", ck_passwd);
    mav.addObject("ck_passwd_save", ck_passwd_save);

    mav.setViewName("/members/login_ck_form");
    return mav;
  }

  @RequestMapping(value = "/members/login.do", method = RequestMethod.POST)
  public ModelAndView login_proc(HttpServletRequest request, HttpServletResponse response, HttpSession session,
      String id, String passwd, @RequestParam(value = "id_save", defaultValue = "") String id_save,
      @RequestParam(value = "passwd_save", defaultValue = "") String passwd_save) {
    ModelAndView mav = new ModelAndView();
    Map<Object, Object> map = new HashMap<Object, Object>();
    map.put("id", id);
    map.put("passwd", passwd);

    int count = membersProc.login(map);
    if (count == 1) { // �α��� ����
// System.out.println(id + " �α��� ����");
      MembersVO memberVO = membersProc.readById(id);
      session.setAttribute("mno", memberVO.getMno());
      session.setAttribute("id", id);
      session.setAttribute("mname", memberVO.getMname());

// -------------------------------------------------------------------
// id ���� ��� ����
// -------------------------------------------------------------------
      if (id_save.equals("Y")) { // id�� ������ ���
        Cookie ck_id = new Cookie("ck_id", id);
        ck_id.setMaxAge(60 * 60 * 72 * 10); // 30 day, �ʴ���
        response.addCookie(ck_id);
      } else { // N, id�� �������� �ʴ� ���
        Cookie ck_id = new Cookie("ck_id", "");
        ck_id.setMaxAge(0);
        response.addCookie(ck_id);
      }
// id�� �������� �����ϴ�  CheckBox üũ ����
      Cookie ck_id_save = new Cookie("ck_id_save", id_save);
      ck_id_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
      response.addCookie(ck_id_save);
// -------------------------------------------------------------------

// -------------------------------------------------------------------
// Password ���� ��� ����
// -------------------------------------------------------------------
      if (passwd_save.equals("Y")) { // �н����� ������ ���
        Cookie ck_passwd = new Cookie("ck_passwd", passwd);
        ck_passwd.setMaxAge(60 * 60 * 72 * 10); // 30 day
        response.addCookie(ck_passwd);
      } else { // N, �н����带 �������� ���� ���
        Cookie ck_passwd = new Cookie("ck_passwd", "");
        ck_passwd.setMaxAge(0);
        response.addCookie(ck_passwd);
      }
// passwd�� �������� �����ϴ�  CheckBox üũ ����
      Cookie ck_passwd_save = new Cookie("ck_passwd_save", passwd_save);
      ck_passwd_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
      response.addCookie(ck_passwd_save);
// -------------------------------------------------------------------

      mav.setViewName("redirect:/index.do");
    } else {
      mav.setViewName("redirect:/members/login_fail_msg.jsp");
    }

    return mav;
  }

  @RequestMapping(value = "/members/logout.do", method = RequestMethod.GET)
  public ModelAndView logout(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    session.invalidate(); // ��� session ���� ����

    mav.setViewName("redirect:/members/logout_msg.jsp");

    return mav;
  }

}
