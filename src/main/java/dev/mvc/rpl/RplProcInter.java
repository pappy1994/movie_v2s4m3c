package dev.mvc.rpl;

import java.util.List;
import java.util.Map;

public interface RplProcInter {
  public int create(RplVO rplVO);
  
  public List<RplVO> list();
 
  public List<RplVO> list_by_contentsbdno(int contentsbdno);
  
  public List<RplMembersVO> list_by_contentsbdno_join(int contentsbdno);
  
  public int checkPasswd(Map<String, Object> map);

  public int delete(int rplno);
  
  /**
   * contentsbdno 별 레코드 갯수
   * @param contentsbdno
   * @return 레코드 갯수
   */
  public int count2_by_contentsbdno(int contentsbdno);
  
  /**
   * contentsno 별 레코드 삭제
   * @param contentsno
   * @return 레코드 갯수
   */
  public int delete2_by_contentsbdno(int contentsbdno);
}
