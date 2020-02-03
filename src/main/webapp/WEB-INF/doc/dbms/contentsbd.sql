/**********************************/
/* Table Name: ȸ�� */
/**********************************/
CREATE TABLE members(
		mno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY
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
DROP TABLE members;
DROP TABLE boardgrp;
DROP TABLE contentsbd;
DROP TABLE attachbd;
DROP TABLE rpl;

CREATE TABLE contentsbd(
		contentsbdno                    	NUMBER(10)		   NOT NULL		 PRIMARY KEY,
		mno                      	        NUMBER(10)		   NOT NULL,
		boardgrpno                     		NUMBER(10)		   NOT NULL,
		title                         		VARCHAR2(300)		 NOT NULL,
		content                       		CLOB        		 NOT NULL,
		recom                         		NUMBER(7)		     DEFAULT 0		 NOT NULL,
		cnt                           		NUMBER(7)		     DEFAULT 0		 NOT NULL,
		replycnt                      		NUMBER(10)		   DEFAULT 0		 NOT NULL,
		rdate                         		DATE		         NOT NULL,
		word                          		VARCHAR2(100)		 NULL,
		mage                              VARCHAR2(50)     NOT NULL,
		mopen                             VARCHAR2(50)     NOT NULL,
		mbook                             NUMBER(5,2)      NOT NULL,
		seqnobd                           NUMBER(10)       DEFAULT 0     NOT NULL,
		fname                             VARCHAR2(100)    NOT NULL,
    fupname                           VARCHAR2(100)    NOT NULL,
    thumb                             VARCHAR2(100)    NULL,
    fsize                             NUMBER(10)       DEFAULT 0     NOT NULL,
    director                          VARCHAR2(100)    NOT NULL,
    actor                             VARCHAR2(100)    NOT NULL,
    runtime                           NUMBER(10)       NOT NULL,
		genre                             VARCHAR2(100)    NOT NULL,
		youtube                           VARCHAR2(512)    NULL,
		
  FOREIGN KEY (mno) REFERENCES members (mno),
  FOREIGN KEY (boardgrpno) REFERENCES boardgrp (boardgrpno)
);

COMMENT ON TABLE contentsbd is '������';
COMMENT ON COLUMN contentsbd.contentsbdno is '������ ��ȣ';
COMMENT ON COLUMN contentsbd.mno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN contentsbd.boardgrpno is 'ī�װ� �׷� ��ȣ';
COMMENT ON COLUMN contentsbd.title is '����';
COMMENT ON COLUMN contentsbd.content is '����';
COMMENT ON COLUMN contentsbd.recom is '��õ��';
COMMENT ON COLUMN contentsbd.cnt is '��ȸ��';
COMMENT ON COLUMN contentsbd.replycnt is '��ۼ�';
COMMENT ON COLUMN contentsbd.rdate is '�����';
COMMENT ON COLUMN contentsbd.word is '�˻���';
COMMENT ON COLUMN contentsbd.mage is '���� ����';
COMMENT ON COLUMN contentsbd.mopen is '������';
COMMENT ON COLUMN contentsbd.mbook is '������';
COMMENT ON COLUMN contentsbd.seqnobd is '��� ����';
COMMENT ON COLUMN contentsbd.fname is '���� ���� �̸�';
COMMENT ON COLUMN contentsbd.fupname is '���ε� ���� �̸�';
COMMENT ON COLUMN contentsbd.thumb is '������ �̸�';
COMMENT ON COLUMN contentsbd.fsize is '���� ������';
COMMENT ON COLUMN contentsbd.director is '����';
COMMENT ON COLUMN contentsbd.actor is '���';
COMMENT ON COLUMN contentsbd.runtime is '����Ÿ��';
COMMENT ON COLUMN contentsbd.genre is '�帣';
COMMENT ON COLUMN contentsbd.youtube is '��Ʃ��';

1) ���
INSERT INTO contentsbd(contentsbdno, 
                     mno, boardgrpno, title, content, 
                     recom, cnt, replycnt, rdate, word, mage, mopen, mbook, 
                     seqnobd, fname, fupname, thumb, fsize, 
                     director, actor, runtime, genre, youtube)
-- PK ����
SELECT NVL(MAX(contentsbdno), 0) + 1 as contentsbdno FROM contentsbd;
 
CONTENTSNO
----------
          1

INSERT INTO contentsbd(contentsbdno, 
                     mno, boardgrpno, title, content, 
                     recom, cnt, replycnt, rdate, word, mage, mopen, mbook, 
                     seqnobd, fname, fupname, thumb, fsize, 
                     director, actor, runtime, genre, youtube)
VALUES((SELECT NVL(MAX(contentsbdno), 0) + 1 as contentsbdno FROM contentsbd),
        0, 0, '�ܿ�ձ�2', '����1',
        0, 0, 0, sysdate, '', '��ü�̿밡', '19.11.21', 61.7, 1, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000, '������', '��Ʃ�� �ּ�');        
