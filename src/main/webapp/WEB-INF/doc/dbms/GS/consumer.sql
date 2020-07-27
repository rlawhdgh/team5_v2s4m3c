/**********************************/
/* Table Name: ȸ�� */
/**********************************/
drop table consumer CASCADE CONSTRAINTS;
CREATE TABLE consumer(
		consumer_no                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
        consumer_name                       VARCHAR2(100)   NOT NULL ,
		consumer_id                   		VARCHAR2(100)		 NOT NULL UNIQUE,
		consumer_passwd               		VARCHAR2(100)		 NOT NULL,
		consumer_nickname             		VARCHAR2(100)		 NOT NULL,
		consumer_email                		VARCHAR2(100)		 NOT NULL,
		consumer_age                  		VARCHAR2(100)		 NULL,
		consumer_phone_num            		VARCHAR2(100)		 NOT NULL,
        consumer_sex                              CHAR(10)               NULL,
		consumer_pay_num              		VARCHAR2(100)		 NULL,
		consumer_game_tend            		VARCHAR2(100)		 NULL,
		consumer_point                		NUMBER(10)		 DEFAULT 0		NOT NULL ,
        consumer_key                       VARCHAR(100)      NOT NULL,
		grade_no                      		NUMBER(10)		 DEFAULT 0		 NOT NULL,
  FOREIGN KEY (grade_no) REFERENCES grade (grade_no)
);

COMMENT ON TABLE consumer is 'ȸ��';
COMMENT ON COLUMN consumer.consumer_no is 'ȸ����ȣ';
COMMENT ON COLUMN consumer.consumer_name is 'ȸ�� �̸�';
COMMENT ON COLUMN consumer.consumer_id is 'ȸ�� ���̵�';
COMMENT ON COLUMN consumer.consumer_passwd is 'ȸ�� ��й�ȣ';
COMMENT ON COLUMN consumer.consumer_nickname is 'ȸ�� ��Ī';
COMMENT ON COLUMN consumer.consumer_email is 'ȸ�� �̸���';
COMMENT ON COLUMN consumer.consumer_age is 'ȸ�� ����';
COMMENT ON COLUMN consumer.consumer_phone_num is 'ȸ�� ��ȭ��ȣ';
COMMENT ON COLUMN consumer.consumer_sex is 'ȸ�� ����';
COMMENT ON COLUMN consumer.consumer_pay_num is 'ȸ�� ���¹�ȣ';
COMMENT ON COLUMN consumer.consumer_game_tend is 'ȸ�� ���Ӽ���';
COMMENT ON COLUMN consumer.consumer_point is 'ȸ�� ����Ʈ';
COMMENT ON COLUMN consumer.consumer_key is 'ȸ�� ����Ű';
COMMENT ON COLUMN consumer.grade_no is 'ȸ����޹�ȣ';

DROP SEQUENCE consumer_seq;
CREATE SEQUENCE consumer_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
  
  CREATE SEQUENCE login_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;    
  
  ----------------DML-------------------

1) ���(FPS)
INSERT INTO consumer(consumer_no, consumer_name, consumer_id, consumer_passwd, consumer_nickname, consumer_email,
                                  consumer_age, consumer_phone_num, consumer_pay_num, consumer_game_tend, consumer_key,grade_no,consumer_sex)
VALUES(consumer_seq.nextval, '�ڱټ�', 'user1', '1234', '����', 'parkgeunseo2@naver.com', '11', '010-1234-1234', '123-456-789', 'FPS','AJE!125fD',0 ,'M');
INSERT INTO consumer(consumer_no, consumer_name, consumer_id, consumer_passwd, consumer_nickname, consumer_email,
                                  consumer_age, consumer_phone_num, consumer_pay_num, consumer_game_tend, consumer_key,grade_no,consumer_sex)
VALUES(consumer_seq.nextval, '�ڱټ�', 'parkgeunse19', '1234', '����', 'parkgeunseo2@naver.com', '52', '010-1234-1234', '123-456-789', '�ùķ��̼�','AJE!125fD',0,'F' );
INSERT INTO consumer(consumer_no, consumer_name, consumer_id, consumer_passwd, consumer_nickname, consumer_email,
                                  consumer_age, consumer_phone_num, consumer_pay_num, consumer_game_tend, consumer_key,grade_no)
