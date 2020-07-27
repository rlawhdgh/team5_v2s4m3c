/**********************************/
/* Table Name: �������� */
/**********************************/

DROP TABLE openspace CASCADE CONSTRAINTS; 
CREATE TABLE openspace(
openspace_no                   NUMBER(10)     NOT NULL  PRIMARY KEY,
consumer_no                       NUMBER(10)  NOT NULL,
openspace_title                VARCHAR2(100) NOT NULL,
openspace_content                CLOB                NOT NULL,
openspace_division             VARCHAR2(50)     NOT NULL,
openspace_cnt                  NUMBER(8)         DEFAULT 0  NOT NULL,
openspace_seqno                NUMBER(8)         DEFAULT 1  NOT NULL,
openspace_visible              CHAR(1)             DEFAULT 'Y'  NOT NULL,
openspace_youtube            VARCHAR2(500),
openspace_rdate                DATE                 NOT NULL,
openspace_redate               DATE                 NULL, 

FOREIGN KEY (consumer_no) REFERENCES consumer (consumer_no)
);

COMMENT ON TABLE openspace is '��������';
COMMENT ON COLUMN openspace.openspace_no is '�������� ��ȣ';
COMMENT ON COLUMN openspace.consumer_no is 'ȸ�� ��ȣ';
COMMENT ON COLUMN openspace.openspace_title is '�������� ����';
COMMENT ON COLUMN openspace.openspace_content is '�������� ����';
COMMENT ON COLUMN openspace.openspace_division is '����';
COMMENT ON COLUMN openspace.openspace_cnt is '��ȸ��';
COMMENT ON COLUMN openspace.openspace_seqno is '��� ����';
COMMENT ON COLUMN openspace.openspace_visible is '��� ���';
COMMENT ON COLUMN openspace.openspace_rdate is '�����';
COMMENT ON COLUMN openspace.openspace_redate is '������';


DROP SEQUENCE openspace_seq;
CREATE SEQUENCE openspace_seq
    START WITH 1        -- ���� ��ȣ
    INCREMENT BY 1    -- ������
    MAXVALUE 9999999999 -- �ִ�:9999999999 --> NUMVER(10) ����
    CACHE 2                -- 2���� �޸𸮿����� ��� (�������)
    NOCYCLE;     

