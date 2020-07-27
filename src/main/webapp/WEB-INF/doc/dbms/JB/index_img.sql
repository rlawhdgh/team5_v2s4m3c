/**********************************/
/* Table Name: ���� �̹��� */
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

COMMENT ON TABLE index_img is '���� �̹���';
COMMENT ON COLUMN index_img.index_img_no is '���� �̹�����ȣ';
COMMENT ON COLUMN index_img.index_img_fname is '���� ���ϸ�';
COMMENT ON COLUMN index_img.index_img_fupname is '���ε� ���ϸ�';
COMMENT ON COLUMN index_img.index_img_fsize is '���� ������';
COMMENT ON COLUMN index_img.index_img_url is 'Url';
COMMENT ON COLUMN index_img.index_img_division is '����';
COMMENT ON COLUMN index_img.index_img_rdate is '�����';