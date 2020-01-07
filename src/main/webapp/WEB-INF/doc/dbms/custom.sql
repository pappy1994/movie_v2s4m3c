/**********************************/
/* Table Name: 회원관리 그룹 */
/**********************************/

CREATE TABLE CUSTOMGRP(
		CUSTOMGRPNO                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		NAME                          		VARCHAR2(50)		 NOT NULL,
		SEQNO                         		NUMBER(7)		 NOT NULL,
		VISIBLE                       		CHAR(1)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL		
);

COMMENT ON TABLE CUSTOMGRP is '회원관리 그룹';
COMMENT ON COLUMN CUSTOMGRP.CUSTOMGRPNO is '회원관리그룹번호';
COMMENT ON COLUMN CUSTOMGRP.NAME is '이름';
COMMENT ON COLUMN CUSTOMGRP.SEQNO is '출력 순서';
COMMENT ON COLUMN CUSTOMGRP.VISIBLE is '출력 모드';
COMMENT ON COLUMN CUSTOMGRP.RDATE is '그룹 생성일';

COMMENT ON COLUMN CUSTOMGRP.CNT is '등록된 자료수';


-- 등록
INSERT INTO customgrp(customgrpno, name, seqno, visible, rdate)
VALUES((SELECT NVL(MAX(customgrpno), 0) + 1 as customgrpno FROM customgrp),
            '공지 사항', 1, 'Y', sysdate);
            
INSERT INTO customgrp(customgrpno, name, seqno, visible, rdate)
VALUES((SELECT NVL(MAX(customgrpno), 0) + 1 as customgrpno FROM customgrp),
            '등급별 혜택', 2, 'Y', sysdate);            

INSERT INTO customgrp(customgrpno, name, seqno, visible, rdate)
VALUES((SELECT NVL(MAX(customgrpno), 0) + 1 as customgrpno FROM customgrp),
            'Q&A', 3, 'Y', sysdate);              
            
            
-- 목록            
SELECT customgrpno, name, seqno, visible, TO_CHAR(rdate, 'YYYY-MM-DD hh:mi:ss') as rdate
FROM customgrp
ORDER BY customgrpno ASC;
 CUSTOMGRPNO NAME    SEQNO VISIBLE RDATE
 ----------- ------- ----- ------- -------------------
           1 일반 등급       1 Y       2019-12-04 05:13:02
           2 VIP 등급      2 Y       2019-12-04 05:13:03
           3 SVIP 등급     3 Y       2019-12-04 05:13:04


-- 수정
UPDATE customgrp
SET name='RVIP 등급', seqno = 1, visible='Y'
WHERE customgrpno = 3;


-- 삭제
DELETE FROM CUSTOMGRP;
DROP TABLE CUSTOMGRP;


DELETE FROM customgrp
WHERE customgrpno = 2;




