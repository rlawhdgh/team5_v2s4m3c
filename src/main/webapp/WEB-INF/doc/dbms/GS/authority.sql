/**********************************/
/* Table Name: 권한 */
/**********************************/
drop table authority;
CREATE TABLE authority(
    authority_no                      NUMBER(10)     NOT NULL    PRIMARY KEY
);

COMMENT ON TABLE authority is '권한';
COMMENT ON COLUMN authority.authority_no is '권한번호';