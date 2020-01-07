/**********************************/
/* Table Name: ȸ�� */
/**********************************/
CREATE TABLE members(
    mno                          NUMBER(10)     NOT NULL    PRIMARY KEY
);

COMMENT ON TABLE members is 'ȸ��';
COMMENT ON COLUMN members.mno is 'ȸ����ȣ';


/**********************************/
/* Table Name: ī�װ� �׷� */
/**********************************/
CREATE TABLE CUSTOMGRP(
    CUSTOMGRPNO                         NUMBER(10)     NOT NULL    PRIMARY KEY,
    NAME                              VARCHAR2(50)     NOT NULL,
    SEQNO                             NUMBER(7)    NOT NULL,
    VISIBLE                           CHAR(1)    NOT NULL,
    RDATE                             DATE     NOT NULL   
);

COMMENT ON TABLE CUSTOMGRP is 'ȸ������ �׷�';
COMMENT ON COLUMN CUSTOMGRP.CUSTOMGRPNO is 'ȸ�������׷��ȣ';
COMMENT ON COLUMN CUSTOMGRP.NAME is '�̸�';
COMMENT ON COLUMN CUSTOMGRP.SEQNO is '��� ����';
COMMENT ON COLUMN CUSTOMGRP.VISIBLE is '��� ���';
COMMENT ON COLUMN CUSTOMGRP.RDATE is '�׷� ������';


/**********************************/
/* Table Name: ������ */
/**********************************/
DROP TABLE members;
DROP TABLE customgrp;
DROP TABLE contentsmv;

DROP TABLE contentsmv CASCADE CONSTRAINTS; 

CREATE TABLE contentsmv(
    contentsmvno                        NUMBER(10)     NOT NULL    PRIMARY KEY,
    mno                          NUMBER(10)     NOT NULL,
    customgrpno                         NUMBER(10)     NOT NULL,
    title                             VARCHAR2(300)    NOT NULL,
    content                           CLOB           NOT NULL,
    recom                             NUMBER(7)    DEFAULT 0     NOT NULL,
    cnt                               NUMBER(7)    DEFAULT 0     NOT NULL,
    replycnt                          NUMBER(10)     DEFAULT 0     NOT NULL,
    rdate                             DATE     NOT NULL,
    word                              VARCHAR2(100)    NULL ,
  FOREIGN KEY (mno) REFERENCES members (mno),
  FOREIGN KEY (customgrpno) REFERENCES customgrp (customgrpno)
);

COMMENT ON TABLE contentsmv is '������';
COMMENT ON COLUMN contentsmv.contentsmvno is '��������ȣ';
COMMENT ON COLUMN contentsmv.mno is 'ȸ����ȣ';
COMMENT ON COLUMN contentsmv.customgrpno is 'ī�װ� �׷� ��ȣ';
COMMENT ON COLUMN contentsmv.title is '����';
COMMENT ON COLUMN contentsmv.content is '����';
COMMENT ON COLUMN contentsmv.recom is '��õ��';
COMMENT ON COLUMN contentsmv.cnt is '��ȸ��';
COMMENT ON COLUMN contentsmv.replycnt is '��ۼ�';
COMMENT ON COLUMN contentsmv.rdate is '�����';
COMMENT ON COLUMN contentsmv.word is '�˻���';

1) ���
-- PK ����
SELECT NVL(MAX(contentsmvno), 0) + 1 as contentsmvno FROM contentsmv;                                
 contentsmvNO
 ----------
          1

INSERT INTO contentsmv(contentsmvno, 
                                mno, customgrpno, title, content, 
                                recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(contentsmvno), 0) + 1 as contentsmvno FROM contentsmv),
             0, 0, '����1', '����1',
             0, 0, 0, sysdate, '');

-- ORA-02291: integrity constraint (AI.SYS_C007068) violated - parent key not found
-- FK �÷��� ���� �θ� ���̺� ��ϵǾ� ���� �ʾƼ� �߻�
-- members ���̺� ��� Ȯ��
INSERT INTO members(mno)
VALUES((SELECT NVL(MAX(mno), 0) + 1 as mno FROM members));
INSERT INTO members(mno)
VALUES((SELECT NVL(MAX(mno), 0) + 1 as mno FROM members));
INSERT INTO members(mno)
VALUES((SELECT NVL(MAX(mno), 0) + 1 as mno FROM members));

SELECT mno FROM members ORDER BY mno; 

 mno
 --------
        1
        2
        3
        
-- customgrp ���̺� ��� Ȯ��                                
SELECT customgrpno, name, seqno, visible, rdate
FROM customgrp
ORDER BY seqno ASC;

 CUSTOMGRPNO NAME   SEQNO VISIBLE RDATE
 ----------- ------ ----- ------- ---------------------
           1 ���� ����      1 Y       2019-12-11 17:52:15.0
           2 ��޺� ����     2 Y       2019-12-11 17:52:16.0
           3 Q&A        3 Y       2019-12-11 17:52:17.0

-- 1) contentsmv ���(members: 1, customgrpno: 1),
--     varchar�� '' ��ϵǸ� null�� insert ��
INSERT INTO contentsmv(contentsmvno, 
                                mno, customgrpno, title, content, 
                                recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(contentsmvno), 0) + 1 as contentsmvno FROM contentsmv),
             1, 1, '����1', '����1',
             0, 0, 0, sysdate, '');

-- 2) ���
SELECT contentsmvno, mno, customgrpno, title, content, 
           recom, cnt, replycnt, rdate, word
FROM contentsmv
ORDER BY contentsmvno DESC;
 contentsmvNO mno customgrpno TITLE CONTENT RECOM CNT REPLYCNT RDATE                 WORD
 ---------- -------- --------- ----- ------- ----- --- -------- --------------------- ----
          1        1         1 ����1   ����1         0   0        0 2019-11-25 16:14:17.0 NULL

-- 3) customgrpno�� ��ü ���  -- 1: �ؿ� ����, 2: ���� ����
SELECT contentsmvno, mno, customgrpno, title, content, 
           recom, cnt, replycnt, rdate, word
FROM contentsmv
WHERE customgrpno=1                                                       
ORDER BY contentsmvno DESC;

-- 4) ��ü ���ڵ� ��
SELECT COUNT(*) as count
FROM contentsmv;
             
-- 5) ��ȸ
SELECT contentsmvno, mno, customgrpno, title, content, 
           recom, cnt, replycnt, rdate, word
FROM contentsmv
WHERE contentsmvno=1;

-- 6) ����
UPDATE contentsmv
SET title='���� ����', content='���� ����', word='�˻���'
WHERE contentsmvno = 1;

-- 7) ����
DELETE FROM contentsmv
WHERE contentsmvno=1;

-- 8) FK �θ� ���̺� ���ڵ� ���� ����
SELECT contentsmvno, mno, customgrpno, title
FROM contentsmv
WHERE customgrpno=6;

 contentsmvNO mno customgrpno TITLE
 ---------- -------- --------- -----------------------
          3          1                6                  12�� ���� ����ȳ�
          5          1                6                  �̹��� ������ �ɾ� �����մϴ�.
          7          1                6                  ��Ű�� �Ա� ������ ��ӵ��ο��� �������ּ���~

SELECT COUNT(*) as cnt
FROM contentsmv
WHERE customgrpno=6;

 CNT
 ---
   3             
             
-- 9) FK �θ� ���̺� ���ڵ� ����
DELETE FROM contentsmv
WHERE customgrpno=6;

(3 rows affected)