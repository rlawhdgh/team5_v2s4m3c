package dev.mvc.catebag;

public class Catebag_Pay_VO {
  // List �κ�
  /**��ǰ ��ȣ */
  private int game_gameno;
  /**��ǰ ���� */
  private String game_title;
  /**��ǰ ���� */
  private String game_writing;
  /**��ǰ ����� */
  private String game_release;
  /**���߻�*/
  private String game_developer;
  /**����*/
  private int game_price;
  /** ����*/
  private int game_sale;
  /**��ǰ �̹��� */
  private String game_image;
  
  // catebag�κ�
  /**��ٱ��� ��ȣ */
  private int catebag_catebagno;
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
  
  
  /**
   * get set
   * @return
   */ 
  public int getGame_gameno() {
    return game_gameno;
  }
  public void setGame_gameno(int game_gameno) {
    this.game_gameno = game_gameno;
  }
  
  public String getGame_title() {
    return game_title;
  }
  
  public void setGame_title(String game_title) {
    this.game_title = game_title;
  }
  public String getGame_writing() {
    return game_writing;
  }
  public void setGame_writing(String game_writing) {
    this.game_writing = game_writing;
  }
  public String getGame_release() {
    return game_release;
  }
  public void setGame_release(String game_release) {
    this.game_release = game_release;
  }
  public String getGame_developer() {
    return game_developer;
  }
  public void setGame_developer(String game_developer) {
    this.game_developer = game_developer;
  }
  public int getGame_price() {
    return game_price;
  }
  public void setGame_price(int game_price) {
    this.game_price = game_price;
  }
  public String getGame_image() {
    return game_image;
  }
  public void setGame_image(String game_image) {
    this.game_image = game_image;
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
  public int getCatebag_sum() {
    return catebag_sum;
  }
  public void setCatebag_sum(int catebag_sum) {
    this.catebag_sum = catebag_sum;
  }
  public int getCatebag_seqno() {
    return catebag_seqno;
  }
  public void setCatebag_seqno(int catebag_seqno) {
    this.catebag_seqno = catebag_seqno;
  }
  public int getConsumer_no() {
    return consumer_no;
  }
  public void setConsumer_no(int consumer_no) {
    this.consumer_no = consumer_no;
  }
  public String getCatebag_date() {
    return catebag_date;
  }
  public void setCatebag_date(String catebag_date) {
    this.catebag_date = catebag_date;
  }
  public int getGame_sale() {
    return game_sale;
  }
  public void setGame_sale(int game_sale) {
    this.game_sale = game_sale;
  }
  
  
  
  
  
 
 
  
  
  
  
  
}
