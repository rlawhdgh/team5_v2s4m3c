/**********************************/
/* Table Name: 관리자 */
/**********************************/
drop table admin;
DROP TABLE admin CASCADE CONSTRAINTS; 
CREATE TABLE admin(
    admin_no                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    consumer_no                     NUMBER(10)	    NOT NULL ,
    
    FOREIGN KEY (consumer_no) REFERENCES consumer (consumer_no)
);

DROP SEQUENCE admin_seq;
CREATE SEQUENCE admin_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

COMMENT ON TABLE admin is '관리자';
COMMENT ON COLUMN admin.admin_no is '관리자 번호';
COMMENT ON COLUMN admin.consumer_no is '회원 번호';


INSERT INTO admin(admin_no, consumer_no)
 VALUES (admin_seq.nextval, 4);
 
INSERT INTO admin(admin_no, admin_id, admin_passwd)
 VALUES (admin_seq.nextval, '운영자1',1234);
 
 SELECT * FROM admin
 
    SELECT COUNT(admin_no) as cnt
    FROM admin
    WHERE admin_id = '운영자' and admin_passwd= 1234
 
 
                   


/**********************************/
/* Table Name: 공지사항 */
/**********************************/
drop table openspace;
DROP TABLE openspace CASCADE CONSTRAINTS; 
CREATE TABLE openspace(
openspace_no                   NUMBER(10)     NOT NULL  PRIMARY KEY,
consumer_no                       NUMBER(10)  NOT NULL,
openspace_title                VARCHAR2(100) NOT NULL,
openspace_content                CLOB                NOT NULL,
openspace_division             VARCHAR2(50)     NOT NULL,
openspace_cnt                  NUMBER(8)         DEFAULT 0  NOT NULL,
openspace_seqno                NUMBER(8)         DEFAULT 1  NOT NULL,
openspace_visible              CHAR(1)             DEFAULT 'Y'  NOT NULL,
openspace_youtube            VARCHAR2(500),
openspace_rdate                DATE                 NOT NULL,
openspace_redate               DATE                 NULL, 

FOREIGN KEY (consumer_no) REFERENCES consumer (consumer_no)
);

COMMENT ON TABLE openspace is '공지사항';
COMMENT ON COLUMN openspace.openspace_no is '공지사항 번호';
COMMENT ON COLUMN openspace.consumer_no is '회원 번호';
COMMENT ON COLUMN openspace.openspace_title is '공지사항 제목';
COMMENT ON COLUMN openspace.openspace_content is '공지사항 내용';
COMMENT ON COLUMN openspace.openspace_division is '구분';
COMMENT ON COLUMN openspace.openspace_cnt is '조회수';
COMMENT ON COLUMN openspace.openspace_seqno is '출력 순서';
COMMENT ON COLUMN openspace.openspace_visible is '출력 모드';
COMMENT ON COLUMN openspace.openspace_rdate is '등록일';
COMMENT ON COLUMN openspace.openspace_redate is '수정일';


DROP SEQUENCE openspace_seq;
CREATE SEQUENCE openspace_seq
    START WITH 1        -- 시작 번호
    INCREMENT BY 1    -- 증가값
    MAXVALUE 9999999999 -- 최댓값:9999999999 --> NUMVER(10) 같음
    CACHE 2                -- 2번은 메모리에서만 계산 (저장안함)
    NOCYCLE;     
    
-- 1)등록
INSERT INTO openspace(openspace_no, admin_no,
                   openspace_title, openspace_content, openspace_division, openspace_cnt, openspace_seqno,
                   openspace_visible, openspace_rdate, openspace_redate)
VALUES (openspace_seq.nextval, 1, '제목', '내용', '구분', 0, 1,
                   'Y', sysdate, sysdate);
                   
INSERT INTO openspace(openspace_no, admin_no,
                   openspace_title, openspace_content, openspace_division, openspace_cnt, openspace_seqno,
                   openspace_visible, openspace_rdate, openspace_redate)
VALUES (openspace_seq.nextval, 1, '제목', '내용', '구분', 0, (SELECT NVL(MAX(openspace_seqno), 0) + 1 as openspace_seqno FROM openspace),
                   'Y', sysdate, sysdate);
                   
