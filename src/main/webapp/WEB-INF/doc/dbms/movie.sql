/**********************************/
/* Table Name: ���� */
/**********************************/
DROP TABLE moviegrp

CREATE TABLE moviegrp(
		movieno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		movie                         		VARCHAR2(100)		 NOT NULL
);

COMMENT ON TABLE moviegrp is '����';
COMMENT ON COLUMN moviegrp.movieno is '�����ȣ';
COMMENT ON COLUMN moviegrp.movie is '�����ο�ȭ';


-- ���
INSERT INTO moviegrp(movieno, movie)
VALUES((SELECT NVL(MAX(movieno), 0) + 1 as movieno FROM moviegrp),
            '�ܿ�ձ�2');
            
INSERT INTO moviegrp(movieno, movie)
VALUES((SELECT NVL(MAX(movieno), 0) + 1 as movieno FROM moviegrp),
            '���ʰ����׳�');
            
INSERT INTO moviegrp(movieno, movie)
VALUES((SELECT NVL(MAX(movieno), 0) + 1 as movieno FROM moviegrp),
            '����V���');
            
-- ���
SELECT movieno, movie
FROM moviegrp
ORDER BY movieno ASC;

-- ��ȸ
SELECT movieno, movie
FROM moviegrp
WHERE movieno = 2;

-- ����
UPDATE moviegrp
SET movie='������'
WHERE movieno = 2;

-- ����
DELETE FROM moviegrp
WHERE movieno = 2;
