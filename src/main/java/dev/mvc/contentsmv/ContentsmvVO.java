package dev.mvc.contentsmv;

public class ContentsmvVO {
  /** 컨텐츠 번호 */
  private int contentsmvno;
  
  /** 회원 번호 */
  private int mno;
  
  /** 카테고리 번호 */
  private int customgrpno;
  
  /** 제목 */
  private String title;
  
  /** 내용 */
  private String content;
  
  /** 추천 */
  private int recom;
  
  /** 조회수 */
  private int cnt;
  
  /** 댓글수 */
  private int replycnt;
  
  /** 등록일 */
  private String rdate;
  
  /** 검색어 */
  private String word;

  public int getContentsmvno() {
    return contentsmvno;
  }

  public void setContentsmvno(int contentsmvno) {
    this.contentsmvno = contentsmvno;
  }

  public int getMno() {
    return mno;
  }

  public void setMno(int mno) {
    this.mno = mno;
  }

  public int getCustomgrpno() {
    return customgrpno;
  }

  public void setCustomgrpno(int customgrpno) {
    this.customgrpno = customgrpno;
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

  public int getRecom() {
    return recom;
  }

  public void setRecom(int recom) {
    this.recom = recom;
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

  public String getWord() {
    return word;
  }

  public void setWord(String word) {
    this.word = word;
  }

  
}
