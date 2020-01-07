/**********************************/
/* Table Name: ȸ������ �׷� */
/**********************************/

CREATE TABLE CUSTOMGRP(
		CUSTOMGRPNO                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		NAME                          		VARCHAR2(50)		 NOT NULL,
		SEQNO                         		NUMBER(7)		 NOT NULL,
		VISIBLE                       		CHAR(1)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL		
);

COMMENT ON TABLE CUSTOMGRP is 'ȸ������ �׷�';
COMMENT ON COLUMN CUSTOMGRP.CUSTOMGRPNO is 'ȸ�������׷��ȣ';
COMMENT ON COLUMN CUSTOMGRP.NAME is '�̸�';
COMMENT ON COLUMN CUSTOMGRP.SEQNO is '��� ����';
COMMENT ON COLUMN CUSTOMGRP.VISIBLE is '��� ���';
COMMENT ON COLUMN CUSTOMGRP.RDATE is '�׷� ������';

COMMENT ON COLUMN CUSTOMGRP.CNT is '��ϵ� �ڷ��';


-- ���
INSERT INTO customgrp(customgrpno, name, seqno, visible, rdate)
VALUES((SELECT NVL(MAX(customgrpno), 0) + 1 as customgrpno FROM customgrp),
            '���� ����', 1, 'Y', sysdate);
            
INSERT INTO customgrp(customgrpno, name, seqno, visible, rdate)
VALUES((SELECT NVL(MAX(customgrpno), 0) + 1 as customgrpno FROM customgrp),
            '��޺� ����', 2, 'Y', sysdate);            

INSERT INTO customgrp(customgrpno, name, seqno, visible, rdate)
VALUES((SELECT NVL(MAX(customgrpno), 0) + 1 as customgrpno FROM customgrp),
            'Q&A', 3, 'Y', sysdate);              
            
            
-- ���            
SELECT customgrpno, name, seqno, visible, TO_CHAR(rdate, 'YYYY-MM-DD hh:mi:ss') as rdate
FROM customgrp
ORDER BY customgrpno ASC;
 CUSTOMGRPNO NAME    SEQNO VISIBLE RDATE
 ----------- ------- ----- ------- -------------------
           1 �Ϲ� ���       1 Y       2019-12-04 05:13:02
           2 VIP ���      2 Y       2019-12-04 05:13:03
           3 SVIP ���     3 Y       2019-12-04 05:13:04


-- ����
UPDATE customgrp
SET name='RVIP ���', seqno = 1, visible='Y'
WHERE customgrpno = 3;


-- ����
DELETE FROM CUSTOMGRP;
DROP TABLE CUSTOMGRP;


DELETE FROM customgrp
WHERE customgrpno = 2;