INSERT INTO consumer(consumer_no, consumer_name, consumer_id, consumer_passwd, consumer_nickname, consumer_email,
                                  consumer_age, consumer_phone_num, consumer_pay_num, consumer_game_tend, consumer_key,grade_no,consumer_sex)
VALUES(consumer_seq.nextval, '박근서', 'parkgeunse19', '1234', '별명', 'parkgeunseo2@naver.com', '52', '010-1234-1234', '123-456-789', '시뮬레이션','AJE!125fD',0,'F' );
                   
                   

                   
-- 2)목록                   
SELECT openspace_no, consumer_no,
                   openspace_title, openspace_content, openspace_division, openspace_cnt, openspace_seqno,
                   openspace_visible, openspace_rdate, openspace_redate , openspace_youtube
FROM openspace
ORDER BY openspace_seqno ASC;


    SELECT openspace_no, admin_no,
                       openspace_title, openspace_content, openspace_division, openspace_cnt, openspace_seqno,
                       openspace_visible, openspace_rdate, openspace_redate 
    FROM openspace
    WHERE openspace_title like '%안녕%' or openspace_content like '%안녕%'
    



                   
-- 3)조회 
SELECT openspace_no, admin_no,
                   openspace_title, openspace_content, openspace_division, openspace_cnt, openspace_seqno,
                   openspace_visible, openspace_rdate, openspace_redate 
FROM openspace
where openspace_no =1;

-- 4)수정
UPDATE openspace
set openspace_title = '제목인가요?', openspace_redate=sysdate
where openspace_no =4;

-- 4-1) 조회수 증가
UPDATE openspace
set openspace_cnt = openspace_cnt+1
where openspace_no =4;

-- 5)삭제
DELETE FROM openspace
WHERE openspace_no = 24;
    
    
-- 6) 이전글 다음글 제목 프라이머리키 조회
SELECT * FROM
 (
    SELECT openspace_seqno, openspace_title,
    lead(openspace_no, 1) over (order by openspace_seqno) next_no,
    lead(openspace_title, 1) over (order by openspace_seqno) next_title,
    lag(openspace_no,1) over(order by openspace_seqno)pre_no,
    lag(openspace_title,1) over(order by openspace_seqno)pre_title
    from openspace
    )
WHERE openspace_seqno='6';


openspace_division
SELECT * FROM
 (
    SELECT openspace_seqno, openspace_title,
    lead(openspace_division, 1) over (order by openspace_seqno) next_seqno,
    lead(openspace_no, 1) over (order by openspace_seqno) next_no,
    lead(openspace_title, 1) over (order by openspace_seqno) next_title,
    lag(openspace_division,1) over(order by openspace_seqno)pre_seqno,
    lag(openspace_no,1) over(order by openspace_seqno)pre_no,
    lag(openspace_title,1) over(order by openspace_seqno)pre_title
    from openspace
    )
WHERE openspace_seqno='6';




SELECT * FROM
 (
    SELECT openspace_seqno, openspace_title,
    lead(openspace_no, 1) over (order by openspace_seqno) next_no,
    lead(openspace_seqno, 1) over (order by openspace_seqno) next_seqno,
    lag(openspace_no,1) over(order by openspace_seqno)pre_no,
    lag(openspace_seqno,1) over(order by openspace_seqno)pre_seqno
    from openspace
    )
WHERE openspace_seqno='6';


-- 출력 순서 상향, 10 ▷ 1
UPDATE openspace
SET openspace_seqno = openspace_seqno - 1
WHERE openspace_no=1;
UPDATE categrp
SET seqno = seqno - 1
WHERE categrpno=1;
 



-- 페이징 
-- step 3 rownum을 밖으로 전달 r:1~10 1페이지
SELECT  openspace_no, admin_no,
                   openspace_title, openspace_content, openspace_division, openspace_cnt, openspace_seqno,
                   openspace_visible, openspace_rdate, openspace_redate, r
FROM (
           SELECT  openspace_no, admin_no,
                   openspace_title, openspace_content, openspace_division, openspace_cnt, openspace_seqno,
                   openspace_visible, openspace_rdate, openspace_redate , rownum as r
           FROM (
                     SELECT  openspace_no, admin_no,
                   openspace_title, openspace_content, openspace_division, openspace_cnt, openspace_seqno,
                   openspace_visible, openspace_rdate, openspace_redate 
                     FROM openspace
                     WHERE openspace_title LIKE '%%' and openspace_visible ='Y'  
                     
                     ORDER BY openspace_seqno DESC
           )          
)
WHERE r >=1 AND r <= 10; 


