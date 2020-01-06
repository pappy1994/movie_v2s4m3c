DROP TABLE boardgrp;
  
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

-- 등록
INSERT INTO boardgrp(boardgrpno, name, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(boardgrpno), 0) + 1 as boardgrpno FROM boardgrp),
            '박스오피스', 1, 'Y', sysdate, 0);          

INSERT INTO boardgrp(boardgrpno, name, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(boardgrpno), 0) + 1 as boardgrpno FROM boardgrp),
            '상영예정작', 2, 'Y', sysdate, 0);

-- 목록
SELECT boardgrpno, name, seqno, visible, rdate, cnt
FROM boardgrp
ORDER BY seqno ASC;

-- 출력 순서에따른 전체 목록
SELECT boardgrpno, name, seqno, visible, rdate, cnt
FROM boardgrp
ORDER BY seqno ASC;

-- 수정
UPDATE boardgrp
SET name='기대작', seqno = 1, visible='Y'
WHERE boardgrpno = 3;

-- 삭제
DELETE FROM boardgrp
COMMIT;
       
DELETE FROM boardgrp
WHERE boardgrpno = 3;
COMMIT;

  