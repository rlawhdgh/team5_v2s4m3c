/**********************************/
/* Table Name: ������������ */
/**********************************/
DROP TABLE save CASCADE CONSTRAINTS;
CREATE TABLE save(
		makeno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		survey_cateno                 		NUMBER(10)		 NULL ,
		question                      		VARCHAR2(200)		 NOT NULL,
        item1                   		VARCHAR2(200)		 NOT NULL,
        item2                   		VARCHAR2(200)		 NOT NULL,
        item3                   		VARCHAR2(200)		 NOT NULL,
        period                 		NUMBER(10)		 NOT NULL,
		wdate                         		DATE		 NOT NULL,
        word                          		VARCHAR2(300)		 NULL ,
        cnt                    		NUMBER(10)		 NULL ,
        vote                        NUMBER(10)         NULL,
        passwd                     VARCHAR2(15)		 NOT NULL,

  FOREIGN KEY (survey_cateno) REFERENCES survey_cate (survey_cateno)
);

COMMENT ON TABLE save is '������������';
COMMENT ON COLUMN save.makeno is '���������Ϲ�ȣ';
COMMENT ON COLUMN save.survey_cateno is 'ī�װ� ��ȣ';
COMMENT ON COLUMN save.question is '��������';
COMMENT ON COLUMN save.item1 is '�����׸�1';
COMMENT ON COLUMN save.item2 is '�����׸�2';
COMMENT ON COLUMN save.item3 is '�����׸�3';
COMMENT ON COLUMN save.period is '�����Ⱓ';
COMMENT ON COLUMN save.wdate is '��ϳ�¥';
COMMENT ON COLUMN save.word is '�˻���';
COMMENT ON COLUMN save.cnt is '��ȸ��';
COMMENT ON COLUMN save.vote is '�� ��ǥ��';

CREATE SEQUENCE save_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
   INSERT INTO save(makeno,  survey_cateno, question, sdate, edate, wdate, type, active, word, cnt)
   VALUES(save_seq.nextval, 9 ,'ġŲ', 2020-01-20, 0);


    SELECT makeno, survey_cateno, question, item1, item2, item3, period, wdate, cnt
    FROM save 
    WHERE survey_cateno = 11
    ORDER BY makeno DESC
