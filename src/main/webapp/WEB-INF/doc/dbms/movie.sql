/**********************************/
/* Table Name: 예약 */
/**********************************/
DROP TABLE moviegrp

CREATE TABLE moviegrp(
		movieno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		movie                         		VARCHAR2(100)		 NOT NULL
);

COMMENT ON TABLE moviegrp is '예약';
COMMENT ON COLUMN moviegrp.movieno is '예약번호';
COMMENT ON COLUMN moviegrp.movie is '상영중인영화';


-- 등록
INSERT INTO moviegrp(movieno, movie)
VALUES((SELECT NVL(MAX(movieno), 0) + 1 as movieno FROM moviegrp),
            '겨울왕국2');
            
INSERT INTO moviegrp(movieno, movie)
VALUES((SELECT NVL(MAX(movieno), 0) + 1 as movieno FROM moviegrp),
            '감쪽같은그녀');
            
INSERT INTO moviegrp(movieno, movie)
VALUES((SELECT NVL(MAX(movieno), 0) + 1 as movieno FROM moviegrp),
            '포드V페라리');
            
-- 목록
SELECT movieno, movie
FROM moviegrp
ORDER BY movieno ASC;

-- 조회
SELECT movieno, movie
FROM moviegrp
WHERE movieno = 2;

-- 수정
UPDATE moviegrp
SET movie='컨저링'
WHERE movieno = 2;

-- 삭제
DELETE FROM moviegrp
WHERE movieno = 2;
