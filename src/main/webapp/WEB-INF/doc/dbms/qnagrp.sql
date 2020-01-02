/**********************************/
/* Table Name: Q/A ī�װ� */
/**********************************/
DROP TABLE qnagrp;

CREATE TABLE qnagrp(
    qnagrpno                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    name                              VARCHAR2(50)     NOT NULL,
    seqno                             NUMBER(7)    DEFAULT 0     NOT NULL,
    visible                           CHAR(1)    DEFAULT 'Y'     NOT NULL,
    rdate                             DATE     NOT NULL
);

COMMENT ON TABLE qnagrp is 'Q/A ī�װ�';
COMMENT ON COLUMN qnagrp.qnagrpno is 'ī�װ��׷��ȣ';
COMMENT ON COLUMN qnagrp.name is '�׷� �̸�';
COMMENT ON COLUMN qnagrp.seqno is '��¼���';
COMMENT ON COLUMN qnagrp.visible is '��� ���';
COMMENT ON COLUMN qnagrp.rdate is '�׷� ������';

-- 1)���

INSERT INTO qnagrp(qnagrpno, name, seqno, visible, rdate)
VALUES((SELECT NVL(MAX(qnagrpno), 0) + 1 as qnagrpno FROM qnagrp),
            '��������', 1, 'Y', sysdate);

INSERT INTO qnagrp(qnagrpno, name, seqno, visible, rdate)
VALUES((SELECT NVL(MAX(qnagrpno), 0) + 1 as qnagrpno FROM qnagrp),
            '���� ���� ����', 1, 'Y', sysdate);

INSERT INTO qnagrp(qnagrpno, name, seqno, visible, rdate)
VALUES((SELECT NVL(MAX(qnagrpno), 0) + 1 as qnagrpno FROM qnagrp),
            'Q/A', 1, 'Y', sysdate);

-- 2)���
SELECT qnagrpno, name, seqno, visible, TO_CHAR(rdate, 'YYYY-MM-DD hh:mi:ss') as rdate
FROM qnagrp
ORDER BY qnagrpno ASC;

 QNAGRPNO NAME     SEQNO VISIBLE RDATE
 -------- -------- ----- ------- -------------------
        1 ��������         1 Y       2019-12-17 06:01:06
        2 ���� ���� ����     1 Y       2019-12-17 06:01:10
        3 Q/A          1 Y       2019-12-17 06:01:11


         
-- 3)����
UPDATE qnagrp
SET name='������������', seqno = 3, visible='N'
WHERE qnagrpno = 3;

-- 4)��ȸ
SELECT qnagrpno, name, seqno, visible, rdate 
FROM qnagrp
WHERE qnagrpno = 1;

 QNAGRPNO NAME SEQNO VISIBLE RDATE
 -------- ---- ----- ------- ---------------------
        1 ��������     1 Y       2019-12-17 18:01:06.0
        
-- 5)����
DELETE FROM qnagrp
 
DELETE FROM qnagrp
WHERE qnagrpno = 2;

 QNAGRPNO NAME   SEQNO VISIBLE RDATE
 -------- ------ ----- ------- -------------------
        1 ��������       1 Y       2019-12-17 06:01:06
        3 ������������     3 N       2019-12-17 06:01:11
        
-- 6) ��� ���������� ��ü ���
SELECT qnagrpno, name, seqno, visible, TO_CHAR(rdate, 'YYYY-MM-DD hh:mi:ss') as rdate
FROM qnagrp
ORDER BY seqno ASC;

 QNAGRPNO NAME    SEQNO VISIBLE RDATE
 -------- ------- ----- ------- -------------------
        1 ��������        1 Y       2019-12-19 11:11:04
        2 ���֪O�� ����     2 Y       2019-12-24 05:18:06
        3 1:1 ����      3 Y       2019-12-24 05:18:47

 
-- ��� ���� ����, 10 �� 1
UPDATE qnagrp
SET seqno = seqno - 1
WHERE qnagrpno=1;
 
-- ��¼��� ����, 1 �� 10
UPDATE qnagrp
SET seqno = seqno + 1
WHERE qnagrpno=1;        
