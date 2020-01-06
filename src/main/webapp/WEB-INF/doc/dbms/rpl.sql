/**********************************/
/* Table Name: ī�װ� �׷� */
/**********************************/
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


/**********************************/
/* Table Name: ȸ�� */
/**********************************/
CREATE TABLE members(
    mno                         NUMBER(10)     NOT NULL    PRIMARY KEY
);

COMMENT ON TABLE members is 'ȸ��';
COMMENT ON COLUMN members.mno is 'ȸ�� ��ȣ';

/**********************************/
/* Table Name: ������ */
/**********************************/
CREATE TABLE contentsbd(
    contentsbdno                      NUMBER(10)       NOT NULL    PRIMARY KEY,
    mno                               NUMBER(10)       NOT NULL,
    boardgrpno                        NUMBER(10)       NOT NULL,
    title                             VARCHAR2(300)    NOT NULL,
    content                           CLOB             NOT NULL,
    recom                             NUMBER(7)        DEFAULT 0     NOT NULL,
    cnt                               NUMBER(7)        DEFAULT 0     NOT NULL,
    replycnt                          NUMBER(10)       DEFAULT 0     NOT NULL,
    rdate                             DATE             NOT NULL,
    word                              VARCHAR2(100)    NULL,
    mage                              VARCHAR2(50)     NOT NULL,
    mopen                             VARCHAR2(50)     NOT NULL,
    mbook                             NUMBER(5,2)      NOT NULL,
    seqnobd                           NUMBER(10)       DEFAULT 0     NOT NULL,
    fname                             VARCHAR2(100)    NOT NULL,
    fupname                           VARCHAR2(100)    NOT NULL,
    thumb                             VARCHAR2(100)    NULL ,
    fsize                             NUMBER(10)       DEFAULT 0     NOT NULL,
    director                          VARCHAR2(100)    NOT NULL,
    actor                             VARCHAR2(100)    NOT NULL,
    runtime                           NUMBER(10)       NOT NULL,
    genre                             VARCHAR2(100)    NOT NULL,
    
  FOREIGN KEY (mno) REFERENCES members (mno),
  FOREIGN KEY (boardgrpno) REFERENCES boardgrp (boardgrpno)
);

/**********************************/
/* Table Name: ��� */
/**********************************/
DROP TABLE rpl;

CREATE TABLE rpl(
    rplno                            NUMBER(10)     NOT NULL    PRIMARY KEY,
    contentsbdno                      NUMBER(10)  NOT  NULL ,
    mno                               NUMBER(6)    NOT NULL ,
    content                           VARCHAR2(1000)     NOT NULL,
    passwd                            VARCHAR2(20)     NOT NULL,
    rdate                              DATE NOT NULL,
  FOREIGN KEY (contentsbdno) REFERENCES contentsbd (contentsbdno),
  FOREIGN KEY (mno) REFERENCES members (mno)
);

COMMENT ON TABLE rpl is '���';
COMMENT ON COLUMN rpl.rplno is '��۹�ȣ';
COMMENT ON COLUMN rpl.contentsbdno is '��������ȣ';
COMMENT ON COLUMN rpl.mno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN rpl.content is '����';
COMMENT ON COLUMN rpl.passwd is '��й�ȣ';
COMMENT ON COLUMN rpl.rdate is '�����';

1) ���
INSERT INTO rpl(rplno, contentsbdno, mno, content, passwd, rdate)
VALUES((SELECT NVL(MAX(rplno), 0) + 1 as rplno FROM rpl),
             2, 1, '���1', '1234', sysdate);
INSERT INTO rpl(rplno, contentsbdno, mno, content, passwd, rdate)
VALUES((SELECT NVL(MAX(rplno), 0) + 1 as rplno FROM rpl),
             2, 1, '���2', '1234', sysdate);
INSERT INTO rpl(rplno, contentsbdno, mno, content, passwd, rdate)
VALUES((SELECT NVL(MAX(rplno), 0) + 1 as rplno FROM rpl),
             2, 1, '���3', '1234', sysdate);             

2) ��ü ���
SELECT rplno, contentsbdno, mno, content, passwd, rdate
FROM rpl
ORDER BY rplno DESC;

 RPLNO CONTENTSBDNO MNO CONTENT PASSWD RDATE
 ----- ------------ --- ------- ------ ---------------------
     3            2   1 ���3     1234   2019-12-19 13:29:56.0
     2            2   1 ���2     1234   2019-12-19 13:29:55.0
     1            2   1 ���1     1234   2019-12-19 13:29:54.0

3) contentsno �� ���
SELECT rplno, contentsbdno, mno, content, passwd, rdate
FROM rpl
WHERE contentsbdno=2
ORDER BY rplno DESC;

 RPLNO CONTENTSBDNO MNO CONTENT PASSWD RDATE
 ----- ------------ --- ------- ------ ---------------------
     3            2   1 ���3     1234   2019-12-19 13:29:56.0
     2            2   1 ���2     1234   2019-12-19 13:29:55.0
     1            2   1 ���1     1234   2019-12-19 13:29:54.0


4) ����
-- �н����� �˻�
SELECT count(passwd) as cnt
FROM rpl
WHERE rplno=1 AND passwd='1234';

 CNT
 ---
   1
   
-- ����
DELETE FROM rpl
WHERE rplno=1;

5) contentsbdno�� �ش��ϴ� ��� �� Ȯ�� �� ����
SELECT COUNT(*) as cnt
FROM rpl
WHERE contentsbdno=2;

CNT
 ---
   2

DELETE FROM rpl
WHERE contentsbdno=2;

6) mno�� �ش��ϴ� ��� �� Ȯ�� �� ����
SELECT COUNT(*) as cnt
FROM rpl
WHERE mno=1;

 CNT
 ---
   1

DELETE FROM rpl
WHERE mno=1;
 
7) ȸ�� ID�� ���
SELECT m.id,
       r.rplno, r.contentsbdno, r.mno, r.content, r.passwd, r.rdate
FROM members m,  rpl r
WHERE (m.mno = r.mno) AND r.contentsbdno = 1
ORDER BY r.rplno DESC;
 
8) ������ �н����� �˻�
SELECT COUNT(*) as cnt
FROM rpl
WHERE rplno = 1 AND passwd = '1234';

 CNT
 ---
   0

9) ����
DELETE FROM rpl
WHERE rplno = 1;

   

