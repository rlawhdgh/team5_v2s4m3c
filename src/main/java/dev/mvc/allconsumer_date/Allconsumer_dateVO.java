package dev.mvc.allconsumer_date;

/*
CREATE TABLE allconsumer_date(
    allconsumer_date_no                     NUMBER(10)     NOT NULL    PRIMARY KEY,
    allconsumer_date_date                   VARCHAR2(100)    NOT NULL,
    allconsumer_date_cnt                      NUMBER(10)     NOT NULL
);
*/
public class Allconsumer_dateVO {
  private int allconsumer_date_no;
  private String allconsumer_date_date;
  private int allconsumer_date_cnt;
  
  public int getAllconsumer_date_no() {
    return allconsumer_date_no;
  }
  public void setAllconsumer_date_no(int allconsumer_date_no) {
    this.allconsumer_date_no = allconsumer_date_no;
  }
  public String getAllconsumer_date_date() {
    return allconsumer_date_date;
  }
  public void setAllconsumer_date_date(String allconsumer_date_date) {
    this.allconsumer_date_date = allconsumer_date_date;
  }
  public int getAllconsumer_date_cnt() {
    return allconsumer_date_cnt;
  }
  public void setAllconsumer_date_cnt(int allconsumer_date_cnt) {
    this.allconsumer_date_cnt = allconsumer_date_cnt;
  }


 

}