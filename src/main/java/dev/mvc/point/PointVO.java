package dev.mvc.point;

public class PointVO {

  
//  CREATE TABLE point(
//      point_pointno                           NUMBER(10)       NOT NULL        PRIMARY KEY,
//      point_now                       NUMBER(10)       NOT NULL,
//      game_contentsno                     NUMBER(10)       NULL ,
//      consumer_no                         NUMBER(10)       NULL ,
//FOREIGN KEY (consumer_no) REFERENCES consumer (consumer_no)
//);
//
//COMMENT ON TABLE point is '포인트';
//COMMENT ON COLUMN point.point_pointno is '포인트 번호';
//COMMENT ON COLUMN point.point_now is '현재포인트';
//COMMENT ON COLUMN point.consumer_no is '회원번호';
  private int point_pointno;
  private int point_now;
  private int consumer_no;
  
  /////
  public int getPoint_pointno() {
    return point_pointno;
  }
  public void setPoint_pointno(int point_pointno) {
    this.point_pointno = point_pointno;
  }
  public int getPoint_now() {
    return point_now;
  }
  public void setPoint_now(int point_now) {
    this.point_now = point_now;
  }
  public int getConsumer_no() {
    return consumer_no;
  }
  public void setConsumer_no(int consumer_no) {
    this.consumer_no = consumer_no;
  }
  
  //////
  
  
  
  
  
  
  
  
  
  
}
