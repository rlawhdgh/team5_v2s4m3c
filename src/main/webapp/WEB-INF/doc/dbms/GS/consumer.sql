/**********************************/
/* Table Name: 회원 */
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

COMMENT ON TABLE consumer is '회원';
COMMENT ON COLUMN consumer.consumer_no is '회원번호';
COMMENT ON COLUMN consumer.consumer_name is '회원 이름';
COMMENT ON COLUMN consumer.consumer_id is '회원 아이디';
COMMENT ON COLUMN consumer.consumer_passwd is '회원 비밀번호';
COMMENT ON COLUMN consumer.consumer_nickname is '회원 별칭';
COMMENT ON COLUMN consumer.consumer_email is '회원 이메일';
COMMENT ON COLUMN consumer.consumer_age is '회원 나이';
COMMENT ON COLUMN consumer.consumer_phone_num is '회원 전화번호';
COMMENT ON COLUMN consumer.consumer_sex is '회원 성별';
COMMENT ON COLUMN consumer.consumer_pay_num is '회원 계좌번호';
COMMENT ON COLUMN consumer.consumer_game_tend is '회원 게임성향';
COMMENT ON COLUMN consumer.consumer_point is '회원 포인트';
COMMENT ON COLUMN consumer.consumer_key is '회원 인증키';
COMMENT ON COLUMN consumer.grade_no is '회원등급번호';

DROP SEQUENCE consumer_seq;
CREATE SEQUENCE consumer_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
  
  CREATE SEQUENCE login_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;    
  
  ----------------DML-------------------

1) 등록(FPS)
INSERT INTO consumer(consumer_no, consumer_name, consumer_id, consumer_passwd, consumer_nickname, consumer_email,
                                  consumer_age, consumer_phone_num, consumer_pay_num, consumer_game_tend, consumer_key,grade_no,consumer_sex)
VALUES(consumer_seq.nextval, '박근서', 'user1', '1234', '별명', 'parkgeunseo2@naver.com', '11', '010-1234-1234', '123-456-789', 'FPS','AJE!125fD',0 ,'M');
INSERT INTO consumer(consumer_no, consumer_name, consumer_id, consumer_passwd, consumer_nickname, consumer_email,
                                  consumer_age, consumer_phone_num, consumer_pay_num, consumer_game_tend, consumer_key,grade_no,consumer_sex)
VALUES(consumer_seq.nextval, '박근서', 'parkgeunse19', '1234', '별명', 'parkgeunseo2@naver.com', '52', '010-1234-1234', '123-456-789', '시뮬레이션','AJE!125fD',0,'F' );
INSERT INTO consumer(consumer_no, consumer_name, consumer_id, consumer_passwd, consumer_nickname, consumer_email,
                                  consumer_age, consumer_phone_num, consumer_pay_num, consumer_game_tend, consumer_key,grade_no)
VALUES(consumer_seq.nextval, '박근서', 'parkgeunse12', '1234', '별명', 'parkgeunseo2@naver.com', '42', '010-1234-1234', '123-456-789', '스포츠','AJE!125fD',0 );
INSERT INTO consumer(consumer_no, consumer_name, consumer_id, consumer_passwd, consumer_nickname, consumer_email,
                                  consumer_age, consumer_phone_num, consumer_pay_num, consumer_game_tend, consumer_key,grade_no,consumer_sex)
VALUES(consumer_seq.nextval, '박근서', 'parkgeunse13', '1234', '별명', 'parkgeunseo2@naver.com', '22', '010-1234-1234', '123-456-789', '아케이드','AJE!125fD',0,'M' );
INSERT INTO consumer(consumer_no, consumer_name, consumer_id, consumer_passwd, consumer_nickname, consumer_email,
                                  consumer_age, consumer_phone_num, consumer_pay_num, consumer_game_tend, consumer_key,grade_no)
