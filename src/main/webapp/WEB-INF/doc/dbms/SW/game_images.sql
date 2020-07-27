/**********************************/
/* Table Name: ÷������ */
/**********************************/
DROP TABLE list_images;
DROP SEQUENCE list_images_seq;

DROP TABLE game_images;
CREATE TABLE game_images(
        game_imagesno                  NUMBER(10)         NOT NULL         PRIMARY KEY,
        game_gameno                            NUMBER(10)         NULL ,
        game_fname                             VARCHAR2(100)         NOT NULL,
        game_fupname                      VARCHAR2(100)         NOT NULL,
        game_thumb                         VARCHAR2(100)         NULL ,
        game_fsize                                 NUMBER(10)         DEFAULT 0         NOT NULL,
        images_rdate                           DATE     NOT NULL,
  FOREIGN KEY (game_gameno) REFERENCES game (game_gameno)
);

COMMENT ON TABLE game_images is '÷������';
COMMENT ON COLUMN game_images.game_imagesno is '÷�����Ϲ�ȣ';
COMMENT ON COLUMN game_images.game_gameno is '��������ȣ';
COMMENT ON COLUMN game_images.game_fname is '���� ���ϸ�';
COMMENT ON COLUMN game_images.game_fupname is '���ε� ���ϸ�';
COMMENT ON COLUMN game_images.game_thumb is 'Thumb ���ϸ�';
COMMENT ON COLUMN game_images.game_fsize is '���� ������';
COMMENT ON COLUMN game_images.images_rdate is '�����';

DROP SEQUENCE game_images_seq;
CREATE SEQUENCE game_images_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

COMMIT;

INSERT INTO game_images(game_imagesno, game_gameno, game_fname, game_fupname, game_thumb, game_fsize, images_rdate)
VALUES(game_images_seq.nextval, 1, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000, sysdate);

COMMIT;
             
SELECT game_imagesno, game_gameno, game_fname, game_fupname, game_thumb, game_fsize, images_rdate
FROM game_images
ORDER BY images_rdate ASC;

DELETE FROM game_images
WHERE game_imagesno = 1;


    SELECT game_imagesno, game_gameno, game_fname,
               game_fupname, game_thumb, game_fsize, images_rdate
    FROM game_images
    WHERE game_imagesno=1
    ORDER BY game_imagesno;


-- 5) FK list_listno �θ�Ű �� ��ȸ
SELECT game_imagesno, game_gameno, game_fname,
           game_fupname, game_thumb, game_fsize, images_rdate
FROM game_images
WHERE game_gameno=1;