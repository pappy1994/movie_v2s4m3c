CREATE TABLE members(
    mno                         NUMBER(10)     NOT NULL    PRIMARY KEY
);

COMMENT ON TABLE members is 'ȸ��';
COMMENT ON COLUMN members.mno is 'ȸ�� ��ȣ';

/**********************************/
/* Table Name: ��ȭ */
/**********************************/
DROP TABLE members;
DROP TABLE boardgrp;
DROP TABLE contentsbd;
DROP TABLE attachbd;
DROP TABLE rpl;

CREATE TABLE contentsbd(
    contentsbdno                      NUMBER(10)       NOT NULL    PRIMARY KEY,
    mno                               NUMBER(10)       NOT NULL,
    boardgrpno                        NUMBER(10)       NOT NULL,
    title                             VARCHAR2(300)    NOT NULL,
    content                           CLOB             NOT NULL,
    recom                             NUMBER(7)        DEFAULT 0     NOT NULL,
    cnt                               NUMBER(7)        DEFAULT 0     NOT NULL,
    replycnt                          NUMBER(10)       DEFAULT 0     NOT NULL,
    rdate                             DATE             NOT NULL,
    word                              VARCHAR2(100)    NULL,
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

/**********************************/
/* Table Name: ���� */
/**********************************/
DROP TABLE areagrp;

CREATE TABLE areagrp(
    areano                        NUMBER(10)     NOT NULL    PRIMARY KEY,
    area                           VARCHAR2(30),
    cnt                             NUMBER(7)    DEFAULT 0     NOT NULL    
);

COMMENT ON TABLE areagrp is '����';
COMMENT ON COLUMN areagrp.areano is '������ȣ';
COMMENT ON COLUMN areagrp.area is '������';
COMMENT ON COLUMN areagrp.cnt is '��ϵ� �ڷ��';
/**********************************/
/* Table Name: ���� */
/**********************************/
DROP TABLE theatergrp;

CREATE TABLE theatergrp(
    theaterno                         NUMBER(10)     NOT NULL    PRIMARY KEY,
    areano                             NUMBER(10),
    theater                            VARCHAR2(30),
    FOREIGN KEY (areano) REFERENCES areagrp (areano)
);

COMMENT ON TABLE theatergrp is '����';
COMMENT ON COLUMN theatergrp.theaterno is '�����ȣ';
COMMENT ON COLUMN theatergrp.areano is '������ȣ';
COMMENT ON COLUMN theatergrp.theater is '�󿵱���';

/**********************************/
/* Table Name: �ð� */
/**********************************/
DROP TABLE movie_time

CREATE TABLE movie_time(
    movie_timeno                  NUMBER(10)     NOT NULL    PRIMARY KEY,
    seqno                            NUMBER(7)    DEFAULT 0     NOT NULL,
    mtime                           VARCHAR2(30)   NOT NULL
);

COMMENT ON TABLE movie_time is '��ȭ�ð�';
COMMENT ON COLUMN movie_time.movie_timeno is '�󿵽ð���ȣ';
COMMENT ON COLUMN movie_time.seqno is '��� ����';
COMMENT ON COLUMN movie_time.mtime is '�󿵽ð�';

/**********************************/
/* Table Name: RESERVEGRP */
/**********************************/
CREATE TABLE RESERVEGRP(
    reserveno                         NUMBER(10)    NOT NULL,
    areano                            NUMBER(10)     NOT NULL,
    theaterno                         NUMBER(10)     NOT NULL,
    movie_timeno                      NUMBER(10)     NOT NULL,
    contentsbdno                      NUMBER(10)     NOT NULL,
    FOREIGN KEY (areano) REFERENCES areagrp (areano),
    FOREIGN KEY (theaterno) REFERENCES theatergrp (theaterno),
    FOREIGN KEY (movie_timeno) REFERENCES movie_time (movie_timeno),
    FOREIGN KEY (contentsbdno) REFERENCES contentsbd (contentsbdno)
);

DROP TABLE reservegrp;
