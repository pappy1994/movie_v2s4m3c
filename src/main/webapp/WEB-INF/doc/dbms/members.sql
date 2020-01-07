- ���̺� ����
-- members �������� FK�� ����� blog ���̺� ���� �����մϴ�.
DROP TABLE contents;
DROP TABLE members;
-- ���� ���ǰ� �Բ� ����(���� ������ �־ ������, �������� ����.)
DROP TABLE memberss CASCADE CONSTRAINTS; 
 
CREATE TABLE members(
  mno NUMBER(6) NOT NULL, -- ȸ�� ��ȣ, ���ڵ带 �����ϴ� �÷� 
  id              VARCHAR(20)   NOT NULL UNIQUE, -- ���̵�, �ߺ� �ȵ�, ���ڵ带 ���� 
  passwd      VARCHAR(60)   NOT NULL, -- �н�����, ������ ����
  mname      VARCHAR(20)   NOT NULL, -- ����, �ѱ� 10�� ���� ����
  tel            VARCHAR(14)   NOT NULL, -- ��ȭ��ȣ
  zipcode     VARCHAR(5)        NULL, -- �����ȣ, 12345
  address1    VARCHAR(80)       NULL, -- �ּ� 1
  address2    VARCHAR(50)       NULL, -- �ּ� 2
  mdate       DATE             NOT NULL, -- ������    
  PRIMARY KEY (mno)                     -- �ѹ� ��ϵ� ���� �ߺ� �ȵ�
);
 
COMMENT ON TABLE members is 'ȸ��';
COMMENT ON COLUMN members.mno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN members.ID is '���̵�';
COMMENT ON COLUMN members.PASSWD is '�н�����';
COMMENT ON COLUMN members.MNAME is '����';
COMMENT ON COLUMN members.TEL is '��ȭ��ȣ';
COMMENT ON COLUMN members.ZIPCODE is '�����ȣ';
COMMENT ON COLUMN members.ADDRESS1 is '�ּ�1';
COMMENT ON COLUMN members.ADDRESS2 is '�ּ�2';
COMMENT ON COLUMN members.MDATE is '������';
 
 
1. ���
 
1) id �ߺ� Ȯ��
SELECT COUNT(id) as cnt
FROM members
WHERE id='user1';
 
 cnt
 ---
   0   �� �ߺ� ���� ����.
   
2) ���
- �Ϸù�ȣ ���� ��������
- MAX(mno): mno �÷��� ���߿� ���� ū ���� ����
- ���ڵ尡 ������ MAX �Լ��� ����� NULL�̵˴ϴ�.
SELECT MAX(mno) as mno FROM members;
mno
 ------
 NULL
 
 - NULL ���� ��Ģ������ ����� NULL�̵˴ϴ�. �ǹ� ����.
SELECT MAX(mno)+1 as mno FROM members;
mno
 ------
 NULL
 
 - NVL(��, ��ȯ�� ��): ���� NULL�̸� ��ȯ�� ������ ����, 
   NULL�� 0���� ����
SELECT NVL(MAX(mno), 0) as mno FROM members;
mno
 ------
   0
   
- NULL�� ó���ϸ鼭 ���ο� �ִ밪 ���� SQL
SELECT NVL(MAX(mno), 0)+1 as mno FROM members;
mno
 ------
   1
 
-- ������ ȸ�� ����
INSERT INTO members(mno,
                   id, passwd, mname, tel, zipcode,
                   address1, address2, mdate)
VALUES ((SELECT NVL(MAX(mno), 0)+1 as mno FROM members),
                   'qnaadmin', '1234', 'QNA������', '000-0000-0000', '12345',
                   '����� ���α�', '��ö��', sysdate);
 
INSERT INTO members(mno,
                   id, passwd, mname, tel, zipcode,
                   address1, address2, mdate)
VALUES ((SELECT NVL(MAX(mno), 0)+1 as mno FROM members),
                   'crm', '1234', '��������', '000-0000-0000', '12345',
                   '����� ���α�', '��ö��', sysdate);
 
-- ���� ȸ�� ����
INSERT INTO members(mno,
                   id, passwd, mname, tel, zipcode,
                   address1, address2, mdate)
VALUES ((SELECT NVL(MAX(mno), 0)+1 as mno FROM members),
                   'user1', '1234', '�մ���', '000-0000-0000', '12345',
                   '����� ���α�', '��ö��', sysdate);
 
INSERT INTO members(mno,
                   id, passwd, mname, tel, zipcode,
                   address1, address2, mdate)
VALUES ((SELECT NVL(MAX(mno), 0)+1 as mno FROM members),
                  'user2', '1234', '�մ���', '000-0000-0000', '12345',
                  '����� ���α�', '��ö��', sysdate);
 