SELECT  openspace_no, admin_no,
                   openspace_title, openspace_content, openspace_division, openspace_cnt, openspace_seqno,
                   openspace_visible, openspace_rdate, openspace_redate, admin_id, r
FROM (
           SELECT  openspace_no, admin_no,
                   openspace_title, openspace_content, openspace_division, openspace_cnt, openspace_seqno,
                   openspace_visible, openspace_rdate, openspace_redate , admin_id, rownum as r
           FROM (
                     SELECT  o.openspace_no, o.admin_no,
                   o.openspace_title, o.openspace_content, o.openspace_division, o.openspace_cnt, o.openspace_seqno,
                   o.openspace_visible, o.openspace_rdate, o.openspace_redate, a.admin_id
                     FROM openspace o, admin a
                     WHERE o.admin_no=a.admin_no and o.openspace_title LIKE '%%' and o.openspace_visible ='Y'                       
                     ORDER BY o.openspace_seqno DESC
           )          
)
WHERE r >=1 AND r <= 10; 

SELECT  openspace_no, admin_no,
                   openspace_title, openspace_content, openspace_division, openspace_cnt, openspace_seqno,
                   openspace_visible, openspace_rdate, openspace_redate, admin_id, r
FROM (
           SELECT  openspace_no, admin_no,
                   openspace_title, openspace_content, openspace_division, openspace_cnt, openspace_seqno,
                   openspace_visible, openspace_rdate, openspace_redate , admin_id, rownum as r
           FROM (
                          SELECT o.openspace_no, o.consumer_no,
                   o.openspace_title, o.openspace_content, o.openspace_division, o.openspace_cnt, o.openspace_seqno,
                   o.openspace_visible, o.openspace_rdate, o.openspace_redate, c.consumer_nickname
                          FROM openspace o, consumer c
                     WHERE o.consumer_no=c.consumer_no                     
                     ORDER BY o.openspace_seqno DESC
           )          
)
WHERE r >=1 AND r <= 10; 
 
 


/**********************************/
/* Table Name: 질문 구분 그룹 */
/**********************************/
CREATE TABLE questiongrp(
		questiongrp_no                		    NUMBER(10)		 NOT NULL		 PRIMARY KEY,
        admin_no                                NUMBER(10)         NOT NULL,       
		questiongrp_name              		VARCHAR2(50)		 NOT NULL,
		questiongrp_seqno             		NUMBER(7)		     DEFAULT 0		 NOT NULL,
        
         FOREIGN KEY (admin_no) REFERENCES admin (admin_no)
);

COMMENT ON TABLE questiongrp is '질문 구분 그룹';
COMMENT ON COLUMN questiongrp.questiongrp_no is '카테고리 그룹 번호';
COMMENT ON COLUMN questiongrp.questiongrp_name is '이름';
COMMENT ON COLUMN questiongrp.questiongrp_seqno is '출력 순서';

CREATE SEQUENCE questiongrp_seq
    START WITH 1        -- 시작 번호
    INCREMENT BY 1    -- 증가값
    MAXVALUE 9999999999 -- 최댓값:9999999999 --> NUMVER(10) 같음
    CACHE 2                -- 2번은 메모리에서만 계산 (저장안함)
    NOCYCLE;     

INSERT INTO questiongrp(questiongrp_no, admin_no, questiongrp_name, questiongrp_seqno)
 VALUES (questiongrp_seq.nextval,1, '안뇽',1);
 
SELECT *
FROM questiongrp
-- 4) 수정
UPDATE questiongrp
set questiongrp_name = '제목인가요?', questiongrp_seqno = 4
where questiongrp_no =3;
 
 -- 5)삭제
DELETE FROM questiongrp


    SELECT question_no, questiongrp_no,
                       question_title, question_content, question_division, question_seqno, question_url, question_date
    FROM question 
    WHERE questiongrp_no=1


