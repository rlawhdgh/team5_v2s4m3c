/**********************************/
/* Table Name: 회원 */
/**********************************/
DROP TABLE consumer;
CREATE TABLE consumer(
		consumer_no                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE consumer is '회원';
COMMENT ON COLUMN consumer.consumer_no is '회원번호';


/**********************************/
/* Table Name: 관리자 */
/**********************************/
DROP TABLE admin;
CREATE TABLE admin(
		admin_no                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE admin is '관리자';
COMMENT ON COLUMN admin.admin_no is '관리자 번호';


/**********************************/
/* Table Name: 로그인 내역 */
/**********************************/
DROP TABLE login;
CREATE TABLE login(
		login_no                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE login is '로그인 내역';
COMMENT ON COLUMN login.login_no is '로그인 번호';


/**********************************/
/* Table Name: 관리자 로그인 내역 */
/**********************************/
DROP TABLE admin_login;
CREATE TABLE admin_login(
		admin_login_no                		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE admin_login is '관리자 로그인 내역';
COMMENT ON COLUMN admin_login.admin_login_no is '관리자 로그인 번호';


/**********************************/
/* Table Name: 권한 */
/**********************************/
DROP TABLE authority;
CREATE TABLE authority(
		authority_no                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE authority is '권한';
COMMENT ON COLUMN authority.authority_no is '권한 번호';


/**********************************/
/* Table Name: 회원 등급 */
/**********************************/
DROP TABLE grade;
CREATE TABLE grade(
		grade_no                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE grade is '회원 등급';
COMMENT ON COLUMN grade.grade_no is '등급번호';


