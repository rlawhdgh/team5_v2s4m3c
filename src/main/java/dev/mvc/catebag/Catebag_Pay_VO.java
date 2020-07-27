package dev.mvc.catebag;

public class Catebag_Pay_VO {
  // List 부분
  /**상품 번호 */
  private int game_gameno;
  /**상품 제목 */
  private String game_title;
  /**상품 내용 */
  private String game_writing;
  /**상품 출시일 */
  private String game_release;
  /**개발사*/
  private String game_developer;
  /**가격*/
  private int game_price;
  /** 세일*/
  private int game_sale;
  /**상품 이미지 */
  private String game_image;
  
  // catebag부분
  /**장바구니 번호 */
  private int catebag_catebagno;
  /**장바구니 수량 */
  private int catebag_cnt;
  /**장바구니 합계 */
  private int catebag_sum;
  /**장바구니 순서 */
  private int catebag_seqno;
  /**회원 번호 */
  private int consumer_no;
  /**등록 날짜 */
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
