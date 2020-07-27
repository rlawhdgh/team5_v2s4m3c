/**********************************/
/* Table Name: 첨부파일 */
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

COMMENT ON TABLE game_images is '첨부파일';
COMMENT ON COLUMN game_images.game_imagesno is '첨부파일번호';
COMMENT ON COLUMN game_images.game_gameno is '컨텐츠번호';
COMMENT ON COLUMN game_images.game_fname is '원본 파일명';
COMMENT ON COLUMN game_images.game_fupname is '업로드 파일명';
COMMENT ON COLUMN game_images.game_thumb is 'Thumb 파일명';
COMMENT ON COLUMN game_images.game_fsize is '파일 사이즈';
COMMENT ON COLUMN game_images.images_rdate is '등록일';

DROP SEQUENCE game_images_seq;
CREATE SEQUENCE game_images_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

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


-- 5) FK list_listno 부모키 별 조회
SELECT game_imagesno, game_gameno, game_fname,
           game_fupname, game_thumb, game_fsize, images_rdate
FROM game_images
WHERE game_gameno=1;