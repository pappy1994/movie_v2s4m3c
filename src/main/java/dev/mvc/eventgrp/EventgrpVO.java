package dev.mvc.eventgrp;

public class EventgrpVO {

  /*
  eventgrpno                      NUMBER(10)     NOT NULL    PRIMARY KEY, -- 그룹 번호
  name                            VARCHAR2(50)     NOT NULL,              -- 이름
  seqno                            NUMBER(7)    DEFAULT 0     NOT NULL,   -- 출력 순서
  visible                           CHAR(1)    DEFAULT 'Y'     NOT NULL,  -- 출력 모드
  rdate
  */
  private int eventgrpno;
  private String name;
  private int seqno;
  private String visible;
  private String rdate;
  
  public int getEventgrpno() {
    return eventgrpno;
  }
  public void setEventgrpno(int eventgrpno) {
    this.eventgrpno = eventgrpno;
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
