/**********************************/
/* Table Name: 로그인 내역 */
/**********************************/
DROP TABLE login;
CREATE TABLE login(
    login_no                           NUMBER(10)     NOT NULL    PRIMARY KEY,
    login_time                         DATE               NOT NULL,
    login_ip                            VARCHAR(100)   NOT NULL,
    consumer_no                     NUMBER(10)     NULL 
);


COMMENT ON TABLE login is '로그인 내역';
COMMENT ON COLUMN login.login_no is '로그인 번호';
COMMENT ON COLUMN login.login_time is '로그인 시간';
COMMENT ON COLUMN login.login_ip is '로그인 ip';
COMMENT ON COLUMN login.consumer_no is '회원번호';

DROP SEQUENCE login_seq;
CREATE SEQUENCE login_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
  
INSERT INTO login(login_no , login_time , consumer_no)
VALUES (login_seq.nextval, SYSDATE,1)

select login_no, login_time, login_ip, consumer_no
from login
order by login_time desc

select login_no, login_time, login_ip,consumer_no
from login
where consumer_no = 1
order by login_time desc;

DELETE FROM login
WHERE  consumer_no = 50;

commit;
