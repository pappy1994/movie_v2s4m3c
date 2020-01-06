/**********************************/
/* Table Name: ī�װ� �׷� */
/**********************************/
CREATE TABLE EVENTGRP(
    eventgrpno                        NUMBER(10)     NOT NULL    PRIMARY KEY,
    name                              VARCHAR2(50)     NOT NULL,
    seqno                             NUMBER(7)    NOT NULL,
    visible                           CHAR(1)    NOT NULL,
    rdate                             DATE     NOT NULL
);

COMMENT ON TABLE EVENTGRP is 'ī�װ� �׷�';
COMMENT ON COLUMN EVENTGRP.eventgrpno is 'ī�װ� �׷� ��ȣ';
COMMENT ON COLUMN EVENTGRP.name is '�̸�';
COMMENT ON COLUMN EVENTGRP.seqno is '��� ����';
COMMENT ON COLUMN EVENTGRP.visible is '��� ���';
COMMENT ON COLUMN EVENTGRP.rdate is '�׷� ������';

drop table eventcontents;
drop table eventgrp;

select * from eventcontents;

/**********************************/
/* Table Name: �̺�Ʈ ������ */
/**********************************/
CREATE TABLE EVENTCONTENTS(
    econtentsno                       NUMBER(10)     NOT NULL    PRIMARY KEY,
    eventgrpno                        NUMBER(10)     NULL ,
    etype                             VARCHAR2(50)     NOT NULL,
    title                             VARCHAR2(300)    NOT NULL,
    content                           CLOB         NOT NULL,
    rdate                             DATE     NOT NULL,
    FOREIGN KEY (eventgrpno) REFERENCES eventgrp (eventgrpno)
);

COMMENT ON TABLE EVENTCONTENTS is '�̺�Ʈ ������';
COMMENT ON COLUMN EVENTCONTENTS.econtentsno is '�̺�Ʈ ����';
COMMENT ON COLUMN EVENTCONTENTS.eventgrpno is 'ī�װ� �׷� ��ȣ';
COMMENT ON COLUMN EVENTCONTENTS.etype is '�̺�Ʈ Ÿ��';
COMMENT ON COLUMN EVENTCONTENTS.title is '����';
COMMENT ON COLUMN EVENTCONTENTS.content is '����';
COMMENT ON COLUMN EVENTCONTENTS.rdate is '�̺�Ʈ �Ⱓ';


-- ��� create
INSERT INTO eventcontents(econtentsno, eventgrpno, etype, title, content, rdate)
VALUES((SELECT NVL(MAX(econtentsno), 0) + 1 as econtentsno FROM eventcontents),
             1,'��ȭ/����', '����', '�̺�Ʈ ����', sysdate);
             
-- ��� Ȯ��  list           
SELECT econtentsno, eventgrpno, etype, title, content, rdate
FROM eventcontents
ORDER BY econtentsno ASC;

ECONTENTSNO EVENTGRPNO ETYPE TITLE CONTENT RDATE
 ----------- ---------- ----- ----- ------- ---------------------
           1        1  ��ȭ/���� ����    �̺�Ʈ ����  2019-12-12 18:35:31.0

-- ��ȸ read
SELECT econtentsno, eventgrpno, etype, title, content, rdate
FROM eventcontents
WHERE econtentsno = 1;       

-- ���� update
UPDATE eventcontents
SET title='�̺�Ʈ', content='�̺�Ʈ ���� ����'
WHERE econtentsno = 1;

 ECONTENTSNO EVENTGRPNO ETYPE TITLE CONTENT   RDATE
 ----------- ---------- ----- ----- --------- ---------------------
           1          1 ��ȭ/���� �̺�Ʈ   �̺�Ʈ ���� ���� 2019-12-12 18:35:31.0
         
-- ���� delete
DELETE FROM eventcontents
WHERE econtentsno=4;         

DELETE FROM eventcontents
COMMIT;

