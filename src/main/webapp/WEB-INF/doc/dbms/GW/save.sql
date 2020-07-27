/**********************************/
/* Table Name: 설문조사저장 */
/**********************************/
DROP TABLE save CASCADE CONSTRAINTS;
CREATE TABLE save(
		makeno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		survey_cateno                 		NUMBER(10)		 NULL ,
		question                      		VARCHAR2(200)		 NOT NULL,
        item1                   		VARCHAR2(200)		 NOT NULL,
        item2                   		VARCHAR2(200)		 NOT NULL,
        item3                   		VARCHAR2(200)		 NOT NULL,
        period                 		NUMBER(10)		 NOT NULL,
		wdate                         		DATE		 NOT NULL,
        word                          		VARCHAR2(300)		 NULL ,
        cnt                    		NUMBER(10)		 NULL ,
        vote                        NUMBER(10)         NULL,
        passwd                     VARCHAR2(15)		 NOT NULL,

  FOREIGN KEY (survey_cateno) REFERENCES survey_cate (survey_cateno)
);

COMMENT ON TABLE save is '설문조사저장';
COMMENT ON COLUMN save.makeno is '설문조사등록번호';
COMMENT ON COLUMN save.survey_cateno is '카테고리 번호';
COMMENT ON COLUMN save.question is '설문제목';
COMMENT ON COLUMN save.item1 is '설문항목1';
COMMENT ON COLUMN save.item2 is '설문항목2';
COMMENT ON COLUMN save.item3 is '설문항목3';
COMMENT ON COLUMN save.period is '설문기간';
COMMENT ON COLUMN save.wdate is '등록날짜';
COMMENT ON COLUMN save.word is '검색어';
COMMENT ON COLUMN save.cnt is '조회수';
COMMENT ON COLUMN save.vote is '총 투표수';

CREATE SEQUENCE save_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
   INSERT INTO save(makeno,  survey_cateno, question, sdate, edate, wdate, type, active, word, cnt)
   VALUES(save_seq.nextval, 9 ,'치킨', 2020-01-20, 0);


    SELECT makeno, survey_cateno, question, item1, item2, item3, period, wdate, cnt
    FROM save 
    WHERE survey_cateno = 11
    ORDER BY makeno DESC
