/**********************************/
/* Table Name: 통계테이블 */
/**********************************/
DROP TABLE statistics;
CREATE TABLE statistics(
		statistics_no                 		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		statistics_code               		VARCHAR2(10)		 NOT NULL,
		statistics_title              		VARCHAR2(100)		 NOT NULL,
		statistics_data               		VARCHAR2(500)		 NOT NULL,
		statistics_rdate              		DATE		 NOT NULL
);

COMMENT ON TABLE statistics is '통계테이블';
COMMENT ON COLUMN statistics.statistics_no is '시각화 데이터 번호';
COMMENT ON COLUMN statistics.statistics_code is '코드';
COMMENT ON COLUMN statistics.statistics_title is '제목';
COMMENT ON COLUMN statistics.statistics_data is '데이터';
COMMENT ON COLUMN statistics.statistics_rdate is '등록일';

INSERT INTO statistics (statistics_no, statistics_code, statistics_title, data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'BAR', '매출액', '"abc"', sysdate);

SELECT * FROM statistics;

-- X
INSERT INTO statistics (statistics_no, statistics_code, statistics_title, data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'BAR', '매출액', "''abc''", sysdate);

-- O
INSERT INTO statistics (statistics_no, statistics_code, statistics_title, data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'BAR', '매출액', '''abc''', sysdate);
SELECT * FROM statistics;

-- X
INSERT INTO statistics (statistics_no, statistics_code, statistics_title, statistics_data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'BAR', '매출액', '\'abc\'', sysdate);
SELECT * FROM statistics;

-- O
INSERT INTO statistics (statistics_no, statistics_code, statistics_title, statistics_data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'BAR', '매출액', q'$'abc'$', sysdate);
SELECT * FROM statistics;

-- O
INSERT INTO statistics (statistics_no, statistics_code, statistics_title, statistics_data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'BAR', '매출액', q'$"abc"$', sysdate);
SELECT * FROM statistics;

SELECT statistics_no, statistics_code, statistics_title, statistics_data, statistics_rdate
FROM statistics
WHERE statistics_code='BAR'
ORDER BY statisticsno ASC;

--  subquery를 이용한 최근 등록 데이터 출력  --> 통계 xml에 등록 부분.
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

-- 옵션이 추가된 라인 그래프
INSERT INTO statistics (statistics_no, statistics_code, statistics_title, statistics_data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'LINE', '옵션이 추가된 라인 그래프', q'$[[10,20,30,40,50,300,200],[25,32,45,53,65,270,150]]$', sysdate);
SELECT * FROM statistics;

-- Tcik이 있는 라인 그래프
INSERT INTO statistics (statistics_no, statistics_code, statistics_title, statistics_data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'LINE', 'Tcik이 있는 라인 그래프', q'$[[['1월', 300], ['2월', 52], ['3월', 38], ['4월', 30], ['5월', 0]]]$', sysdate);
SELECT * FROM statistics;

-- 막대 그래프 기본
INSERT INTO statistics (statistics_no, statistics_code, statistics_title, statistics_data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'BAR1', '막대 그래프 기본', q'$[['포드', 4],['볼보', 6],['포르쉐', 2],['아우디', 5],['부가티', 6]]$', sysdate);
SELECT * FROM statistics;
    
-- 막대 그래프 2 변수, 변수 구분은 '/'
INSERT INTO statistics (statistics_no, statistics_code, statistics_title, statistics_data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'BAR2', '막대 그래프 2 변수', q'$[9, 8, 6, 8, 7, 6, 4]/[2, 3, 4, 10, 8, 5, 1]$', sysdate);
SELECT * FROM statistics;

-- 막대 그래프와 꺽은선 그래프의 결합
INSERT INTO statistics (statistics_no, statistics_code, statistics_title, statistics_data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'BAR3', '막대 그래프와 꺽은선 그래프의 결합', q'$[9, 8, 6, 8, 7, 6, 4]/[2, 3, 4, 10, 8, 5, 1]$', sysdate);
SELECT * FROM statistics;

-- 막대 그래프 값 출력
INSERT INTO statistics (statistics_no, statistics_code, statistics_title, statistics_data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'BAR4', '막대 그래프 값 출력', q'$[14, 32, 41, 44, 40, 37, 29]$', sysdate);
SELECT * FROM statistics;

update statistics
set statistics_data = q'$[30, 32, 41, 44, 40, 37, 29]$'
where statistics_no = 6

-- 원형 그래프
INSERT INTO statistics (statistics_no, statistics_code, statistics_title, statistics_data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'PIE', '원형 그래프', q'$[[['1/4 분기', 50], ['2/4 분기', 22], ['3/4 분기', 38], ['4/4 분기', 30]]]$', sysdate);
SELECT * FROM statistics;

-- Meter gauge
INSERT INTO statistics (statistics_no, statistics_code, statistics_title, statistics_data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'METER', 'Meter gauge', q'$322$', sysdate);
SELECT * FROM statistics;

COMMIT;

-- 자동 새로고침 확인 데이터
INSERT INTO statistics (statistics_no, statistics_code, statistics_title, statistics_data, statistics_rdate) 
VALUES ((SELECT NVL(MAX(statistics_no), 0) + 1 as statistics_no FROM statistics),
             'METER', 'Meter gauge', q'$320$', sysdate);

COMMIT;

