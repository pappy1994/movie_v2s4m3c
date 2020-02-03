/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE members(
		mno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY
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
DROP TABLE members;
DROP TABLE boardgrp;
DROP TABLE contentsbd;
DROP TABLE attachbd;
DROP TABLE rpl;

CREATE TABLE contentsbd(
		contentsbdno                    	NUMBER(10)		   NOT NULL		 PRIMARY KEY,
		mno                      	        NUMBER(10)		   NOT NULL,
		boardgrpno                     		NUMBER(10)		   NOT NULL,
		title                         		VARCHAR2(300)		 NOT NULL,
		content                       		CLOB        		 NOT NULL,
		recom                         		NUMBER(7)		     DEFAULT 0		 NOT NULL,
		cnt                           		NUMBER(7)		     DEFAULT 0		 NOT NULL,
		replycnt                      		NUMBER(10)		   DEFAULT 0		 NOT NULL,
		rdate                         		DATE		         NOT NULL,
		word                          		VARCHAR2(100)		 NULL,
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

1) 등록
INSERT INTO contentsbd(contentsbdno, 
                     mno, boardgrpno, title, content, 
                     recom, cnt, replycnt, rdate, word, mage, mopen, mbook, 
                     seqnobd, fname, fupname, thumb, fsize, 
                     director, actor, runtime, genre, youtube)
-- PK 생성
SELECT NVL(MAX(contentsbdno), 0) + 1 as contentsbdno FROM contentsbd;
 
CONTENTSNO
----------
          1

INSERT INTO contentsbd(contentsbdno, 
                     mno, boardgrpno, title, content, 
                     recom, cnt, replycnt, rdate, word, mage, mopen, mbook, 
                     seqnobd, fname, fupname, thumb, fsize, 
                     director, actor, runtime, genre, youtube)
VALUES((SELECT NVL(MAX(contentsbdno), 0) + 1 as contentsbdno FROM contentsbd),
        0, 0, '겨울왕국2', '내용1',
        0, 0, 0, sysdate, '', '전체이용가', '19.11.21', 61.7, 1, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000, '스릴러', '유튜브 주소');        
-- ORA-02291: integrity constraint (AI.SYS_C007288) violated - parent key not found
-- FK 컬럼의 값이 부모 테이블에 등록되어 있지 않아서 발생함.

-- member 테이블 목록 확인
INSERT INTO members(mno)
VALUES((SELECT NVL(MAX(mno), 0) + 1 as mno FROM members));
INSERT INTO members(mno)
VALUES((SELECT NVL(MAX(mno), 0) + 1 as mno FROM members));
INSERT INTO members(mno)
VALUES((SELECT NVL(MAX(mno), 0) + 1 as mno FROM members));

SELECT mno FROM members ORDER BY mno; 

 MNO
 ---
   1
   2
   3

-- boardgrp 테이블 목록 확인
SELECT boardgrpno, name, seqno, visible, rdate, cnt
FROM boardgrp
ORDER BY seqno ASC;

 BOARDGRPNO NAME  SEQNO VISIBLE RDATE                 CNT
 ---------- ----- ----- ------- --------------------- ---
          1 박스오피스     1 Y       2019-12-16 16:35:20.0   0
          2 상영예정작     2 Y       2019-12-26 12:52:23.0   0

-- 1) 컨텐츠 등록
-- contentsbd (등록: memberno=1, boardgrpno=1)
-- VARCHAR에 ''이 등록되면 NULL이 insert 됨
INSERT INTO contentsbd(contentsbdno, 
                     mno, boardgrpno, title, content, 
                     recom, cnt, replycnt, rdate, word, mage, mopen, mbook, 
                     seqnobd, fname, fupname, thumb, fsize, 
                     director, actor, runtime, genre, youtube)