-- ORA-02291: integrity constraint (AI.SYS_C007288) violated - parent key not found
-- FK �÷��� ���� �θ� ���̺� ��ϵǾ� ���� �ʾƼ� �߻���.

-- member ���̺� ��� Ȯ��
INSERT INTO members(mno)
VALUES((SELECT NVL(MAX(mno), 0) + 1 as mno FROM members));
INSERT INTO members(mno)
VALUES((SELECT NVL(MAX(mno), 0) + 1 as mno FROM members));
INSERT INTO members(mno)
VALUES((SELECT NVL(MAX(mno), 0) + 1 as mno FROM members));

SELECT mno FROM members ORDER BY mno; 

 MNO
 ---
   1
   2
   3

-- boardgrp ���̺� ��� Ȯ��
SELECT boardgrpno, name, seqno, visible, rdate, cnt
FROM boardgrp
ORDER BY seqno ASC;

 BOARDGRPNO NAME  SEQNO VISIBLE RDATE                 CNT
 ---------- ----- ----- ------- --------------------- ---
          1 �ڽ����ǽ�     1 Y       2019-12-16 16:35:20.0   0
          2 �󿵿�����     2 Y       2019-12-26 12:52:23.0   0

-- 1) ������ ���
-- contentsbd (���: memberno=1, boardgrpno=1)
-- VARCHAR�� ''�� ��ϵǸ� NULL�� insert ��
INSERT INTO contentsbd(contentsbdno, 
                     mno, boardgrpno, title, content, 
                     recom, cnt, replycnt, rdate, word, mage, mopen, mbook, 
                     seqnobd, fname, fupname, thumb, fsize, 
                     director, actor, runtime, genre, youtube)
VALUES((SELECT NVL(MAX(contentsbdno), 0) + 1 as contentsbdno FROM contentsbd),
        1, 1, '�ܿ�ձ�2', '����1',
        0, 0, 0, sysdate, '', '��ü�̿밡', '19.11.21', 61.7, 
        1, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000, '�����', '��, ������', 105, '�θǽ�', '��Ʃ�� �ּ�');        

-- 2) ���
SELECT contentsbdno, mno, boardgrpno, title, content, 
       recom, cnt, replycnt, rdate, word, mage, mopen, mbook, 
       seqnobd, fname, fupname, thumb, fsize,
       director, actor, runtime, genre, youtube
FROM contentsbd
ORDER BY mbook DESC

 CONTENTSBDNO MNO BOARDGRPNO TITLE CONTENT RECOM CNT REPLYCNT RDATE                 WORD MAGE  MOPEN    MBOOK SEQNOBD FNAME       FUPNAME       THUMB         FSIZE DIRECTOR ACTOR  RUNTIME GENRE YOUTUBE
 ------------ --- ---------- ----- ------- ----- --- -------- --------------------- ---- ----- -------- ----- ------- ----------- ------------- ------------- ----- -------- ------ ------- ----- -------
            1   1          1 �ܿ�ձ�2 ����1         0   0        0 2019-12-26 11:57:30.0 NULL ��ü�̿밡 19.11.21  61.7       1 samyang.jpg samyang_1.jpg samyang_t.jpg  1000 �����      ��, ������     105 �θǽ�   ��Ʃ�� �ּ�

-- 3) boardgrpno�� ��ü ���
SELECT contentsbdno, mno, boardgrpno, title, content, 
       recom, cnt, replycnt, rdate, word, mage, mopen, mbook, seqnobd, fname, fupname, thumb, fsize
FROM contentsbd
WHERE boardgrpno = 1;
ORDER BY mbook DESC

-- contents ���̺��� ���Ǵ� ���ڵ��� ����
DELETE FROM boardgrp WHERE boardgrpno = 1;
-- ORA-02292: integrity constraint (AI.SYS_C007314) violated - child record found
-- �ڽ� ���̺��� boardgrp�� boardgrpno �÷��� ���ǰ� �ִ��� Ȯ�� ��
-- �����ϸ� ����
-- �ڽ� ���ڵ� ����
DELETE FROM contentsbd WHERE contentsbdno = 1;
-- ���� �θ� ���̺� ���ڵ� ����
DELETE FROM boardgrp WHERE boardgrpno = 1;

SELECT boardgrp, name, seqno, visible, rdate, cnt
FROM boardgrp
ORDER BY seqno ASC;

-- 4) ��ü ���ڵ� ��
SELECT COUNT(*) as count
FROM contentsbd;
 COUNT
 -----
     1
          
-- 5) ��ȸ
SELECT contentsbdno, mno, boardgrpno, title, content, 
           recom, cnt, replycnt, rdate, word, mage, mopen, mbook, 
           seqnobd, fname, fupname, thumb, fsize,
           director, actor, runtime, genre, youtube
FROM contentsbd
WHERE contentsbdno=18;

