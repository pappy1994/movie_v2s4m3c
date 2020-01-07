/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE members(
    mno                          NUMBER(10)     NOT NULL    PRIMARY KEY
);

COMMENT ON TABLE members is '회원';
COMMENT ON COLUMN members.mno is '회원번호';


/**********************************/
/* Table Name: 카테고리 그룹 */
/**********************************/
CREATE TABLE CUSTOMGRP(
    CUSTOMGRPNO                         NUMBER(10)     NOT NULL    PRIMARY KEY,
    NAME                              VARCHAR2(50)     NOT NULL,
    SEQNO                             NUMBER(7)    NOT NULL,
    VISIBLE                           CHAR(1)    NOT NULL,
    RDATE                             DATE     NOT NULL   
);

COMMENT ON TABLE CUSTOMGRP is '회원관리 그룹';
COMMENT ON COLUMN CUSTOMGRP.CUSTOMGRPNO is '회원관리그룹번호';
COMMENT ON COLUMN CUSTOMGRP.NAME is '이름';
COMMENT ON COLUMN CUSTOMGRP.SEQNO is '출력 순서';
COMMENT ON COLUMN CUSTOMGRP.VISIBLE is '출력 모드';
COMMENT ON COLUMN CUSTOMGRP.RDATE is '그룹 생성일';


/**********************************/
/* Table Name: 컨텐츠 */
/**********************************/
DROP TABLE members;
DROP TABLE customgrp;
DROP TABLE contentsmv;

DROP TABLE contentsmv CASCADE CONSTRAINTS; 

CREATE TABLE contentsmv(
    contentsmvno                        NUMBER(10)     NOT NULL    PRIMARY KEY,
    mno                          NUMBER(10)     NOT NULL,
    customgrpno                         NUMBER(10)     NOT NULL,
    title                             VARCHAR2(300)    NOT NULL,
    content                           CLOB           NOT NULL,
    recom                             NUMBER(7)    DEFAULT 0     NOT NULL,
    cnt                               NUMBER(7)    DEFAULT 0     NOT NULL,
    replycnt                          NUMBER(10)     DEFAULT 0     NOT NULL,
    rdate                             DATE     NOT NULL,
    word                              VARCHAR2(100)    NULL ,
  FOREIGN KEY (mno) REFERENCES members (mno),
  FOREIGN KEY (customgrpno) REFERENCES customgrp (customgrpno)
);

COMMENT ON TABLE contentsmv is '컨텐츠';
COMMENT ON COLUMN contentsmv.contentsmvno is '컨텐츠번호';
COMMENT ON COLUMN contentsmv.mno is '회원번호';
COMMENT ON COLUMN contentsmv.customgrpno is '카테고리 그룹 번호';
COMMENT ON COLUMN contentsmv.title is '제목';
COMMENT ON COLUMN contentsmv.content is '내용';
COMMENT ON COLUMN contentsmv.recom is '추천수';
COMMENT ON COLUMN contentsmv.cnt is '조회수';
COMMENT ON COLUMN contentsmv.replycnt is '댓글수';
COMMENT ON COLUMN contentsmv.rdate is '등록일';
COMMENT ON COLUMN contentsmv.word is '검색어';

1) 등록
-- PK 생성
SELECT NVL(MAX(contentsmvno), 0) + 1 as contentsmvno FROM contentsmv;                                
 contentsmvNO
 ----------
          1

INSERT INTO contentsmv(contentsmvno, 
                                mno, customgrpno, title, content, 
                                recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(contentsmvno), 0) + 1 as contentsmvno FROM contentsmv),
             0, 0, '제목1', '내용1',
             0, 0, 0, sysdate, '');

-- ORA-02291: integrity constraint (AI.SYS_C007068) violated - parent key not found
-- FK 컬럼의 값이 부모 테이블에 등록되어 있지 않아서 발생
-- members 테이블 목록 확인
INSERT INTO members(mno)
VALUES((SELECT NVL(MAX(mno), 0) + 1 as mno FROM members));
INSERT INTO members(mno)
VALUES((SELECT NVL(MAX(mno), 0) + 1 as mno FROM members));
INSERT INTO members(mno)
VALUES((SELECT NVL(MAX(mno), 0) + 1 as mno FROM members));

SELECT mno FROM members ORDER BY mno; 

 mno
 --------
        1
        2
        3
        
-- customgrp 테이블 목록 확인                                
SELECT customgrpno, name, seqno, visible, rdate
FROM customgrp
ORDER BY seqno ASC;

 CUSTOMGRPNO NAME   SEQNO VISIBLE RDATE
 ----------- ------ ----- ------- ---------------------
           1 공지 사항      1 Y       2019-12-11 17:52:15.0
           2 등급별 혜택     2 Y       2019-12-11 17:52:16.0
           3 Q&A        3 Y       2019-12-11 17:52:17.0

-- 1) contentsmv 등록(members: 1, customgrpno: 1),
--     varchar에 '' 등록되면 null이 insert 됨
INSERT INTO contentsmv(contentsmvno, 
                                mno, customgrpno, title, content, 
                                recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(contentsmvno), 0) + 1 as contentsmvno FROM contentsmv),
             1, 1, '제목1', '내용1',
             0, 0, 0, sysdate, '');

-- 2) 목록
SELECT contentsmvno, mno, customgrpno, title, content, 
           recom, cnt, replycnt, rdate, word
FROM contentsmv
ORDER BY contentsmvno DESC;
 contentsmvNO mno customgrpno TITLE CONTENT RECOM CNT REPLYCNT RDATE                 WORD
 ---------- -------- --------- ----- ------- ----- --- -------- --------------------- ----
          1        1         1 제목1   내용1         0   0        0 2019-11-25 16:14:17.0 NULL

-- 3) customgrpno별 전체 목록  -- 1: 해외 여행, 2: 국내 여행
SELECT contentsmvno, mno, customgrpno, title, content, 
           recom, cnt, replycnt, rdate, word
FROM contentsmv
WHERE customgrpno=1                                                       
ORDER BY contentsmvno DESC;

-- 4) 전체 레코드 수
SELECT COUNT(*) as count
FROM contentsmv;
             
-- 5) 조회
SELECT contentsmvno, mno, customgrpno, title, content, 
           recom, cnt, replycnt, rdate, word
FROM contentsmv
WHERE contentsmvno=1;

-- 6) 수정
UPDATE contentsmv
SET title='제목 수정', content='내용 수정', word='검색어'
WHERE contentsmvno = 1;

-- 7) 삭제
DELETE FROM contentsmv
WHERE contentsmvno=1;

-- 8) FK 부모 테이블별 레코드 갯수 산출
SELECT contentsmvno, mno, customgrpno, title
FROM contentsmv
WHERE customgrpno=6;

 contentsmvNO mno customgrpno TITLE
 ---------- -------- --------- -----------------------
          3          1                6                  12월 객실 예약안내
          5          1                6                  이번주 폭설로 심야 개장합니다.
          7          1                6                  스키장 입구 폭설로 고속도로에서 진입해주세요~

SELECT COUNT(*) as cnt
FROM contentsmv
WHERE customgrpno=6;

 CNT
 ---
   3             
             
-- 9) FK 부모 테이블별 레코드 삭제
DELETE FROM contentsmv
WHERE customgrpno=6;

(3 rows affected)