/**********************************/
/* Table Name: 자주묻는질문 */
/**********************************/
DROP TABLE question;
CREATE TABLE question(
		question_no                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
        questiongrp_no                		    NUMBER(10)		 NOT NULL,      
		question_title                		VARCHAR2(100)		 NOT NULL,
		question_content              		CLOB		 NOT NULL,
		question_seqno                		NUMBER(3)		 NOT NULL,
        question_url                        VARCHAR2(500),
		question_date                 		DATE		 NOT NULL,
        
    FOREIGN KEY (questiongrp_no) REFERENCES questiongrp (questiongrp_no)
);

COMMENT ON TABLE question is '자주묻는질문';
COMMENT ON COLUMN question.question_no is '질문 번호';
COMMENT ON COLUMN question.questiongrp_no is '카테고리 그룹 번호';
COMMENT ON COLUMN question.question_title is '질문 제목';
COMMENT ON COLUMN question.question_content is '질문 내용';
COMMENT ON COLUMN question.question_seqno is '출력 순서';
COMMENT ON COLUMN question.question_url is 'Url';
COMMENT ON COLUMN question.question_date is '등록일';




DROP SEQUENCE question_seq;
CREATE SEQUENCE question_seq
    START WITH 1        -- 시작 번호
    INCREMENT BY 1    -- 증가값
    MAXVALUE 9999999999 -- 최댓값:9999999999 --> NUMVER(10) 같음
    CACHE 2                -- 2번은 메모리에서만 계산 (저장안함)
    NOCYCLE;     


-- 1등록
INSERT INTO question(question_no, questiongrp_no,
                   question_title, question_content, question_division, question_seqno, question_url, question_date)
VALUES (question_seq.nextval, 2, '제목', '내용', '구분', (SELECT NVL(MAX(question_seqno), 0) + 1 as question_seqno FROM question), 'url', sysdate);


-- 2목록
SELECT question_no, questiongrp_no,
                   question_title, question_content, question_seqno, question_url, question_date
FROM question
ORDER BY question_seqno DESC;


SELECT g.questiongrp_name,
                q.question_no, q.questiongrp_no,
                   q.question_title, q.question_content, q.question_seqno, q.question_url, q.question_date
FROM question q, questiongrp g
where q.questiongrp_no= g.questiongrp_no and q.questiongrp_no=1
ORDER BY q.question_seqno DESC;


SELECT question_no, questiongrp_no,
                   question_title, question_content, question_division, question_seqno, question_url, question_date
FROM question WHERE question_division='웹사이트 및 계정'
ORDER BY question_seqno DESC;


SELECT question_no, questiongrp_no,
                   question_title, question_content, question_division, question_seqno, question_url, question_date
FROM question WHERE questiongrp_no=1
ORDER BY question_seqno DESC;


-- 4)조회
SELECT question_no, questiongrp_no,
                   question_title, question_content, question_division, question_seqno, question_url, question_date
FROM question
where question_no =;



-- 4)수정
UPDATE question
set question_title = '제목인가요?'
where question_no =35;



-- 5)삭제
DELETE FROM question
WHERE question_no = 24;

/**********************************/
/* Table Name: 문의하기 */
/**********************************/
CREATE TABLE contact(
		contact_no                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		contact_title                 		VARCHAR2(100)		 NOT NULL,
		contact_content               		CLOB(10)		 NOT NULL,
		contact_seqno                 		NUMBER(3)		 NOT NULL,
		contact_date                  		DATE		 NOT NULL,
		contact_ip                    		VARCHAR2(50)		 NOT NULL,
		contact_division              		VARCHAR2(50)		 NOT NULL,
		contact_date                  		DATE		 NOT NULL
);

COMMENT ON TABLE contact is '문의하기';
COMMENT ON COLUMN contact.contact_no is '문의 번호';
COMMENT ON COLUMN contact.contact_title is '문의 제목';
COMMENT ON COLUMN contact.contact_content is '문의 내용';
COMMENT ON COLUMN contact.contact_seqno is '출력 순서';
COMMENT ON COLUMN contact.contact_date is '등록일';
COMMENT ON COLUMN contact.contact_ip is 'IP';
COMMENT ON COLUMN contact.contact_division is '구분';
COMMENT ON COLUMN contact.contact_date is '등록일';


