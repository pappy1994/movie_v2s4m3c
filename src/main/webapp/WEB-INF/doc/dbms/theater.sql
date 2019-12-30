/**********************************/
/* Table Name: ���� */
/**********************************/
DROP TABLE theatergrp

CREATE TABLE theatergrp(
		theaterno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		area                               VARCHAR2(30)  ,
		theater                         		VARCHAR2(100)
);

COMMENT ON TABLE theatergrp is '����';
COMMENT ON COLUMN theatergrp.theaterno is '�����ȣ';
COMMENT ON COLUMN theatergrp.area is '������';
COMMENT ON COLUMN theatergrp.theater is '�󿵱���';


-- ���
INSERT INTO theatergrp(theaterno, area, theater)
VALUES((SELECT NVL(MAX(theaterno), 0) + 1 as theaterno FROM theatergrp),
            '����', '����CGV');
            
INSERT INTO theatergrp(theaterno, area, theater)
VALUES((SELECT NVL(MAX(theaterno), 0) + 1 as theaterno FROM theatergrp),
            '����', '����CGV');
            
INSERT INTO theatergrp(theaterno, area, theater)
VALUES((SELECT NVL(MAX(theaterno), 0) + 1 as theaterno FROM theatergrp),
            '����', '����CGV');
            
INSERT INTO theatergrp(theaterno, area)
VALUES((SELECT NVL(MAX(theaterno), 0) + 1 as theaterno FROM theatergrp),
            '������');
            
INSERT INTO theatergrp(theaterno, theater)
VALUES((SELECT NVL(MAX(theaterno), 0) + 1 as theaterno FROM theatergrp),
            '����CGV');
            
-- ���
SELECT theaterno, area, theater
FROM theatergrp
ORDER BY theaterno ASC;

-- ��ȸ
SELECT theaterno, area, theater
FROM theatergrp
WHERE theaterno = 2;

-- ����
UPDATE theatergrp
SET area='�뱸', theater='����CGV'
WHERE theaterno = 2;

-- ����
DELETE FROM theatergrp
WHERE theaterno = 2;
