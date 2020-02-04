DROP TABLE movie_time

CREATE TABLE movie_time(
    movie_timeno                  NUMBER(10)     NOT NULL    PRIMARY KEY,
    seqno                            NUMBER(7)    DEFAULT 0     NOT NULL,
    mtime                           VARCHAR2(30)   NOT NULL
);

COMMENT ON TABLE movie_time is '영화시간';
COMMENT ON COLUMN movie_time.movie_timeno is '상영시간번호';
COMMENT ON COLUMN movie_time.seqno is '출력 순서';
COMMENT ON COLUMN movie_time.mtime is '상영시간';

INSERT INTO movie_time(movie_timeno, seqno, mtime)
VALUES((SELECT NVL(MAX(movie_timeno), 0) + 1 as movie_timeno FROM movie_time),
            1, '9:30');
            
INSERT INTO movie_time(movie_timeno, seqno, mtime)
VALUES((SELECT NVL(MAX(movie_timeno), 0) + 1 as movie_timeno FROM movie_time),
            2, '10:30');
            
INSERT INTO movie_time(movie_timeno, seqno, mtime)
VALUES((SELECT NVL(MAX(movie_timeno), 0) + 1 as movie_timeno FROM movie_time),
            3, '11:30');            

SELECT movie_timeno, seqno, mtime
FROM movie_time
ORDER BY movie_timeno ASC;

SELECT movie_timeno, seqno, mtime
FROM movie_time
ORDER BY seqno ASC;

SELECT movie_timeno, seqno, mtime
FROM movie_time
WHERE movie_timeno = 1;

UPDATE movie_time
SET mtime='12:30'
WHERE movie_timeno = 3;

UPDATE movie_time
SET seqno = seqno - 1
WHERE movie_timeno=2;

UPDATE movie_time
SET seqno = seqno + 1
WHERE movie_timeno=1;

DELETE FROM movie_time
WHERE movie_timeno = 3;


