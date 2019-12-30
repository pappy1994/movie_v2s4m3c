/****************************************/
/* Table Name: 이벤트 정보 카테고리 그룹 */
/****************************************/
DROP TABLE eventgrp;
  
CREATE TABLE eventgrp(
    eventgrpno                      NUMBER(10)     NOT NULL    PRIMARY KEY, -- 그룹 번호
    name                            VARCHAR2(50)     NOT NULL,              -- 이름
    seqno                            NUMBER(7)    DEFAULT 0     NOT NULL,   -- 출력 순서
    visible                          CHAR(1)    DEFAULT'Y'     NOT NULL,
    rdate                             DATE     NOT NULL                     -- 그룹 생성일
);
 
COMMENT ON TABLE eventgrp is '카테고리 그룹';

COMMENT ON COLUMN eventgrp.eventgrpno is '카테고리 그룹 번호';
COMMENT ON COLUMN eventgrp.name is '이름';
COMMENT ON COLUMN eventgrp.seqno is '출력 순서';
COMMENT ON COLUMN eventgrp.visible is '출력 모드';
COMMENT ON COLUMN eventgrp.rdate is '그룹 생성일';
  
 
2) insert
INSERT INTO eventgrp(eventgrpno, name, seqno, visible, rdate)
VALUES((SELECT NVL(MAX(eventgrpno), 0) + 1 as eventgrpno FROM eventgrp),
            '이벤트1', 1, 'Y', sysdate);
 
INSERT INTO eventgrp(eventgrpno, name, seqno, visible, rdate)
VALUES((SELECT NVL(MAX(eventgrpno), 0) + 1 as eventgrpno FROM eventgrp),
            '이벤트2', 1, 'Y', sysdate);
 
INSERT INTO eventgrp(eventgrpno, name, seqno, visible, rdate)
VALUES((SELECT NVL(MAX(eventgrpno), 0) + 1 as eventgrpno FROM eventgrp),
            '이벤트3', 1, 'Y', sysdate);
 
4) 목록 list
-- eventgrp 정렬
SELECT eventgrpno, name, seqno, visible, TO_CHAR(rdate, 'YYYY-MM-DD hh:mi:ss') as rdate
FROM eventgrp
ORDER BY eventgrpno ASC;
 
 EVENTGRPNO NAME SEQNO VISIBAL RDATE
 ---------- ---- ----- ------- -------------------
          1 이벤트1     1 Y       2019-12-11 05:57:51
          2 이벤트2     1 Y       2019-12-11 05:58:06
          3 이벤트3     1 Y       2019-12-11 05:58:09
 
5) 조회read
SELECT eventgrpno, name, seqno, visible, rdate 
FROM eventgrp
WHERE eventgrpno = 1;
 
 EVENTGRPNO NAME SEQNO RDATE
 ---------- ---- ----- ---------------------
          1 이벤트1     1 2019-12-11 17:37:13.0
         
6) 수정
UPDATE eventgrp
SET name='이벤트', seqno = 1
WHERE eventgrpno = 3;
 
 EVENTGRPNO NAME SEQNO RDATE
 ---------- ---- ----- -------------------
          1 이벤트1     1 2019-12-11 05:37:13
          2 이벤트2     1 2019-12-11 05:37:27
          3 이벤트      1 2019-12-11 05:37:30   <-- 변경됨. 
 
7) 삭제
-- 모든 레코드 삭제
DELETE FROM eventgrp
COMMIT;


-------------------------------------------------------------------
eventcontents컬럼 정하기

이벤트타입(VARCHAR), 제목(VARCHAR), 기간(RDATE)