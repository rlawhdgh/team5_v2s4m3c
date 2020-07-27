/**********************************/
/* Table Name: ������ */
/**********************************/
DROP TABLE admin;
CREATE TABLE admin(
		admin_no                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		consumer_no                   		NUMBER(10)	UNIQUE  NOT NULL,
  FOREIGN KEY (consumer_no) REFERENCES consumer (consumer_no)
);


    SELECT COUNT(admin_no) as cnt
    FROM admin
    WHERE consumer_no = 2


COMMENT ON TABLE admin is '������';
COMMENT ON COLUMN admin.admin_no is '������ ��ȣ';
COMMENT ON COLUMN admin.consumer_no is 'ȸ����ȣ';

DROP SEQUENCE admin_seq;
CREATE SEQUENCE admin_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

----------------DML-------------------
1) ���
INSERT INTO admin(admin_no, consumer_no)
VALUES(admin_seq.nextval, 15);

INSERT INTO admin(admin_no, consumer_no)
VALUES(admin_seq.nextval, 1);
2) ���
SELECT admin_no, consumer_no
FROM admin
ORDER BY admin_no ASC;

3) ��ȸ
SELECT admin_no, admin_id, admin_passwd
FROM admin
where admin_no = 1

3 -1) ���̵�� ��ȸ
SELECT admin_no, admin_id, admin_passwd
FROM admin
where admin_id = '�ڱټ�';

4) ����
UPDATE admin
SET  admin_id = '������ �̸�', admin_passwd='12345'
WHERE admin_no = 1;

5) ����
DELETE FROM admin
WHERE admin_no = 1;


SELECT COUNT(admin_no) as cnt
FROM admin
WHERE admin_id='�ڱټ�' AND admin_passwd='12345';

--------------TCL---------------
commit;

-------------ȸ����ȣ 0��(������)�� ��ȸ������ ������ ��ȣ���� ����-------------
select ad.admin_no , ad.consumer_no  , cs.consumer_id, cs.consumer_phone_num
from admin ad , consumer cs
where ad.consumer_no = cs.consumer_no
order by ad.admin_no;
-------------ȸ�� ��ȣ�� ������ ��ȣ�� �������°�------------------------------
select ad.admin_no , ad.consumer_no  , cs.consumer_id, cs.consumer_phone_num
from admin ad , consumer cs
where ad.consumer_no = cs.consumer_no
order by ad.admin_no;

    SELECT admin_no, consumer_no
    FROM admin
    WHERE consumer_no = 1;
    
SELECT COUNT(*) as cnt
FROM admin
WHERE consumer_no = 47