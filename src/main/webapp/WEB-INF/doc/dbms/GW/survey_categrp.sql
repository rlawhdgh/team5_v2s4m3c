/**********************************/
/* Table Name: 설문조사 카테고리 그룹 */
/**********************************/
DROP TABLE survey_categrp CASCADE CONSTRAINTS;
CREATE TABLE Survey_categrp(
		survey_categrpno              		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		survey_name                   		VARCHAR2(50)		 NOT NULL,
		survey_seqno                  		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		survey_rdate                  		DATE		 NOT NULL
 
);


COMMENT ON TABLE survey_categrp is '카테고리 그룹';
COMMENT ON COLUMN survey_categrp.survey_categrpno is '카테고리 그룹 번호';
COMMENT ON COLUMN survey_categrp.survey_name is '이름';
COMMENT ON COLUMN survey_categrp.survey_seqno is '출력 순서';
COMMENT ON COLUMN survey_categrp.survey_rdate is '그룹 생성일';



DROP SEQUENCE survey_categrp_seq;
CREATE SEQUENCE survey_categrp_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO survey_categrp(survey_categrpno, survey_name, survey_seqno, survey_rdate)
VALUES(survey_categrp_seq.nextval, '음식', 1, sysdate);

-- list
SELECT survey_categrpno, survey_name, survey_seqno, survey_rdate
FROM survey_categrp
ORDER BY survey_categrpno ASC;

-- read
SELECT survey_categrpno, survey_name, survey_seqno, survey_rdate
FROM survey_categrp
WHERE survey_categrpno=7;

-- update
UPDATE survey_categrp
SET survey_name='식당'
WHERE survey_categrpno = 2

-- delete
DELETE FROM survey_categrp
WHERE survey_categrpno=1;

-- 레코드 갯수
SELECT COUNT(*) as cnt
FROM survey_categrp;

commit;