/****************************************/
/* Table Name: �̺�Ʈ ���� ī�װ� �׷� */
/****************************************/
DROP TABLE eventgrp;
  
CREATE TABLE eventgrp(
    eventgrpno                      NUMBER(10)     NOT NULL    PRIMARY KEY, -- �׷� ��ȣ
    name                            VARCHAR2(50)     NOT NULL,              -- �̸�
    seqno                            NUMBER(7)    DEFAULT 0     NOT NULL,   -- ��� ����
    visible                          CHAR(1)    DEFAULT'Y'     NOT NULL,
    rdate                             DATE     NOT NULL                     -- �׷� ������
);
 
COMMENT ON TABLE eventgrp is 'ī�װ� �׷�';

COMMENT ON COLUMN eventgrp.eventgrpno is 'ī�װ� �׷� ��ȣ';
COMMENT ON COLUMN eventgrp.name is '�̸�';
COMMENT ON COLUMN eventgrp.seqno is '��� ����';
COMMENT ON COLUMN eventgrp.visible is '��� ���';
COMMENT ON COLUMN eventgrp.rdate is '�׷� ������';
  
 
2) insert
INSERT INTO eventgrp(eventgrpno, name, seqno, visible, rdate)
VALUES((SELECT NVL(MAX(eventgrpno), 0) + 1 as eventgrpno FROM eventgrp),
            '�̺�Ʈ1', 1, 'Y', sysdate);
 
INSERT INTO eventgrp(eventgrpno, name, seqno, visible, rdate)
VALUES((SELECT NVL(MAX(eventgrpno), 0) + 1 as eventgrpno FROM eventgrp),
            '�̺�Ʈ2', 1, 'Y', sysdate);
 
INSERT INTO eventgrp(eventgrpno, name, seqno, visible, rdate)
VALUES((SELECT NVL(MAX(eventgrpno), 0) + 1 as eventgrpno FROM eventgrp),
            '�̺�Ʈ3', 1, 'Y', sysdate);
 
4) ��� list
-- eventgrp ����
SELECT eventgrpno, name, seqno, visible, TO_CHAR(rdate, 'YYYY-MM-DD hh:mi:ss') as rdate
FROM eventgrp
ORDER BY eventgrpno ASC;
 
 EVENTGRPNO NAME SEQNO VISIBAL RDATE
 ---------- ---- ----- ------- -------------------
          1 �̺�Ʈ1     1 Y       2019-12-11 05:57:51
          2 �̺�Ʈ2     1 Y       2019-12-11 05:58:06
          3 �̺�Ʈ3     1 Y       2019-12-11 05:58:09
 
5) ��ȸread
SELECT eventgrpno, name, seqno, visible, rdate 
FROM eventgrp
WHERE eventgrpno = 1;
 
 EVENTGRPNO NAME SEQNO RDATE
 ---------- ---- ----- ---------------------
          1 �̺�Ʈ1     1 2019-12-11 17:37:13.0
         
6) ����
UPDATE eventgrp
SET name='�̺�Ʈ', seqno = 1
WHERE eventgrpno = 3;
 
 EVENTGRPNO NAME SEQNO RDATE
 ---------- ---- ----- -------------------
          1 �̺�Ʈ1     1 2019-12-11 05:37:13
          2 �̺�Ʈ2     1 2019-12-11 05:37:27
          3 �̺�Ʈ      1 2019-12-11 05:37:30   <-- �����. 
 
7) ����
-- ��� ���ڵ� ����
DELETE FROM eventgrp
COMMIT;


-------------------------------------------------------------------
eventcontents�÷� ���ϱ�

�̺�ƮŸ��(VARCHAR), ����(VARCHAR), �Ⱓ(RDATE)