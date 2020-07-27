/**********************************/
/* Table Name: 장바구니 */
/**********************************/
DROP TABLE catebag;
CREATE TABLE catebag(
		catebag_catebagno             		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		game_gameno               		NUMBER(10)		 NULL ,
		catebag_cnt                   		NUMBER(10)		 NOT NULL,
		catebag_sum                   		NUMBER(10)		 NOT NULL,
		catebag_seqno                 		NUMBER(10)		 NOT NULL,
        catebag_date                 		DATE		 NOT NULL,
		consumer_no                   		NUMBER(10)		 NULL ,
  FOREIGN KEY (game_gameno) REFERENCES game (game_gameno),
  FOREIGN KEY (consumer_no) REFERENCES consumer (consumer_no)
);

COMMENT ON TABLE catebag is '장바구니';
COMMENT ON COLUMN catebag.catebag_catebagno is '장바구니번호';
COMMENT ON COLUMN catebag.game_gameno is '상품번호';
COMMENT ON COLUMN catebag.catebag_cnt is '수량';
COMMENT ON COLUMN catebag.catebag_sum is '예상결재금액';
COMMENT ON COLUMN catebag.catebag_seqno is '장바구니출력순서';
COMMENT ON COLUMN catebag.catebag_date is '저장일';
COMMENT ON COLUMN catebag.consumer_no is '회원번호';



CREATE SEQUENCE catebag_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
  commit;
    --데이터 입력  
INSERT INTO  catebag(catebag_catebagno , catebag_cnt, catebag_sum, catebag_seqno, game_gameno, consumer_no, catebag_date)
VALUES(catebag_seq.nextval, 1, 18000, 1, 1, 15, sysdate);
 
INSERT INTO  catebag(catebag_catebagno , catebag_cnt, catebag_sum, catebag_seqno, game_gameno, consumer_no, catebag_date)
VALUES(catebag_seq.nextval, 2, 36000, 2, 2, 1, sysdate);

INSERT INTO  catebag(catebag_catebagno , catebag_cnt, catebag_sum, catebag_seqno, game_contentsno, consumer_no, catebag_date)
VALUES(catebag_seq.nextval, 3, 54000, 3, 3, 1, sysdate);

INSERT INTO  catebag(catebag_catebagno , catebag_cnt, catebag_sum, catebag_seqno, game_contentsno, consumer_no, catebag_date)
VALUES(catebag_seq.nextval, 2, 18000, 1, 4, 1, sysdate);
 
INSERT INTO  catebag(catebag_catebagno , catebag_cnt, catebag_sum, catebag_seqno, game_contentsno, consumer_no, catebag_date)
VALUES(catebag_seq.nextval, 2, 36000, 2, 5, 1, sysdate);

INSERT INTO  catebag(catebag_catebagno , catebag_cnt, catebag_sum, catebag_seqno, game_contentsno, consumer_no, catebag_date)
VALUES(catebag_seq.nextval, 2, 54000, 3, 6, 1, sysdate);

INSERT INTO  catebag(catebag_catebagno , catebag_cnt, catebag_sum, catebag_seqno, game_contentsno, consumer_no, catebag_date)
VALUES(catebag_seq.nextval, 1, 18000*5, 1, 7, 1, sysdate);
 
INSERT INTO  catebag(catebag_catebagno , catebag_cnt, catebag_sum, catebag_seqno, game_contentsno, consumer_no, catebag_date)
VALUES(catebag_seq.nextval, 2, 36000, 2, 8, 1, sysdate);

INSERT INTO  catebag(catebag_catebagno , catebag_cnt, catebag_sum, catebag_seqno, game_contentsno, consumer_no, catebag_date)
VALUES(catebag_seq.nextval, 3, 54000, 3, 9, 1, sysdate);

INSERT INTO  catebag(catebag_catebagno , catebag_cnt, catebag_sum, catebag_seqno, game_contentsno, consumer_no, catebag_date)
VALUES(catebag_seq.nextval, 2, 18000, 1, 10, 1, sysdate);
 
INSERT INTO  catebag(catebag_catebagno , catebag_cnt, catebag_sum, catebag_seqno, game_contentsno, consumer_no, catebag_date)
VALUES(catebag_seq.nextval, 2, 36000, 2, 11, 1, sysdate);


SELECT COUNT(list_contentsno) as cnt
FROM catebag
WHERE list_contentsno=45;

       CNT
----------
         0

commit;

--조회
SELECT catebag_catebagno , catebag_cnt, catebag_sum, catebag_seqno, game_gameno, consumer_no, catebag_date
FROM catebag
ORDER BY catebag_catebagno ASC;

