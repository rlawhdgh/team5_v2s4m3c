package dev.mvc.openspace;

public class OpenspaceVO {

  /*
openspace_no                   NUMBER(10)     NOT NULL  PRIMARY KEY,
consumer_no                       NUMBER(10)  NOT NULL,
openspace_title                VARCHAR2(100) NOT NULL,
openspace_content                CLOB                NOT NULL,
openspace_division             VARCHAR2(50)     NOT NULL,
openspace_cnt                  NUMBER(8)         DEFAULT 0  NOT NULL,
openspace_seqno                NUMBER(8)         DEFAULT 1  NOT NULL,
openspace_visible              CHAR(1)             DEFAULT 'Y'  NOT NULL,
openspace_youtube            VARCHAR2(500),
openspace_rdate                DATE                 NOT NULL,
openspace_redate               DATE                 NULL, 
   */
  /** 회원 닉네임 */
 private String consumer_nickname;

  
  
  
  
  /** 공지사항 번호 */
  private int openspace_no;
  /** 회원 번호 */
  private int consumer_no;
  /** 공지사항 제목 */
  private String openspace_title;
  /** 공지사항 내용 */
  private String openspace_content;
  /** 구분 */
  private String openspace_division;
  /** 조회수 */
  private int openspace_cnt;
  /** 출력순서 */
  private int openspace_seqno;
  /** 출력모드 */
  private String openspace_visible;
  /** youtube */
  private String openspace_youtube;
  /** 등록일 */
  private String openspace_rdate;
  /** 수정일 */
  private String openspace_redate;
  
  
  
  //-------------------------------------//
  /**다음글 구분 */
  private String next_division;  
  /** 다음글 번호*/
  private int next_no;
  /** 다음글 제목*/
  private String next_title;
  /**이전글 구분 */
  private String pre_division;  
  /** 이전글 번호*/
  private int pre_no;
  /** 이전글 제목 */
  private String pre_title;
  

  

  public String getConsumer_nickname() {
    return consumer_nickname;
  }
  public void setConsumer_nickname(String consumer_nickname) {
    this.consumer_nickname = consumer_nickname;
  }
  public String getOpenspace_youtube() {
    return openspace_youtube;
  }
  public void setOpenspace_youtube(String openspace_youtube) {
    this.openspace_youtube = openspace_youtube;
  }
  public String getNext_division() {
    return next_division;
  }
  public void setNext_division(String next_division) {
    this.next_division = next_division;
  }
  public String getPre_division() {
    return pre_division;
  }
  public void setPre_division(String pre_division) {
    this.pre_division = pre_division;
  }
  public int getNext_no() {
    return next_no;
  }
  public void setNext_no(int next_no) {
    this.next_no = next_no;
  }
  public String getNext_title() {
    return next_title;
  }
  public void setNext_title(String next_title) {
    this.next_title = next_title;
  }
  public int getPre_no() {
    return pre_no;
  }
  public void setPre_no(int pre_no) {
    this.pre_no = pre_no;
  }
  public String getPre_title() {
    return pre_title;
  }
  public void setPre_title(String pre_title) {
    this.pre_title = pre_title;
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
  public String getOpenspace_title() {
    return openspace_title;
  }
  public void setOpenspace_title(String openspace_title) {
    this.openspace_title = openspace_title;
  }
  public String getOpenspace_content() {
    return openspace_content;
  }
  public void setOpenspace_content(String openspace_content) {
    this.openspace_content = openspace_content;
  }
  public String getOpenspace_division() {
    return openspace_division;
  }
  public void setOpenspace_division(String openspace_division) {
    this.openspace_division = openspace_division;
  }
  public int getOpenspace_cnt() {
    return openspace_cnt;
  }
  public void setOpenspace_cnt(int openspace_cnt) {
    this.openspace_cnt = openspace_cnt;
  }
  public int getOpenspace_seqno() {
    return openspace_seqno;
  }
  public void setOpenspace_seqno(int openspace_seqno) {
    this.openspace_seqno = openspace_seqno;
  }
  public String getOpenspace_visible() {
    return openspace_visible;
  }
  public void setOpenspace_visible(String openspace_visible) {
    this.openspace_visible = openspace_visible;
  }
  public String getOpenspace_rdate() {
    return openspace_rdate;
  }
  public void setOpenspace_rdate(String openspace_rdate) {
    this.openspace_rdate = openspace_rdate;
  }
  public String getOpenspace_redate() {
    return openspace_redate;
  }
  public void setOpenspace_redate(String openspace_redate) {
    this.openspace_redate = openspace_redate;
  }
  
  
  
}
