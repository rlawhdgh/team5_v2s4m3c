/**********************************/
/* Table Name: 질문 구분 그룹 */
/**********************************/
CREATE TABLE questiongrp(
    questiongrp_no                        NUMBER(10)     NOT NULL    PRIMARY KEY,
        admin_no                                NUMBER(10)         NOT NULL,       
    questiongrp_name                  VARCHAR2(50)     NOT NULL,
    questiongrp_seqno                 NUMBER(7)        DEFAULT 0     NOT NULL,
        
         FOREIGN KEY (admin_no) REFERENCES admin (admin_no)
);

COMMENT ON TABLE questiongrp is '질문 구분 그룹';
COMMENT ON COLUMN questiongrp.questiongrp_no is '카테고리 그룹 번호';
COMMENT ON COLUMN questiongrp.questiongrp_name is '이름';
COMMENT ON COLUMN questiongrp.questiongrp_seqno is '출력 순서';

CREATE SEQUENCE questiongrp_seq
    START WITH 1        -- 시작 번호
    INCREMENT BY 1    -- 증가값
    MAXVALUE 9999999999 -- 최댓값:9999999999 --> NUMVER(10) 같음
    CACHE 2                -- 2번은 메모리에서만 계산 (저장안함)
    NOCYCLE;     

INSERT INTO questiongrp(questiongrp_no, admin_no, questiongrp_name, questiongrp_seqno)
 VALUES (questiongrp_seq.nextval,1, '안뇽',1);