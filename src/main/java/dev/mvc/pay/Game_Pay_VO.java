package dev.mvc.pay;

public class Game_Pay_VO {
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
  /**��ǰ �̹��� */
  private String game_image;
  /** ���� ����*/
  private int game_sale;
  
  // wishlist�κ�
  /**���� ��ȣ */
  private int pay_payno;
  /** ���� ����*/
  private int pay_cnt;
  /**���� ��¥ */
  private String pay_date;
  /** ���� ���*/
  private String pay_kind;
  
  
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
  public int getPay_payno() {
    return pay_payno;
  }
  public void setPay_payno(int pay_payno) {
    this.pay_payno = pay_payno;
  }
  public int getPay_cnt() {
    return pay_cnt;
  }
  public void setPay_cnt(int pay_cnt) {
    this.pay_cnt = pay_cnt;
  }
  public String getPay_date() {
    return pay_date;
  }
  public void setPay_date(String pay_date) {
    this.pay_date = pay_date;
  }
  public String getPay_kind() {
    return pay_kind;
  }
  public void setPay_kind(String pay_kind) {
    this.pay_kind = pay_kind;
  }
  public int getGame_sale() {
    return game_sale;
  }
  public void setGame_sale(int game_sale) {
    this.game_sale = game_sale;
  }
  public String getGame_image() {
    return game_image;
  }
  public void setGame_image(String game_image) {
    this.game_image = game_image;
  }
  
  
  
  
  
  
  
  
  
  

  
  
  
}
