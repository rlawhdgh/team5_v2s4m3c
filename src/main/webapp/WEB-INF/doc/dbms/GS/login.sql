/**********************************/
/* Table Name: �α��� ���� */
/**********************************/
DROP TABLE login;
CREATE TABLE login(
    login_no                           NUMBER(10)     NOT NULL    PRIMARY KEY,
    login_time                         DATE               NOT NULL,
    login_ip                            VARCHAR(100)   NOT NULL,
    consumer_no                     NUMBER(10)     NULL 
);


COMMENT ON TABLE login is '�α��� ����';
COMMENT ON COLUMN login.login_no is '�α��� ��ȣ';
COMMENT ON COLUMN login.login_time is '�α��� �ð�';
COMMENT ON COLUMN login.login_ip is '�α��� ip';
COMMENT ON COLUMN login.consumer_no is 'ȸ����ȣ';

DROP SEQUENCE login_seq;
CREATE SEQUENCE login_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
  
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
