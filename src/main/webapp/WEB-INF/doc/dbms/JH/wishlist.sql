/**********************************/
/* Table Name: 위시리스트 */
/**********************************/
DROP TABLE wishlist;
CREATE TABLE wishlist(
		wishlist_wishlistno           		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		game_gameno               		NUMBER(10)		 NULL ,
		wishlist_date                 		DATE		 NOT NULL,
		wishlist_seqno                		NUMBER(10)		 NOT NULL,
		consumer_no                   		NUMBER(10)		 NULL ,
  FOREIGN KEY (game_gameno) REFERENCES game (game_gameno),
  FOREIGN KEY (consumer_no) REFERENCES consumer (consumer_no)
);

COMMENT ON TABLE wishlist is '위시리스트';
COMMENT ON COLUMN wishlist.wishlist_wishlistno is '위시리스트번호';
COMMENT ON COLUMN wishlist.game_gameno is '상품번호';
COMMENT ON COLUMN wishlist.wishlist_date is '저장일';
COMMENT ON COLUMN wishlist.wishlist_seqno is '위시리스트출력순서';
COMMENT ON COLUMN wishlist.consumer_no is '회원번호';

DROP SEQUENCE wishlist_seq;
CREATE SEQUENCE wishlist_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
commit;  
  
  --데이터 입력  
INSERT INTO  wishlist(wishlist_wishlistno, wishlist_seqno, game_gameno, consumer_no, wishlist_date)
VALUES(wishlist_seq.nextval, 1, 1, 1, sysdate);
 
INSERT INTO  wishlist(wishlist_wishlistno, wishlist_seqno, game_gameno, consumer_no, wishlist_date)
VALUES(wishlist_seq.nextval, 2, 2, 1, sysdate);

INSERT INTO  wishlist(wishlist_wishlistno, wishlist_seqno, game_contentsno, consumer_no, wishlist_date)
VALUES(wishlist_seq.nextval, 3, 3, 1, sysdate);

INSERT INTO  wishlist(wishlist_wishlistno, wishlist_seqno, game_contentsno, consumer_no, wishlist_date)
VALUES(wishlist_seq.nextval, 4, 4, 1, sysdate);

INSERT INTO  wishlist(wishlist_wishlistno, wishlist_seqno, game_contentsno, consumer_no, wishlist_date)
VALUES(wishlist_seq.nextval, 4, 5, 1, sysdate);

INSERT INTO  wishlist(wishlist_wishlistno, wishlist_seqno, game_contentsno, consumer_no, wishlist_date)
VALUES(wishlist_seq.nextval, 5, 6, 1, sysdate);
 
INSERT INTO  wishlist(wishlist_wishlistno, wishlist_seqno, game_contentsno, consumer_no, wishlist_date)
VALUES(wishlist_seq.nextval, 6, 7, 1, sysdate);

INSERT INTO  wishlist(wishlist_wishlistno, wishlist_seqno, game_contentsno, consumer_no, wishlist_date)
VALUES(wishlist_seq.nextval, 7, 8, 1, sysdate);

INSERT INTO  wishlist(wishlist_wishlistno, wishlist_seqno, game_contentsno, consumer_no, wishlist_date)
VALUES(wishlist_seq.nextval, 8, 9, 1, sysdate);

INSERT INTO  wishlist(wishlist_wishlistno, wishlist_seqno, game_contentsno, consumer_no, wishlist_date)
VALUES(wishlist_seq.nextval, 9, 10, 1, sysdate);

INSERT INTO  wishlist(wishlist_wishlistno, wishlist_seqno, game_contentsno, consumer_no, wishlist_date)
VALUES(wishlist_seq.nextval, 5, 11, 1, sysdate);
 
INSERT INTO  wishlist(wishlist_wishlistno, wishlist_seqno, game_contentsno, consumer_no, wishlist_date)
VALUES(wishlist_seq.nextval, 6, 12, 1, sysdate);

INSERT INTO  wishlist(wishlist_wishlistno, wishlist_seqno, game_contentsno, consumer_no, wishlist_date)
VALUES(wishlist_seq.nextval, 7, 13, 1, sysdate);

INSERT INTO  wishlist(wishlist_wishlistno, wishlist_seqno, game_contentsno, consumer_no, wishlist_date)
VALUES(wishlist_seq.nextval, 8, 13, 27, sysdate);

INSERT INTO  wishlist(wishlist_wishlistno, wishlist_seqno, game_contentsno, consumer_no, wishlist_date)
VALUES(wishlist_seq.nextval, 9, 57, 27, sysdate);

INSERT INTO  wishlist(wishlist_wishlistno, wishlist_seqno, game_contentsno, consumer_no, wishlist_date)
VALUES(wishlist_seq.nextval, 9, 58, 27, sysdate);

INSERT INTO  wishlist(wishlist_wishlistno, wishlist_seqno, game_contentsno, consumer_no, wishlist_date)
VALUES(wishlist_seq.nextval, 5, 59, 27, sysdate);
 
INSERT INTO  wishlist(wishlist_wishlistno, wishlist_seqno, game_contentsno, consumer_no, wishlist_date)
VALUES(wishlist_seq.nextval, 6, 60, 27, sysdate);

INSERT INTO  wishlist(wishlist_wishlistno, wishlist_seqno, game_contentsno, consumer_no, wishlist_date)
VALUES(wishlist_seq.nextval, 7, 61, 27, sysdate);

INSERT INTO  wishlist(wishlist_wishlistno, wishlist_seqno, game_contentsno, consumer_no, wishlist_date)
VALUES(wishlist_seq.nextval, 8, 62, 27, sysdate);

INSERT INTO  wishlist(wishlist_wishlistno, wishlist_seqno, game_contentsno, consumer_no, wishlist_date)
VALUES(wishlist_seq.nextval, 9, 63, 27, sysdate);

