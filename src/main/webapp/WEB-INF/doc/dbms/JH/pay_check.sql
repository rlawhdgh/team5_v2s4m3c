/**********************************/
/* Table Name: 결재내역 */
/**********************************/
DROP TABLE point;
CREATE TABLE point(
		point_pointno                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		point_now                  		NUMBER(10)		 NOT NULL,
		game_contentsno               		NUMBER(10)		 NULL ,
		consumer_no                   		NUMBER(10)		 NULL ,
  FOREIGN KEY (consumer_no) REFERENCES consumer (consumer_no)
);

COMMENT ON TABLE point is '포인트';
COMMENT ON COLUMN point.point_pointno is '포인트 번호';
COMMENT ON COLUMN point.point_now is '현재포인트';
COMMENT ON COLUMN point.consumer_no is '회원번호';

DROP SEQUENCE point_seq;
CREATE SEQUENCE point_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
INSERT INTO  point(point_pointno, point_now, consumer_no)
VALUES(point_seq.nextval, 3000, 1);

SELECT point_pointno, point_now, consumer_no
FROM point
ORDER BY point_pointno ASC;

SELECT point_now
FROM point
WHERE consumer_no = 1;






commit;







