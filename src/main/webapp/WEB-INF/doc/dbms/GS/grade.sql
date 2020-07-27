/**********************************/
/* Table Name: 회원 등급 */
/**********************************/
DROP TABLE grade;
CREATE TABLE grade(
		grade_no                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		grade_name                    		VARCHAR2(100)		 NOT NULL
);

COMMENT ON TABLE grade is '회원 등급';
COMMENT ON COLUMN grade.grade_no is '회원등급번호';
COMMENT ON COLUMN grade.grade_name is '회원등급이름';

DROP SEQUENCE grade_seq;
CREATE SEQUENCE grade_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
  ----------------DML-------------------
1) 등록
INSERT INTO grade(grade_no, grade_name)
VALUES(0, '일반회원');
INSERT INTO grade(grade_no, grade_name)
VALUES(1, 'BRONZE');
INSERT INTO grade(grade_no, grade_name)
VALUES(2, 'SILVER');
INSERT INTO grade(grade_no, grade_name)
VALUES(3, 'GOLD');
INSERT INTO grade(grade_no, grade_name)
VALUES(4, 'PLATINUM');
INSERT INTO grade(grade_no, grade_name)
VALUES(5, 'VIP');
INSERT INTO grade(grade_no, grade_name)
VALUES(10, '관리자');

1) 등록
INSERT INTO grade(grade_no, grade_name)
VALUES(0, '일반회원');

2) 목록
SELECT grade_no, grade_name
FROM grade
ORDER BY grade_no ASC;

3) 수정
UPDATE grade
SET grade_name='Manager'
WHERE grade_no = 10;

4) 삭제
DELETE FROM grade
WHERE grade_no = 7;

  ----------------DDL-------------------
1). 등급 추가
ALTER TABLE grade
ADD (test VARCHAR(9));
       
2). 등급 속성 수정
ALTER TABLE grade
MODIFY (test VARCHAR(30));

3). 등급명 수정
ALTER TABLE grade
RENAME COLUMN test to test2;

4). 등급 삭제
ALTER TABLE grade
DROP COLUMN test2;

--------------TCL---------------
commit;