package dev.mvc.admins;

import javax.servlet.http.HttpSession;

public interface AdminsProcInter {
  /**
   * ������ ���
   * @return
   */
  public String list();
  
  /**
   * ���������� �˻�
   * @param session
   * @return
   */
  public boolean isAdmins(HttpSession session);
  
  /**
   * �α��� ó��
   * @param id_admin
   * @param passwd_admin
   * @return
   */
  public boolean login(String id_admins, String passwd_admins);
    
}