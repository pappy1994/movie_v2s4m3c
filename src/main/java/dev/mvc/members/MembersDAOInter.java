package dev.mvc.members;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MembersDAOInter {
  /**
   * 중복 아이디 검사
   * @param id 아이디
   * @return 중복 아이디 갯수
   */
  public int checkId(String id);
  
  /**
   * 회원 가입
   * @param memberVO
   * @return 가입된 회원 수
   */
  public int create(MembersVO memberVO); 
 
  /**
   * 목록
   * @return
   */
  public List<MembersVO> list();
  
  public MembersVO read(int mno);
  
  public MembersVO readById(String id);
  
  public int update(MembersVO membersVO);
  
  public int passwd_check(HashMap<Object, Object> map);
  
  public int passwd_update(HashMap<Object, Object> map);
  
  public int delete(int mno);
  
  public int login(Map<Object, Object> map);
}
