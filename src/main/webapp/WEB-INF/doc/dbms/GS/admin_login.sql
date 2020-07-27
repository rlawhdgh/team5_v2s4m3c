/**********************************/
/* Table Name: ������ �α��� ���� */
/**********************************/
drop table admin_login;
CREATE TABLE admin_login(
    admin_login_no                    NUMBER(10)     NOT NULL    PRIMARY KEY,
    admin_no                          NUMBER(10)     NULL ,
    admin_login_time                  DATE     NOT NULL,
  FOREIGN KEY (admin_no) REFERENCES admin (admin_no)
);

COMMENT ON TABLE admin_login is '������ �α��� ����';
COMMENT ON COLUMN admin_login.admin_login_no is '������ �α��� ��ȣ';
COMMENT ON COLUMN admin_login.admin_no is '������ ��ȣ';
COMMENT ON COLUMN admin_login.admin_login_time is '������ �α��� �ð�';

----------------DML-------------------
1) ���
INSERT INTO admin(admin_no, admin_id, admin_passwd)
VALUES(admin_seq.nextval, '�մ���10', '1234');

2) ���
SELECT admin_no, admin_id, admin_passwd
FROM admin
ORDER BY admin_no ASC;

3) ��ȸ
SELECT admin_no, admin_id, admin_passwd
FROM admin
where admin_no = 1

4) ����
UPDATE admin
SET  admin_id = '������ �̸�', admin_passwd='12345'
WHERE admin_no = 1;

5) ����
DELETE FROM admin
WHERE admin_no = 1;


--------------TCL---------------
commit;

