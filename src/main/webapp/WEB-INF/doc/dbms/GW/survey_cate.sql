
/**********************************/
/* Table Name: ī�װ� */
/**********************************/
CREATE TABLE survey_cate(
		survey_cateno                 		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		survey_categrpno              		NUMBER(10)	NOT	 NULL ,
		survey_name                   		VARCHAR2(100)		 NOT NULL,
		survey_rdate                  		DATE		 NOT NULL,
		survey_cnt                    		NUMBER(10)		 DEFAULT 0		 NOT NULL,
  FOREIGN KEY (survey_categrpno) REFERENCES survey_categrp (survey_categrpno)
);

COMMENT ON TABLE survey_cate is 'ī�װ�';
COMMENT ON COLUMN survey_cate.survey_cateno is 'ī�װ� ��ȣ';
COMMENT ON COLUMN survey_cate.survey_categrpno is '�׷��ȣ';
COMMENT ON COLUMN survey_cate.survey_name is 'ī�װ� �̸�';
COMMENT ON COLUMN survey_cate.survey_rdate is '�����';
COMMENT ON COLUMN survey_cate.survey_cnt is '��ϵ� �� ��';

DROP SEQUENCE survey_cate_seq;
CREATE SEQUENCE survey_cate_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

   INSERT INTO survey_cate(survey_cateno, survey_categrpno, survey_name, survey_rdate, survey_cnt)
   VALUES(survey_cate_seq.nextval, 2 ,'ġŲ', sysdate, 0);



