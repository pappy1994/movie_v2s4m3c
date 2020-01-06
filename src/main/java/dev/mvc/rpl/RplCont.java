package dev.mvc.rpl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.admins.AdminsProcInter;

@Controller
public class RplCont {
  @Autowired
  @Qualifier("dev.mvc.rpl.RplProc") // 이름 지정
  private RplProcInter rplProc;
  
  @Autowired
  @Qualifier("dev.mvc.admins.AdminsProc") // 이름 지정
  private AdminsProcInter adminsProc;
  
  public RplCont(){
    System.out.println("--> RplCont created.");
  }
  
  @ResponseBody
  @RequestMapping(value = "/rpl/create.do",
                  method = RequestMethod.POST,
                  produces = "text/plain;charset=UTF-8")
  public String create(RplVO rplVO) {
    int count = rplProc.create(rplVO);
    
    JSONObject obj = new JSONObject();
    obj.put("count",count);
 
    return obj.toString(); // {"count":1}

  }
  
  @RequestMapping(value="/rpl/list.do", method=RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if (adminsProc.isAdmins(session)) {
      List<RplVO> list = rplProc.list();
      
      mav.addObject("list", list);
      mav.setViewName("/rpl/list"); // /webapp/rpl/list.jsp

    } else {
      mav.setViewName("redirect:/admins/login_need.jsp"); // /webapp/admins/login_need.jsp
    }
    
    return mav;
  }

  /**
   <xmp>
   http://localhost:9090/ojt/rpl/list_by_contentsbdno.do?contentsbdno=1
   글이 없는 경우: {"list":[]}
   글이 있는 경우
   {"list":[
            {"memberno":1,"rdate":"2019-12-18 16:46:43","passwd":"123","replyno":3,"content":"댓글 3","contentsno":1}
            ,
            {"memberno":1,"rdate":"2019-12-18 16:46:39","passwd":"123","replyno":2,"content":"댓글 2","contentsno":1}
            ,
            {"memberno":1,"rdate":"2019-12-18 16:46:35","passwd":"123","replyno":1,"content":"댓글 1","contentsno":1}
            ] 
   }
   </xmp>  
   * @param contentsbdno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/rpl/list_by_contentsbdno.do",
                  method = RequestMethod.GET,
                  produces = "text/plain;charset=UTF-8")
  public String list_by_contentsbdno(int contentsbdno) {
    List<RplVO> list = rplProc.list_by_contentsbdno(contentsbdno);
    
    JSONObject obj = new JSONObject();
    obj.put("list", list);
 
    return obj.toString(); 

  }
  
  /**
   * {"list":[
          {"memberno":1,
        "rdate":"2019-12-18 16:46:35",
      "passwd":"123",
      "replyno":1,
      "id":"user1",
      "content":"댓글&nbsp;1",
      "contentsno":1}
    ,
        {"memberno":1,
       "rdate":"2019-12-18 16:46:35",
       "passwd":"123",
       "replyno":1,
       "id":"user1",
       "content":"댓글&nbsp;1",
       "contentsno":1}
    ]
}
   * http://localhost:9090/ojt/reply/list_by_contentsno_join.do?contentsno=1
   * @param contentsno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/rpl/list_by_contentsbdno_join.do",
                  method = RequestMethod.GET,
                  produces = "text/plain;charset=UTF-8")
  public String list_by_contentsbdno_join(int contentsbdno) {
    // String msg="JSON 출력";
    // return msg;
    
    List<RplMembersVO> list = rplProc.list_by_contentsbdno_join(contentsbdno);
    
    JSONObject obj = new JSONObject();
    obj.put("list", list);
 
    return obj.toString();     
  }
  
  
  
  
  
  
  
}