-- 1건 조회
SELECT catebag_catebagno , catebag_cnt, catebag_sum, catebag_seqno, list_contentsno, consumer_no, catebag_date
FROM catebag
WHERE catebag_catebagno = 184;

-- 1건 조회
SELECT catebag_catebagno , catebag_cnt, catebag_sum, catebag_seqno, list_contentsno, consumer_no, catebag_date
FROM catebag
WHERE consumer_no = 27;

--1건 삭제
DELETE FROM catebag;
WHERE catebag_catebagno = 1;

--전체 삭제 
DELETE FROM catebag;

--4) 수정 --categrp 에서 가져옴
UPDATE catebag
SET catebag_cnt=10
WHERE catebag_catebagno=8;

--수량 하향, 10 ▷ 1
UPDATE catebag
SET catebag_cnt = catebag_cnt - 1
WHERE catebag_catebagno=8;
 
-- 수량 상향, 1 ▷ 10
UPDATE catebag
SET catebag_cnt = catebag_cnt + 1
WHERE catebag_catebagno=8;

SELECT catebag_catebagno , catebag_cnt, catebag_sum, catebag_seqno, game_contentsno, consumer_no
FROM catebag
ORDER BY catebag_catebagno ASC;

--장바구니 중복체크(상품번호를 조회, 상품 이름을 하든지 하면 된다.)
SELECT COUNT(game_contentsno) as cnt
FROM catebag
WHERE game_contentsno=1;


DELETE FROM catebag
WHERE game_contentsno=1;


INSERT INTO  catebag(catebag_catebagno , catebag_cnt, catebag_sum, catebag_seqno, game_contentsno, consumer_no, catebag_date)
VALUES(catebag_seq.nextval, 1, 18000, 1, 1, 1, sysdate);


----------------------------------------------------------------------------------

cnt
 ---
   0   ← 중복 되지 않음. 0이면 사용가능

SELECT catebag_catebagno , catebag_cnt, catebag_sum, catebag_seqno, list_contentsno, consumer_no, catebag_date
FROM catebag
WHERE list_contentsno = 43;


-- cnt 수정
UPDATE catebag
SET catebag_cnt=30
WHERE catebag_catebagno = 3;

SELECT catebag_catebagno , catebag_cnt, catebag_sum, catebag_seqno, list_contentsno, consumer_no, catebag_date
FROM catebag
WHERE catebag_catebagno = 3;


----join 회원 + 장바구니 + 상품
SELECT l.game_contentsno as l_game_contentsno, l.game_title as l_game_title, l.game_release as l_game_release, l.game_developer as l_game_developer, l.game_images as l_game_images, --리스트테이블
          l.game_price as l_game_price, l.game_writing as l_game_writing,
          b.catebag_catebagno as b_catebag_catebagno, b.catebag_cnt as b_catebag_cnt, b.catebag_sum as b_catebag_sum, b.catebag_seqno as b_catebag_seqno, 
          b.catebag_date as b_catebag_date -- 위시 리스트 테이블(자식)
               
FROM game l, catebag b
WHERE b.catebag_catebagno = 2;  ---- 이부분 쇼핑 카트로 해야한다.

ORDER BY b.catebag_date DESC;


SELECT l.game_contentsno, l.game_title, l.game_release, l.game_developer, l.game_images , --리스트테이블
          l.game_price, l.game_writing,
          b.catebag_catebagno, b.catebag_cnt, b.catebag_sum, b.catebag_seqno, 
          b.catebag_date -- 위시 리스트 테이블(자식)               
FROM game l, catebag b
WHERE l.game_contentsno = b.game_contentsno  AND b.catebag_catebagno = 1;



   SELECT l.game_contentsno as l_game_contentsno, l.game_title as l_game_title, l.game_release as l_game_release, l.game_developer as l_game_developer, l.game_images as l_game_images, 
          l.game_price as l_game_price, l.game_writing as l_game_writing,
          b.catebag_catebagno as b_catebag_catebagno, b.catebag_cnt as b_catebag_cnt, b.catebag_sum as b_catebag_sum, b.catebag_seqno as b_catebag_seqno, 
          b.catebag_date as b_catebag_date             
   FROM game l, catebag b
   WHERE l.game_contentsno = b.game_contentsno  AND b.catebag_catebagno = 1

   SELECT l.game_contentsno as l_game_contentsno, l.game_title as l_game_title, l.game_release as l_game_release, l.game_developer as l_game_developer, l.game_images as l_game_images, 
          l.game_price as l_game_price, l.game_writing as l_game_writing,
          b.catebag_catebagno as b_catebag_catebagno, b.catebag_cnt as b_catebag_cnt, b.catebag_sum as b_catebag_sum, b.catebag_seqno as b_catebag_seqno, 
          b.catebag_date as b_catebag_date             
   FROM game l, catebag b
   WHERE l.game_contentsno = b.game_contentsno  AND b.catebag_catebagno = 1