INSERT INTO  wishlist(wishlist_wishlistno, wishlist_seqno, game_contentsno, consumer_no, wishlist_date)
VALUES(wishlist_seq.nextval, 9, 64, 27, sysdate);

INSERT INTO  wishlist(wishlist_wishlistno, wishlist_seqno, game_contentsno, consumer_no, wishlist_date)
VALUES(wishlist_seq.nextval, 5, 65, 27, sysdate);
 
INSERT INTO  wishlist(wishlist_wishlistno, wishlist_seqno, game_contentsno, consumer_no, wishlist_date)
VALUES(wishlist_seq.nextval, 6, 66, 27, sysdate);

INSERT INTO  wishlist(wishlist_wishlistno, wishlist_seqno, game_contentsno, consumer_no, wishlist_date)
VALUES(wishlist_seq.nextval, 7, 67, 27, sysdate);

INSERT INTO  wishlist(wishlist_wishlistno, wishlist_seqno, game_contentsno, consumer_no, wishlist_date)
VALUES(wishlist_seq.nextval, 8, 68, 27, sysdate);

INSERT INTO  wishlist(wishlist_wishlistno, wishlist_seqno, game_contentsno, consumer_no, wishlist_date)
VALUES(wishlist_seq.nextval, 9, 69, 27, sysdate);

INSERT INTO  wishlist(wishlist_wishlistno, wishlist_seqno, game_contentsno, consumer_no, wishlist_date)
VALUES(wishlist_seq.nextval, 1, 70, 27, sysdate);

commit;

DELETE FROM wishlist;




--목록 조회--
SELECT wishlist_wishlistno, wishlist_seqno, game_gameno, consumer_no, wishlist_date
FROM wishlist
ORDER BY wishlist_date ASC;

COMMIT;

--1건의 목록 조회
SELECT wishlist_wishlistno, wishlist_seqno, game_contentsno, consumer_no, wishlist_date
FROM wishlist
WHERE consumer_no = 1;

--1건 삭제
DELETE FROM wishlist;
WHERE wishlist_wishlistno = 35;

--특정 회원 전체 삭제
DELETE FROM wishlist
WHERE consumer_no = 27;

commit;

-- 내가 해본거 -- 쓰면 안됨
SELECT r.list_contentsno as r_list_contentsno, r.list_title as list_title,
          c.wishlist_wishlistno, c.wishlist_seqno, c.wishlist_date         
FROM list r, wishlist c
WHERE r.list_contentsno = c.list_contentsno
ORDER BY  r.list_contentsno ASC, c.wishlist_seqno ASC;



--특정 회원만 확인 할 수 있도록 하는거(써야하는거 
SELECT l.game_gameno as l_game_gameno, l.game_title as l_game_title, l.game_release as l_game_release, l.game_developer as l_game_developer, l.game_image as l_game_image, --리스트테이블
          l.game_price as l_game_price, l.game_writing as l_game_writing,
          w.wishlist_wishlistno as w_wishlist_wishlistno, w.wishlist_seqno as w_wishlist_seqno, w.wishlist_date as w_wishlist_date, -- 위시 리스트 테이블(자식)
          c.consumer_no as c_consumer_no   -- 회원 테이블                
FROM game l, wishlist w, consumer c
WHERE l.game_gameno = w.game_gameno AND w.consumer_no = c.consumer_no AND c.consumer_no = 1

ORDER BY l.game_gameno ASC, w.wishlist_wishlistno DESC;


--- 페이징--
SELECT  list_contentsno, list_title, list_writing, list_release , list_developer, list_price, list_images, wishlist_wishlistno, wishlist_date, consumer_no, r    -- 회원 테이블
FROM (
           SELECT  list_contentsno, list_title, list_writing, list_release , list_developer, list_price, list_images, wishlist_wishlistno, wishlist_date, consumer_no,    -- 회원 테이블
                     rownum as r
           FROM (
                     SELECT   l.list_contentsno, l.list_title, l.list_writing, l.list_release , l.list_developer, l.list_price, l.list_images, w.wishlist_wishlistno, w.wishlist_date, c.consumer_no             
                     FROM list l, wishlist w, consumer c    
                     WHERE l.list_contentsno = w.list_contentsno AND w.consumer_no = c.consumer_no AND c.consumer_no = 1
                     ORDER BY list_contentsno DESC
           )          
)
WHERE r>=1 AND r <=3;

SELECT  list_contentsno, list_title, list_writing, list_release , list_developer, list_price, list_images, wishlist_wishlistno, wishlist_date, consumer_no, r   -- 회원 테이블
FROM (
           SELECT  list_contentsno, list_title, list_writing, list_release , list_developer, list_price, list_images, wishlist_wishlistno, wishlist_date, consumer_no,    -- 회원 테이블
                     rownum as r
           FROM (
                     SELECT   l.list_contentsno, l.list_title, l.list_writing, l.list_release , l.list_developer, l.list_price, l.list_images, w.wishlist_wishlistno, w.wishlist_date, c.consumer_no             
                     FROM list l, wishlist w, consumer c   
                     WHERE l.list_contentsno = w.list_contentsno AND w.consumer_no = c.consumer_no AND c.consumer_no = 23
                     ORDER BY list_contentsno DESC
           )          
)
WHERE r>=4 AND r <=6;

commit;





SELECT list_contentsno, list_title, list_writing, list_release , list_developer, list_price, list_images

SELECT wishlist_wishlistno, wishlist_seqno, list_contentsno, consumer_no, wishlist_date
FROM wishlist
ORDER BY wishlist_date ASC;


SELECT *
FROM list
WHERE list_title LIKE '%배틀그라운드%'


SELECT *
FROM  wishlist