VALUES((SELECT NVL(MAX(contentsbdno), 0) + 1 as contentsbdno FROM contentsbd),
        1, 1, '겨울왕국2', '내용1',
        0, 0, 0, sysdate, '', '전체이용가', '19.11.21', 61.7, 
        1, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000, '눈사람', '눈, 눈덩이', 105, '로맨스', '유튜브 주소');        

-- 2) 목록
SELECT contentsbdno, mno, boardgrpno, title, content, 
       recom, cnt, replycnt, rdate, word, mage, mopen, mbook, 
       seqnobd, fname, fupname, thumb, fsize,
       director, actor, runtime, genre, youtube
FROM contentsbd
ORDER BY mbook DESC

 CONTENTSBDNO MNO BOARDGRPNO TITLE CONTENT RECOM CNT REPLYCNT RDATE                 WORD MAGE  MOPEN    MBOOK SEQNOBD FNAME       FUPNAME       THUMB         FSIZE DIRECTOR ACTOR  RUNTIME GENRE YOUTUBE
 ------------ --- ---------- ----- ------- ----- --- -------- --------------------- ---- ----- -------- ----- ------- ----------- ------------- ------------- ----- -------- ------ ------- ----- -------
            1   1          1 겨울왕국2 내용1         0   0        0 2019-12-26 11:57:30.0 NULL 전체이용가 19.11.21  61.7       1 samyang.jpg samyang_1.jpg samyang_t.jpg  1000 눈사람      눈, 눈덩이     105 로맨스   유튜브 주소

-- 3) boardgrpno별 전체 목록
SELECT contentsbdno, mno, boardgrpno, title, content, 
       recom, cnt, replycnt, rdate, word, mage, mopen, mbook, seqnobd, fname, fupname, thumb, fsize
FROM contentsbd
WHERE boardgrpno = 1;
ORDER BY mbook DESC

-- contents 테이블에서 사용되는 레코드의 삭제
DELETE FROM boardgrp WHERE boardgrpno = 1;
-- ORA-02292: integrity constraint (AI.SYS_C007314) violated - child record found
-- 자식 테이블에서 boardgrp의 boardgrpno 컬럼이 사용되고 있는지 확인 후
-- 존재하면 삭제
-- 자식 레코드 삭제
DELETE FROM contentsbd WHERE contentsbdno = 1;
-- 현재 부모 테이블 레코드 삭제
DELETE FROM boardgrp WHERE boardgrpno = 1;

SELECT boardgrp, name, seqno, visible, rdate, cnt
FROM boardgrp
ORDER BY seqno ASC;

-- 4) 전체 레코드 수
SELECT COUNT(*) as count
FROM contentsbd;
 COUNT
 -----
     1
          
-- 5) 조회
SELECT contentsbdno, mno, boardgrpno, title, content, 
           recom, cnt, replycnt, rdate, word, mage, mopen, mbook, 
           seqnobd, fname, fupname, thumb, fsize,
           director, actor, runtime, genre, youtube
FROM contentsbd
WHERE contentsbdno=18;

-- 6) 수정
UPDATE contentsbd
SET title='겨울왕국', content='내용 수정', word='검색어', mage='15', mopen='12.12.12', mbook='69.99',
    director='두유', actor='콩, 우유', runtime=107, genre='요리', youtube='유튜브 변경'
WHERE contentsbdno = 1;

-- 예매율에 따른 전체 목록
SELECT contentsbdno, mno, boardgrpno, title, content, 
       recom, cnt, replycnt, rdate, word, mage, mopen, mbook, 
       seqnobd, fname, fupname, thumb, fsize, 
       director, actor, runtime, genre, youtube
FROM contentsbd
ORDER BY mbook DESC

-- 7) 삭제
DELETE FROM contentsbd
WHERE contentsbdno=18;

-- 8) FK 부모 테이블별 레코드 개수 산출
SELECT contentsbdno, mno, boardgrpno, title
FROM contentsbd
WHERE boardgrpno = 1;
          
SELECT COUNT(*) as cnt
FROM contentsbd
WHERE boardgrpno = 6;
          
 CNT
 ---
   1

