package dev.mvc.contentsbd;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ContentsbdVO {

 /* contentsbdno                    NUMBER(10)     NOT NULL    PRIMARY KEY,
  mno                               NUMBER(10)     NOT NULL,
  boardgrpno                        NUMBER(10)     NOT NULL,
  title                             VARCHAR2(300)    NOT NULL,
  content                           CLOB             NOT NULL,
  recom                             NUMBER(7)    DEFAULT 0     NOT NULL,
  cnt                               NUMBER(7)    DEFAULT 0     NOT NULL,
  replycnt                          NUMBER(10)     DEFAULT 0     NOT NULL,
  rdate                             DATE     NOT NULL,
  word                              VARCHAR2(100)    NULL ,
  mage                              VARCHAR2(50)    NOT NULL,
  mopen                             VARCHAR2(50)    NOT NULL,
  mbook                             VARCHAR2(50)    NOT NULL,
  seqnobd                           NUMBER(10)    DEFAULT 0     NOT NULL,
  fname                             VARCHAR2(100)    NOT NULL,
  fupname                           VARCHAR2(100)    NOT NULL,
  thumb                             VARCHAR2(100)    NULL ,
  fsize                             NUMBER(10)     DEFAULT 0     NOT NULL,
  director                          VARCHAR2(100)    NOT NULL,
  actor                             VARCHAR2(100)    NOT NULL,
  runtime                           NUMBER(10)       NOT NULL,
  genre                             VARCHAR2(100)    NOT NULL,
  youtube                           VARCHAR2(512)    NULL,
    */
  
  private int contentsbdno;
  private int mno;
  private int boardgrpno;
  private String title;
  private String content;
  private int recom;
  private int cnt;
  private int replycnt;
  private String rdate;
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
  private String youtube;

  /** Form의 파일을 MultipartFile로 변환하여 저장  */
  private MultipartFile fnameMF;  
  
  public int getContentsbdno() {
    return contentsbdno;
  }
  public void setContentsbdno(int contentsbdno) {
    this.contentsbdno = contentsbdno;
  }

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

  public MultipartFile getFnameMF() {
    return fnameMF;
  }
  public void setFnameMF(MultipartFile fnameMF) {
    this.fnameMF = fnameMF;
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
  public String getYoutube() {
    return youtube;
  }
  public void setYoutube(String youtube) {
    this.youtube = youtube;
  }



  
}
