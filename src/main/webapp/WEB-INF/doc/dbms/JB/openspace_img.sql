/**********************************/
/* Table Name: 공지사항 이미지 */
/**********************************/
drop table openspace_img
CREATE TABLE openspace_img(
    openspace_img_no                    NUMBER(8)    NOT NULL    PRIMARY KEY,
    openspace_no                      NUMBER(10)     NOT NULL ,
    openspace_img_fname                 VARCHAR2(1000)     NOT NULL,
    openspace_img_fupname               VARCHAR2(1000)     NOT NULL,
    openspace_img_thumb                 VARCHAR2(1000)     NOT NULL,
    openspace_img_fsize                 NUMBER(10)     NOT NULL,
    openspace_img_rdate                 DATE     NOT NULL,
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