SELECT c.cateno as c_cateno, c.name as c_name, c.rdate as c_rdate,
          t.contentsno as t_contentsno, t.title as t_title, t.web as t_web, t.ip as t_ip, t.rdate as t_rdate        
FROM cate c, contents t, member m
WHERE c.cateno = t.cateno AND t.memberno = m.memberno AND m.memberno = 1
ORDER BY c.cateno ASC, t.contentsno DESC;

DELETE FROM catebag;





commit;

SELECT  list_contentsno, list_title, list_writing, list_release , list_developer, list_price, list_images, catebag_catebagno , catebag_cnt, catebag_sum, catebag_date, consumer_no, r    -- 회원 테이블
FROM (
           SELECT  list_contentsno, list_title, list_writing, list_release , list_developer, list_price, list_images, catebag_catebagno , catebag_cnt, catebag_sum, catebag_date, consumer_no,    -- 회원 테이블
                     rownum as r
           FROM (
                     SELECT   l.list_contentsno, l.list_title, l.list_writing, l.list_release , l.list_developer, l.list_price, l.list_images, b.catebag_catebagno , b.catebag_cnt, b.catebag_sum, b.catebag_date, c.consumer_no             
                     FROM list l,  catebag b, consumer c    
                     WHERE l.list_contentsno = b.list_contentsno AND b.consumer_no = c.consumer_no AND c.consumer_no = 27
                     ORDER BY list_contentsno DESC
           )          
)
WHERE r>=1 AND r <=3;

SELECT   list_contentsno, list_title, list_writing, list_release , list_developer, list_price, list_images, catebag_catebagno , catebag_cnt, catebag_sum, catebag_date, consumer_no, r   -- 회원 테이블
FROM (
           SELECT  list_contentsno, list_title, list_writing, list_release , list_developer, list_price, list_images, catebag_catebagno , catebag_cnt, catebag_sum, catebag_date, consumer_no,    -- 회원 테이블
                     rownum as r
           FROM (
                     SELECT   l.list_contentsno, l.list_title, l.list_writing, l.list_release , l.list_developer, l.list_price, l.list_images, b.catebag_catebagno , b.catebag_cnt, b.catebag_sum, b.catebag_date, c.consumer_no             
                     FROM list l,  catebag b, consumer c    
                     WHERE l.list_contentsno = b.list_contentsno AND b.consumer_no = c.consumer_no AND c.consumer_no = 27
                     ORDER BY list_contentsno DESC
           )          
)
WHERE r>=4 AND r <=6;





commit;


SELECT  list_contentsno, list_title, list_writing, list_release , list_developer, list_price,  list_images, 
           catebag_catebagno, catebag_cnt, catebag_sum, catebag_date, consumer_no, r  
     FROM (
                SELECT list_contentsno, list_title, list_writing, list_release , list_developer, list_price, list_images, 
                catebag_catebagno , catebag_cnt, catebag_sum, catebag_date, consumer_no, rownum as r
                FROM (
                          SELECT l.list_contentsno, l.list_title, l.list_writing, l.list_release , l.list_developer, l.list_price, l.list_images, 
                          b.catebag_catebagno , b.catebag_cnt, b.catebag_sum, b.catebag_date, c.consumer_no      
                          
                          FROM list l, catebag b, consumer c
                          WHERE  l.list_contentsno = b.list_contentsno AND b.consumer_no = c.consumer_no AND c.consumer_no = 27
                          ORDER BY list_contentsno ASC
           )          
)
WHERE r>=1 AND r <=3;


SELECT  list_contentsno, list_title, list_writing, list_release , list_developer, list_price, 
             list_images, catebag_catebagno , catebag_cnt, catebag_sum, catebag_date, consumer_no, r  
     FROM (
                SELECT list_contentsno, list_title, list_writing, list_release , list_developer, list_price, list_images, 
                catebag_catebagno , catebag_cnt, catebag_sum, catebag_date, consumer_no, rownum as r
                FROM (
                          SELECT l.list_contentsno, l.list_title, l.list_writing, l.list_release , l.list_developer, l.list_price, l.list_images, 
                          b.catebag_catebagno , b.catebag_cnt, b.catebag_sum, b.catebag_date, c.consumer_no      
                          
                          FROM list l, catebag b, consumer c
                          WHERE  l.list_contentsno = b.list_contentsno AND b.consumer_no = c.consumer_no AND c.consumer_no = #{consumer_no}
                          ORDER BY list_contentsno ASC
                          
                          
                          










