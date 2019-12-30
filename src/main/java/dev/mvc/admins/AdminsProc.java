package dev.mvc.admins;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component("dev.mvc.admins.AdminsProc")
public class AdminsProc implements AdminsProcInter {
  @Value("${admin1}")  // properties ����
  private String admin1;

  @Value("${admin2}")
  private String admin2;
  
  @Value("${admin3}")
  private String admin3;
  
  /**
   * ������ ���� �˻�
   * @param info
   * @param id
   * @return
   */
  public boolean admins_check(String id_admins, String passwd_admins) {
    boolean sw = false;
    String[] admins = {admin1, admin2, admin3};
    
    for (String admin:admins) {
      String[] tokens = admin.split("/");    // {"admin1","1234","������1"} 
      if (tokens[0].equals(id_admins) && tokens[1].equals(passwd_admins)) {
        sw = true;
      }
    }
    
    return sw;
  }
  
  /**
   * ������ �α��� ó��
   */
  @Override
  public boolean login(String id_admins, String passwd_admins){
    System.out.println(admin1);
    System.out.println(admin2);
    System.out.println(admin3);
   
    // ������ ���̵�, �н����� �˻�
    boolean sw = admins_check(id_admins, passwd_admins); 
    
    return sw;
  }
  
  /**
   * ���� �α��ε� �������� üũ
   */
  @Override
  public boolean isAdmins(HttpSession session){
    boolean sw = false;
    
    String id_admins = (String)session.getAttribute("id_admins");
    
    if (id_admins != null){
      sw = true;
    }
    return sw;
  }
  
  /**
   * ������ ���
   */
  @Override
  public String list() {
    String admins = "";
    admins = admin1 + "\n" + admin2 + "\n" + admin3;  
    
    return admins;
  }
  
}

