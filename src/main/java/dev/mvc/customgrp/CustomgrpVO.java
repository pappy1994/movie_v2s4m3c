package dev.mvc.customgrp;
 
public class CustomgrpVO {
  /*CUSTOMGRPNO                         NUMBER(10)     NOT NULL    PRIMARY KEY,
  NAME                              VARCHAR2(50)     NOT NULL,
  SEQNO                             NUMBER(7)    NOT NULL,
  VISIBLE                           CHAR(1)    NOT NULL,
  RDATE                             DATE     NOT NULL,
  CNT                               NUMBER(7)    NULL */
  
  private int customgrpno;
  private String name;
  private int seqno;
  private String visible;
  private String rdate;  
  
  public int getCustomgrpno() {
    return customgrpno;
  }
  public void setCustomgrpno(int customgrpno) {
    this.customgrpno = customgrpno;
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