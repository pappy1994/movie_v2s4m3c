package dev.mvc.rpl;

public class RplVO {
/*  rplno                            NUMBER(10)     NOT NULL    PRIMARY KEY,
  contentsbdno                      NUMBER(10)  NOT  NULL ,
  mno                               NUMBER(6)    NOT NULL ,
  content                           VARCHAR2(1000)     NOT NULL,
  passwd                            VARCHAR2(20)     NOT NULL,
  rdate                              DATE NOT NULL,*/
  
  /** ��� ��ȣ */
  private int rplno;
  /** ���� �� ��ȣ */
  private int contentsbdno;
  /** ȸ�� ��ȣ */
  private int mno;
  /** ���� */
  private String content;
  /** �н����� */
  private String passwd;
  /** ����� */
  private String rdate;
  
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
  public int getMno() {
    return mno;
  }
  public void setMno(int mno) {
    this.mno = mno;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
  
  
}
