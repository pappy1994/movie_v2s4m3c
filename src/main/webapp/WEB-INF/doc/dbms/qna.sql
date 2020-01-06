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


/**********************************/
/* Table Name: ������ */
/**********************************/
DROP TABLE qna;

CREATE TABLE qna(
    qnano                             NUMBER(10)     NOT NULL    PRIMARY KEY,
    qnagrpno                          NUMBER(10)     NULL ,
    title                             VARCHAR2(300)    NOT NULL,
    content                           CLOB     NOT NULL,
    cnt                               NUMBER(7)    NOT NULL,
    replycnt                          NUMBER(10)     NOT NULL,
    rdate                             DATE     NOT NULL,
  FOREIGN KEY (qnagrpno) REFERENCES qnagrp (qnagrpno)
);

COMMENT ON TABLE qna is '������';
COMMENT ON COLUMN qna.qnano is '��������ȣ';
COMMENT ON COLUMN qna.qnagrpno is 'ī�װ��׷��ȣ';
COMMENT ON COLUMN qna.title is '����';
COMMENT ON COLUMN qna.content is '����';
COMMENT ON COLUMN qna.cnt is '��ȸ��';
COMMENT ON COLUMN qna.replycnt is '��ۼ�';
COMMENT ON COLUMN qna.rdate is '�����';

1) ���
-- PK ����
SELECT NVL(MAX(qnano), 0) + 1 as qnano FROM qna;                                
 CONTENTSNO
 ----------
          1

INSERT INTO qna(qnano, qnagrpno, title, content, 
                                cnt, replycnt, rdate)
VALUES((SELECT NVL(MAX(qnano), 0) + 1 as qnano FROM qna),
             1, '����1', '����1',
             0, 0, sysdate);

-- 1) contents ���(categrpno: 1),
--     varchar�� '' ��ϵǸ� null�� insert ��
INSERT INTO qna(qnano, qnagrpno, title, content, 
                                cnt, replycnt, rdate)
VALUES((SELECT NVL(MAX(qnano), 0) + 1 as qnano FROM qna),
             1, '����1', '����1',
             0, 0, sysdate);
             
-- 2) ���
SELECT qnano, qnagrpno, title, content,
           cnt, replycnt, rdate
FROM qna
ORDER BY qnano DESC;

 QNANO QNAGRPNO TITLE CONTENT CNT REPLYCNT RDATE
 ----- -------- ----- ------- --- -------- ---------------------
     1        1 ����1   ����1       0        0 2019-12-19 11:48:49.0



-- 3) categrpno�� ��ü ���
SELECT qnano, qnagrpno, title, content, 
            cnt, replycnt, rdate
FROM qna
WHERE qnagrpno=1
ORDER BY qnano DESC;

 QNANO QNAGRPNO TITLE CONTENT CNT REPLYCNT RDATE
 ----- -------- ----- ------- --- -------- ---------------------
     1        1 ����1   ����1       0        0 2019-12-19 11:48:49.0


DELETE FROM contents; 

-- 4) ��ü ���ڵ� ��
SELECT COUNT(*) as count
FROM contents;
 
 COUNT
 -----
     2
     
-- 5) ��ȸ
SELECT qnano, qnagrpno, title, content, 
            cnt, replycnt, rdate
FROM qna
WHERE qnano=1

 QNANO QNAGRPNO TITLE CONTENT CNT REPLYCNT RDATE
 ----- -------- ----- ------- --- -------- ---------------------
     1        1 ����1   ����1       0        0 2019-12-19 11:48:49.0



-- 6) ����
UPDATE qna
SET title='���� ����', content='���� ����'
WHERE qnano = 1;

 QNANO QNAGRPNO TITLE CONTENT CNT REPLYCNT RDATE
 ----- -------- ----- ------- --- -------- ---------------------
     1        1 ���� ���� ���� ����     0        0 2019-12-19 11:48:49.0


-- 7) ����
DELETE FROM qna
WHERE qnano = 1;




             
             
             
             