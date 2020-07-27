/**********************************/
/* Table Name: ���ֹ������� */
/**********************************/
DROP TABLE question;
CREATE TABLE question(
    question_no                       NUMBER(10)     NOT NULL    PRIMARY KEY,
        questiongrp_no                        NUMBER(10)     NOT NULL,      
    question_title                    VARCHAR2(100)    NOT NULL,
    question_content                  CLOB     NOT NULL,
    question_seqno                    NUMBER(3)    NOT NULL,
        question_url                        VARCHAR2(500),
    question_date                     DATE     NOT NULL,
        
    FOREIGN KEY (questiongrp_no) REFERENCES questiongrp (questiongrp_no)
);

COMMENT ON TABLE question is '���ֹ�������';
COMMENT ON COLUMN question.question_no is '���� ��ȣ';
COMMENT ON COLUMN question.questiongrp_no is 'ī�װ� �׷� ��ȣ';
COMMENT ON COLUMN question.question_title is '���� ����';
COMMENT ON COLUMN question.question_content is '���� ����';
COMMENT ON COLUMN question.question_seqno is '��� ����';
COMMENT ON COLUMN question.question_url is 'Url';
COMMENT ON COLUMN question.question_date is '�����';




DROP SEQUENCE question_seq;
CREATE SEQUENCE question_seq
    START WITH 1        -- ���� ��ȣ
    INCREMENT BY 1    -- ������
    MAXVALUE 9999999999 -- �ִ�:9999999999 --> NUMVER(10) ����
    CACHE 2                -- 2���� �޸𸮿����� ��� (�������)
    NOCYCLE;     