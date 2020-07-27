-- ���� ��� + ������
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

COMMENT ON TABLE game is '���';
COMMENT ON COLUMN game.game_gameno is '������ ��ȣ';
COMMENT ON COLUMN game.kind_kindno is '���� ������ȣ';
COMMENT ON COLUMN game.game_title is '����';
COMMENT ON COLUMN game.game_youtube is 'Youtube';
COMMENT ON COLUMN game.game_image is '�̹���';
COMMENT ON COLUMN game.game_writing is '��������';
COMMENT ON COLUMN game.game_character is '����Ư¡';
COMMENT ON COLUMN game.game_require is '�ý��ۿ䱸����';
COMMENT ON COLUMN game.game_brief is '����������';
COMMENT ON COLUMN game.game_price is '����';
COMMENT ON COLUMN game.game_sale is '���ϰ�';
COMMENT ON COLUMN game.game_release is '�����';
COMMENT ON COLUMN game.game_developer is '���߻�';
COMMENT ON COLUMN game.game_recom is '��õ';
COMMENT ON COLUMN game.game_word is '�˻���';
COMMENT ON COLUMN game.game_web is '���ͳ� �ּ�';
COMMENT ON COLUMN game.game_rdate is '�����';



DROP SEQUENCE game_gameno_seq;
CREATE SEQUENCE game_gameno_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����


INSERT INTO game(game_gameno, kind_kindno, game_title, game_youtube, game_image, 
game_writing, game_character, game_require, game_brief, game_price, game_sale,game_release, game_developer, game_rdate)
VALUES(game_gameno_seq.nextval, 1, 'lol','��Ʃ���ּ�', '�̹���1', '�̰����� �����', '�ſ��������', '������10',
'�����', 10000, 5000, '2012-01-01', '���̾�', sysdate);

INSERT INTO game(game_gameno, kind_kindno, game_title, game_youtube, game_image, 
game_writing, game_character, game_require, game_brief, game_price, game_sale,game_release, game_developer, game_rdate)
VALUES(1, 1, 'lol','��Ʃ���ּ�', '�̹���1', '�̰����� �����', '�ſ��������', '������10',
'�����', 10000, 5000, '2012-01-01', '���̾�', sysdate);

commit;
-- ��ü
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

-- �ֽ� ���Ӽ�
SELECT game_gameno, kind_kindno, game_title, game_youtube, game_image, 
game_writing, game_character, game_require, game_brief, game_price, game_sale,game_release, game_developer, game_rdate
FROM game 
ORDER BY game_rdate DESC;   

-- ���μ�
SELECT game_gameno, kind_kindno, game_title, game_youtube, game_image, 
           game_writing, game_character, game_require, game_brief, game_price, 
           game_sale,game_release, game_developer, game_rdate
FROM game 
where game_price > 0
ORDER BY (game_price-game_sale)/game_price DESC;   

-- �������
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
SET game_title='īī��', game_writing='īī��', game_character='īī��', game_require='īī��', game_brief='īī��',
      game_price='10000', game_sale='3000', game_release='2020-07-09', game_developer='īī��'
WHERE game_gameno=3;

DELETE FROM game
WHERE game_gameno=4;
    
    commit;

SELECT * FROM game;