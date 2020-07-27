DROP TABLE result;
CREATE TABLE result(
        resultno                           NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		item1no                       		 NUMBER(10)	  NULL,
		item2no                       		 NUMBER(10)		  NULL,
		item3no                       		 NUMBER(10)		  NULL,
		count                         		NUMBER(10)		 NULL 
);

COMMENT ON TABLE result is '설문조사결과';
COMMENT ON COLUMN result.resultno is '결과 번호';
COMMENT ON COLUMN result.item1no is '항목1번호';
COMMENT ON COLUMN result.item2no is '항목2번호';
COMMENT ON COLUMN result.item3no is '항목3번호';
COMMENT ON COLUMN result.count is '투표수';

DROP SEQUENCE result_seq;
CREATE SEQUENCE result_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

 INSERT INTO result(resultno, item1no, item2no, item3no, count)
 VALUES(result_seq.nextval, 1, 1, 1, 1);   
 
     SELECT resultno, item1no, item2no, item3no, count
    FROM result
    WHERE resultno=1
     SELECT resultno, item1no, item2no, item3no, count
    FROM result
    ORDER BY resultno
    
    commit;