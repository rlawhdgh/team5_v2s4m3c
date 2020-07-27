/**********************************/
/* Table Name: 카테고리 그룹 */
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

COMMENT ON TABLE kind is '게임 카테고리';
COMMENT ON COLUMN kind.kind_kindno is '게임 종류번호';
COMMENT ON COLUMN kind.consumer_no is '회원번호';
COMMENT ON COLUMN kind.kind_kindname is '게임 장르';
COMMENT ON COLUMN kind.kind_kindseqno is '출력 순서';
COMMENT ON COLUMN kind.kind_kindrdate is '그룹 생성일';


DROP SEQUENCE kind_seq;
CREATE SEQUENCE kind_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
 
-- insert
INSERT INTO kind(kind_kindno,consumer_no, kind_kindname,kind_kindseqno,kind_kindrdate)
VALUES(1,1, 'SF', 1, sysdate);
 
INSERT INTO kind(kind_kindno,consumer_no, kind_kindname,kind_kindseqno,kind_kindrdate)
VALUES(kind_seq.nextval,1, '슈팅', 2, sysdate);

commit;

-- list
SELECT kind_kindno, kind_kindname, kind_kindseqno, kind_kindrdate
FROM kind
ORDER BY kind_kindno ASC;

-- 수정
UPDATE kind
SET kind_kindno='아케이드', kind_kindseqno = 10
WHERE kind_kindno = 1;

commit;

-- 1번 레코드 삭제
DELETE FROM kind
WHERE kind_kindno=4;

DELETE FROM list
WHERE kind_kindno=4;


-- 출력 순서 상향, 10 ▷ 1
UPDATE kind
SET kind_kindseqno = kind_kindseqno - 1
WHERE kind_kindno=1;
 
-- 출력순서 하향, 1 ▷ 10
UPDATE kind
SET kind_kindseqno = kind_kindseqno + 1
WHERE kind_kindno=1;
