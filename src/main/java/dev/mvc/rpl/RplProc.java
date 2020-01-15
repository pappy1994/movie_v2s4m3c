package dev.mvc.rpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import nation.web.tool.Tool;

@Component("dev.mvc.rpl.RplProc")
public class RplProc implements RplProcInter {
  @Autowired
  private RplDAOInter rplDAO; 
  
  public RplProc(){
    System.out.println("--> RplProc created.");
  
}

  @Override
  public int create(RplVO rplVO) {
    int cnt = rplDAO.create(rplVO);
    return cnt;
  }

  @Override
  public List<RplVO> list() {
    List<RplVO> list = rplDAO.list();
    return list;
  }

  @Override
  public List<RplVO> list_by_contentsbdno(int contentsbdno) {
    List<RplVO> list = rplDAO.list_by_contentsbdno(contentsbdno);
    String content = "";
    
    // 특수 문자 변경
    for (RplVO rplVO:list) {
      content = rplVO.getContent();
      content = Tool.convertChar(content);
      rplVO.setContent(content);
    }
    return list;
  }

  @Override
  public List<RplMembersVO> list_by_contentsbdno_join(int contentsbdno) {
    List<RplMembersVO> list = rplDAO.list_by_contentsbdno_join(contentsbdno);
    String content = "";
    
    // 특수 문자 변경
    for (RplMembersVO rplMembersVO:list) {
      content = rplMembersVO.getContent();
      content = Tool.convertChar(content);
      rplMembersVO.setContent(content);
    }
    
    return list;
  }

  @Override
  public int checkPasswd(Map<String, Object> map) {
   int cnt = rplDAO.checkPasswd(map);
    return cnt;
  }

  @Override
  public int delete(int rplno) {
   int cnt = rplDAO.delete(rplno);
    return cnt;
  }

  @Override
  public int count2_by_contentsbdno(int contentsbdno) {
   int cnt = rplDAO.count2_by_contentsbdno(contentsbdno);
    return cnt;
  }

  @Override
  public int delete2_by_contentsbdno(int contentsbdno) {
   int cnt = rplDAO.delete2_by_contentsbdno(contentsbdno);
    return cnt;
  }
}
