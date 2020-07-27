/**********************************/
/* Table Name: 공지사항 */
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

COMMENT ON TABLE openspace is '공지사항';
COMMENT ON COLUMN openspace.openspace_no is '공지사항 번호';
COMMENT ON COLUMN openspace.consumer_no is '회원 번호';
COMMENT ON COLUMN openspace.openspace_title is '공지사항 제목';
COMMENT ON COLUMN openspace.openspace_content is '공지사항 내용';
COMMENT ON COLUMN openspace.openspace_division is '구분';
COMMENT ON COLUMN openspace.openspace_cnt is '조회수';
COMMENT ON COLUMN openspace.openspace_seqno is '출력 순서';
COMMENT ON COLUMN openspace.openspace_visible is '출력 모드';
COMMENT ON COLUMN openspace.openspace_rdate is '등록일';
COMMENT ON COLUMN openspace.openspace_redate is '수정일';


DROP SEQUENCE openspace_seq;
CREATE SEQUENCE openspace_seq
    START WITH 1        -- 시작 번호
    INCREMENT BY 1    -- 증가값
    MAXVALUE 9999999999 -- 최댓값:9999999999 --> NUMVER(10) 같음
    CACHE 2                -- 2번은 메모리에서만 계산 (저장안함)
    NOCYCLE;     