VALUES(consumer_seq.nextval, '�ڱټ�', 'parkgeunse12', '1234', '����', 'parkgeunseo2@naver.com', '42', '010-1234-1234', '123-456-789', '������','AJE!125fD',0 );
INSERT INTO consumer(consumer_no, consumer_name, consumer_id, consumer_passwd, consumer_nickname, consumer_email,
                                  consumer_age, consumer_phone_num, consumer_pay_num, consumer_game_tend, consumer_key,grade_no,consumer_sex)
VALUES(consumer_seq.nextval, '�ڱټ�', 'parkgeunse13', '1234', '����', 'parkgeunseo2@naver.com', '22', '010-1234-1234', '123-456-789', '�����̵�','AJE!125fD',0,'M' );
INSERT INTO consumer(consumer_no, consumer_name, consumer_id, consumer_passwd, consumer_nickname, consumer_email,
                                  consumer_age, consumer_phone_num, consumer_pay_num, consumer_game_tend, consumer_key,grade_no)
VALUES(consumer_seq.nextval, '�ڱټ�', 'parkgeunse14', '1234', '����', 'parkgeunseo2@naver.com', '18', '010-1234-1234', '123-456-789', '����','AJE!125fD',0 );
INSERT INTO consumer(consumer_no, consumer_name, consumer_id, consumer_passwd, consumer_nickname, consumer_email,
                                  consumer_age, consumer_phone_num, consumer_pay_num, consumer_game_tend, consumer_key,grade_no)
VALUES(consumer_seq.nextval, '�ڱټ�', 'parkgeunse15', '1234', '����', 'parkgeunseo2@naver.com', '25', '010-1234-1234', '123-456-789', '��庥ó','AJE!125fD',0 );
INSERT INTO consumer(consumer_no, consumer_name, consumer_id, consumer_passwd, consumer_nickname, consumer_email,
                                  consumer_age, consumer_phone_num, consumer_pay_num, consumer_game_tend, consumer_key,grade_no)
VALUES(consumer_seq.nextval, '�ڱټ�', 'parkgeunse20', '1234', '����', 'parkgeunseo2@naver.com', '9', '010-1234-1234', '123-456-789', '�׼�','AJE!125fD',0 );
INSERT INTO consumer(consumer_no, consumer_name, consumer_id, consumer_passwd, consumer_nickname, consumer_email,
                                   consumer_phone_num, consumer_pay_num, consumer_key,grade_no)
VALUES(1, '�ڱټ�', 'user4', '1234', '����', 'parkgeunseo2@naver.com', '010-1234-1234', '123-456-789','AJE!125fD',0 );
commit;


INSERT INTO consumer(consumer_no, consumer_name, consumer_id, consumer_passwd, consumer_nickname, consumer_email,
                                  consumer_age, consumer_phone_num, consumer_pay_num, consumer_game_tend, consumer_key,grade_no,consumer_sex)
VALUES(1, '�ڱټ�', 'user1', '1234', '����', 'parkgeunseo2@naver.com', '11', '010-1234-1234', '123-456-789', 'FPS','AJE!125fD',0 ,'M');

2) ���
SELECT consumer_no, consumer_name, consumer_id, consumer_passwd, consumer_nickname, consumer_email,
                                  consumer_age, consumer_phone_num, consumer_pay_num, consumer_key,consumer_pay_num,consumer_sex,consumer_game_tend,grade_no
FROM consumer
ORDER BY consumer_no ASC;

3) ��ȸ
SELECT consumer_no, consumer_name, consumer_id, consumer_passwd, consumer_nickname, consumer_email,
                                  consumer_age, consumer_phone_num, consumer_pay_num, consumer_game_tend,grade_no
FROM consumer
where consumer_no = 1 

