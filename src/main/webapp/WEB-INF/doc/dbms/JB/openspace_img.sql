/**********************************/
/* Table Name: �������� �̹��� */
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

COMMENT ON TABLE openspace_img is '�������� �̹���';
COMMENT ON COLUMN openspace_img.openspace_img_no is '�������� �̹�����ȣ';
COMMENT ON COLUMN openspace_img.openspace_no is '�������� ��ȣ';
COMMENT ON COLUMN openspace_img.openspace_img_fname is '���� ���ϸ�';
COMMENT ON COLUMN openspace_img.openspace_img_fupname is '���ε� ���ϸ�';
COMMENT ON COLUMN openspace_img.openspace_img_thumb is 'thumb ����';
COMMENT ON COLUMN openspace_img.openspace_img_fsize is '���� ������';
COMMENT ON COLUMN openspace_img.openspace_img_rdate is '�����';