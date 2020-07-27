DROP TABLE allconsumer_date;
CREATE TABLE allconsumer_date(
		allconsumer_date_no                 		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		allconsumer_date_date               		VARCHAR2(100)		 NOT NULL,
		allconsumer_date_cnt              		    NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE allconsumer_date is '날짜별 회원수 통계테이블';
COMMENT ON COLUMN allconsumer_date.allconsumer_date_no is '날짜별 회원수 통계 번호';
COMMENT ON COLUMN allconsumer_date.allconsumer_date_date is '날짜';
COMMENT ON COLUMN allconsumer_date.allconsumer_date_cnt is '날짜별 회원수 통계';

DROP SEQUENCE allconsumer_date_seq;
CREATE SEQUENCE allconsumer_date_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

update allconsumer_date
set(allconsumer_date_cnt)=(SELECT  COUNT(consumer_no) as consumer_cnt from consumer)
where allconsumer_date_date = TO_CHAR(SYSDATE, 'MM/DD');
-- 날짜별 회원수 등록
INSERT INTO allconsumer_date(allconsumer_date_no, allconsumer_date_date, allconsumer_date_cnt)
VALUES(allconsumer_date_seq.nextval, TO_CHAR(SYSDATE, 'MM/DD'), (SELECT  COUNT(consumer_no) as allconsumer_date_cnt from consumer));      
--TO_CHAR(SYSDATE, 'MM/DD')

update allconsumer_date

INSERT INTO allconsumer_date(allconsumer_date_no, allconsumer_date_date, allconsumer_date_cnt)
VALUES(allconsumer_date_seq.nextval, '07/21', 29);      
--TO_CHAR(SYSDATE, 'MM/DD')


DELETE FROM allconsumer_date where allconsumer_date_no = 71;

select allconsumer_date_no, allconsumer_date_date, allconsumer_date_cnt
from allconsumer_date
order by allconsumer_date_date desc;

select allconsumer_date_date, allconsumer_date_cnt
from allconsumer_date
order by allconsumer_date_date desc;

grant create any job to ai6 ;

BEGIN
    DBMS_SCHEDULER.CREATE_JOB
    (
    JOB_NAME => 'EX_JOB',
    JOB_TYPE => 'STORED_PROCEDURE',
    JOB_ACTION => 'EX_PROC',
    start_date           => TO_DATE('2020-07-16 10:03:00' , 'YYYY-MM-DD HH24:MI:SS'),
    REPEAT_INTERVAL => 'SYSDATE+1', --매일 아침 10시에 1번
    COMMENTS => '잡객체 1'
    );
END;

BEGIN
    DBMS_SCHEDULER.CREATE_JOB
    (
    JOB_NAME => 'EX_JOB1',
    JOB_TYPE => 'STORED_PROCEDURE',
    JOB_ACTION => 'EX_PROC1',
    start_date  => SYSDATE,
    REPEAT_INTERVAL => 'freq=minutely ; interval=1',  --1분마다 1번씩 실행
    COMMENTS => '잡객체 2'
    );
END;
-- 잡 삭제
begin
  dbms_scheduler.drop_job('EX_JOB');
end;
begin
  dbms_scheduler.drop_job('EX_JOB1');
end;


SELECT 
*
FROM 
USER_SCHEDULER_JOBS 

--JOB1 시작
BEGIN
    DBMS_SCHEDULER.ENABLE ('EX_JOB');
END;
--JOB1 중지
BEGIN
    DBMS_SCHEDULER.disable ('EX_JOB');
END;
--JOB1 시작
BEGIN
    DBMS_SCHEDULER.ENABLE ('EX_JOB1');
END;
--JOB1 중지
BEGIN
    DBMS_SCHEDULER.disable ('EX_JOB1');
END;
-- 중지, 재시작
EXECUTE DBMS_JOB.BROKEN(1, TRUE);
EXECUTE DBMS_JOB.BROKEN(1,FALSE);

SELECT job, last_date, last_sec, next_date, next_sec, broken, interval, failures, what
FROM   USER_SCHEDULER_JOBS;
--DBMS_JOB.SUBMIT -> JOB 등록
--DBMS_JOB.REMOVE -> 제거
--DBMS_JOB.CHANGE ->  변경
--DBMS_JOB.NEXT_DATE -> JOB의 다음 수행시간 변경
--DBMS_JOB.INTERVAL -> JOB의 실행 CYCLE 지정
--DBMS_JOB.WHAT -> JOB 수행 으로 등록된 OBJECT 를 변경
--DBMS_JOB.RUN -> JOB을 수동으로 강제 실행


SELECT * FROM USER_SCHEDULER_JOB_LOG;

SELECT * FROM USER_SCHEDULER_JOB_RUN_DETAILS order by actual_start_date desc;

select pkg_test.get_list('01') dataset from dual;

DELETE FROM USER_SCHEDULER_JOB_LOG 

commit;