4) ����
UPDATE consumer
SET  consumer_no = 1,consumer_name='UG������', consumer_id ='UG������' , consumer_passwd='1234',consumer_nickname ='UG������'
WHERE consumer_no = 2;

UPDATE consumer
SET  consumer_key = 'Y'
WHERE consumer_no = 15;

UPDATE consumer
SET  consumer_passwd = '$2a$10$wto5qtVcp9Db0PS9YK.M0OMT/kwQdzj6vhmnSVExKHZkgqPPVnBZW'
WHERE consumer_no = 15;

UPDATE consumer
SET  grade_no = 10
WHERE consumer_no = 51;


UPDATE consumer
SET  consumer_game_tend = '�׼�'
WHERE consumer_no = 48;

5) ����
DELETE FROM consumer
WHERE  consumer_no = 77;

  ----------------DDL-------------------
1). ȸ�� �Ӽ� �߰�
ALTER TABLE consumer
ADD (test VARCHAR(9));
       
2). ȸ�� �Ӽ� ����
ALTER TABLE consumer
MODIFY (consumer_age NUMBER(3));

3). ȸ�� �Ӽ��� ����
ALTER TABLE consumer
RENAME COLUMN test to test2;

4). ȸ�� �Ӽ� ����
ALTER TABLE consumer
DROP COLUMN test2;

--------------TCL---------------
commit;

 update consumer 
 set consumer_key ='asggwFASGA12QGWIVN'
 where consumer_id = 'parkgeunseo'



----------������ ���� ���� ( �̹��� , ���� )-------------
UPDATE consumer
SET consumer_nickname = '����12345',consumer_img= 'image12'
WHERE consumer_no = 12;



-------------join(ȸ�� ��Ͽ��� ȸ�� ��޸� ��ȸ)----------------
SELECT c.consumer_no as c_consumer_no,
            c.consumer_name as c_consumer_name,
            c.consumer_id as c_consumer_id,
            c.consumer_phone_num as c_consumer_phone_num,
            g.grade_name as g_grade_name
FROM consumer c , grade g
where c.grade_no = g.grade_no and c.consumer_key ='Y'
order by g.grade_no desc;

SELECT COUNT(consumer_id) as cnt
FROM consumer
WHERE consumer_id='�մ���123'

update consumer 
set consumer_passwd = '1234'
where consumer_no = 4

SELECT COUNT(consumer_name) as cnt
FROM consumer
WHERE consumer_name='�ڱټ�'

update consumer 
set consumer_pay_num = ''
where consumer_no = 


SELECT COUNT(consumer_no) as cnt
FROM consumer
WHERE consumer_id='parkgeunseo' AND 

<select id="readById" parameterType="String" resultType="MemberVO">
SELECT consumer_no, consumer_id, consumer_passwd, consumer_name, consumer_phone_num 
FROM consumer
WHERE consumer_id = 'parkgeunseo';
</select>

UPDATE consumer
SET  grade_no=10
WHERE consumer_no = 1;

SELECT COUNT(consumer_email) as cnt
FROM consumer
WHERE consumer_name='�ڱټ�' AND consumer_email ='parkgeunseo@naver.com';



SELECT consumer_id
FROM consumer
where consumer_email = 'parkgeunseo@naver.com';

select consumer_id
from consumer
where consumer_age <= 26


select consumer_age
from consumer
group by consumer_age = 9;


SELECT consumer_no, consumer_name, consumer_id, consumer_passwd, consumer_nickname, consumer_email,
                                  consumer_age, consumer_phone_num, consumer_pay_num, consumer_key,consumer_pay_num,consumer_sex,consumer_game_tend,grade_no
