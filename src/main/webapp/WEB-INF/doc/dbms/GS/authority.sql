/**********************************/
/* Table Name: ���� */
/**********************************/
drop table authority;
CREATE TABLE authority(
    authority_no                      NUMBER(10)     NOT NULL    PRIMARY KEY
);

COMMENT ON TABLE authority is '����';
COMMENT ON COLUMN authority.authority_no is '���ѹ�ȣ';