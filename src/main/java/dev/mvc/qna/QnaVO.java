package dev.mvc.qna;

public class QnaVO {
/*  
    qnano                             NUMBER(10)     NOT NULL    PRIMARY KEY,
    qnagrpno                          NUMBER(10)     NULL ,
    title                             VARCHAR2(300)    NOT NULL,
    content                           CLOB     NOT NULL,
    cnt                               NUMBER(7)    NOT NULL,
    replycnt                          NUMBER(10)     NOT NULL,
    rdate                             DATE     NOT NULL,

 
 */
  /** ������ ��ȣ */
  private int qnano;
  
  /** ī�װ� ��ȣ */
  private int qnagrpno;
  
  /** ���� */
  private String title;
  
  /** ���� */
  private String content;

  /** ��ȸ�� */
  private int cnt;
  
  /** ��ۼ� */
  private int replycnt;
  
  /** ����� */
  private String rdate;

  public int getQnano() {
    return qnano;
  }

  public void setQnano(int qnano) {
    this.qnano = qnano;
  }

  public int getQnagrpno() {
    return qnagrpno;
  }

  public void setQnagrpno(int qnagrpno) {
    this.qnagrpno = qnagrpno;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public int getCnt() {
    return cnt;
  }

  public void setCnt(int cnt) {
    this.cnt = cnt;
  }

  public int getReplycnt() {
    return replycnt;
  }

  public void setReplycnt(int replycnt) {
    this.replycnt = replycnt;
  }

  public String getRdate() {
    return rdate;
  }

  public void setRdate(String rdate) {
    this.rdate = rdate;
  }


  
  
  
}







