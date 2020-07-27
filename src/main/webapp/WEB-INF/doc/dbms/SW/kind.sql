/**********************************/
/* Table Name: ī�װ� �׷� */
/**********************************/
DROP TABLE admin;
CREATE TABLE admin(
admin_no  NUMBER(10)       NOT NULL        PRIMARY KEY
);

INSERT INTO admin(admin_no)
VALUES(1);

DROP TABLE kind;
CREATE TABLE kind(
    kind_kindno                             NUMBER(10)       NOT NULL        PRIMARY KEY,
    consumer_no                                NUMBER(10)       NOT NULL,
    kind_kindname                            VARCHAR(50)    NOT NULL, 
    kind_kindseqno                             NUMBER(7)    DEFAULT 0     NOT NULL,
    kind_kindrdate  DATE     NOT NULL,
    FOREIGN KEY (consumer_no) REFERENCES consumer(consumer_no)
);

COMMENT ON TABLE kind is '���� ī�װ�';
COMMENT ON COLUMN kind.kind_kindno is '���� ������ȣ';
COMMENT ON COLUMN kind.consumer_no is 'ȸ����ȣ';
COMMENT ON COLUMN kind.kind_kindname is '���� �帣';
COMMENT ON COLUMN kind.kind_kindseqno is '��� ����';
COMMENT ON COLUMN kind.kind_kindrdate is '�׷� ������';


DROP SEQUENCE kind_seq;
CREATE SEQUENCE kind_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
 
-- insert
INSERT INTO kind(kind_kindno,consumer_no, kind_kindname,kind_kindseqno,kind_kindrdate)
VALUES(1,1, 'SF', 1, sysdate);
 
INSERT INTO kind(kind_kindno,consumer_no, kind_kindname,kind_kindseqno,kind_kindrdate)
VALUES(kind_seq.nextval,1, '����', 2, sysdate);

commit;

-- list
SELECT kind_kindno, kind_kindname, kind_kindseqno, kind_kindrdate
FROM kind
ORDER BY kind_kindno ASC;

-- ����
UPDATE kind
SET kind_kindno='�����̵�', kind_kindseqno = 10
WHERE kind_kindno = 1;

commit;

-- 1�� ���ڵ� ����
DELETE FROM kind
WHERE kind_kindno=4;

DELETE FROM list
WHERE kind_kindno=4;


-- ��� ���� ����, 10 �� 1
UPDATE kind
SET kind_kindseqno = kind_kindseqno - 1
WHERE kind_kindno=1;
 
-- ��¼��� ����, 1 �� 10
UPDATE kind
SET kind_kindseqno = kind_kindseqno + 1
WHERE kind_kindno=1;
