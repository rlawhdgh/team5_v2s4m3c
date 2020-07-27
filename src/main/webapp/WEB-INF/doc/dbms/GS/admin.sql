/**********************************/
/* Table Name: 관리자 */
/**********************************/
DROP TABLE admin;
CREATE TABLE admin(
		admin_no                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		consumer_no                   		NUMBER(10)	UNIQUE  NOT NULL,
  FOREIGN KEY (consumer_no) REFERENCES consumer (consumer_no)
);


    SELECT COUNT(admin_no) as cnt
    FROM admin
    WHERE consumer_no = 2


COMMENT ON TABLE admin is '관리자';
COMMENT ON COLUMN admin.admin_no is '관리자 번호';
COMMENT ON COLUMN admin.consumer_no is '회원번호';

DROP SEQUENCE admin_seq;
CREATE SEQUENCE admin_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

----------------DML-------------------
1) 등록
INSERT INTO admin(admin_no, consumer_no)
VALUES(admin_seq.nextval, 15);

INSERT INTO admin(admin_no, consumer_no)
VALUES(admin_seq.nextval, 1);
2) 목록
SELECT admin_no, consumer_no
FROM admin
ORDER BY admin_no ASC;

3) 조회
SELECT admin_no, admin_id, admin_passwd
FROM admin
where admin_no = 1

3 -1) 아이디로 조회
SELECT admin_no, admin_id, admin_passwd
FROM admin
where admin_id = '박근서';

4) 수정
UPDATE admin
SET  admin_id = '수정된 이름', admin_passwd='12345'
WHERE admin_no = 1;

5) 삭제
DELETE FROM admin
WHERE admin_no = 1;


SELECT COUNT(admin_no) as cnt
FROM admin
WHERE admin_id='박근서' AND admin_passwd='12345';

--------------TCL---------------
commit;

-------------회원번호 0번(관리자)을 조회했을떄 관리자 번호까지 같이-------------
select ad.admin_no , ad.consumer_no  , cs.consumer_id, cs.consumer_phone_num
from admin ad , consumer cs
where ad.consumer_no = cs.consumer_no
order by ad.admin_no;
-------------회원 번호와 관리자 번호만 가져오는것------------------------------
select ad.admin_no , ad.consumer_no  , cs.consumer_id, cs.consumer_phone_num
from admin ad , consumer cs
where ad.consumer_no = cs.consumer_no
order by ad.admin_no;

    SELECT admin_no, consumer_no
    FROM admin
    WHERE consumer_no = 1;
    
SELECT COUNT(*) as cnt
FROM admin
WHERE consumer_no = 47