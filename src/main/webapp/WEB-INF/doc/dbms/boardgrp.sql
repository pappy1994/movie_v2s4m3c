DROP TABLE boardgrp;
  
CREATE TABLE boardgrp(
    boardgrpno                      NUMBER(10)     NOT NULL    PRIMARY KEY,
    name                            VARCHAR2(50)     NOT NULL,
    seqno                           NUMBER(7)    DEFAULT 0     NOT NULL,
    visible                         CHAR(1)    DEFAULT 'Y'     NOT NULL,
    rdate                           DATE     NOT NULL,
    cnt                             NUMBER(7)    DEFAULT 0     NOT NULL    
);
 
COMMENT ON TABLE boardgrp is '�Խ��� �׷�';
COMMENT ON COLUMN boardgrp.boardgrpno is '�Խ��� ��ȣ';
COMMENT ON COLUMN boardgrp.name is '�̸�';
COMMENT ON COLUMN boardgrp.seqno is '��� ����';
COMMENT ON COLUMN boardgrp.visible is '��� ���';
COMMENT ON COLUMN boardgrp.rdate is '�׷� ������';
COMMENT ON COLUMN boardgrp.cnt is '��ϵ� �ڷ��';

-- ���
INSERT INTO boardgrp(boardgrpno, name, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(boardgrpno), 0) + 1 as boardgrpno FROM boardgrp),
            '�ڽ����ǽ�', 1, 'Y', sysdate, 0);          

INSERT INTO boardgrp(boardgrpno, name, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(boardgrpno), 0) + 1 as boardgrpno FROM boardgrp),
            '�󿵿�����', 2, 'Y', sysdate, 0);

-- ���
SELECT boardgrpno, name, seqno, visible, rdate, cnt
FROM boardgrp
ORDER BY seqno ASC;

-- ��� ���������� ��ü ���
SELECT boardgrpno, name, seqno, visible, rdate, cnt
FROM boardgrp
ORDER BY seqno ASC;

-- ����
UPDATE boardgrp
SET name='�����', seqno = 1, visible='Y'
WHERE boardgrpno = 3;

-- ����
DELETE FROM boardgrp
COMMIT;
       
DELETE FROM boardgrp
WHERE boardgrpno = 3;
COMMIT;

  