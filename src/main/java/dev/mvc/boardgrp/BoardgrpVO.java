package dev.mvc.boardgrp;

public class BoardgrpVO {
/*  boardgrpno                         NUMBER(10)     NOT NULL    PRIMARY KEY,
  name                            VARCHAR2(50)     NOT NULL,
  seqno                           NUMBER(7)    DEFAULT 0     NOT NULL,
  visible                         CHAR(1)    DEFAULT 'Y'     NOT NULL,
  rdate                           DATE     NOT NULL,
  cnt                             NUMBER(7)    DEFAULT 0     NOT NULL    */
  
  /** 게시판 번호 */
  private int boardgrpno;
  /** 게시판 이름 */
  private String name;
  /** 출력 순서 */
  private int seqno;
  /** 출력 모드 */
  private String visible;
  /** 그룹 생성일 */
  private String rdate;
  /** 등록된 자료수 */
  private int cnt;
  
  public int getBoardgrpno() {
    return boardgrpno;
  }
  public void setBoardgrpno(int boardgrpno) {
    this.boardgrpno = boardgrpno;
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
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  
  
  
}
