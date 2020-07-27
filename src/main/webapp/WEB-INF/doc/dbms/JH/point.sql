/**********************************/
/* Table Name: ���系�� */
/**********************************/
DROP TABLE point;
CREATE TABLE point(
		point_pointno                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		point_now                  		NUMBER(10)		 NOT NULL,
		consumer_no                   		NUMBER(10)		 NULL ,
  FOREIGN KEY (consumer_no) REFERENCES consumer (consumer_no)
);

COMMENT ON TABLE point is '����Ʈ';
COMMENT ON COLUMN point.point_pointno is '����Ʈ ��ȣ';
COMMENT ON COLUMN point.point_now is '��������Ʈ';
COMMENT ON COLUMN point.consumer_no is 'ȸ����ȣ';

DROP SEQUENCE point_seq;
CREATE SEQUENCE point_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
INSERT INTO  point(point_pointno, point_now, consumer_no)
VALUES(point_seq.nextval, 5000, 1);

SELECT point_pointno, point_now, consumer_no
FROM point
ORDER BY point_pointno ASC;

SELECT point_pointno, point_now, consumer_no
FROM point
WHERE consumer_no = 1;

UPDATE point
SET point_now = 2000
WHERE consumer_no = 1;

commit;

DELETE point;

UPDATE categrp
SET name='��ȭ'
WHERE categrpno=1;



commit;







