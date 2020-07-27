package dev.mvc.pay;

public class PayVO {
  /*CREATE TABLE pay(
      pay_payno                           NUMBER(10)       NOT NULL        PRIMARY KEY,
      list_contentsno                     NUMBER(10)       NULL ,
      consumer_no                         NUMBER(10)       NULL ,
      pay_date                            DATE         NOT NULL,
      pay_kind                            VARCHAR2(100)        NOT NULL,
      pay_total                           NUMBER(8)        NOT NULL,
FOREIGN KEY (consumer_no) REFERENCES consumer (consumer_no),
FOREIGN KEY (list_contentsno) REFERENCES list (list_contentsno)
);

COMMENT ON TABLE pay is '결제';
COMMENT ON COLUMN pay.pay_payno is '결제번호';
COMMENT ON COLUMN pay.list_contentsno is '상품번호';
COMMENT ON COLUMN pay.consumer_no is '회원번호';
COMMENT ON COLUMN pay.pay_date is '결제일시';
COMMENT ON COLUMN pay.pay_kind is '결제방법';
COMMENT ON COLUMN pay.pay_total is '결제금액';
*/
  /**결제 번호*/
  private int pay_payno;
  /** 결제 수량*/
  private int pay_cnt;
  /**결제 날짜*/
  private String pay_date;
  /**상품 번호*/
  private int game_gameno;
  /**회원 번호*/
  private int consumer_no;
  /**결재 종류 */
  private String pay_kind;
  
  
  
  public int getPay_cnt() {
    return pay_cnt;
  }
  public void setPay_cnt(int pay_cnt) {
    this.pay_cnt = pay_cnt;
  }
  public int getPay_payno() {
    return pay_payno;
  }
  public void setPay_payno(int pay_payno) {
    this.pay_payno = pay_payno;
  }
  public String getPay_date() {
    return pay_date;
  }
  public void setPay_date(String pay_date) {
    this.pay_date = pay_date;
  }
  
  
  
 
  public int getConsumer_no() {
    return consumer_no;
  }
  public void setConsumer_no(int consumer_no) {
    this.consumer_no = consumer_no;
  }
  public String getPay_kind() {
    return pay_kind;
  }
  public void setPay_kind(String pay_kind) {
    this.pay_kind = pay_kind;
  }
  public int getGame_gameno() {
    return game_gameno;
  }
  public void setGame_gameno(int game_gameno) {
    this.game_gameno = game_gameno;
  }
  
  
  
  
  
  
  
  
}
