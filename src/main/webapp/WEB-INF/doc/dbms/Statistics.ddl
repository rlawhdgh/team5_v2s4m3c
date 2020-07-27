/**********************************/
/* Table Name: ������̺� */
/**********************************/
DROP TABLE statistics;
CREATE TABLE statistics(
		statistics_no                 		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		statistics_code               		VARCHAR2(10)		 NOT NULL,
		statistics_title              		VARCHAR2(100)		 NOT NULL,
		statistics_data               		VARCHAR2(500)		 NOT NULL,
		statistics_rdate              		DATE		 NOT NULL
);

COMMENT ON TABLE statistics is '������̺�';
COMMENT ON COLUMN statistics.statistics_no is '�ð�ȭ ������ ��ȣ';
COMMENT ON COLUMN statistics.statistics_code is '�ڵ�';
COMMENT ON COLUMN statistics.statistics_title is '����';
COMMENT ON COLUMN statistics.statistics_data is '������';
COMMENT ON COLUMN statistics.statistics_rdate is '�����';

INSERT INTO statistics (statistics_no, statistics_code, statistics_title, data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'BAR', '�����', '"abc"', sysdate);

SELECT * FROM statistics;

-- X
INSERT INTO statistics (statistics_no, statistics_code, statistics_title, data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'BAR', '�����', "''abc''", sysdate);

-- O
INSERT INTO statistics (statistics_no, statistics_code, statistics_title, data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'BAR', '�����', '''abc''', sysdate);
SELECT * FROM statistics;

-- X
INSERT INTO statistics (statistics_no, statistics_code, statistics_title, statistics_data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'BAR', '�����', '\'abc\'', sysdate);
SELECT * FROM statistics;

-- O
INSERT INTO statistics (statistics_no, statistics_code, statistics_title, statistics_data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'BAR', '�����', q'$'abc'$', sysdate);
SELECT * FROM statistics;

-- O
INSERT INTO statistics (statistics_no, statistics_code, statistics_title, statistics_data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'BAR', '�����', q'$"abc"$', sysdate);
SELECT * FROM statistics;

SELECT statistics_no, statistics_code, statistics_title, statistics_data, statistics_rdate
FROM statistics
WHERE statistics_code='BAR'
ORDER BY statisticsno ASC;

--  subquery�� �̿��� �ֱ� ��� ������ ���  --> ��� xml�� ��� �κ�.
SELECT statistics_no, statistics_code, statistics_title, statistics_data, statistics_rdate, r
FROM (
    SELECT statistics_no, statistics_code, statistics_title, statistics_data, statistics_rdate, rownum as r
    FROM (
        SELECT statistics_no, statistics_code, statistics_title, statistics_data, statistics_rdate
        FROM statistics
        WHERE statistics_code='BAR'
        ORDER BY statistics_no DESC
    )
)
WHERE r = 1;

DELETE FROM statistics;
COMMIT;

-- �ɼ��� �߰��� ���� �׷���
INSERT INTO statistics (statistics_no, statistics_code, statistics_title, statistics_data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'LINE', '�ɼ��� �߰��� ���� �׷���', q'$[[10,20,30,40,50,300,200],[25,32,45,53,65,270,150]]$', sysdate);
SELECT * FROM statistics;

-- Tcik�� �ִ� ���� �׷���
INSERT INTO statistics (statistics_no, statistics_code, statistics_title, statistics_data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'LINE', 'Tcik�� �ִ� ���� �׷���', q'$[[['1��', 300], ['2��', 52], ['3��', 38], ['4��', 30], ['5��', 0]]]$', sysdate);
SELECT * FROM statistics;

-- ���� �׷��� �⺻
INSERT INTO statistics (statistics_no, statistics_code, statistics_title, statistics_data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'BAR1', '���� �׷��� �⺻', q'$[['����', 4],['����', 6],['������', 2],['�ƿ��', 5],['�ΰ�Ƽ', 6]]$', sysdate);
SELECT * FROM statistics;
    
-- ���� �׷��� 2 ����, ���� ������ '/'
INSERT INTO statistics (statistics_no, statistics_code, statistics_title, statistics_data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'BAR2', '���� �׷��� 2 ����', q'$[9, 8, 6, 8, 7, 6, 4]/[2, 3, 4, 10, 8, 5, 1]$', sysdate);
SELECT * FROM statistics;

-- ���� �׷����� ������ �׷����� ����
INSERT INTO statistics (statistics_no, statistics_code, statistics_title, statistics_data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'BAR3', '���� �׷����� ������ �׷����� ����', q'$[9, 8, 6, 8, 7, 6, 4]/[2, 3, 4, 10, 8, 5, 1]$', sysdate);
SELECT * FROM statistics;

-- ���� �׷��� �� ���
INSERT INTO statistics (statistics_no, statistics_code, statistics_title, statistics_data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'BAR4', '���� �׷��� �� ���', q'$[14, 32, 41, 44, 40, 37, 29]$', sysdate);
SELECT * FROM statistics;

update statistics
set statistics_data = q'$[30, 32, 41, 44, 40, 37, 29]$'
where statistics_no = 6

-- ���� �׷���
INSERT INTO statistics (statistics_no, statistics_code, statistics_title, statistics_data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'PIE', '���� �׷���', q'$[[['1/4 �б�', 50], ['2/4 �б�', 22], ['3/4 �б�', 38], ['4/4 �б�', 30]]]$', sysdate);
SELECT * FROM statistics;

-- Meter gauge
INSERT INTO statistics (statistics_no, statistics_code, statistics_title, statistics_data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'METER', 'Meter gauge', q'$322$', sysdate);
SELECT * FROM statistics;

COMMIT;

-- �ڵ� ���ΰ�ħ Ȯ�� ������
INSERT INTO statistics (statistics_no, statistics_code, statistics_title, statistics_data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'METER', 'Meter gauge', q'$320$', sysdate);

COMMIT;

