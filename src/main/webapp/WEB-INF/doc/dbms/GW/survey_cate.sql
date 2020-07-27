
/**********************************/
/* Table Name: 카테고리 */
/**********************************/
CREATE TABLE survey_cate(
		survey_cateno                 		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		survey_categrpno              		NUMBER(10)	NOT	 NULL ,
		survey_name                   		VARCHAR2(100)		 NOT NULL,
		survey_rdate                  		DATE		 NOT NULL,
		survey_cnt                    		NUMBER(10)		 DEFAULT 0		 NOT NULL,
  FOREIGN KEY (survey_categrpno) REFERENCES survey_categrp (survey_categrpno)
);

COMMENT ON TABLE survey_cate is '카테고리';
COMMENT ON COLUMN survey_cate.survey_cateno is '카테고리 번호';
COMMENT ON COLUMN survey_cate.survey_categrpno is '그룹번호';
COMMENT ON COLUMN survey_cate.survey_name is '카테고리 이름';
COMMENT ON COLUMN survey_cate.survey_rdate is '등록일';
COMMENT ON COLUMN survey_cate.survey_cnt is '등록된 글 수';

DROP SEQUENCE survey_cate_seq;
CREATE SEQUENCE survey_cate_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

   INSERT INTO survey_cate(survey_cateno, survey_categrpno, survey_name, survey_rdate, survey_cnt)
   VALUES(survey_cate_seq.nextval, 2 ,'치킨', sysdate, 0);



