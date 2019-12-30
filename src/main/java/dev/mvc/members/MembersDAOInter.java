package dev.mvc.members;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MembersDAOInter {
  /**
   * �ߺ� ���̵� �˻�
   * @param id ���̵�
   * @return �ߺ� ���̵� ����
   */
  public int checkId(String id);
  
  /**
   * ȸ�� ����
   * @param memberVO
   * @return ���Ե� ȸ�� ��
   */
  public int create(MembersVO memberVO); 
 
  /**
   * ���
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
