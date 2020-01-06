package dev.mvc.attachbd;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class AttachbdVO {
  /*
    attachbdno                  NUMBER(10)     NOT NULL    PRIMARY KEY,
    contentsbdno                   NUMBER(10)    NULL ,
    aname                           VARCHAR2(100)    NOT NULL,
    aupname                      VARCHAR2(100)     NOT NULL,
    athumb                         VARCHAR2(100)    NULL ,
    asize                             NUMBER(10)     DEFAULT 0     NOT NULL,
   */
  /** ���� ��ȣ */
  private int attachbdno;
  /** �� ��ȣ(FK) */
  private int contentsbdno;
  /** ���� ���ϸ� */
  private String aname;
  /** ���ε�� ���ϸ� */
  private String aupname;
  /** Thumb �̹��� */
  private String athumb;
  /** ���� ũ�� */
  private long asize;
  /** ����� */
  private String rdate;
  
  /** Form�� ������ MultipartFile�� ��ȯ�Ͽ� List�� ����  */
  private List<MultipartFile> anamesMF;
  
  // private MultipartFile fnamesMF;  // �ϳ��� ���� ó��
  /** ���� ���� ��� */
  private String flabel;

  public int getAttachbdno() {
    return attachbdno;
  }

  public void setAttachbdno(int attachbdno) {
    this.attachbdno = attachbdno;
  }

  public int getContentsbdno() {
    return contentsbdno;
  }

  public void setContentsbdno(int contentsbdno) {
    this.contentsbdno = contentsbdno;
  }

  public String getAname() {
    return aname;
  }

  public void setAname(String aname) {
    this.aname = aname;
  }

  public String getAupname() {
    return aupname;
  }

  public void setAupname(String aupname) {
    this.aupname = aupname;
  }

  public String getAthumb() {
    return athumb;
  }

  public void setAthumb(String athumb) {
    this.athumb = athumb;
  }

  public long getAsize() {
    return asize;
  }

  public void setAsize(long asize) {
    this.asize = asize;
  }

  public String getRdate() {
    return rdate;
  }

  public void setRdate(String rdate) {
    this.rdate = rdate;
  }

  public List<MultipartFile> getAnamesMF() {
    return anamesMF;
  }

  public void setAnamesMF(List<MultipartFile> anamesMF) {
    this.anamesMF = anamesMF;
  }

  public String getFlabel() {
    return flabel;
  }

  public void setFlabel(String flabel) {
    this.flabel = flabel;
  }


  
}
