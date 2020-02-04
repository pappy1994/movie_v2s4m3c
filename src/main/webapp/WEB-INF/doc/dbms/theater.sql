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


COMMENT ON TABLE areagrp is '지역';
COMMENT ON COLUMN areagrp.areano is '지역번호';
COMMENT ON COLUMN areagrp.area is '상영지역';
COMMENT ON COLUMN areagrp.cnt is '등록된 자료수';

COMMENT ON TABLE theatergrp is '극장';
COMMENT ON COLUMN theatergrp.theaterno is '극장번호';
COMMENT ON COLUMN theatergrp.areano is '지역번호';
COMMENT ON COLUMN theatergrp.theater is '상영극장';

-- 등록
INSERT INTO areagrp(areano, area, cnt)
VALUES((SELECT NVL(MAX(areano), 0) + 1 as areano FROM areagrp),
            '서울', 0);
            
INSERT INTO areagrp(areano, area, cnt)
VALUES((SELECT NVL(MAX(areano), 0) + 1 as areano FROM areagrp),
            '대구', 0);
            
INSERT INTO areagrp(areano, area, cnt)
VALUES((SELECT NVL(MAX(areano), 0) + 1 as areano FROM areagrp),
            '부산', 0);
            
SELECT NVL(MAX(theaterno), 0) + 1 as theaterno FROM theatergrp; 
SELECT NVL(MAX(areano), 0) + 1 as areano FROM areagrp;            
            
INSERT INTO theatergrp(theaterno, areano, theater)
VALUES((SELECT NVL(MAX(theaterno), 0) + 1 as theaterno FROM theatergrp),
            1, '강남CGV');
            
SELECT areano FROM areagrp ORDER BY areano; 
            
-- 목록
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

-- 조회
SELECT areano, area, cnt
FROM areagrp
WHERE areano = 2;

SELECT theaterno, areano, theater
FROM theatergrp
WHERE theaterno = 1;

-- 수정
UPDATE areagrp
SET area='대전'
WHERE areano = 2;

UPDATE theatergrp
SET theater='종각CGV'
WHERE theaterno = 1;

-- 등록된 글수 증가,감소
UPDATE areagrp 
SET cnt = cnt + 1 
WHERE areano=1;

UPDATE areagrp 
SET cnt = cnt - 1 
WHERE areano=1;

-- 삭제
DELETE FROM areagrp
WHERE areano = 2;

DELETE FROM theatergrp
WHERE theaterno = 1;

-- FK 부모 테이블별 레코드 삭제
DELETE FROM theatergrp
WHERE areano=1;
