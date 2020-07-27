package dev.mvc.kind;

/*
      kind_kindno                         NUMBER(10)     NOT NULL    PRIMARY KEY, --게임 종류번호
      kind_kindgenre                            VARCHAR(50)    NOT NULL, -- 게임장르
      kind_kindrdate                        DATE     NOT NULL 
*/

public class KindVO {
  /** 게임 종류 번호*/
  private int kind_kindno;
  /** 관리자 번호*/
  private int consumer_no;
  /** 게임 장르이름*/
  private String kind_kindname;
  /** 게임 출력 순서*/
  private int kind_kindseqno;
  /** 등록일*/
  private String kind_kindrdate;
  
  int cnt;
  
  
  public KindVO( ) {
 
  }
  
  public int getConsumer_no() {
    return consumer_no;
  }

  public void setConsumer_no(int consumer_no) {
    this.consumer_no = consumer_no;
  }

  public int getKind_kindseqno() {
    return kind_kindseqno;
  }
  
  public void setKind_kindseqno(int kind_kindseqno) {
    this.kind_kindseqno = kind_kindseqno;
  }
  
  public int getKind_kindno() {
    return kind_kindno;
  }

  public void setKind_kindno(int kind_kindno) {
    this.kind_kindno = kind_kindno;
  }

  public String getKind_kindname() {
    return kind_kindname;
  }

  public void setKind_kindname(String kind_kindname) {
    this.kind_kindname = kind_kindname;
  }

  public String getKind_kindrdate() {
    return kind_kindrdate;
  }

  public void setKind_kindrdate(String kind_kindrdate) {
    this.kind_kindrdate = kind_kindrdate;
  }

  public int getCnt() {
    return cnt;
  }

  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
}
