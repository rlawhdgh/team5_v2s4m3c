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

COMMENT ON TABLE pay is '����';
COMMENT ON COLUMN pay.pay_payno is '������ȣ';
COMMENT ON COLUMN pay.list_contentsno is '��ǰ��ȣ';
COMMENT ON COLUMN pay.consumer_no is 'ȸ����ȣ';
COMMENT ON COLUMN pay.pay_date is '�����Ͻ�';
COMMENT ON COLUMN pay.pay_kind is '�������';
COMMENT ON COLUMN pay.pay_total is '�����ݾ�';
*/
  /**���� ��ȣ*/
  private int pay_payno;
  /** ���� ����*/
  private int pay_cnt;
  /**���� ��¥*/
  private String pay_date;
  /**��ǰ ��ȣ*/
  private int game_gameno;
  /**ȸ�� ��ȣ*/
  private int consumer_no;
  /**���� ���� */
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
