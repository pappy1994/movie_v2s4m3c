package dev.mvc.rpl;

import java.util.List;

public interface RplDAOInter {
  public int create(RplVO rplVO);
  
  public List<RplVO> list();
 
  public List<RplVO> list_by_contentsbdno(int contentsbdno);
  

}