INSERT INTO members(mno,
                   id, passwd, mname, tel, zipcode,
                   address1, address2, mdate)
VALUES ((SELECT NVL(MAX(mno), 0)+1 as mno FROM members),
                   'user3', '1234', '�մ���', '000-0000-0000', '12345',
                   '����� ���α�', '��ö��', sysdate);
 
-- �׷캰 ����ȸ�� ����
INSERT INTO members(mno,
                   id, passwd, mname, tel, zipcode,
                  address1, address2, mdate)
VALUES ((SELECT NVL(MAX(mno), 0)+1 as mno FROM members),
                   'team1', '1234', '������', '000-0000-0000', '12345',
                   '����� ���α�', '��ö��', sysdate);
 
INSERT INTO members(mno,
                   id, passwd, mname, tel, zipcode,
                   address1, address2, mdate)
VALUES ((SELECT NVL(MAX(mno), 0)+1 as mno FROM members),
                   'team2', '1234', '���ۺ�����', '000-0000-0000', '12345',
                   '����� ���α�', '��ö��', sysdate);
 
INSERT INTO members(mno,
                   id, passwd, mname, tel, zipcode,
                   address1, address2, mdate)
VALUES ((SELECT NVL(MAX(mno), 0)+1 as mno FROM members),
                   'team3', '1234', '��������', '000-0000-0000', '12345',
                   '����� ���α�', '��ö��', sysdate);
 
 
2. ���
- �˻��� ���� �ʴ� ���, ��ü ��� ���
 
SELECT mno, id, passwd, mname, tel, zipcode, address1, address2, mdate
FROM members
ORDER BY mno ASC;
 
 mno ID       PASSWD MNAME  TEL           ZIPCODE ADDRESS1 ADDRESS2 MDATE
 --- -------- ------ ------ ------------- ------- -------- -------- ---------------------
   1 qnaadmin 1234   QNA������ 000-0000-0000 12345   ����� ���α�  ��ö��      2019-05-24 14:51:43.0
   2 crm      1234   ��������  000-0000-0000 12345   ����� ���α�  ��ö��      2019-05-24 14:51:44.0
   3 user1    1234   �մ���    000-0000-0000 12345   ����� ���α�  ��ö��      2019-05-24 14:51:48.0
   4 user2    1234   �մ���    000-0000-0000 12345   ����� ���α�  ��ö��      2019-05-24 14:51:49.0
   5 user3    1234   �մ���    000-0000-0000 12345   ����� ���α�  ��ö��      2019-05-24 14:51:50.0
   6 team1    1234   ������    000-0000-0000 12345   ����� ���α�  ��ö��      2019-05-24 14:51:53.0
   7 team2    1234   ���ۺ����� 000-0000-0000 12345   ����� ���α�  ��ö��      2019-05-24 14:51:54.0
   8 team3    1234   ��������   000-0000-0000 12345   ����� ���α�  ��ö��      2019-05-24 14:51:55.0
 
 
   
3. ��ȸ
 
1) mno PK�� user1 ��� ���� ����
SELECT mno, id, passwd, mname, tel, zipcode, address1, address2, mdate
FROM members
WHERE mno = 1;
 
 mno ID       PASSWD MNAME  TEL           ZIPCODE ADDRESS1 ADDRESS2 MDATE
 --- -------- ------ ------ ------------- ------- -------- -------- ---------------------
   1 qnaadmin 1234   QNA������ 000-0000-0000 12345   ����� ���α�  ��ö��      2019-05-24 14:51:43.0

2) id�� user1 ��� ���� ����   
SELECT mno, id, passwd, mname, tel, zipcode, address1, address2, mdate
FROM members
WHERE id = 'user1';
 
 mno ID    PASSWD MNAME TEL           ZIPCODE ADDRESS1 ADDRESS2 MDATE
 --- ----- ------ ----- ------------- ------- -------- -------- ---------------------
   3 user1 1234   �մ���   000-0000-0000 12345   ����� ���α�  ��ö��      2019-05-24 14:51:48.0
 
 
   
4. ����
UPDATE members 
SET mname='�Ʒι�', tel='111-1111-1111', zipcode='00000',
      address1='��⵵', address2='���ֽ�'
WHERE mno=1;
 
 
5. �н����� ����
1) �н����� �˻�
SELECT COUNT(mno) as cnt
FROM members
WHERE mno=1 AND passwd='1234';
 
2) �н����� ����
UPDATE members
SET passwd='0000'
WHERE mno=1;
 
 
6. ����
1) ��� ����
DELETE FROM members;
 
2) Ư�� ȸ�� ����
DELETE FROM members
WHERE mno=8;
 
 
7. �α���
SELECT COUNT(mno) as cnt
FROM members
WHERE id='user1' AND passwd='1234';
 cnt
 ---
   0
   
 
