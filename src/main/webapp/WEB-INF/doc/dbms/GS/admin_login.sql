/**********************************/
/* Table Name: 관리자 로그인 내역 */
/**********************************/
drop table admin_login;
CREATE TABLE admin_login(
    admin_login_no                    NUMBER(10)     NOT NULL    PRIMARY KEY,
    admin_no                          NUMBER(10)     NULL ,
    admin_login_time                  DATE     NOT NULL,
  FOREIGN KEY (admin_no) REFERENCES admin (admin_no)
);

COMMENT ON TABLE admin_login is '관리자 로그인 내역';
COMMENT ON COLUMN admin_login.admin_login_no is '관리자 로그인 번호';
COMMENT ON COLUMN admin_login.admin_no is '관리자 번호';
COMMENT ON COLUMN admin_login.admin_login_time is '관리자 로그인 시간';

----------------DML-------------------
1) 등록
INSERT INTO admin(admin_no, admin_id, admin_passwd)
VALUES(admin_seq.nextval, '왕눈이10', '1234');

2) 목록
SELECT admin_no, admin_id, admin_passwd
FROM admin
ORDER BY admin_no ASC;

3) 조회
SELECT admin_no, admin_id, admin_passwd
FROM admin
where admin_no = 1

4) 수정
UPDATE admin
SET  admin_id = '수정된 이름', admin_passwd='12345'
WHERE admin_no = 1;

5) 삭제
DELETE FROM admin
WHERE admin_no = 1;


--------------TCL---------------
commit;

