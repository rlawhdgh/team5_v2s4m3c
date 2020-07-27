DROP TABLE admin_login CASCADE CONSTRAINTS;
DROP TABLE login CASCADE CONSTRAINTS;
DROP TABLE admin CASCADE CONSTRAINTS;
DROP TABLE consumer CASCADE CONSTRAINTS;
DROP TABLE grade CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: ȸ�� ��� */
/**********************************/
CREATE TABLE grade(
		grade_no                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		grade_name                    		VARCHAR2(100)		 NOT NULL
);

COMMENT ON TABLE grade is 'ȸ�� ���';
COMMENT ON COLUMN grade.grade_no is 'ȸ����޹�ȣ';
COMMENT ON COLUMN grade.grade_name is 'ȸ������̸�';


/**********************************/
/* Table Name: ȸ�� */
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

COMMENT ON TABLE consumer is 'ȸ��';
COMMENT ON COLUMN consumer.consumer_no is 'ȸ����ȣ';
COMMENT ON COLUMN consumer.consumer_id is 'ȸ�� ���̵�';
COMMENT ON COLUMN consumer.consumer_passwd is 'ȸ�� ��й�ȣ';
COMMENT ON COLUMN consumer.consumer_nickname is 'ȸ�� ��Ī';
COMMENT ON COLUMN consumer.consumer_email is 'ȸ�� �̸���';
COMMENT ON COLUMN consumer.consumer_age is 'ȸ�� ����';
COMMENT ON COLUMN consumer.consumer_phone_num is 'ȸ�� ��ȭ��ȣ';
COMMENT ON COLUMN consumer.consumer_sex is 'ȸ�� ����';
COMMENT ON COLUMN consumer.consumer_pay_num is 'ȸ�� ���¹�ȣ';
COMMENT ON COLUMN consumer.consumer_game_tend is 'ȸ�� ���Ӽ���';
COMMENT ON COLUMN consumer.consumer_point is 'ȸ�� ����Ʈ';
COMMENT ON COLUMN consumer.grade_no is 'ȸ����޹�ȣ';
COMMENT ON COLUMN consumer.consumer_key is 'ȸ�� Ű';


/**********************************/
/* Table Name: ������ */
/**********************************/
CREATE TABLE admin(
		admin_no                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		consumer_no                   		NUMBER(10)		 NULL ,
  FOREIGN KEY (consumer_no) REFERENCES consumer (consumer_no)
);

COMMENT ON TABLE admin is '������';
COMMENT ON COLUMN admin.admin_no is '������ ��ȣ';
COMMENT ON COLUMN admin.consumer_no is 'ȸ����ȣ';


/**********************************/
/* Table Name: �α��� ���� */
/**********************************/
CREATE TABLE login(
		login_no                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		login_time                    		DATE		 NOT NULL,
		consumer_no                   		NUMBER(10)		 NULL ,
  FOREIGN KEY (consumer_no) REFERENCES consumer (consumer_no)
);

COMMENT ON TABLE login is '�α��� ����';
COMMENT ON COLUMN login.login_no is '�α��� ��ȣ';
COMMENT ON COLUMN login.login_time is '�α��� �ð�';
COMMENT ON COLUMN login.consumer_no is 'ȸ����ȣ';


/**********************************/
/* Table Name: ������ �α��� ���� */
/**********************************/
CREATE TABLE admin_login(
		admin_login_no                		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		admin_no                      		NUMBER(10)		 NULL ,
		admin_login_time              		DATE		 NOT NULL,
  FOREIGN KEY (admin_no) REFERENCES admin (admin_no)
);

COMMENT ON TABLE admin_login is '������ �α��� ����';
COMMENT ON COLUMN admin_login.admin_login_no is '������ �α��� ��ȣ';
COMMENT ON COLUMN admin_login.admin_no is '������ ��ȣ';
COMMENT ON COLUMN admin_login.admin_login_time is '������ �α��� �ð�';


