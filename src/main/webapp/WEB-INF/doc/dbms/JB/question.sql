/**********************************/
/* Table Name: 자주묻는질문 */
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

COMMENT ON TABLE question is '자주묻는질문';
COMMENT ON COLUMN question.question_no is '질문 번호';
COMMENT ON COLUMN question.questiongrp_no is '카테고리 그룹 번호';
COMMENT ON COLUMN question.question_title is '질문 제목';
COMMENT ON COLUMN question.question_content is '질문 내용';
COMMENT ON COLUMN question.question_seqno is '출력 순서';
COMMENT ON COLUMN question.question_url is 'Url';
COMMENT ON COLUMN question.question_date is '등록일';




DROP SEQUENCE question_seq;
CREATE SEQUENCE question_seq
    START WITH 1        -- 시작 번호
    INCREMENT BY 1    -- 증가값
    MAXVALUE 9999999999 -- 최댓값:9999999999 --> NUMVER(10) 같음
    CACHE 2                -- 2번은 메모리에서만 계산 (저장안함)
    NOCYCLE;     