/**********************************/
/* Table Name: 문의 이미지 */
/**********************************/
CREATE TABLE contact_img(
		contact_img_no                		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		contact_no                    		NUMBER(10)		 NULL ,
		contact_img_fname             		VARCHAR2(100)		 NOT NULL,
		contact_img_fupname           		VARCHAR2(100)		 NOT NULL,
		contact_img_thumb             		VARCHAR2(100)		 NOT NULL,
		contact_img_fsize             		NUMBER(10)		 NOT NULL,
		contact_img_rdate             		DATE		 NOT NULL,
  FOREIGN KEY (contact_no) REFERENCES contact (contact_no)
);

COMMENT ON TABLE contact_img is '문의 이미지';
COMMENT ON COLUMN contact_img.contact_img_no is '문의 첨부파일번호';
COMMENT ON COLUMN contact_img.contact_no is '문의 번호';
COMMENT ON COLUMN contact_img.contact_img_fname is '원본 파일명';
COMMENT ON COLUMN contact_img.contact_img_fupname is '업로드 파일명';
COMMENT ON COLUMN contact_img.contact_img_thumb is 'thumb 파일';
COMMENT ON COLUMN contact_img.contact_img_fsize is '파일 사이즈';
COMMENT ON COLUMN contact_img.contact_img_rdate is '등록일';


/**********************************/
/* Table Name: 답변 */
/**********************************/
CREATE TABLE reply(
		reply_no                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		contact_no                    		NUMBER(10)		 NULL ,
		reply_title                   		VARCHAR2(100)		 NOT NULL,
		reply_content                 		CLOB(10)		 NOT NULL,
		reply_url                     		VARCHAR2(300)		 NULL ,
		reply                         		DATE		 NOT NULL,
  FOREIGN KEY (contact_no) REFERENCES contact (contact_no)
);

COMMENT ON TABLE reply is '답변';
COMMENT ON COLUMN reply.reply_no is '답변 번호';
COMMENT ON COLUMN reply.contact_no is '문의 번호';
COMMENT ON COLUMN reply.reply_title is '답변 제목';
COMMENT ON COLUMN reply.reply_content is '답변 내용';
COMMENT ON COLUMN reply.reply_url is 'url 주소';
COMMENT ON COLUMN reply.reply is '등록일';


/**********************************/
/* Table Name: 공지사항 첨부파일 */
/**********************************/
CREATE TABLE notice_file(
		notice_file                   		NUMBER(8)		 NOT NULL		 PRIMARY KEY,
		openspace_no                  		NUMBER(10)		 NULL ,
  FOREIGN KEY (openspace_no) REFERENCES openspace (openspace_no)
);

COMMENT ON TABLE notice_file is '공지사항 첨부파일';
COMMENT ON COLUMN notice_file.notice_file is '공지사항 파일번호';
COMMENT ON COLUMN notice_file.openspace_no is '공지사항 번호';


/**********************************/
/* Table Name: 공지사항 이미지 */
/**********************************/
drop table openspace_img
CREATE TABLE openspace_img(
		openspace_img_no                 		NUMBER(8)		 NOT NULL		 PRIMARY KEY,
		openspace_no                  		NUMBER(10)		 NOT NULL ,
		openspace_img_fname              		VARCHAR2(1000)		 NOT NULL,
		openspace_img_fupname            		VARCHAR2(1000)		 NOT NULL,
		openspace_img_thumb              		VARCHAR2(1000)		 NOT NULL,
		openspace_img_fsize              		NUMBER(10)		 NOT NULL,
		openspace_img_rdate              		DATE		 NOT NULL,
  FOREIGN KEY (openspace_no) REFERENCES openspace (openspace_no)
);

COMMENT ON TABLE openspace_img is '공지사항 이미지';
COMMENT ON COLUMN openspace_img.openspace_img_no is '공지사항 이미지번호';
COMMENT ON COLUMN openspace_img.openspace_no is '공지사항 번호';
COMMENT ON COLUMN openspace_img.openspace_img_fname is '원본 파일명';
COMMENT ON COLUMN openspace_img.openspace_img_fupname is '업로드 파일명';
COMMENT ON COLUMN openspace_img.openspace_img_thumb is 'thumb 파일';
COMMENT ON COLUMN openspace_img.openspace_img_fsize is '파일 사이즈';
COMMENT ON COLUMN openspace_img.openspace_img_rdate is '등록일';


