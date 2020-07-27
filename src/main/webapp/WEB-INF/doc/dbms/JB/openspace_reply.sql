/**********************************/
/* Table Name: 공지사항 댓글 */
/**********************************/

DROP TABLE openspace_reply CASCADE CONSTRAINTS; 
CREATE TABLE openspace_reply(
    openspace_reply_no                NUMBER(10)     NOT NULL    PRIMARY KEY,
        openspace_no                      NUMBER(10)     NULL ,
    consumer_no                       NUMBER(10)  DEFAULT 0  NULL ,
    openspace_reply_content           VARCHAR2(700)    NOT NULL,
    openspace_reply_date              DATE     NOT NULL,

  FOREIGN KEY (openspace_no) REFERENCES openspace (openspace_no),
  FOREIGN KEY (consumer_no) REFERENCES consumer (consumer_no)
);

COMMENT ON TABLE openspace_reply is '공지사항 댓글';
COMMENT ON COLUMN openspace_reply.openspace_reply_no is '공지사항 댓글 번호';
COMMENT ON COLUMN openspace_reply.openspace_reply_content is '공지사항 댓글 내용';
COMMENT ON COLUMN openspace_reply.openspace_reply_date is '등록일';
COMMENT ON COLUMN openspace_reply.openspace_no is '공지사항 번호';
COMMENT ON COLUMN openspace_reply.consumer_no is '회원번호';