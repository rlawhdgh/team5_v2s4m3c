/**********************************/
/* Table Name: ���ø���Ʈ */
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

COMMENT ON TABLE wishlist is '���ø���Ʈ';
COMMENT ON COLUMN wishlist.wishlist_wishlistno is '���ø���Ʈ��ȣ';
COMMENT ON COLUMN wishlist.game_gameno is '��ǰ��ȣ';
COMMENT ON COLUMN wishlist.wishlist_date is '������';
COMMENT ON COLUMN wishlist.wishlist_seqno is '���ø���Ʈ��¼���';
COMMENT ON COLUMN wishlist.consumer_no is 'ȸ����ȣ';

DROP SEQUENCE wishlist_seq;
CREATE SEQUENCE wishlist_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
commit;  
  
  --������ �Է�  
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




--��� ��ȸ--
SELECT wishlist_wishlistno, wishlist_seqno, game_gameno, consumer_no, wishlist_date
FROM wishlist
ORDER BY wishlist_date ASC;

COMMIT;

--1���� ��� ��ȸ
SELECT wishlist_wishlistno, wishlist_seqno, game_contentsno, consumer_no, wishlist_date
FROM wishlist
WHERE consumer_no = 1;

--1�� ����
DELETE FROM wishlist;
WHERE wishlist_wishlistno = 35;

--Ư�� ȸ�� ��ü ����
DELETE FROM wishlist
WHERE consumer_no = 27;

commit;

-- ���� �غ��� -- ���� �ȵ�
SELECT r.list_contentsno as r_list_contentsno, r.list_title as list_title,
          c.wishlist_wishlistno, c.wishlist_seqno, c.wishlist_date         
FROM list r, wishlist c
WHERE r.list_contentsno = c.list_contentsno
ORDER BY  r.list_contentsno ASC, c.wishlist_seqno ASC;



--Ư�� ȸ���� Ȯ�� �� �� �ֵ��� �ϴ°�(����ϴ°� 
SELECT l.game_gameno as l_game_gameno, l.game_title as l_game_title, l.game_release as l_game_release, l.game_developer as l_game_developer, l.game_image as l_game_image, --����Ʈ���̺�
          l.game_price as l_game_price, l.game_writing as l_game_writing,
          w.wishlist_wishlistno as w_wishlist_wishlistno, w.wishlist_seqno as w_wishlist_seqno, w.wishlist_date as w_wishlist_date, -- ���� ����Ʈ ���̺�(�ڽ�)
          c.consumer_no as c_consumer_no   -- ȸ�� ���̺�                
FROM game l, wishlist w, consumer c
WHERE l.game_gameno = w.game_gameno AND w.consumer_no = c.consumer_no AND c.consumer_no = 1

ORDER BY l.game_gameno ASC, w.wishlist_wishlistno DESC;


--- ����¡--
SELECT  list_contentsno, list_title, list_writing, list_release , list_developer, list_price, list_images, wishlist_wishlistno, wishlist_date, consumer_no, r    -- ȸ�� ���̺�
FROM (
           SELECT  list_contentsno, list_title, list_writing, list_release , list_developer, list_price, list_images, wishlist_wishlistno, wishlist_date, consumer_no,    -- ȸ�� ���̺�
                     rownum as r
           FROM (
                     SELECT   l.list_contentsno, l.list_title, l.list_writing, l.list_release , l.list_developer, l.list_price, l.list_images, w.wishlist_wishlistno, w.wishlist_date, c.consumer_no             
                     FROM list l, wishlist w, consumer c    
                     WHERE l.list_contentsno = w.list_contentsno AND w.consumer_no = c.consumer_no AND c.consumer_no = 1
                     ORDER BY list_contentsno DESC
           )          
)
WHERE r>=1 AND r <=3;

SELECT  list_contentsno, list_title, list_writing, list_release , list_developer, list_price, list_images, wishlist_wishlistno, wishlist_date, consumer_no, r   -- ȸ�� ���̺�
FROM (
           SELECT  list_contentsno, list_title, list_writing, list_release , list_developer, list_price, list_images, wishlist_wishlistno, wishlist_date, consumer_no,    -- ȸ�� ���̺�
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
WHERE list_title LIKE '%��Ʋ�׶���%'


SELECT *
FROM  wishlist