INSERT INTO openspace_img(openspace_img_no, openspace_no, openspace_img_fname, openspace_img_fupname, openspace_img_thumb, openspace_img_fsize, openspace_img_rdate)
VALUES((SELECT NVL(MAX(openspace_img_no), 0) + 1 as openspace_img_no FROM openspace_img),
             24, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000, sysdate);


SELECT * FROM openspace_img
WHERE openspace_no = 24

-- 삭제

DELETE FROM openspace_img
WHERE openspace_no = 17

/**********************************/
/* Table Name: 답변 이미지 */
/**********************************/
CREATE TABLE reply_img(
		reply_img_no                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		reply_no                      		NUMBER(10)		 NULL ,
		reply_img_no                  		NUMBER(10)		 NOT NULL,
		reply_img_fname               		VARCHAR2(100)		 NOT NULL,
		reply_img_fupname             		VARCHAR2(100)		 NOT NULL,
		reply_img_thumb               		VARCHAR2(100)		 NOT NULL,
		reply_img_fsize               		NUMBER(10)		 NOT NULL,
		reply_img_rdate               		DATE		 NOT NULL,
  FOREIGN KEY (reply_no) REFERENCES reply (reply_no)
);

COMMENT ON TABLE reply_img is '답변 이미지';
COMMENT ON COLUMN reply_img.reply_img_no is '문의 첨부파일번호';
COMMENT ON COLUMN reply_img.reply_no is '답변 번호';
COMMENT ON COLUMN reply_img.reply_img_no is '문의 번호';
COMMENT ON COLUMN reply_img.reply_img_fname is '원본 파일명';
COMMENT ON COLUMN reply_img.reply_img_fupname is '업로드 파일명';
COMMENT ON COLUMN reply_img.reply_img_thumb is 'thumb 파일';
COMMENT ON COLUMN reply_img.reply_img_fsize is '파일 사이즈';
COMMENT ON COLUMN reply_img.reply_img_rdate is '등록일';



/**********************************/
/* Table Name: 메인 이미지 */
/**********************************/
drop table index_img
CREATE TABLE index_img(
		index_img_no                  		NUMBER(8)		 NOT NULL		 PRIMARY KEY,
		index_img_fname               		VARCHAR2(100)		 NOT NULL,
		index_img_fupname             		VARCHAR2(100)		 NOT NULL,
		index_img_fsize               		NUMBER(10)		 NOT NULL,
		index_img_url                 		VARCHAR2(500),
		index_img_division            		VARCHAR2(100)		,
		index_img_rdate               		DATE		 NOT NULL
);

COMMENT ON TABLE index_img is '메인 이미지';
COMMENT ON COLUMN index_img.index_img_no is '메인 이미지번호';
COMMENT ON COLUMN index_img.index_img_fname is '원본 파일명';
COMMENT ON COLUMN index_img.index_img_fupname is '업로드 파일명';
COMMENT ON COLUMN index_img.index_img_fsize is '파일 사이즈';
COMMENT ON COLUMN index_img.index_img_url is 'Url';
COMMENT ON COLUMN index_img.index_img_division is '구분';
COMMENT ON COLUMN index_img.index_img_rdate is '등록일';

-- 1 등록
INSERT INTO index_img(index_img_no, index_img_fname, index_img_fupname, index_img_fsize, index_img_url, index_img_division, index_img_rdate)
VALUES((SELECT NVL(MAX(index_img_no), 0) + 1 as index_img_no FROM index_img),
              'samyang.jpg', 'samyang_1.jpg', 1000, 'www', '메인', sysdate);
              
SELECT index_img_no, index_img_fname, index_img_fupname, index_img_fsize, index_img_url, index_img_division, index_img_rdate 
FROM index_img

SELECT index_img_no, index_img_fname, index_img_fupname, index_img_fsize, index_img_url, index_img_division, index_img_rdate 
FROM index_img
where index_img_division = '메인'

SELECT index_img_no, index_img_fname, index_img_fupname, index_img_fsize, index_img_url, index_img_division, index_img_rdate 
FROM index_img
where index_img_division = '이벤트'

-- 4 조회
SELECT index_img_no, index_img_fname, index_img_fupname, index_img_fsize, index_img_url, index_img_division, index_img_rdate 
FROM index_img
where index_img_no = 1


