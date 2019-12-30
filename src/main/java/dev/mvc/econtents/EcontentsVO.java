package dev.mvc.econtents;

public class EcontentsVO {

  /** 이벤트 순서 */
  private int econtentsno;
  /** 카테고리 그룹 번호 */
  private int eventgrpno;
  /** 이벤트 타입 */
  private String etype;
  /** 제목 */
  private String title;
  /** 내용 */
  private String content;
  /** 이벤트 기간 */
  private String rdate;
  
  public int getEcontentsno() {
    return econtentsno;
  }
  public void setEcontentsno(int econtentsno) {
    this.econtentsno = econtentsno;
  }
  public int getEventgrpno() {
    return eventgrpno;
  }
  public void setEventgrpno(int eventgrpno) {
    this.eventgrpno = eventgrpno;
  }
  public String getEtype() {
    return etype;
  }
  public void setEtype(String etype) {
    this.etype = etype;
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
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
  
  
}