VALUES(consumer_seq.nextval, '박근서', 'parkgeunse14', '1234', '별명', 'parkgeunseo2@naver.com', '18', '010-1234-1234', '123-456-789', '퍼즐','AJE!125fD',0 );
INSERT INTO consumer(consumer_no, consumer_name, consumer_id, consumer_passwd, consumer_nickname, consumer_email,
                                  consumer_age, consumer_phone_num, consumer_pay_num, consumer_game_tend, consumer_key,grade_no)
VALUES(consumer_seq.nextval, '박근서', 'parkgeunse15', '1234', '별명', 'parkgeunseo2@naver.com', '25', '010-1234-1234', '123-456-789', '어드벤처','AJE!125fD',0 );
INSERT INTO consumer(consumer_no, consumer_name, consumer_id, consumer_passwd, consumer_nickname, consumer_email,
                                  consumer_age, consumer_phone_num, consumer_pay_num, consumer_game_tend, consumer_key,grade_no)
VALUES(consumer_seq.nextval, '박근서', 'parkgeunse20', '1234', '별명', 'parkgeunseo2@naver.com', '9', '010-1234-1234', '123-456-789', '액션','AJE!125fD',0 );
INSERT INTO consumer(consumer_no, consumer_name, consumer_id, consumer_passwd, consumer_nickname, consumer_email,
                                   consumer_phone_num, consumer_pay_num, consumer_key,grade_no)
VALUES(1, '박근서', 'user4', '1234', '별명', 'parkgeunseo2@naver.com', '010-1234-1234', '123-456-789','AJE!125fD',0 );
commit;


INSERT INTO consumer(consumer_no, consumer_name, consumer_id, consumer_passwd, consumer_nickname, consumer_email,
                                  consumer_age, consumer_phone_num, consumer_pay_num, consumer_game_tend, consumer_key,grade_no,consumer_sex)
VALUES(1, '박근서', 'user1', '1234', '별명', 'parkgeunseo2@naver.com', '11', '010-1234-1234', '123-456-789', 'FPS','AJE!125fD',0 ,'M');

2) 목록
SELECT consumer_no, consumer_name, consumer_id, consumer_passwd, consumer_nickname, consumer_email,
                                  consumer_age, consumer_phone_num, consumer_pay_num, consumer_key,consumer_pay_num,consumer_sex,consumer_game_tend,grade_no
FROM consumer
ORDER BY consumer_no ASC;

3) 조회
SELECT consumer_no, consumer_name, consumer_id, consumer_passwd, consumer_nickname, consumer_email,
                                  consumer_age, consumer_phone_num, consumer_pay_num, consumer_game_tend,grade_no
FROM consumer
where consumer_no = 1 

4) 수정
UPDATE consumer
SET  consumer_no = 1,consumer_name='UG관리자', consumer_id ='UG관리자' , consumer_passwd='1234',consumer_nickname ='UG관리자'
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
SET  consumer_game_tend = '액션'
WHERE consumer_no = 48;

5) 삭제
DELETE FROM consumer
WHERE  consumer_no = 77;

  ----------------DDL-------------------
1). 회원 속성 추가
ALTER TABLE consumer
ADD (test VARCHAR(9));
       
2). 회원 속성 수정
ALTER TABLE consumer
MODIFY (consumer_age NUMBER(3));

3). 회원 속성명 수정
ALTER TABLE consumer
RENAME COLUMN test to test2;

4). 회원 속성 삭제
ALTER TABLE consumer
DROP COLUMN test2;

--------------TCL---------------
commit;

 update consumer 
 set consumer_key ='asggwFASGA12QGWIVN'
 where consumer_id = 'parkgeunseo'



----------프로필 정보 수정 ( 이미지 , 별명 )-------------
UPDATE consumer
SET consumer_nickname = '별명12345',consumer_img= 'image12'
WHERE consumer_no = 12;



-------------join(회원 목록에서 회원 등급명도 조회)----------------
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
WHERE consumer_id='왕눈이123'

update consumer 
set consumer_passwd = '1234'
where consumer_no = 4

