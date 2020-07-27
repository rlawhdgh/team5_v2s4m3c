package dev.mvc.openspace_reply;

public class Openspace_replyVO {
  
  /*
    openspace_reply_no                NUMBER(10)     NOT NULL    PRIMARY KEY,
    openspace_no                      NUMBER(10)     NULL ,
    consumer_no                       NUMBER(10)     NULL ,
    openspace_reply_content           VARCHAR2(500)    NOT NULL,
    openspace_reply_date              DATE     NOT NULL,
    

COMMENT ON COLUMN openspace_reply.openspace_reply_no is '공지사항 댓글 번호';
COMMENT ON COLUMN openspace_reply.openspace_reply_content is '공지사항 댓글 내용';
COMMENT ON COLUMN openspace_reply.openspace_reply_date is '등록일';
COMMENT ON COLUMN openspace_reply.openspace_no is '공지사항 번호';
COMMENT ON COLUMN openspace_reply.consumer_no is '회원번호';
   */
  
  /** 회원테이블 닉네임 */
  private String consumer_nickname;
  
  /** 공지사항 제목 */
  private String openspace_title; 
  
  
  
  /** 공지사항 댓글 번호 */
  private int openspace_reply_no;
  /** 공지사항 번호 */
  private int openspace_no;
  /** 회원번호*/
  private int consumer_no;
  /** 관리자 번호 */
  private int admin_no;
  /** 공지사항 댓글 내용 */
  private String openspace_reply_content;
  /** 등록일 */
  private String openspace_reply_date;
  
  
  
  
  public String getOpenspace_title() {
    return openspace_title;
  }
  public void setOpenspace_title(String openspace_title) {
    this.openspace_title = openspace_title;
  }
  public int getAdmin_no() {
    return admin_no;
  }
  public void setAdmin_no(int admin_no) {
    this.admin_no = admin_no;
  }
  public String getConsumer_nickname() {
    return consumer_nickname;
  }
  public void setConsumer_nickname(String consumer_nickname) {
    this.consumer_nickname = consumer_nickname;
  }
  public int getOpenspace_reply_no() {
    return openspace_reply_no;
  }
  public void setOpenspace_reply_no(int openspace_reply_no) {
    this.openspace_reply_no = openspace_reply_no;
  }
  public int getOpenspace_no() {
    return openspace_no;
  }
  public void setOpenspace_no(int openspace_no) {
    this.openspace_no = openspace_no;
  }
  public int getConsumer_no() {
    return consumer_no;
  }
  public void setConsumer_no(int consumer_no) {
    this.consumer_no = consumer_no;
  }
  public String getOpenspace_reply_content() {
    return openspace_reply_content;
  }
  public void setOpenspace_reply_content(String openspace_reply_content) {
    this.openspace_reply_content = openspace_reply_content;
  }
  public String getOpenspace_reply_date() {
    return openspace_reply_date;
  }
  public void setOpenspace_reply_date(String openspace_reply_date) {
    this.openspace_reply_date = openspace_reply_date;
  }

  
  
  
}
