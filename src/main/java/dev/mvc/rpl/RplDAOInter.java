package dev.mvc.rpl;

import java.util.List;
import java.util.Map;

public interface RplDAOInter {
  public int create(RplVO rplVO);
  
  public List<RplVO> list();
 
  public List<RplVO> list_by_contentsbdno(int contentsbdno);
  
  public List<RplMembersVO> list_by_contentsbdno_join(int contentsbdno);
  
  public int checkPasswd(Map<String, Object> map);

  public int delete(int rplno);
}
