/**********************************/
/* Table Name: 메인 이미지 */
/**********************************/
drop table index_img
CREATE TABLE index_img(
    index_img_no                      NUMBER(8)    NOT NULL    PRIMARY KEY,
    index_img_fname                   VARCHAR2(100)    NOT NULL,
    index_img_fupname                 VARCHAR2(100)    NOT NULL,
    index_img_fsize                   NUMBER(10)     NOT NULL,
    index_img_url                     VARCHAR2(500),
    index_img_division                VARCHAR2(100)   ,
    index_img_rdate                   DATE     NOT NULL
);

COMMENT ON TABLE index_img is '메인 이미지';
COMMENT ON COLUMN index_img.index_img_no is '메인 이미지번호';
COMMENT ON COLUMN index_img.index_img_fname is '원본 파일명';
COMMENT ON COLUMN index_img.index_img_fupname is '업로드 파일명';
COMMENT ON COLUMN index_img.index_img_fsize is '파일 사이즈';
COMMENT ON COLUMN index_img.index_img_url is 'Url';
COMMENT ON COLUMN index_img.index_img_division is '구분';
COMMENT ON COLUMN index_img.index_img_rdate is '등록일';