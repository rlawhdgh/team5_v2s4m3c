/**********************************/
/* Table Name: ȸ�� */
/**********************************/
DROP TABLE consumer;
CREATE TABLE consumer(
		consumer_no                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE consumer is 'ȸ��';
COMMENT ON COLUMN consumer.consumer_no is 'ȸ����ȣ';


/**********************************/
/* Table Name: ������ */
/**********************************/
DROP TABLE admin;
CREATE TABLE admin(
		admin_no                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE admin is '������';
COMMENT ON COLUMN admin.admin_no is '������ ��ȣ';


/**********************************/
/* Table Name: �α��� ���� */
/**********************************/
DROP TABLE login;
CREATE TABLE login(
		login_no                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE login is '�α��� ����';
COMMENT ON COLUMN login.login_no is '�α��� ��ȣ';


/**********************************/
/* Table Name: ������ �α��� ���� */
/**********************************/
DROP TABLE admin_login;
CREATE TABLE admin_login(
		admin_login_no                		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE admin_login is '������ �α��� ����';
COMMENT ON COLUMN admin_login.admin_login_no is '������ �α��� ��ȣ';


/**********************************/
/* Table Name: ���� */
/**********************************/
DROP TABLE authority;
CREATE TABLE authority(
		authority_no                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE authority is '����';
COMMENT ON COLUMN authority.authority_no is '���� ��ȣ';


/**********************************/
/* Table Name: ȸ�� ��� */
/**********************************/
DROP TABLE grade;
CREATE TABLE grade(
		grade_no                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE grade is 'ȸ�� ���';
COMMENT ON COLUMN grade.grade_no is '��޹�ȣ';


