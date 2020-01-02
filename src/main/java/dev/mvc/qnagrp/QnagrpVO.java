package dev.mvc.qnagrp;

/*COMMENT ON TABLE qnagrp is 'Q/A 카테고리';
COMMENT ON COLUMN Q/A categrp.qnagrpno is '카테고리그룹번호';
COMMENT ON COLUMN Q/A categrp.name is '그룹 이름';
COMMENT ON COLUMN Q/A categrp.seqno is '출력순서';
COMMENT ON COLUMN Q/A categrp.visible is '출력 모드';
COMMENT ON COLUMN Q/A categrp.rdate is '그룹 생성일';*/
 
public class QnagrpVO {
  /** 카테고리 그룹 번호*/
  private int qnagrpno;
  /**  카테고리 이름 */
  private String name;
  /** 출력 순서 */
  private int seqno;
  /** 출력 모드 */
  private String visible;
  /** 등록일 */
  private String rdate;
  
  public int getQnagrpno() {
    return qnagrpno;
  }
  public void setQnagrpno(int qnagrpno) {
    this.qnagrpno = qnagrpno;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public int getSeqno() {
    return seqno;
  }
  public void setSeqno(int seqno) {
    this.seqno = seqno;
  }
  public String getVisible() {
    return visible;
  }
  public void setVisible(String visible) {
    this.visible = visible;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
  
  
} 
 
  