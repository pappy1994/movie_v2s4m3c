package dev.mvc.rpl;

public class RplMembersVO {

  /** ��� ��ȣ */
  private int rplno;
  /** ���� �� ��ȣ */
  private int contentsbdno;
  /** ���� */
  private String content;
  /** ����� */
  private String rdate;
  /** ������ ��ȣ */
  private int mno;
  /** ���̵� */
  private String id = "";
  /** �н����� */
  private String passwd = "";
  public int getRplno() {
    return rplno;
  }
  public void setRplno(int rplno) {
    this.rplno = rplno;
  }
  public int getContentsbdno() {
    return contentsbdno;
  }
  public void setContentsbdno(int contentsbdno) {
    this.contentsbdno = contentsbdno;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public int getMno() {
    return mno;
  }
  public void setMno(int mno) {
    this.mno = mno;
  }
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
  
  
}
