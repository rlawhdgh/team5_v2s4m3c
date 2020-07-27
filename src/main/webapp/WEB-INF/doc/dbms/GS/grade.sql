/**********************************/
/* Table Name: ȸ�� ��� */
/**********************************/
DROP TABLE grade;
CREATE TABLE grade(
		grade_no                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		grade_name                    		VARCHAR2(100)		 NOT NULL
);

COMMENT ON TABLE grade is 'ȸ�� ���';
COMMENT ON COLUMN grade.grade_no is 'ȸ����޹�ȣ';
COMMENT ON COLUMN grade.grade_name is 'ȸ������̸�';

DROP SEQUENCE grade_seq;
CREATE SEQUENCE grade_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
  ----------------DML-------------------
1) ���
INSERT INTO grade(grade_no, grade_name)
VALUES(0, '�Ϲ�ȸ��');
INSERT INTO grade(grade_no, grade_name)
VALUES(1, 'BRONZE');
INSERT INTO grade(grade_no, grade_name)
VALUES(2, 'SILVER');
INSERT INTO grade(grade_no, grade_name)
VALUES(3, 'GOLD');
INSERT INTO grade(grade_no, grade_name)
VALUES(4, 'PLATINUM');
INSERT INTO grade(grade_no, grade_name)
VALUES(5, 'VIP');
INSERT INTO grade(grade_no, grade_name)
VALUES(10, '������');

1) ���
INSERT INTO grade(grade_no, grade_name)
VALUES(0, '�Ϲ�ȸ��');

2) ���
SELECT grade_no, grade_name
FROM grade
ORDER BY grade_no ASC;

3) ����
UPDATE grade
SET grade_name='Manager'
WHERE grade_no = 10;

4) ����
DELETE FROM grade
WHERE grade_no = 7;

  ----------------DDL-------------------
1). ��� �߰�
ALTER TABLE grade
ADD (test VARCHAR(9));
       
2). ��� �Ӽ� ����
ALTER TABLE grade
MODIFY (test VARCHAR(30));

3). ��޸� ����
ALTER TABLE grade
RENAME COLUMN test to test2;

4). ��� ����
ALTER TABLE grade
DROP COLUMN test2;

--------------TCL---------------
commit;