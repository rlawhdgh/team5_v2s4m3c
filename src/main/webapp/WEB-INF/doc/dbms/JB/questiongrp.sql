/**********************************/
/* Table Name: ���� ���� �׷� */
/**********************************/
CREATE TABLE questiongrp(
    questiongrp_no                        NUMBER(10)     NOT NULL    PRIMARY KEY,
        admin_no                                NUMBER(10)         NOT NULL,       
    questiongrp_name                  VARCHAR2(50)     NOT NULL,
    questiongrp_seqno                 NUMBER(7)        DEFAULT 0     NOT NULL,
        
         FOREIGN KEY (admin_no) REFERENCES admin (admin_no)
);

COMMENT ON TABLE questiongrp is '���� ���� �׷�';
COMMENT ON COLUMN questiongrp.questiongrp_no is 'ī�װ� �׷� ��ȣ';
COMMENT ON COLUMN questiongrp.questiongrp_name is '�̸�';
COMMENT ON COLUMN questiongrp.questiongrp_seqno is '��� ����';

CREATE SEQUENCE questiongrp_seq
    START WITH 1        -- ���� ��ȣ
    INCREMENT BY 1    -- ������
    MAXVALUE 9999999999 -- �ִ�:9999999999 --> NUMVER(10) ����
    CACHE 2                -- 2���� �޸𸮿����� ��� (�������)
    NOCYCLE;     

INSERT INTO questiongrp(questiongrp_no, admin_no, questiongrp_name, questiongrp_seqno)
 VALUES (questiongrp_seq.nextval,1, '�ȴ�',1);