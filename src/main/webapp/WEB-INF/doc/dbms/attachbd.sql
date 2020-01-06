/**********************************/
/* Table Name: ȸ�� */
/**********************************/
CREATE TABLE members(
    mno                         NUMBER(10)     NOT NULL    PRIMARY KEY
);

COMMENT ON TABLE members is 'ȸ��';
COMMENT ON COLUMN members.mno is 'ȸ�� ��ȣ';


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
/* Table Name: ÷������ */
/**********************************/
DROP TABLE attachbd;

CREATE TABLE attachbd(
		attachbdno                  NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		contentsbdno                NUMBER(10)		 NULL ,
		aname                      	VARCHAR2(100)		 NOT NULL,
		aupname                     VARCHAR2(100)		 NOT NULL,
		athumb                       VARCHAR2(100)		 NULL ,
		asize                    		NUMBER(10)		 DEFAULT 0		 NOT NULL,
    rdate                       DATE     NOT NULL,
  FOREIGN KEY (contentsbdno) REFERENCES contentsbd (contentsbdno)
);

COMMENT ON TABLE attachbd is '÷������';
COMMENT ON COLUMN attachbd.attachbdno is '÷�����Ϲ�ȣ';
COMMENT ON COLUMN attachbd.contentsbdno is '��������ȣ';
COMMENT ON COLUMN attachbd.aname is '���� ���ϸ�';
COMMENT ON COLUMN attachbd.aupname is '���ε� ���ϸ�';
COMMENT ON COLUMN attachbd.athumb is 'Thumb ����';
COMMENT ON COLUMN attachbd.asize is '���� ������';
COMMENT ON COLUMN attachbd.rdate is '�����';

-- 1) ���
SELECT NVL(MAX(attachbdno), 0) + 1 as attachbdno FROM attachbd;

 ATTACHBDNO
 ----------
          1

SELECT contentsbdno, mno, boardgrpno, title
FROM contentsbd
ORDER BY contentsbdno ASC;
 
 CONTENTSBDNO MNO BOARDGRPNO TITLE
 ------------ --- ---------- -----------
            2   1          1 �길��: �ؽ�Ʈ ����
            3   1          1 ���� V ���

INSERT INTO attachbd(attachbdno, contentsbdno, aname, aupname, athumb, asize, rdate)
VALUES((SELECT NVL(MAX(attachbdno), 0) + 1 as attachbdno FROM attachbd),
             2, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000, sysdate);
             
-- 2) ���( contentsno ���� ���� ����, attachfileno ���� ��������)
SELECT attachbdno, contentsbdno, aname, aupname, athumb, asize, rdate
FROM attachbd
ORDER BY contentsbdno DESC,  attachbdno ASC;

 ATTACHBDNO CONTENTSBDNO ANAME       AUPNAME       ATHUMB        ASIZE RDATE
 ---------- ------------ ----------- ------------- ------------- ----- ---------------------
          1            2 samyang.jpg samyang_1.jpg samyang_t.jpg  1000 2019-12-19 10:20:56.0

-- 3) �ۺ� ���� ���(contentsno ���� ���� ����, attachfileno ���� ��������)
SELECT attachbdno, contentsbdno, aname, aupname, athumb, asize, rdate
FROM attachbd
WHERE contentsbdno = 2
ORDER BY aname ASC;

 ATTACHBDNO CONTENTSBDNO ANAME       AUPNAME       ATHUMB        ASIZE RDATE
 ---------- ------------ ----------- ------------- ------------- ----- ---------------------
          1            2 samyang.jpg samyang_1.jpg samyang_t.jpg  1000 2019-12-19 10:20:56.0

-- 4) �ϳ��� ���� ����
DELETE FROM attachbd
WHERE attachbdno = 2;

-- 5) FK contentsno �θ� ���̺� ���ڵ� ���� ����
SELECT attachbdno, contentsbdno, aname, aupname, athumb, asize, rdate
FROM attachbd
WHERE contentsbdno=2;

SELECT COUNT(*) as cnt
FROM attachbd
WHERE contentsbdno=2;          
             
-- 6) FK �θ� ���̺� ���ڵ� ����
DELETE FROM attachbd
WHERE contentsbdno=2;

-- 7) Contentsbd, Attachbd join 
SELECT c.title, 
       a.attachbdno, a.contentsbdno, a.aname, a.aupname, a.athumb, a.asize, a.rdate
FROM contentsbd c, attachbd a
WHERE c.contentsbdno = a.contentsbdno
ORDER BY c.contentsbdno DESC, a.attachbdno ASC;

 TITLE       ATTACHBDNO CONTENTSBDNO ANAME       AUPNAME       ATHUMB        ASIZE RDATE
 ----------- ---------- ------------ ----------- ------------- ------------- ----- ---------------------
 �길��: �ؽ�Ʈ ����          1            2 samyang.jpg samyang_1.jpg samyang_t.jpg  1000 2019-12-19 10:20:56.0








