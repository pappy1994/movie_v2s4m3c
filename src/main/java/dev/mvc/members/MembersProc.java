package dev.mvc.members;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.members.MembersProc")
public class MembersProc implements MembersProcInter {
  @Autowired
  private MembersDAOInter membersDAO; 
  
  @Override
  public int checkId(String id) {
    int count = membersDAO.checkId(id);
    return count;
  }

  @Override
  public int create(MembersVO membersVO) {
    int count = membersDAO.create(membersVO);
    return count;
  }

  @Override
  public List<MembersVO> list() {
    List<MembersVO> list = membersDAO.list();
    return list;
  } 

  @Override
  public MembersVO read(int mno) {
    MembersVO membersVO = membersDAO.read(mno);
    return membersVO;
  }

  @Override
  public MembersVO readById(String id) {
    MembersVO membersVO = membersDAO.readById(id);
    return membersVO;
  }
  
  @Override
  public int update(MembersVO membersVO) {
    int count = membersDAO.update(membersVO);
    return count;
  }

  @Override
  public int passwd_check(HashMap<Object, Object> map) {
    int count = membersDAO.passwd_check(map);
    return count;
  }

  @Override
  public int passwd_update(HashMap<Object, Object> map) {
    int count = membersDAO.passwd_update(map);
    return count;
  }

  @Override
  public int delete(int mno) {
    int count = membersDAO.delete(mno);
    return count;
  }

  @Override
  public int login(Map<Object, Object> map) {
    int count = membersDAO.login(map);
    return count;
  }
  
  @Override
  public boolean isMembers(HttpSession session) {
    boolean sw = false;
    
    String id = (String)session.getAttribute("id");
    
    if (id != null){
      sw = true;
    }
    return sw;
  }

  
}
