DROP TABLE areagrp;
DROP TABLE theatergrp;
DROP TABLE areagrp CASCADE CONSTRAINTS;
DROP TABLE theatergrp CASCADE CONSTRAINTS;

CREATE TABLE areagrp(
		areano                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		area                           VARCHAR2(30),
		cnt                             NUMBER(7)    DEFAULT 0     NOT NULL    
);

CREATE TABLE theatergrp(
    theaterno                         NUMBER(10)     NOT NULL    PRIMARY KEY,
    areano                             NUMBER(10),
    theater                            VARCHAR2(30),
    FOREIGN KEY (areano) REFERENCES areagrp (areano)
);


COMMENT ON TABLE areagrp is '����';
COMMENT ON COLUMN areagrp.areano is '������ȣ';
COMMENT ON COLUMN areagrp.area is '������';
COMMENT ON COLUMN areagrp.cnt is '��ϵ� �ڷ��';

COMMENT ON TABLE theatergrp is '����';
COMMENT ON COLUMN theatergrp.theaterno is '�����ȣ';
COMMENT ON COLUMN theatergrp.areano is '������ȣ';
COMMENT ON COLUMN theatergrp.theater is '�󿵱���';

-- ���
INSERT INTO areagrp(areano, area, cnt)
VALUES((SELECT NVL(MAX(areano), 0) + 1 as areano FROM areagrp),
            '����', 0);
            
INSERT INTO areagrp(areano, area, cnt)
VALUES((SELECT NVL(MAX(areano), 0) + 1 as areano FROM areagrp),
            '�뱸', 0);
            
INSERT INTO areagrp(areano, area, cnt)
VALUES((SELECT NVL(MAX(areano), 0) + 1 as areano FROM areagrp),
            '�λ�', 0);
            
SELECT NVL(MAX(theaterno), 0) + 1 as theaterno FROM theatergrp; 
SELECT NVL(MAX(areano), 0) + 1 as areano FROM areagrp;            
            
INSERT INTO theatergrp(theaterno, areano, theater)
VALUES((SELECT NVL(MAX(theaterno), 0) + 1 as theaterno FROM theatergrp),
            1, '����');
            
SELECT areano FROM areagrp ORDER BY areano; 
            
-- ���
SELECT areano, area, cnt
FROM areagrp
ORDER BY areano ASC;

SELECT theaterno , areano, theater
FROM theatergrp
ORDER BY theaterno ASC;

SELECT theaterno , areano, theater
FROM theatergrp
WHERE areano = 1;
ORDER BY theaterno ASC;

-- ��ȸ
SELECT areano, area, cnt
FROM areagrp
WHERE areano = 2;

SELECT theaterno, areano, theater
FROM theatergrp
WHERE theaterno = 1;

-- ����
UPDATE areagrp
SET area='����'
WHERE areano = 2;

UPDATE theatergrp
SET theater='����'
WHERE theaterno = 1;

-- ��ϵ� �ۼ� ����,����
UPDATE areagrp 
SET cnt = cnt + 1 
WHERE areano=1;

UPDATE areagrp 
SET cnt = cnt - 1 
WHERE areano=1;

-- ����
DELETE FROM areagrp
WHERE areano = 2;

DELETE FROM theatergrp
WHERE theaterno = 1;

-- FK �θ� ���̺� ���ڵ� ����
DELETE FROM theatergrp
WHERE areano=1;

-- �˻�
SELECT theaterno, areano, theater
FROM theatergrp
WHERE areano=1 AND theater LIKE '%����%'
ORDER BY theaterno DESC;

SELECT theaterno, areano, theater
FROM theatergrp
WHERE areano=1 AND theater LIKE '%�ϳ�%'
ORDER BY theaterno DESC;

SELECT theaterno, areano, theater
FROM theatergrp
WHERE areano=1 AND theater LIKE '%����%'
ORDER BY theaterno DESC;

SELECT theaterno, areano, theater
FROM theatergrp
WHERE areano=1 AND theater LIKE '%���ӳ�%'
ORDER BY theaterno DESC;

SELECT theaterno, areano, theater
FROM theatergrp
WHERE areano=1 AND theater LIKE '%����%'
ORDER BY theaterno DESC;

-- ��ü ���ڵ� ����
SELECT COUNT(*) as cnt
FROM theatergrp
WHERE areano=1;

-- �˻� ���ڵ� ����
SELECT COUNT(*) as cnt
FROM theatergrp
WHERE areano=1 AND theater LIKE '%����%';

-- ����¡
-- step 1
SELECT theaterno, areano, theater
FROM theatergrp
WHERE areano=1 AND theater LIKE '%����%'
ORDER BY theaterno DESC;

-- step 2
SELECT theaterno, areano, theater, rownum as r
FROM (
          SELECT theaterno, areano, theater
          FROM theatergrp
          WHERE areano=1 AND theater LIKE '%����%'
          ORDER BY theaterno DESC
);
   
-- step 3
SELECT theaterno, areano, theater, r
FROM (
           SELECT theaterno, areano, theater, rownum as r
           FROM (
                     SELECT theaterno, areano, theater
                     FROM theatergrp
                     WHERE areano=1 AND theater LIKE '%����%'
                     ORDER BY theaterno DESC
           )          
)
WHERE r >= 1 AND r <= 3;