-- 수정
     UPDATE index_img
     SET index_img_url = '뭐래', index_img_division = ''
     WHERE index_img_no= 1

-- 5 삭제
DELETE FROM index_img
where index_img_no= 7



-- 페이징
SELECT  index_img_no, index_img_fname, index_img_fupname, index_img_fsize, index_img_url, index_img_division, index_img_rdate, r
FROM (
           SELECT  index_img_no, index_img_fname, index_img_fupname, index_img_fsize, index_img_url, index_img_division, index_img_rdate  , rownum as r
           FROM (
                     SELECT index_img_no, index_img_fname, index_img_fupname, index_img_fsize, index_img_url, index_img_division, index_img_rdate 
                     FROM index_img
                     where index_img_division='이벤트'
                     ORDER BY index_img_no DESC
           )          
)
WHERE r >=1 AND r <= 3; 

-- 공지사항 댓글
drop table openspace_reply
DROP TABLE openspace_reply CASCADE CONSTRAINTS; 
CREATE TABLE openspace_reply(
		openspace_reply_no            		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
        openspace_no                  		NUMBER(10)		 NULL ,
		consumer_no                   		NUMBER(10)	DEFAULT 0	 NULL ,
		openspace_reply_content       		VARCHAR2(700)		 NOT NULL,
		openspace_reply_date          		DATE		 NOT NULL,

  FOREIGN KEY (openspace_no) REFERENCES openspace (openspace_no),
  FOREIGN KEY (consumer_no) REFERENCES consumer (consumer_no)
);

COMMENT ON TABLE openspace_reply is '공지사항 댓글';
COMMENT ON COLUMN openspace_reply.openspace_reply_no is '공지사항 댓글 번호';
COMMENT ON COLUMN openspace_reply.openspace_reply_content is '공지사항 댓글 내용';
COMMENT ON COLUMN openspace_reply.openspace_reply_date is '등록일';
COMMENT ON COLUMN openspace_reply.openspace_no is '공지사항 번호';
COMMENT ON COLUMN openspace_reply.consumer_no is '회원번호';




-- 등록
INSERT INTO openspace_reply(openspace_reply_no, openspace_no, consumer_no, admin_no, openspace_reply_content, openspace_reply_date)
VALUES((SELECT NVL(MAX(openspace_reply_no), 0) + 1 as openspace_reply_no FROM openspace_reply),
             139, 1, 1, '댓글1', sysdate);
             
-- 조회
select * from openspace_reply

-- 공지사항별 댓글
SELECT openspace_reply_no, openspace_no, consumer_no, openspace_reply_content, openspace_reply_date
FROM openspace_reply
WHERE openspace_no=133
ORDER BY openspace_reply_date DESC;





SELECT  openspace_reply_no, openspace_no, consumer_no, openspace_reply_content, openspace_reply_date, consumer_nickname, r
FROM (
           SELECT openspace_reply_no, openspace_no, consumer_no, openspace_reply_content, openspace_reply_date , consumer_nickname, rownum as r
           FROM (
                    SELECT o.openspace_reply_no, o.openspace_no, o.consumer_no, o.openspace_reply_content, o.openspace_reply_date, c.consumer_nickname
                    FROM openspace_reply o, consumer c 
                    WHERE openspace_no=155 and o.consumer_no = c.consumer_no
                    ORDER BY openspace_reply_date DESC
           )          
)
WHERE r >=1 AND r <= 5; 


SELECT c.cateno as c_cateno, c.name as c_name,
           t.contentsno as t_contentsno, t.title as t_title,
           t.web as t_web, t.ip as t_ip , t.rdate as t_rdate,
           m.memberno as m_memberno, m.mname as m_mname           
FROM cate c, contents t, member m
WHERE c.cateno = t.cateno AND t.memberno = m.memberno AND m.memberno = 1
ORDER BY c.cateno ASC, t.contentsno DESC;



SELECT o.openspace_reply_no, o.openspace_no, o.consumer_no, o.openspace_reply_content, o.openspace_reply_date, c.consumer_nickname
FROM consumer c, openspace_reply o
WHERE o.consumer_no = c.consumer_no and o.openspace_no=1
ORDER BY o.openspace_reply_date DESC;


