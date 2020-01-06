package dev.mvc.attachbd;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Contentsbd_AttachbdVO {
  // ===== contentsbdVO =====
  private int mno;
  private int boardgrpno;
  private String title;
  private String content;
  private int recom;
  private int cnt;
  private int replycnt;
  private String word;
  private String mage;
  private String mopen;
  private double mbook;
  private int seqnobd;
  private String fname;
  private String fupname;
  private String thumb;
  private long fsize;
  private String director;
  private String actor;
  private int runtime;
  private String genre;
  
  // ===== attachbdVO =====
  
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

  public int getMno() {
    return mno;
  }

  public void setMno(int mno) {
    this.mno = mno;
  }

  public int getBoardgrpno() {
    return boardgrpno;
  }

  public void setBoardgrpno(int boardgrpno) {
    this.boardgrpno = boardgrpno;
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

  public String getWord() {
    return word;
  }

  public void setWord(String word) {
    this.word = word;
  }

  public String getMage() {
    return mage;
  }

  public void setMage(String mage) {
    this.mage = mage;
  }

  public String getMopen() {
    return mopen;
  }

  public void setMopen(String mopen) {
    this.mopen = mopen;
  }

  public double getMbook() {
    return mbook;
  }

  public void setMbook(double mbook) {
    this.mbook = mbook;
  }

  public int getSeqnobd() {
    return seqnobd;
  }

  public void setSeqnobd(int seqnobd) {
    this.seqnobd = seqnobd;
  }

  public String getFname() {
    return fname;
  }

  public void setFname(String fname) {
    this.fname = fname;
  }

  public String getFupname() {
    return fupname;
  }

  public void setFupname(String fupname) {
    this.fupname = fupname;
  }

  public String getThumb() {
    return thumb;
  }

  public void setThumb(String thumb) {
    this.thumb = thumb;
  }

  public long getFsize() {
    return fsize;
  }

  public void setFsize(long fsize) {
    this.fsize = fsize;
  }

  public String getDirector() {
    return director;
  }

  public void setDirector(String director) {
    this.director = director;
  }

  public String getActor() {
    return actor;
  }

  public void setActor(String actor) {
    this.actor = actor;
  }

  public int getRuntime() {
    return runtime;
  }

  public void setRuntime(int runtime) {
    this.runtime = runtime;
  }

  public String getGenre() {
    return genre;
  }

  public void setGenre(String genre) {
    this.genre = genre;
  }

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







