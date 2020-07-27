DROP TABLE admin_login CASCADE CONSTRAINTS;
DROP TABLE login CASCADE CONSTRAINTS;
DROP TABLE admin CASCADE CONSTRAINTS;
DROP TABLE consumer CASCADE CONSTRAINTS;
DROP TABLE grade CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: 회원 등급 */
/**********************************/
CREATE TABLE grade(
		grade_no                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		grade_name                    		VARCHAR2(100)		 NOT NULL
);

COMMENT ON TABLE grade is '회원 등급';
COMMENT ON COLUMN grade.grade_no is '회원등급번호';
COMMENT ON COLUMN grade.grade_name is '회원등급이름';


/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE consumer(
		consumer_no                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		consumer_id                   		VARCHAR2(100)		 NOT NULL,
		consumer_passwd               		VARCHAR2(100)		 NOT NULL,
		consumer_nickname             		VARCHAR2(100)		 NOT NULL,
		consumer_email                		VARCHAR2(100)		 NOT NULL,
		consumer_age                  		VARCHAR2(100)		 NOT NULL,
		consumer_phone_num            		VARCHAR2(100)		 NOT NULL,
		consumer_sex                  		CHAR(10)		 NULL ,
		consumer_pay_num              		VARCHAR2(100)		 NOT NULL,
		consumer_game_tend            		VARCHAR2(100)		 NOT NULL,
		consumer_point                		NUMBER(10)		 DEFAULT 0		 NULL ,
		grade_no                      		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		consumer_key                  		VARCHAR2(100)		 NOT NULL,
  FOREIGN KEY (grade_no) REFERENCES grade (grade_no)
);

COMMENT ON TABLE consumer is '회원';
COMMENT ON COLUMN consumer.consumer_no is '회원번호';
COMMENT ON COLUMN consumer.consumer_id is '회원 아이디';
COMMENT ON COLUMN consumer.consumer_passwd is '회원 비밀번호';
COMMENT ON COLUMN consumer.consumer_nickname is '회원 별칭';
COMMENT ON COLUMN consumer.consumer_email is '회원 이메일';
COMMENT ON COLUMN consumer.consumer_age is '회원 나이';
COMMENT ON COLUMN consumer.consumer_phone_num is '회원 전화번호';
COMMENT ON COLUMN consumer.consumer_sex is '회원 성별';
COMMENT ON COLUMN consumer.consumer_pay_num is '회원 계좌번호';
COMMENT ON COLUMN consumer.consumer_game_tend is '회원 게임성향';
COMMENT ON COLUMN consumer.consumer_point is '회원 포인트';
COMMENT ON COLUMN consumer.grade_no is '회원등급번호';
COMMENT ON COLUMN consumer.consumer_key is '회원 키';


/**********************************/
/* Table Name: 관리자 */
/**********************************/
CREATE TABLE admin(
		admin_no                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		consumer_no                   		NUMBER(10)		 NULL ,
  FOREIGN KEY (consumer_no) REFERENCES consumer (consumer_no)
);

COMMENT ON TABLE admin is '관리자';
COMMENT ON COLUMN admin.admin_no is '관리자 번호';
COMMENT ON COLUMN admin.consumer_no is '회원번호';


/**********************************/
/* Table Name: 로그인 내역 */
/**********************************/
CREATE TABLE login(
		login_no                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		login_time                    		DATE		 NOT NULL,
		consumer_no                   		NUMBER(10)		 NULL ,
  FOREIGN KEY (consumer_no) REFERENCES consumer (consumer_no)
);

COMMENT ON TABLE login is '로그인 내역';
COMMENT ON COLUMN login.login_no is '로그인 번호';
COMMENT ON COLUMN login.login_time is '로그인 시간';
COMMENT ON COLUMN login.consumer_no is '회원번호';


/**********************************/
/* Table Name: 관리자 로그인 내역 */
/**********************************/
CREATE TABLE admin_login(
		admin_login_no                		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		admin_no                      		NUMBER(10)		 NULL ,
		admin_login_time              		DATE		 NOT NULL,
  FOREIGN KEY (admin_no) REFERENCES admin (admin_no)
);

COMMENT ON TABLE admin_login is '관리자 로그인 내역';
COMMENT ON COLUMN admin_login.admin_login_no is '관리자 로그인 번호';
COMMENT ON COLUMN admin_login.admin_no is '관리자 번호';
COMMENT ON COLUMN admin_login.admin_login_time is '관리자 로그인 시간';


