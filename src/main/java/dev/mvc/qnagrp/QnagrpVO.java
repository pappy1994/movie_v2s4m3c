package dev.mvc.qnagrp;

/*COMMENT ON TABLE qnagrp is 'Q/A ī�װ�';
COMMENT ON COLUMN Q/A categrp.qnagrpno is 'ī�װ��׷��ȣ';
COMMENT ON COLUMN Q/A categrp.name is '�׷� �̸�';
COMMENT ON COLUMN Q/A categrp.seqno is '��¼���';
COMMENT ON COLUMN Q/A categrp.visible is '��� ���';
COMMENT ON COLUMN Q/A categrp.rdate is '�׷� ������';*/
 
public class QnagrpVO {
  /** ī�װ� �׷� ��ȣ*/
  private int qnagrpno;
  /**  ī�װ� �̸� */
  private String name;
  /** ��� ���� */
  private int seqno;
  /** ��� ��� */
  private String visible;
  /** ����� */
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
 
  