/**********************************/
/* Table Name: 예약 */
/**********************************/
DROP TABLE theatergrp

CREATE TABLE theatergrp(
		theaterno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		area                               VARCHAR2(30)  ,
		theater                         		VARCHAR2(100)
);

COMMENT ON TABLE theatergrp is '극장';
COMMENT ON COLUMN theatergrp.theaterno is '극장번호';
COMMENT ON COLUMN theatergrp.area is '상영지역';
COMMENT ON COLUMN theatergrp.theater is '상영극장';


-- 등록
INSERT INTO theatergrp(theaterno, area, theater)
VALUES((SELECT NVL(MAX(theaterno), 0) + 1 as theaterno FROM theatergrp),
            '서울', '신촌CGV');
            
INSERT INTO theatergrp(theaterno, area, theater)
VALUES((SELECT NVL(MAX(theaterno), 0) + 1 as theaterno FROM theatergrp),
            '서울', '신촌CGV');
            
INSERT INTO theatergrp(theaterno, area, theater)
VALUES((SELECT NVL(MAX(theaterno), 0) + 1 as theaterno FROM theatergrp),
            '서울', '신촌CGV');
            
INSERT INTO theatergrp(theaterno, area)
VALUES((SELECT NVL(MAX(theaterno), 0) + 1 as theaterno FROM theatergrp),
            '강원도');
            
INSERT INTO theatergrp(theaterno, theater)
VALUES((SELECT NVL(MAX(theaterno), 0) + 1 as theaterno FROM theatergrp),
            '신촌CGV');
            
-- 목록
SELECT theaterno, area, theater
FROM theatergrp
ORDER BY theaterno ASC;

-- 조회
SELECT theaterno, area, theater
FROM theatergrp
WHERE theaterno = 2;

-- 수정
UPDATE theatergrp
SET area='대구', theater='종각CGV'
WHERE theaterno = 2;

-- 삭제
DELETE FROM theatergrp
WHERE theaterno = 2;