-- 수정
     UPDATE openspace_reply
     SET openspace_reply_content = '뭐래', openspace_reply_date = sysdate
     WHERE openspace_reply_no= 1
     
     
-- 삭제
DELETE FROM openspace_reply
WHERE openspace_reply_no = 1;


-- 내가 쓴 댓글
SELECT r.openspace_reply_no, r.openspace_no, r.consumer_no, r.openspace_reply_content, r.openspace_reply_date, o.openspace_title
FROM openspace_reply r, consumer c, openspace o
WHERE r.consumer_no=c.consumer_no and r.openspace_no=o.openspace_no and c.consumer_no=1
ORDER BY r.openspace_reply_date DESC;


-- 내가 쓴 공지사항    
SELECT o.openspace_no, o.consumer_no,
                   o.openspace_title, o.openspace_content, o.openspace_division, o.openspace_cnt, o.openspace_seqno,
                   o.openspace_visible, o.openspace_rdate, o.openspace_redate , o.openspace_youtube, c.consumer_nickname
FROM openspace o, consumer c
WHERE o.consumer_no = c.consumer_no and c.consumer_no=1
ORDER BY openspace_seqno DESC;
     
     
     
     
     
     
     SELECT * FROM         
        (
          SELECT openspace_seqno, openspace_title, openspace_visible,
          lead(openspace_division, 1) over (order by openspace_seqno) next_division,
          lead(openspace_no, 1) over (order by openspace_seqno) next_no,
          lead(openspace_title, 1) over (order by openspace_seqno) next_title,
          lag(openspace_division,1) over(order by openspace_seqno)pre_division,
          lag(openspace_no,1) over(order by openspace_seqno)pre_no,
          lag(openspace_title,1) over(order by openspace_seqno)pre_title
          from openspace
          where openspace_visible='Y'
          )
      WHERE openspace_seqno=15
      
      
      
SELECT MAX(openspace_seqno) as openspace_seqno
FROM openspace
WHERE openspace_seqno = 15;


-- 이전글
SELECT MAX(openspace_seqno) as openspace_seqno, openspace_no
FROM openspace
WHERE openspace_seqno < 15 and openspace_visible='Y';


--다음글

SELECT MIN(openspace_seqno) as openspace_seqno
FROM openspace
WHERE openspace_seqno > 15 and openspace_visible='Y';





/**********************************/
/* Table Name: 회원 등급 */
/**********************************/
DROP TABLE grade;
CREATE TABLE grade(
grade_no                       NUMBER(10)  NOT NULL  PRIMARY KEY,
grade_name                     VARCHAR2(100)  NOT NULL
);

COMMENT ON TABLE grade is '회원 등급';
COMMENT ON COLUMN grade.grade_no is '회원등급번호';
COMMENT ON COLUMN grade.grade_name is '회원등급이름';

DROP SEQUENCE grade_seq;
CREATE SEQUENCE grade_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
  INSERT INTO grade(grade_no, grade_name)
VALUES(0, '일반회원');
  
  /**********************************/
/* Table Name: 로그인 내역 */
/**********************************/
CREATE TABLE login(
login_no                       NUMBER(10)  NOT NULL  PRIMARY KEY,
login_time                     DATE  NOT NULL,
consumer_no                    NUMBER(10)  NULL ,
  FOREIGN KEY (consumer_no) REFERENCES consumer (consumer_no)
);

COMMENT ON TABLE login is '로그인 내역';
COMMENT ON COLUMN login.login_no is '로그인 번호';
COMMENT ON COLUMN login.login_time is '로그인 시간';
COMMENT ON COLUMN login.consumer_no is '회원번호';


CREATE TABLE admin_login(
admin_login_no                 NUMBER(10)  NOT NULL  PRIMARY KEY,
admin_no                       NUMBER(10)  NULL ,
admin_login_time               DATE  NOT NULL,
  FOREIGN KEY (admin_no) REFERENCES admin (admin_no)
);

COMMENT ON TABLE admin_login is '관리자 로그인 내역';
COMMENT ON COLUMN admin_login.admin_login_no is '관리자 로그인 번호';
COMMENT ON COLUMN admin_login.admin_no is '관리자 번호';
COMMENT ON COLUMN admin_login.admin_login_time is '관리자 로그인 시간';


