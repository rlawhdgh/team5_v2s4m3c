/**********************************/
/* Table Name: �������� ī�װ� �׷� */
/**********************************/
DROP TABLE survey_categrp CASCADE CONSTRAINTS;
CREATE TABLE Survey_categrp(
		survey_categrpno              		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		survey_name                   		VARCHAR2(50)		 NOT NULL,
		survey_seqno                  		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		survey_rdate                  		DATE		 NOT NULL
 
);


COMMENT ON TABLE survey_categrp is 'ī�װ� �׷�';
COMMENT ON COLUMN survey_categrp.survey_categrpno is 'ī�װ� �׷� ��ȣ';
COMMENT ON COLUMN survey_categrp.survey_name is '�̸�';
COMMENT ON COLUMN survey_categrp.survey_seqno is '��� ����';
COMMENT ON COLUMN survey_categrp.survey_rdate is '�׷� ������';



DROP SEQUENCE survey_categrp_seq;
CREATE SEQUENCE survey_categrp_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

-- ���
INSERT INTO survey_categrp(survey_categrpno, survey_name, survey_seqno, survey_rdate)
VALUES(survey_categrp_seq.nextval, '����', 1, sysdate);

-- list
SELECT survey_categrpno, survey_name, survey_seqno, survey_rdate
FROM survey_categrp
ORDER BY survey_categrpno ASC;

-- read
SELECT survey_categrpno, survey_name, survey_seqno, survey_rdate
FROM survey_categrp
WHERE survey_categrpno=7;

-- update
UPDATE survey_categrp
SET survey_name='�Ĵ�'
WHERE survey_categrpno = 2

-- delete
DELETE FROM survey_categrp
WHERE survey_categrpno=1;

-- ���ڵ� ����
SELECT COUNT(*) as cnt
FROM survey_categrp;

commit;