SELECT COUNT(consumer_name) as cnt
FROM consumer
WHERE consumer_name='박근서'

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
WHERE consumer_name='박근서' AND consumer_email ='parkgeunseo@naver.com';



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
        THEN '10대이하'
     WHEN consumer_age > 9 AND consumer_age <= 19
        THEN '10대'
     WHEN consumer_age > 19 AND consumer_age <= 29
        THEN '20대'
     WHEN consumer_age > 29 AND consumer_age <= 29
        THEN '30대'
     WHEN consumer_age > 39 AND consumer_age <= 49
        THEN '40대'
     WHEN consumer_age > 49
        THEN '50대이상'
     ELSE '나머지'
   END) age_group,
   COUNT(*) as age_cnt
 FROM consumer
 GROUP BY (
   CASE
     WHEN consumer_age <= 9
        THEN '10대이하'
     WHEN consumer_age > 9 AND consumer_age <= 19
        THEN '10대'
     WHEN consumer_age > 19 AND consumer_age <= 29
        THEN '20대'
     WHEN consumer_age > 29 AND consumer_age <= 29
        THEN '30대'
     WHEN consumer_age > 39 AND consumer_age <= 49
        THEN '40대'
     WHEN consumer_age > 49
        THEN '50대이상'
     ELSE '나머지'
   END)
   order by age_group;
--AGE_G   COUNT(*)
------- ----------
--나머지          3
--40대           3
--20대           7
--10대이하      1
--10대           6
--50대이상      3


--   <option value="MMORPG">MMORPG</option>
--                    <option value="FPS">FPS</option>
--                    <option value="어드벤처">어드벤처</option>
--                    <option value="아케이드">아케이드</option>
--                    <option value="스포츠">스포츠</option>
--                    <option value="롤플레잉">롤플레잉</option>
--                    <option value="시뮬레이션">시뮬레이션</option>
--                    <option value="퍼즐">퍼즐</option>
--                    <option value="액션">액션</option>
 SELECT (
   CASE
     WHEN consumer_game_tend = 'MMORPG'
        THEN 'MMORPG'
     WHEN consumer_game_tend = 'FPS' 
        THEN 'FPS'
     WHEN consumer_game_tend = '어드벤처'
        THEN '어드벤처'
     WHEN consumer_game_tend = '아케이드' 
        THEN '아케이드'
     WHEN consumer_game_tend = '스포츠' 
        THEN '스포츠'
     WHEN consumer_game_tend = '롤플레잉'
        THEN '롤플레잉'
     WHEN consumer_game_tend = '시뮬레이션'
        THEN '시뮬레이션'
     WHEN consumer_game_tend = '퍼즐'
        THEN '퍼즐'
     WHEN consumer_game_tend = '액션'
        THEN '액션'
     ELSE '나머지'
   END) game_tend_group,
   COUNT(*) as game_tend_cnt
 FROM consumer
 GROUP BY (
   CASE
     WHEN consumer_game_tend = 'MMORPG'
        THEN 'MMORPG'
     WHEN consumer_game_tend = 'FPS' 
        THEN 'FPS'
     WHEN consumer_game_tend = '어드벤처'
        THEN '어드벤처'
     WHEN consumer_game_tend = '아케이드' 
        THEN '아케이드'
     WHEN consumer_game_tend = '스포츠' 
        THEN '스포츠'
     WHEN consumer_game_tend = '롤플레잉'
        THEN '롤플레잉'
     WHEN consumer_game_tend = '시뮬레이션'
        THEN '시뮬레이션'
     WHEN consumer_game_tend = '퍼즐'
        THEN '퍼즐'
     WHEN consumer_game_tend = '액션'
        THEN '액션'
     ELSE '나머지'
   END)
   order by game_tend_group;
   
--GAME_T GAME_TEND_CNT
-------- -------------
--FPS                3
--MMORPG             1
--나머지             1
--롤플레잉             1
--스포츠             3
--시뮬레이션             4
--아케이드             3
--액션               3
--어드벤처             1
--퍼즐               3

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