FROM consumer
ORDER BY consumer_no ASC;


 SELECT (
   CASE
     WHEN consumer_age <= 9
        THEN '10������'
     WHEN consumer_age > 9 AND consumer_age <= 19
        THEN '10��'
     WHEN consumer_age > 19 AND consumer_age <= 29
        THEN '20��'
     WHEN consumer_age > 29 AND consumer_age <= 29
        THEN '30��'
     WHEN consumer_age > 39 AND consumer_age <= 49
        THEN '40��'
     WHEN consumer_age > 49
        THEN '50���̻�'
     ELSE '������'
   END) age_group,
   COUNT(*) as age_cnt
 FROM consumer
 GROUP BY (
   CASE
     WHEN consumer_age <= 9
        THEN '10������'
     WHEN consumer_age > 9 AND consumer_age <= 19
        THEN '10��'
     WHEN consumer_age > 19 AND consumer_age <= 29
        THEN '20��'
     WHEN consumer_age > 29 AND consumer_age <= 29
        THEN '30��'
     WHEN consumer_age > 39 AND consumer_age <= 49
        THEN '40��'
     WHEN consumer_age > 49
        THEN '50���̻�'
     ELSE '������'
   END)
   order by age_group;
--AGE_G   COUNT(*)
------- ----------
--������          3
--40��           3
--20��           7
--10������      1
--10��           6
--50���̻�      3


--   <option value="MMORPG">MMORPG</option>
--                    <option value="FPS">FPS</option>
--                    <option value="��庥ó">��庥ó</option>
--                    <option value="�����̵�">�����̵�</option>
--                    <option value="������">������</option>
--                    <option value="���÷���">���÷���</option>
--                    <option value="�ùķ��̼�">�ùķ��̼�</option>
--                    <option value="����">����</option>
--                    <option value="�׼�">�׼�</option>
 SELECT (
   CASE
     WHEN consumer_game_tend = 'MMORPG'
        THEN 'MMORPG'
     WHEN consumer_game_tend = 'FPS' 
        THEN 'FPS'
     WHEN consumer_game_tend = '��庥ó'
        THEN '��庥ó'
     WHEN consumer_game_tend = '�����̵�' 
        THEN '�����̵�'
     WHEN consumer_game_tend = '������' 
        THEN '������'
     WHEN consumer_game_tend = '���÷���'
        THEN '���÷���'
     WHEN consumer_game_tend = '�ùķ��̼�'
        THEN '�ùķ��̼�'
     WHEN consumer_game_tend = '����'
        THEN '����'
     WHEN consumer_game_tend = '�׼�'
        THEN '�׼�'
     ELSE '������'
   END) game_tend_group,
   COUNT(*) as game_tend_cnt
 FROM consumer
 GROUP BY (
   CASE
     WHEN consumer_game_tend = 'MMORPG'
        THEN 'MMORPG'
     WHEN consumer_game_tend = 'FPS' 
        THEN 'FPS'
     WHEN consumer_game_tend = '��庥ó'
        THEN '��庥ó'
     WHEN consumer_game_tend = '�����̵�' 
        THEN '�����̵�'
     WHEN consumer_game_tend = '������' 
        THEN '������'
     WHEN consumer_game_tend = '���÷���'
        THEN '���÷���'
     WHEN consumer_game_tend = '�ùķ��̼�'
        THEN '�ùķ��̼�'
     WHEN consumer_game_tend = '����'
        THEN '����'
     WHEN consumer_game_tend = '�׼�'
        THEN '�׼�'
     ELSE '������'
   END)
   order by game_tend_group;
   
--GAME_T GAME_TEND_CNT
-------- -------------
--FPS                3
--MMORPG             1
--������             1
--���÷���             1
--������             3
--�ùķ��̼�             4
--�����̵�             3
--�׼�               3
--��庥ó             1
--����               3

SELECT consumer_no, consumer_name, consumer_id, consumer_phone_num, grade_no,grade_name, r
FROM(
         SELECT consumer_no, consumer_name, consumer_id, consumer_phone_num, grade_no,grade_name, rownum as r
         FROM (
                          SELECT c.consumer_no, c.consumer_name, c.consumer_id, c.consumer_phone_num, c.grade_no,
                                    g.grade_name
                          FROM consumer c , grade g
                          where c.grade_no = g.grade_no and consumer_key ='Y'
                   ORDER BY grade_no desc, consumer_key desc
         )
)
WHERE r>=1 AND r <=3;
 
SELECT COUNT(*) as cnt
FROM consumer;

SELECT * FROM    ALL_CONSTRAINTS order by constraint_name desc;



