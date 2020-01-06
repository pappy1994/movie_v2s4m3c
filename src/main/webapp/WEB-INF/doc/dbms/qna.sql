/**********************************/
/* Table Name: Q/A 카테고리 */
/**********************************/
DROP TABLE qnagrp;

CREATE TABLE qnagrp(
    qnagrpno                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    name                              VARCHAR2(50)     NOT NULL,
    seqno                             NUMBER(7)    DEFAULT 0     NOT NULL,
    visible                           CHAR(1)    DEFAULT 'Y'     NOT NULL,
    rdate                             DATE     NOT NULL
);

COMMENT ON TABLE qnagrp is 'Q/A 카테고리';
COMMENT ON COLUMN qnagrp.qnagrpno is '카테고리그룹번호';
COMMENT ON COLUMN qnagrp.name is '그룹 이름';
COMMENT ON COLUMN qnagrp.seqno is '출력순서';
COMMENT ON COLUMN qnagrp.visible is '출력 모드';
COMMENT ON COLUMN qnagrp.rdate is '그룹 생성일';


/**********************************/
/* Table Name: 컨텐츠 */
/**********************************/
DROP TABLE qna;

CREATE TABLE qna(
    qnano                             NUMBER(10)     NOT NULL    PRIMARY KEY,
    qnagrpno                          NUMBER(10)     NULL ,
    title                             VARCHAR2(300)    NOT NULL,
    content                           CLOB     NOT NULL,
    cnt                               NUMBER(7)    NOT NULL,
    replycnt                          NUMBER(10)     NOT NULL,
    rdate                             DATE     NOT NULL,
  FOREIGN KEY (qnagrpno) REFERENCES qnagrp (qnagrpno)
);

COMMENT ON TABLE qna is '컨텐츠';
COMMENT ON COLUMN qna.qnano is '컨텐츠번호';
COMMENT ON COLUMN qna.qnagrpno is '카테고리그룹번호';
COMMENT ON COLUMN qna.title is '제목';
COMMENT ON COLUMN qna.content is '내용';
COMMENT ON COLUMN qna.cnt is '조회수';
COMMENT ON COLUMN qna.replycnt is '댓글수';
COMMENT ON COLUMN qna.rdate is '등록일';

1) 등록
-- PK 생성
SELECT NVL(MAX(qnano), 0) + 1 as qnano FROM qna;                                
 CONTENTSNO
 ----------
          1

INSERT INTO qna(qnano, qnagrpno, title, content, 
                                cnt, replycnt, rdate)
VALUES((SELECT NVL(MAX(qnano), 0) + 1 as qnano FROM qna),
             1, '제목1', '내용1',
             0, 0, sysdate);

-- 1) contents 등록(categrpno: 1),
--     varchar에 '' 등록되면 null이 insert 됨
INSERT INTO qna(qnano, qnagrpno, title, content, 
                                cnt, replycnt, rdate)
VALUES((SELECT NVL(MAX(qnano), 0) + 1 as qnano FROM qna),
             1, '제목1', '내용1',
             0, 0, sysdate);
             
-- 2) 목록
SELECT qnano, qnagrpno, title, content,
           cnt, replycnt, rdate
FROM qna
ORDER BY qnano DESC;

 QNANO QNAGRPNO TITLE CONTENT CNT REPLYCNT RDATE
 ----- -------- ----- ------- --- -------- ---------------------
     1        1 제목1   내용1       0        0 2019-12-19 11:48:49.0



-- 3) categrpno별 전체 목록
SELECT qnano, qnagrpno, title, content, 
            cnt, replycnt, rdate
FROM qna
WHERE qnagrpno=1
ORDER BY qnano DESC;

 QNANO QNAGRPNO TITLE CONTENT CNT REPLYCNT RDATE
 ----- -------- ----- ------- --- -------- ---------------------
     1        1 제목1   내용1       0        0 2019-12-19 11:48:49.0


DELETE FROM contents; 

-- 4) 전체 레코드 수
SELECT COUNT(*) as count
FROM contents;
 
 COUNT
 -----
     2
     
-- 5) 조회
SELECT qnano, qnagrpno, title, content, 
            cnt, replycnt, rdate
FROM qna
WHERE qnano=1

 QNANO QNAGRPNO TITLE CONTENT CNT REPLYCNT RDATE
 ----- -------- ----- ------- --- -------- ---------------------
     1        1 제목1   내용1       0        0 2019-12-19 11:48:49.0



-- 6) 수정
UPDATE qna
SET title='제목 수정', content='내용 수정'
WHERE qnano = 1;

 QNANO QNAGRPNO TITLE CONTENT CNT REPLYCNT RDATE
 ----- -------- ----- ------- --- -------- ---------------------
     1        1 제목 수정 내용 수정     0        0 2019-12-19 11:48:49.0


-- 7) 삭제
DELETE FROM qna
WHERE qnano = 1;




             
             
             
             