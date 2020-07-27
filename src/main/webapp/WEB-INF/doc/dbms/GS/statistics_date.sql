DROP TABLE allconsumer_date;
CREATE TABLE allconsumer_date(
		allconsumer_date_no                 		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		allconsumer_date_date               		VARCHAR2(100)		 NOT NULL,
		allconsumer_date_cnt              		    NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE allconsumer_date is '��¥�� ȸ���� ������̺�';
COMMENT ON COLUMN allconsumer_date.allconsumer_date_no is '��¥�� ȸ���� ��� ��ȣ';
COMMENT ON COLUMN allconsumer_date.allconsumer_date_date is '��¥';
COMMENT ON COLUMN allconsumer_date.allconsumer_date_cnt is '��¥�� ȸ���� ���';

DROP SEQUENCE allconsumer_date_seq;
CREATE SEQUENCE allconsumer_date_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

update allconsumer_date
set(allconsumer_date_cnt)=(SELECT  COUNT(consumer_no) as consumer_cnt from consumer)
where allconsumer_date_date = TO_CHAR(SYSDATE, 'MM/DD');
-- ��¥�� ȸ���� ���
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
    REPEAT_INTERVAL => 'SYSDATE+1', --���� ��ħ 10�ÿ� 1��
    COMMENTS => '�ⰴü 1'
    );
END;

BEGIN
    DBMS_SCHEDULER.CREATE_JOB
    (
    JOB_NAME => 'EX_JOB1',
    JOB_TYPE => 'STORED_PROCEDURE',
    JOB_ACTION => 'EX_PROC1',
    start_date  => SYSDATE,
    REPEAT_INTERVAL => 'freq=minutely ; interval=1',  --1�и��� 1���� ����
    COMMENTS => '�ⰴü 2'
    );
END;
-- �� ����
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

--JOB1 ����
BEGIN
    DBMS_SCHEDULER.ENABLE ('EX_JOB');
END;
--JOB1 ����
BEGIN
    DBMS_SCHEDULER.disable ('EX_JOB');
END;
--JOB1 ����
BEGIN
    DBMS_SCHEDULER.ENABLE ('EX_JOB1');
END;
--JOB1 ����
BEGIN
    DBMS_SCHEDULER.disable ('EX_JOB1');
END;
-- ����, �����
EXECUTE DBMS_JOB.BROKEN(1, TRUE);
EXECUTE DBMS_JOB.BROKEN(1,FALSE);

SELECT job, last_date, last_sec, next_date, next_sec, broken, interval, failures, what
FROM   USER_SCHEDULER_JOBS;
--DBMS_JOB.SUBMIT -> JOB ���
--DBMS_JOB.REMOVE -> ����
--DBMS_JOB.CHANGE ->  ����
--DBMS_JOB.NEXT_DATE -> JOB�� ���� ����ð� ����
--DBMS_JOB.INTERVAL -> JOB�� ���� CYCLE ����
--DBMS_JOB.WHAT -> JOB ���� ���� ��ϵ� OBJECT �� ����
--DBMS_JOB.RUN -> JOB�� �������� ���� ����


SELECT * FROM USER_SCHEDULER_JOB_LOG;

SELECT * FROM USER_SCHEDULER_JOB_RUN_DETAILS order by actual_start_date desc;

select pkg_test.get_list('01') dataset from dual;

DELETE FROM USER_SCHEDULER_JOB_LOG 

commit;
