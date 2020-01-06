/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE members(
    mno                         NUMBER(10)     NOT NULL    PRIMARY KEY
);

COMMENT ON TABLE members is '회원';
COMMENT ON COLUMN members.mno is '회원 번호';


/**********************************/
/* Table Name: 카테고리 그룹 */
/**********************************/
CREATE TABLE boardgrp(
    boardgrpno                      NUMBER(10)     NOT NULL    PRIMARY KEY,
    name                            VARCHAR2(50)     NOT NULL,
    seqno                           NUMBER(7)    DEFAULT 0     NOT NULL,
    visible                         CHAR(1)    DEFAULT 'Y'     NOT NULL,
    rdate                           DATE     NOT NULL,
    cnt                             NUMBER(7)    DEFAULT 0     NOT NULL    
);
 
COMMENT ON TABLE boardgrp is '게시판 그룹';
COMMENT ON COLUMN boardgrp.boardgrpno is '게시판 번호';
COMMENT ON COLUMN boardgrp.name is '이름';
COMMENT ON COLUMN boardgrp.seqno is '출력 순서';
COMMENT ON COLUMN boardgrp.visible is '출력 모드';
COMMENT ON COLUMN boardgrp.rdate is '그룹 생성일';
COMMENT ON COLUMN boardgrp.cnt is '등록된 자료수';

/**********************************/
/* Table Name: 컨텐츠 */
/**********************************/
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
    thumb                             VARCHAR2(100)    NULL ,
    fsize                             NUMBER(10)       DEFAULT 0     NOT NULL,
    director                          VARCHAR2(100)    NOT NULL,
    actor                             VARCHAR2(100)    NOT NULL,
    runtime                           NUMBER(10)       NOT NULL,
    genre                             VARCHAR2(100)    NOT NULL,
    
  FOREIGN KEY (mno) REFERENCES members (mno),
  FOREIGN KEY (boardgrpno) REFERENCES boardgrp (boardgrpno)
);

/**********************************/
/* Table Name: 첨부파일 */
/**********************************/
DROP TABLE attachbd;

CREATE TABLE attachbd(
		attachbdno                  NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		contentsbdno                NUMBER(10)		 NULL ,
		aname                      	VARCHAR2(100)		 NOT NULL,
		aupname                     VARCHAR2(100)		 NOT NULL,
		athumb                       VARCHAR2(100)		 NULL ,
		asize                    		NUMBER(10)		 DEFAULT 0		 NOT NULL,
    rdate                       DATE     NOT NULL,
  FOREIGN KEY (contentsbdno) REFERENCES contentsbd (contentsbdno)
);

COMMENT ON TABLE attachbd is '첨부파일';
COMMENT ON COLUMN attachbd.attachbdno is '첨부파일번호';
COMMENT ON COLUMN attachbd.contentsbdno is '컨텐츠번호';
COMMENT ON COLUMN attachbd.aname is '원본 파일명';
COMMENT ON COLUMN attachbd.aupname is '업로드 파일명';
COMMENT ON COLUMN attachbd.athumb is 'Thumb 파일';
COMMENT ON COLUMN attachbd.asize is '파일 사이즈';
COMMENT ON COLUMN attachbd.rdate is '등록일';

-- 1) 등록
SELECT NVL(MAX(attachbdno), 0) + 1 as attachbdno FROM attachbd;

 ATTACHBDNO
 ----------
          1

SELECT contentsbdno, mno, boardgrpno, title
FROM contentsbd
ORDER BY contentsbdno ASC;
 
 CONTENTSBDNO MNO BOARDGRPNO TITLE
 ------------ --- ---------- -----------
            2   1          1 쥬만지: 넥스트 레벨
            3   1          1 포드 V 페라리

INSERT INTO attachbd(attachbdno, contentsbdno, aname, aupname, athumb, asize, rdate)
VALUES((SELECT NVL(MAX(attachbdno), 0) + 1 as attachbdno FROM attachbd),
             2, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000, sysdate);
             
-- 2) 목록( contentsno 기준 내림 차순, attachfileno 기준 오르차순)
SELECT attachbdno, contentsbdno, aname, aupname, athumb, asize, rdate
FROM attachbd
ORDER BY contentsbdno DESC,  attachbdno ASC;

 ATTACHBDNO CONTENTSBDNO ANAME       AUPNAME       ATHUMB        ASIZE RDATE
 ---------- ------------ ----------- ------------- ------------- ----- ---------------------
          1            2 samyang.jpg samyang_1.jpg samyang_t.jpg  1000 2019-12-19 10:20:56.0

-- 3) 글별 파일 목록(contentsno 기준 내림 차순, attachfileno 기준 오르차순)
SELECT attachbdno, contentsbdno, aname, aupname, athumb, asize, rdate
FROM attachbd
WHERE contentsbdno = 2
ORDER BY aname ASC;

 ATTACHBDNO CONTENTSBDNO ANAME       AUPNAME       ATHUMB        ASIZE RDATE
 ---------- ------------ ----------- ------------- ------------- ----- ---------------------
          1            2 samyang.jpg samyang_1.jpg samyang_t.jpg  1000 2019-12-19 10:20:56.0

-- 4) 하나의 파일 삭제
DELETE FROM attachbd
WHERE attachbdno = 2;

-- 5) FK contentsno 부모 테이블별 레코드 갯수 산출
SELECT attachbdno, contentsbdno, aname, aupname, athumb, asize, rdate
FROM attachbd
WHERE contentsbdno=2;

SELECT COUNT(*) as cnt
FROM attachbd
WHERE contentsbdno=2;          
             
-- 6) FK 부모 테이블별 레코드 삭제
DELETE FROM attachbd
WHERE contentsbdno=2;

-- 7) Contentsbd, Attachbd join 
SELECT c.title, 
       a.attachbdno, a.contentsbdno, a.aname, a.aupname, a.athumb, a.asize, a.rdate
FROM contentsbd c, attachbd a
WHERE c.contentsbdno = a.contentsbdno
ORDER BY c.contentsbdno DESC, a.attachbdno ASC;

 TITLE       ATTACHBDNO CONTENTSBDNO ANAME       AUPNAME       ATHUMB        ASIZE RDATE
 ----------- ---------- ------------ ----------- ------------- ------------- ----- ---------------------
 쥬만지: 넥스트 레벨          1            2 samyang.jpg samyang_1.jpg samyang_t.jpg  1000 2019-12-19 10:20:56.0








