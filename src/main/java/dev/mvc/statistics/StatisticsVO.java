package dev.mvc.statistics;

/*
CREATE TABLE vis (
    statistics_no                         NUMBER(10)     NOT NULL    PRIMARY KEY,
    statistics_code                          VARCHAR(10)       NOT NULL,  
    statistics_title                           VARCHAR(100)     NOT NULL,  
    statistics_data                          VARCHAR(500)     NOT NULL,
    statistics_rdate                         DATE     NOT NULL
);
*/
public class StatisticsVO {
  private int statistics_no;
  private String statistics_code;
  private String statistics_title;
  private String statistics_data;
  private String statistics_rdate;
  
  public int getStatistics_no() {
    return statistics_no;
  }
  public void setStatistics_no(int statistics_no) {
    this.statistics_no = statistics_no;
  }
  public String getStatistics_code() {
    return statistics_code;
  }
  public void setStatistics_code(String statistics_code) {
    this.statistics_code = statistics_code;
  }
  public String getStatistics_title() {
    return statistics_title;
  }
  public void setStatistics_title(String statistics_title) {
    this.statistics_title = statistics_title;
  }
  public String getStatistics_data() {
    return statistics_data;
  }
  public void setStatistics_data(String statistics_data) {
    this.statistics_data = statistics_data;
  }
  public String getStatistics_rdate() {
    return statistics_rdate;
  }
  public void setStatistics_rdate(String statistics_rdate) {
    this.statistics_rdate = statistics_rdate;
  }
 

}