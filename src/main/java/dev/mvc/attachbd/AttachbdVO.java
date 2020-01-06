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
  /** 파일 번호 */
  private int attachbdno;
  /** 글 번호(FK) */
  private int contentsbdno;
  /** 원본 파일명 */
  private String aname;
  /** 업로드된 파일명 */
  private String aupname;
  /** Thumb 이미지 */
  private String athumb;
  /** 파일 크기 */
  private long asize;
  /** 등록일 */
  private String rdate;
  
  /** Form의 파일을 MultipartFile로 변환하여 List에 저장  */
  private List<MultipartFile> anamesMF;
  
  // private MultipartFile fnamesMF;  // 하나의 파일 처리
  /** 파일 단위 출력 */
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
