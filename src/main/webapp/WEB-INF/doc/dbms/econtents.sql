/**********************************/
/* Table Name: 카테고리 그룹 */
/**********************************/
CREATE TABLE EVENTGRP(
    eventgrpno                        NUMBER(10)     NOT NULL    PRIMARY KEY,
    name                              VARCHAR2(50)     NOT NULL,
    seqno                             NUMBER(7)    NOT NULL,
    visible                           CHAR(1)    NOT NULL,
    rdate                             DATE     NOT NULL
);

COMMENT ON TABLE EVENTGRP is '카테고리 그룹';
COMMENT ON COLUMN EVENTGRP.eventgrpno is '카테고리 그룹 번호';
COMMENT ON COLUMN EVENTGRP.name is '이름';
COMMENT ON COLUMN EVENTGRP.seqno is '출력 순서';
COMMENT ON COLUMN EVENTGRP.visible is '출력 모드';
COMMENT ON COLUMN EVENTGRP.rdate is '그룹 생성일';

drop table eventcontents;
drop table eventgrp;

select * from eventcontents;

/**********************************/
/* Table Name: 이벤트 컨텐츠 */
/**********************************/
CREATE TABLE EVENTCONTENTS(
    econtentsno                       NUMBER(10)     NOT NULL    PRIMARY KEY,
    eventgrpno                        NUMBER(10)     NULL ,
    etype                             VARCHAR2(50)     NOT NULL,
    title                             VARCHAR2(300)    NOT NULL,
    content                           CLOB         NOT NULL,
    rdate                             DATE     NOT NULL,
    FOREIGN KEY (eventgrpno) REFERENCES eventgrp (eventgrpno)
);

COMMENT ON TABLE EVENTCONTENTS is '이벤트 컨텐츠';
COMMENT ON COLUMN EVENTCONTENTS.econtentsno is '이벤트 순서';
COMMENT ON COLUMN EVENTCONTENTS.eventgrpno is '카테고리 그룹 번호';
COMMENT ON COLUMN EVENTCONTENTS.etype is '이벤트 타입';
COMMENT ON COLUMN EVENTCONTENTS.title is '제목';
COMMENT ON COLUMN EVENTCONTENTS.content is '내용';
COMMENT ON COLUMN EVENTCONTENTS.rdate is '이벤트 기간';


-- 등록 create
INSERT INTO eventcontents(econtentsno, eventgrpno, etype, title, content, rdate)
VALUES((SELECT NVL(MAX(econtentsno), 0) + 1 as econtentsno FROM eventcontents),
             1,'영화/예매', '제목', '이벤트 내용', sysdate);
             
-- 목록 확인  list           
SELECT econtentsno, eventgrpno, etype, title, content, rdate
FROM eventcontents
ORDER BY econtentsno ASC;

ECONTENTSNO EVENTGRPNO ETYPE TITLE CONTENT RDATE
 ----------- ---------- ----- ----- ------- ---------------------
           1        1  영화/예매 제목    이벤트 내용  2019-12-12 18:35:31.0

-- 조회 read
SELECT econtentsno, eventgrpno, etype, title, content, rdate
FROM eventcontents
WHERE econtentsno = 1;       

-- 수정 update
UPDATE eventcontents
SET title='이벤트', content='이벤트 내용 없음'
WHERE econtentsno = 1;

 ECONTENTSNO EVENTGRPNO ETYPE TITLE CONTENT   RDATE
 ----------- ---------- ----- ----- --------- ---------------------
           1          1 영화/예매 이벤트   이벤트 내용 없음 2019-12-12 18:35:31.0
         
-- 삭제 delete
DELETE FROM eventcontents
WHERE econtentsno=4;         

DELETE FROM eventcontents
COMMIT;

