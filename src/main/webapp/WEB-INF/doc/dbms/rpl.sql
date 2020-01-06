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
/* Table Name: 회원 */
/**********************************/
CREATE TABLE members(
    mno                         NUMBER(10)     NOT NULL    PRIMARY KEY
);

COMMENT ON TABLE members is '회원';
COMMENT ON COLUMN members.mno is '회원 번호';

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
/* Table Name: 댓글 */
/**********************************/
DROP TABLE rpl;

CREATE TABLE rpl(
    rplno                            NUMBER(10)     NOT NULL    PRIMARY KEY,
    contentsbdno                      NUMBER(10)  NOT  NULL ,
    mno                               NUMBER(6)    NOT NULL ,
    content                           VARCHAR2(1000)     NOT NULL,
    passwd                            VARCHAR2(20)     NOT NULL,
    rdate                              DATE NOT NULL,
  FOREIGN KEY (contentsbdno) REFERENCES contentsbd (contentsbdno),
  FOREIGN KEY (mno) REFERENCES members (mno)
);

COMMENT ON TABLE rpl is '댓글';
COMMENT ON COLUMN rpl.rplno is '댓글번호';
COMMENT ON COLUMN rpl.contentsbdno is '컨텐츠번호';
COMMENT ON COLUMN rpl.mno is '회원 번호';
COMMENT ON COLUMN rpl.content is '내용';
COMMENT ON COLUMN rpl.passwd is '비밀번호';
COMMENT ON COLUMN rpl.rdate is '등록일';

1) 등록
INSERT INTO rpl(rplno, contentsbdno, mno, content, passwd, rdate)
VALUES((SELECT NVL(MAX(rplno), 0) + 1 as rplno FROM rpl),
             2, 1, '댓글1', '1234', sysdate);
INSERT INTO rpl(rplno, contentsbdno, mno, content, passwd, rdate)
VALUES((SELECT NVL(MAX(rplno), 0) + 1 as rplno FROM rpl),
             2, 1, '댓글2', '1234', sysdate);
INSERT INTO rpl(rplno, contentsbdno, mno, content, passwd, rdate)
VALUES((SELECT NVL(MAX(rplno), 0) + 1 as rplno FROM rpl),
             2, 1, '댓글3', '1234', sysdate);             

2) 전체 목록
SELECT rplno, contentsbdno, mno, content, passwd, rdate
FROM rpl
ORDER BY rplno DESC;

 RPLNO CONTENTSBDNO MNO CONTENT PASSWD RDATE
 ----- ------------ --- ------- ------ ---------------------
     3            2   1 댓글3     1234   2019-12-19 13:29:56.0
     2            2   1 댓글2     1234   2019-12-19 13:29:55.0
     1            2   1 댓글1     1234   2019-12-19 13:29:54.0

3) contentsno 별 목록
SELECT rplno, contentsbdno, mno, content, passwd, rdate
FROM rpl
WHERE contentsbdno=2
ORDER BY rplno DESC;

 RPLNO CONTENTSBDNO MNO CONTENT PASSWD RDATE
 ----- ------------ --- ------- ------ ---------------------
     3            2   1 댓글3     1234   2019-12-19 13:29:56.0
     2            2   1 댓글2     1234   2019-12-19 13:29:55.0
     1            2   1 댓글1     1234   2019-12-19 13:29:54.0


4) 삭제
-- 패스워드 검사
SELECT count(passwd) as cnt
FROM rpl
WHERE rplno=1 AND passwd='1234';

 CNT
 ---
   1
   
-- 삭제
DELETE FROM rpl
WHERE rplno=1;

5) contentsbdno에 해당하는 댓글 수 확인 및 삭제
SELECT COUNT(*) as cnt
FROM rpl
WHERE contentsbdno=2;

CNT
 ---
   2

DELETE FROM rpl
WHERE contentsbdno=2;

6) mno에 해당하는 댓글 수 확인 및 삭제
SELECT COUNT(*) as cnt
FROM rpl
WHERE mno=1;

 CNT
 ---
   1

DELETE FROM rpl
WHERE mno=1;
 
7) 회원 ID의 출력
SELECT m.id,
       r.rplno, r.contentsbdno, r.mno, r.content, r.passwd, r.rdate
FROM members m,  rpl r
WHERE (m.mno = r.mno) AND r.contentsbdno = 1
ORDER BY r.rplno DESC;
 
8) 삭제용 패스워드 검사
SELECT COUNT(*) as cnt
FROM rpl
WHERE rplno = 1 AND passwd = '1234';

 CNT
 ---
   0

9) 삭제
DELETE FROM rpl
WHERE rplno = 1;

   

