-- 게임 목록 + 컨텐츠
DROP TABLE list;
DROP SEQUENCE list_listno_seq;

DROP TABLE game;
CREATE TABLE game(
game_gameno                NUMBER(10)  NOT NULL  PRIMARY KEY,
kind_kindno                    NUMBER(10)  NULL ,
game_title                     VARCHAR2(300)  NOT NULL,
game_youtube                   VARCHAR2(1000) NULL,
game_image                    VARCHAR2(500) NULL,
game_writing                   CLOB  NOT NULL,
game_character                CLOB  NULL,
game_require                   CLOB NULL,
game_brief                        CLOB NULL,
game_price                     NUMBER(10)  NULL,
game_sale                      NUMBER(10)  NULL,
game_release                   VARCHAR2(300)  NULL,
game_developer                 VARCHAR2(300)  NULL,
game_recom                     NUMBER(10)  NULL ,
game_word                      VARCHAR2(300)  NULL ,
game_web                       VARCHAR2(500)  NULL ,
game_rdate                     DATE  NOT NULL,
  FOREIGN KEY (kind_kindno) REFERENCES kind (kind_kindno)
);

COMMENT ON TABLE game is '목록';
COMMENT ON COLUMN game.game_gameno is '컨텐츠 번호';
COMMENT ON COLUMN game.kind_kindno is '게임 종류번호';
COMMENT ON COLUMN game.game_title is '제목';
COMMENT ON COLUMN game.game_youtube is 'Youtube';
COMMENT ON COLUMN game.game_image is '이미지';
COMMENT ON COLUMN game.game_writing is '게임정보';
COMMENT ON COLUMN game.game_character is '게임특징';
COMMENT ON COLUMN game.game_require is '시스템요구사항';
COMMENT ON COLUMN game.game_brief is '간략한정보';
COMMENT ON COLUMN game.game_price is '가격';
COMMENT ON COLUMN game.game_sale is '세일가';
COMMENT ON COLUMN game.game_release is '출시일';
COMMENT ON COLUMN game.game_developer is '개발사';
COMMENT ON COLUMN game.game_recom is '추천';
COMMENT ON COLUMN game.game_word is '검색어';
COMMENT ON COLUMN game.game_web is '인터넷 주소';
COMMENT ON COLUMN game.game_rdate is '등록일';



DROP SEQUENCE game_gameno_seq;
CREATE SEQUENCE game_gameno_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지


INSERT INTO game(game_gameno, kind_kindno, game_title, game_youtube, game_image, 
game_writing, game_character, game_require, game_brief, game_price, game_sale,game_release, game_developer, game_rdate)
VALUES(game_gameno_seq.nextval, 1, 'lol','유튜브주소', '이미지1', '이게임은 뭘까요', '매우재미있음', '윈도우10',
'재밌음', 10000, 5000, '2012-01-01', '라이엇', sysdate);

INSERT INTO game(game_gameno, kind_kindno, game_title, game_youtube, game_image, 
game_writing, game_character, game_require, game_brief, game_price, game_sale,game_release, game_developer, game_rdate)
VALUES(1, 1, 'lol','유튜브주소', '이미지1', '이게임은 뭘까요', '매우재미있음', '윈도우10',
'재밌음', 10000, 5000, '2012-01-01', '라이엇', sysdate);

commit;
-- 전체
SELECT game_gameno, kind_kindno, game_title, game_youtube, game_image, 
game_writing, game_character, game_require, game_brief, game_price, game_sale,game_release, game_developer, game_rdate
FROM game 
ORDER BY game_gameno ASC;    

SELECT k.kind_kindno, k.kind_kindname, 
           g.game_gameno, g.kind_kindno, g.game_title, g.game_youtube, g.game_image, 
           g.game_writing, g.game_character, g.game_require, g.game_brief, g.game_price, g.game_sale, g.game_release,
           g.game_developer, g.game_rdate
FROM kind k, game g
 WHERE k.kind_kindno = g.kind_kindno
ORDER BY k.kind_kindno ASC, g.game_gameno ASC;    

SELECT game_gameno, kind_kindno, game_title, game_youtube, game_image, 
game_writing, game_character, game_require, game_brief, game_price, game_sale,game_release, game_developer, game_rdate
FROM game 
WHERE game_gameno = 3
ORDER BY game_gameno DESC;

-- 최신 게임순
SELECT game_gameno, kind_kindno, game_title, game_youtube, game_image, 
game_writing, game_character, game_require, game_brief, game_price, game_sale,game_release, game_developer, game_rdate
FROM game 
ORDER BY game_rdate DESC;   

-- 할인순
SELECT game_gameno, kind_kindno, game_title, game_youtube, game_image, 
           game_writing, game_character, game_require, game_brief, game_price, 
           game_sale,game_release, game_developer, game_rdate
FROM game 
where game_price > 0
ORDER BY (game_price-game_sale)/game_price DESC;   

-- 무료게임
SELECT game_gameno, kind_kindno, game_title, game_youtube, game_image, 
           game_writing, game_character, game_require, game_brief, game_price, 
           game_sale,game_release, game_developer, game_rdate
FROM game 
WHERE game_price = 0;

   SELECT k.kind_kindno, k.kind_kindname, 
              g.game_gameno, g.kind_kindno, g.game_title, g.game_youtube, g.game_image, 
              g.game_writing, g.game_character, g.game_require, g.game_brief, g.game_price, g.game_sale, g.game_release,
              g.game_developer, g.game_rdate
   FROM kind k, game g
   WHERE k.kind_kindno = g.kind_kindno and g.game_price >0
   ORDER BY (g.game_price-g.game_sale)/g.game_price DESC;  
 
UPDATE game
SET game_title='카카오', game_writing='카카오', game_character='카카오', game_require='카카오', game_brief='카카오',
      game_price='10000', game_sale='3000', game_release='2020-07-09', game_developer='카카오'
WHERE game_gameno=3;

DELETE FROM game
WHERE game_gameno=4;
    
    commit;

SELECT * FROM game;