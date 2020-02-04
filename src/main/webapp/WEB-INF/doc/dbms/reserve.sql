CREATE TABLE members(
    mno                         NUMBER(10)     NOT NULL    PRIMARY KEY
);

COMMENT ON TABLE members is '회원';
COMMENT ON COLUMN members.mno is '회원 번호';

/**********************************/
/* Table Name: 영화 */
/**********************************/
DROP TABLE members;
DROP TABLE boardgrp;
DROP TABLE contentsbd;
DROP TABLE attachbd;
DROP TABLE rpl;

CREATE TABLE contentsbd(
    contentsbdno                      NUMBER(10)       NOT NULL    PRIMARY KEY,
    mno                               NUMBER(10)       NOT NULL,
    boardgrpno                        NUMBER(10)       NOT NULL,
    title                             VARCHAR2(300)    NOT NULL,
    content                           CLOB             NOT NULL,
    recom                             NUMBER(7)        DEFAULT 0     NOT NULL,
    cnt                               NUMBER(7)        DEFAULT 0     NOT NULL,
    replycnt                          NUMBER(10)       DEFAULT 0     NOT NULL,
    rdate                             DATE             NOT NULL,
    word                              VARCHAR2(100)    NULL,
    mage                              VARCHAR2(50)     NOT NULL,
    mopen                             VARCHAR2(50)     NOT NULL,
    mbook                             NUMBER(5,2)      NOT NULL,
    seqnobd                           NUMBER(10)       DEFAULT 0     NOT NULL,
    fname                             VARCHAR2(100)    NOT NULL,
    fupname                           VARCHAR2(100)    NOT NULL,
    thumb                             VARCHAR2(100)    NULL,
    fsize                             NUMBER(10)       DEFAULT 0     NOT NULL,
    director                          VARCHAR2(100)    NOT NULL,
    actor                             VARCHAR2(100)    NOT NULL,
    runtime                           NUMBER(10)       NOT NULL,
    genre                             VARCHAR2(100)    NOT NULL,
    youtube                           VARCHAR2(512)    NULL,
    
  FOREIGN KEY (mno) REFERENCES members (mno),
  FOREIGN KEY (boardgrpno) REFERENCES boardgrp (boardgrpno)
);

COMMENT ON TABLE contentsbd is '컨텐츠';
COMMENT ON COLUMN contentsbd.contentsbdno is '컨텐츠 번호';
COMMENT ON COLUMN contentsbd.mno is '회원 번호';
COMMENT ON COLUMN contentsbd.boardgrpno is '카테고리 그룹 번호';
COMMENT ON COLUMN contentsbd.title is '제목';
COMMENT ON COLUMN contentsbd.content is '내용';
COMMENT ON COLUMN contentsbd.recom is '추천수';
COMMENT ON COLUMN contentsbd.cnt is '조회수';
COMMENT ON COLUMN contentsbd.replycnt is '댓글수';
COMMENT ON COLUMN contentsbd.rdate is '등록일';
COMMENT ON COLUMN contentsbd.word is '검색어';
COMMENT ON COLUMN contentsbd.mage is '나이 제한';
COMMENT ON COLUMN contentsbd.mopen is '개봉일';
COMMENT ON COLUMN contentsbd.mbook is '예매율';
COMMENT ON COLUMN contentsbd.seqnobd is '출력 순서';
COMMENT ON COLUMN contentsbd.fname is '원본 파일 이름';
COMMENT ON COLUMN contentsbd.fupname is '업로드 파일 이름';
COMMENT ON COLUMN contentsbd.thumb is '프리뷰 이름';
COMMENT ON COLUMN contentsbd.fsize is '파일 사이즈';
COMMENT ON COLUMN contentsbd.director is '감독';
COMMENT ON COLUMN contentsbd.actor is '배우';
COMMENT ON COLUMN contentsbd.runtime is '러닝타임';
COMMENT ON COLUMN contentsbd.genre is '장르';
COMMENT ON COLUMN contentsbd.youtube is '유튜브';

/**********************************/
/* Table Name: 지역 */
/**********************************/
DROP TABLE areagrp;

CREATE TABLE areagrp(
    areano                        NUMBER(10)     NOT NULL    PRIMARY KEY,
    area                           VARCHAR2(30),
    cnt                             NUMBER(7)    DEFAULT 0     NOT NULL    
);

COMMENT ON TABLE areagrp is '지역';
COMMENT ON COLUMN areagrp.areano is '지역번호';
COMMENT ON COLUMN areagrp.area is '상영지역';
COMMENT ON COLUMN areagrp.cnt is '등록된 자료수';
/**********************************/
/* Table Name: 극장 */
/**********************************/
DROP TABLE theatergrp;

CREATE TABLE theatergrp(
    theaterno                         NUMBER(10)     NOT NULL    PRIMARY KEY,
    areano                             NUMBER(10),
    theater                            VARCHAR2(30),
    FOREIGN KEY (areano) REFERENCES areagrp (areano)
);

COMMENT ON TABLE theatergrp is '극장';
COMMENT ON COLUMN theatergrp.theaterno is '극장번호';
COMMENT ON COLUMN theatergrp.areano is '지역번호';
COMMENT ON COLUMN theatergrp.theater is '상영극장';

/**********************************/
/* Table Name: 시간 */
/**********************************/
DROP TABLE movie_time

CREATE TABLE movie_time(
    movie_timeno                  NUMBER(10)     NOT NULL    PRIMARY KEY,
    seqno                            NUMBER(7)    DEFAULT 0     NOT NULL,
    mtime                           VARCHAR2(30)   NOT NULL
);

COMMENT ON TABLE movie_time is '영화시간';
COMMENT ON COLUMN movie_time.movie_timeno is '상영시간번호';
COMMENT ON COLUMN movie_time.seqno is '출력 순서';
COMMENT ON COLUMN movie_time.mtime is '상영시간';

/**********************************/
/* Table Name: RESERVEGRP */
/**********************************/
CREATE TABLE RESERVEGRP(
    reserveno                         NUMBER(10)    NOT NULL,
    areano                            NUMBER(10)     NOT NULL,
    theaterno                         NUMBER(10)     NOT NULL,
    movie_timeno                      NUMBER(10)     NOT NULL,
    contentsbdno                      NUMBER(10)     NOT NULL,
    FOREIGN KEY (areano) REFERENCES areagrp (areano),
    FOREIGN KEY (theaterno) REFERENCES theatergrp (theaterno),
    FOREIGN KEY (movie_timeno) REFERENCES movie_time (movie_timeno),
    FOREIGN KEY (contentsbdno) REFERENCES contentsbd (contentsbdno)
);

DROP TABLE reservegrp;
