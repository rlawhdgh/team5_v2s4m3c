/**********************************/
/* Table Name: 결제 */
/**********************************/
DROP TABLE pay;

CREATE TABLE pay(
		pay_payno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
        pay_cnt                             NUMBER(10)       NOT NULL,
		game_gameno               		NUMBER(10)		 NULL ,
		consumer_no                   		NUMBER(10)		 NULL ,
		pay_date                      		DATE		 NOT NULL,
        pay_kind                 		       VARCHAR2(100)		 NOT NULL,
        

  FOREIGN KEY (consumer_no) REFERENCES consumer (consumer_no),
  FOREIGN KEY (game_gameno) REFERENCES game (game_gameno)
);

COMMENT ON TABLE pay is '결제';
COMMENT ON COLUMN pay.pay_payno is '결제번호';
COMMENT ON COLUMN pay.pay_cnt is '결제수량';
COMMENT ON COLUMN pay.game_gameno is '상품번호';
COMMENT ON COLUMN pay.consumer_no is '회원번호';
COMMENT ON COLUMN pay.pay_date is '결제일시';
COMMENT ON COLUMN pay.pay_kind is '결제일시';


DROP SEQUENCE pay_seq;
CREATE SEQUENCE pay_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
  
INSERT INTO  pay(pay_payno, pay_cnt, pay_kind, pay_date, game_gameno, consumer_no )
VALUES(pay_seq.nextval, 1, '모바일결제', sysdate, 1, 1);

SELECT pay_payno, pay_cnt, pay_kind, pay_date, game_contentsno, consumer_no
FROM pay
ORDER BY pay_date ASC;

commit;

DELETE FROM pay;
WHERE pay_payno = 1;

SELECT catebag_catebagno , catebag_cnt, catebag_sum, catebag_seqno, list_contentsno, consumer_no, catebag_date
FROM catebag
WHERE catebag_catebagno = 184;

--1건 조회
SELECT pay_payno, pay_cnt, pay_date, list_contentsno, consumer_no
FROM pay
WHERE consumer_no = 1;

DELETE FROM pay;
WHERE pay_payno = 1;

SELECT l.game_contentsno as l_game_contentsno, l.game_title as l_game_title, l.game_release as l_game_release, l.game_developer as l_game_developer, l.game_images as l_game_images, --리스트테이블
          l.game_price as l_game_price, l.game_writing as l_game_writing,
          p.pay_payno as p_pay_payno, p.pay_cnt as p_pay_cnt, p.pay_date as p_pay_date, -- 위시 리스트 테이블(자식)
          c.consumer_no as c_consumer_no   -- 회원 테이블                
FROM game l, pay p, consumer c
WHERE l.game_contentsno = p.game_contentsno AND p.consumer_no = c.consumer_no AND c.consumer_no = 1

ORDER BY l.game_contentsno ASC, p.pay_payno DESC;

-----------------------------------------------------------------------------

SELECT l.list_contentsno as l_list_contentsno, l.list_title as l_list_title, l.list_release as l_list_release, l.list_developer as l_list_developer, l.list_images as l_list_images, --리스트테이블
          l.list_price as l_list_price, l.list_writing as l_list_writing,
          b.catebag_catebagno as b_catebag_catebagno, b.catebag_cnt as b_catebag_cnt, b.catebag_sum as b_catebag_sum, b.catebag_seqno as b_catebag_seqno, 
          b.catebag_date as b_catebag_date -- 위시 리스트 테이블(자식)             
FROM list l, catebag b
WHERE b.catebag_catebagno = 43;
ORDER BY b.catebag_catebagno DESC;




SELECT pay_payno, pay_date, list_contentsno, consumer_no
FROM pay
ORDER BY pay_date ASC;

SELECT  list_contentsno, list_title, list_writing, list_release , list_developer, list_price, list_images, pay_payno, pay_cnt, pay_date, consumer_no, r    -- 회원 테이블
FROM (
           SELECT  list_contentsno, list_title, list_writing, list_release , list_developer, list_price, list_images, pay_payno, pay_cnt, pay_date, consumer_no,    -- 회원 테이블
                     rownum as r
           FROM (
                     SELECT   l.list_contentsno, l.list_title, l.list_writing, l.list_release , l.list_developer, l.list_price, l.list_images, p.pay_payno, p.pay_cnt, p.pay_date, c.consumer_no             
                     FROM list l, pay p, consumer c    
                     WHERE l.list_contentsno = p.list_contentsno AND p.consumer_no = c.consumer_no AND c.consumer_no = 10
                     ORDER BY list_contentsno DESC
           )          
)
WHERE r>=1 AND r <=3;





