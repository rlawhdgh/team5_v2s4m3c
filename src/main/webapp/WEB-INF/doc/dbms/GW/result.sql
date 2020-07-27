DROP TABLE result;
CREATE TABLE result(
        resultno                           NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		item1no                       		 NUMBER(10)	  NULL,
		item2no                       		 NUMBER(10)		  NULL,
		item3no                       		 NUMBER(10)		  NULL,
		count                         		NUMBER(10)		 NULL 
);

COMMENT ON TABLE result is '����������';
COMMENT ON COLUMN result.resultno is '��� ��ȣ';
COMMENT ON COLUMN result.item1no is '�׸�1��ȣ';
COMMENT ON COLUMN result.item2no is '�׸�2��ȣ';
COMMENT ON COLUMN result.item3no is '�׸�3��ȣ';
COMMENT ON COLUMN result.count is '��ǥ��';

DROP SEQUENCE result_seq;
CREATE SEQUENCE result_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

 INSERT INTO result(resultno, item1no, item2no, item3no, count)
 VALUES(result_seq.nextval, 1, 1, 1, 1);   
 
     SELECT resultno, item1no, item2no, item3no, count
    FROM result
    WHERE resultno=1
     SELECT resultno, item1no, item2no, item3no, count
    FROM result
    ORDER BY resultno
    
    commit;