-- 9) FK 부모 테이블별 레코드 삭제
DELETE FROM contentsbd
WHERE boardgrpno = 6;


10) 댓글수 증가
UPDATE contentsbd
SET replycnt = replycnt + 1
WHERE contentsbdno = 1;

11) 댓글수 감소
UPDATE contentsbd
SET replycnt = replycnt - 1
WHERE contentsbdno = 1;

12) 추천수 증가
UPDATE contentsbd
SET recom = recom + 1
WHERE contentsbdno = 1;

13) 검색
① boardgrp 검색 목록
SELECT contentsbdno, 
            mno, boardgrpno, title, content, 
            recom, cnt, replycnt, rdate, word, mage, mopen, mbook, 
            seqnobd, fname, fupname, thumb, fsize, 
            director, actor, runtime, genre, youtube
FROM contentsbd
WHERE boardgrpno=2 AND word LIKE '%스위스%'
ORDER BY contentsbdno DESC;

SELECT contentsbdno, 
            mno, boardgrpno, title, content, 
            recom, cnt, replycnt, rdate, word, mage, mopen, mbook, 
            seqnobd, fname, fupname, thumb, fsize, 
            director, actor, runtime, genre, youtube
FROM contentsbd
WHERE boardgrpno=2 AND word LIKE '%스의스%'
ORDER BY contentsbdno DESC;

SELECT contentsbdno, 
            mno, boardgrpno, title, content, 
            recom, cnt, replycnt, rdate, word, mage, mopen, mbook, 
            seqnobd, fname, fupname, thumb, fsize, 
            director, actor, runtime, genre, youtube
FROM contentsbd
WHERE boardgrpno=2 AND word LIKE '%수의스%'
ORDER BY contentsbdno DESC;

SELECT contentsbdno, 
            mno, boardgrpno, title, content, 
            recom, cnt, replycnt, rdate, word, mage, mopen, mbook, 
            seqnobd, fname, fupname, thumb, fsize, 
            director, actor, runtime, genre, youtube
FROM contentsbd
WHERE boardgrpno=2 AND word LIKE '%swiss%'
ORDER BY contentsbdno DESC;

SELECT contentsbdno, 
            mno, boardgrpno, title, content, 
            recom, cnt, replycnt, rdate, word, mage, mopen, mbook, 
            seqnobd, fname, fupname, thumb, fsize, 
            director, actor, runtime, genre, youtube
FROM contentsbd
WHERE boardgrpno=2 AND word LIKE '%유럽%'
ORDER BY contentsbdno DESC;

② 검색 레코드 갯수
-- 전체 레코드 갯수
SELECT COUNT(*) as cnt
FROM contentsbd
WHERE boardgrpno=2;

-- 검색 레코드 갯수
SELECT COUNT(*) as cnt
FROM contentsbd
WHERE boardgrpno=2 AND word LIKE '%스위스%';

-- 페이징    
SELECT contentsbdno, 
            mno, boardgrpno, title, content, 
            recom, cnt, replycnt, rdate, word, mage, mopen, mbook, 
            seqnobd, fname, fupname, thumb, fsize, 
            director, actor, runtime, genre, youtube, r
FROM (
        SELECT contentsbdno, 
                  mno, boardgrpno, title, content, 
                  recom, cnt, replycnt, rdate, word, mage, mopen, mbook, 
                  seqnobd, fname, fupname, thumb, fsize, 
                  director, actor, runtime, genre, youtube, rownum as r
        FROM (
                  SELECT contentsbdno, 
                         mno, boardgrpno, title, content, 
                         recom, cnt, replycnt, rdate, word, mage, mopen, mbook, 
                         seqnobd, fname, fupname, thumb, fsize, 
                         director, actor, runtime, genre, youtube
                  FROM contentsbd
                  ORDER BY mbook DESC
              )
)
WHERE r>=1 AND r<=3;


