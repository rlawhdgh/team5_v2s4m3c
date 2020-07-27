package dev.mvc.catebag;

public class CatebagVO {
 /*
  catebag_catebagno                     NUMBER(10)       NOT NULL        PRIMARY KEY,
        list_contentsno                     INTEGER(10)      NULL ,
        catebag_cnt                         NUMBER(10)       NOT NULL,
        catebag_sum                         NUMBER(10)       NOT NULL,
        catebag_seqno                        NUMBER(10)       NOT NULL,
        consumer_no                         NUMBER(10)       NULL ,
  FOREIGN KEY (list_contentsno) REFERENCES list (list_contentsno),
  FOREIGN KEY (consumer_no) REFERENCES consumer (consumer_no)
  */
  /**��ٱ��� ��ȣ */
  private int catebag_catebagno;
  /**���� ��ȣ */
  private int game_gameno;
  /**��ٱ��� ���� */
  private int catebag_cnt;
  /**��ٱ��� �հ� */
  private int catebag_sum;
  /**��ٱ��� ���� */
  private int catebag_seqno;
  /**ȸ�� ��ȣ */
  private int consumer_no;
  /**��� ��¥ */
  private String catebag_date;
  
  public String getCatebag_date() {
    return catebag_date;
  }
  public void setCatebag_date(String catebag_date) {
    this.catebag_date = catebag_date;
  }
  public int getCatebag_catebagno() {
    return catebag_catebagno;
  }
  public void setCatebag_catebagno(int catebag_catebagno) {
    this.catebag_catebagno = catebag_catebagno;
  }
  
  public int getCatebag_cnt() {
    return catebag_cnt;
  }
  public void setCatebag_cnt(int catebag_cnt) {
    this.catebag_cnt = catebag_cnt;
  }
  public int getCatebag_seqno () {
    return catebag_seqno ;
  }
  public void setCatebag_seqno (int catebag_seqno ) {
    this.catebag_seqno  = catebag_seqno ;
  }
  public int getConsumer_no() {
    return consumer_no;
  }
  public void setConsumer_no(int consumer_no) {
    this.consumer_no = consumer_no;
  }
  public int getCatebag_sum() {
    return catebag_sum;
  }
  public void setCatebag_sum(int catebag_sum) {
    this.catebag_sum = catebag_sum;
  }
  public int getGame_gameno() {
    return game_gameno;
  }
  public void setGame_gameno(int game_gameno) {
    this.game_gameno = game_gameno;
  }
  
  
  
  
}
