package dev.mvc.admins;

import javax.servlet.http.HttpSession;

public interface AdminsProcInter {
  /**
   * 관리자 목록
   * @return
   */
  public String list();
  
  /**
   * 관리자인지 검사
   * @param session
   * @return
   */
  public boolean isAdmins(HttpSession session);
  
  /**
   * 로그인 처리
   * @param id_admin
   * @param passwd_admin
   * @return
   */
  public boolean login(String id_admins, String passwd_admins);
    
}
