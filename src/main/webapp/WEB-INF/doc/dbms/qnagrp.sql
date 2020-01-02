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

-- 1)등록

INSERT INTO qnagrp(qnagrpno, name, seqno, visible, rdate)
VALUES((SELECT NVL(MAX(qnagrpno), 0) + 1 as qnagrpno FROM qnagrp),
            '공지사항', 1, 'Y', sysdate);

INSERT INTO qnagrp(qnagrpno, name, seqno, visible, rdate)
VALUES((SELECT NVL(MAX(qnagrpno), 0) + 1 as qnagrpno FROM qnagrp),
            '자주 묻는 질문', 1, 'Y', sysdate);

INSERT INTO qnagrp(qnagrpno, name, seqno, visible, rdate)
VALUES((SELECT NVL(MAX(qnagrpno), 0) + 1 as qnagrpno FROM qnagrp),
            'Q/A', 1, 'Y', sysdate);

-- 2)목록
SELECT qnagrpno, name, seqno, visible, TO_CHAR(rdate, 'YYYY-MM-DD hh:mi:ss') as rdate
FROM qnagrp
ORDER BY qnagrpno ASC;

 QNAGRPNO NAME     SEQNO VISIBLE RDATE
 -------- -------- ----- ------- -------------------
        1 공지사항         1 Y       2019-12-17 06:01:06
        2 자주 묻는 질문     1 Y       2019-12-17 06:01:10
        3 Q/A          1 Y       2019-12-17 06:01:11


         
-- 3)수정
UPDATE qnagrp
SET name='떠오르지않음', seqno = 3, visible='N'
WHERE qnagrpno = 3;

-- 4)조회
SELECT qnagrpno, name, seqno, visible, rdate 
FROM qnagrp
WHERE qnagrpno = 1;

 QNAGRPNO NAME SEQNO VISIBLE RDATE
 -------- ---- ----- ------- ---------------------
        1 공지사항     1 Y       2019-12-17 18:01:06.0
        
-- 5)삭제
DELETE FROM qnagrp
 
DELETE FROM qnagrp
WHERE qnagrpno = 2;

 QNAGRPNO NAME   SEQNO VISIBLE RDATE
 -------- ------ ----- ------- -------------------
        1 공지사항       1 Y       2019-12-17 06:01:06
        3 떠오르지않음     3 N       2019-12-17 06:01:11
        
-- 6) 출력 순서에따른 전체 목록
SELECT qnagrpno, name, seqno, visible, TO_CHAR(rdate, 'YYYY-MM-DD hh:mi:ss') as rdate
FROM qnagrp
ORDER BY seqno ASC;

 QNAGRPNO NAME    SEQNO VISIBLE RDATE
 -------- ------- ----- ------- -------------------
        1 공지사항        1 Y       2019-12-19 11:11:04
        2 자주찿는 질문     2 Y       2019-12-24 05:18:06
        3 1:1 문의      3 Y       2019-12-24 05:18:47

 
-- 출력 순서 상향, 10 ▷ 1
UPDATE qnagrp
SET seqno = seqno - 1
WHERE qnagrpno=1;
 
-- 출력순서 하향, 1 ▷ 10
UPDATE qnagrp
SET seqno = seqno + 1
WHERE qnagrpno=1;        