-- 6) ����
UPDATE contentsbd
SET title='�ܿ�ձ�', content='���� ����', word='�˻���', mage='15', mopen='12.12.12', mbook='69.99',
    director='����', actor='��, ����', runtime=107, genre='�丮', youtube='��Ʃ�� ����'
WHERE contentsbdno = 1;

-- �������� ���� ��ü ���
SELECT contentsbdno, mno, boardgrpno, title, content, 
       recom, cnt, replycnt, rdate, word, mage, mopen, mbook, 
       seqnobd, fname, fupname, thumb, fsize, 
       director, actor, runtime, genre, youtube
FROM contentsbd
ORDER BY mbook DESC

-- 7) ����
DELETE FROM contentsbd
WHERE contentsbdno=18;

-- 8) FK �θ� ���̺� ���ڵ� ���� ����
SELECT contentsbdno, mno, boardgrpno, title
FROM contentsbd
WHERE boardgrpno = 1;
          
SELECT COUNT(*) as cnt
FROM contentsbd
WHERE boardgrpno = 6;
          
 CNT
 ---
   1

-- 9) FK �θ� ���̺� ���ڵ� ����
DELETE FROM contentsbd
WHERE boardgrpno = 6;


10) ��ۼ� ����
UPDATE contentsbd
SET replycnt = replycnt + 1
WHERE contentsbdno = 1;

11) ��ۼ� ����
UPDATE contentsbd
SET replycnt = replycnt - 1
WHERE contentsbdno = 1;

12) ��õ�� ����
UPDATE contentsbd
SET recom = recom + 1
WHERE contentsbdno = 1;

13) �˻�
�� boardgrp �˻� ���
SELECT contentsbdno, 
            mno, boardgrpno, title, content, 
            recom, cnt, replycnt, rdate, word, mage, mopen, mbook, 
            seqnobd, fname, fupname, thumb, fsize, 
            director, actor, runtime, genre, youtube
FROM contentsbd
WHERE boardgrpno=2 AND word LIKE '%������%'
ORDER BY contentsbdno DESC;

SELECT contentsbdno, 
            mno, boardgrpno, title, content, 
            recom, cnt, replycnt, rdate, word, mage, mopen, mbook, 
            seqnobd, fname, fupname, thumb, fsize, 
            director, actor, runtime, genre, youtube
FROM contentsbd
WHERE boardgrpno=2 AND word LIKE '%���ǽ�%'
ORDER BY contentsbdno DESC;

SELECT contentsbdno, 
            mno, boardgrpno, title, content, 
            recom, cnt, replycnt, rdate, word, mage, mopen, mbook, 
            seqnobd, fname, fupname, thumb, fsize, 
            director, actor, runtime, genre, youtube
FROM contentsbd
WHERE boardgrpno=2 AND word LIKE '%���ǽ�%'
ORDER BY contentsbdno DESC;

SELECT contentsbdno, 
            mno, boardgrpno, title, content, 
            recom, cnt, replycnt, rdate, word, mage, mopen, mbook, 
            seqnobd, fname, fupname, thumb, fsize, 
            director, actor, runtime, genre, youtube
FROM contentsbd
WHERE boardgrpno=2 AND word LIKE '%swiss%'
ORDER BY contentsbdno DESC;

SELECT contentsbdno, 
            mno, boardgrpno, title, content, 
            recom, cnt, replycnt, rdate, word, mage, mopen, mbook, 
            seqnobd, fname, fupname, thumb, fsize, 
            director, actor, runtime, genre, youtube
FROM contentsbd
WHERE boardgrpno=2 AND word LIKE '%����%'
ORDER BY contentsbdno DESC;

�� �˻� ���ڵ� ����
-- ��ü ���ڵ� ����
SELECT COUNT(*) as cnt
FROM contentsbd
WHERE boardgrpno=2;

-- �˻� ���ڵ� ����
SELECT COUNT(*) as cnt
FROM contentsbd
WHERE boardgrpno=2 AND word LIKE '%������%';

-- ����¡    
SELECT contentsbdno, 
            mno, boardgrpno, title, content, 
            recom, cnt, replycnt, rdate, word, mage, mopen, mbook, 
            seqnobd, fname, fupname, thumb, fsize, 
            director, actor, runtime, genre, youtube, r
FROM (
        SELECT contentsbdno, 
                  mno, boardgrpno, title, content, 
                  recom, cnt, replycnt, rdate, word, mage, mopen, mbook, 
                  seqnobd, fname, fupname, thumb, fsize, 
                  director, actor, runtime, genre, youtube, rownum as r
        FROM (
                  SELECT contentsbdno, 
                         mno, boardgrpno, title, content, 
                         recom, cnt, replycnt, rdate, word, mage, mopen, mbook, 
                         seqnobd, fname, fupname, thumb, fsize, 
                         director, actor, runtime, genre, youtube
                  FROM contentsbd
                  ORDER BY mbook DESC
              )
)
WHERE r>=1 AND r<=3;


