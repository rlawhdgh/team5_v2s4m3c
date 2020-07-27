package dev.mvc.wishlist;

public class Game_Wishlist_VO {
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
  /**상품 이미지 */
  private String game_image;
  /** 세일 가격*/
  private int game_sale;
  
  // wishlist부분
  /**위시리스트 번호 */
  private int wishlist_wishlistno;
  /**저장일 */
  private String wishlist_date;
  /**위시리스트 출력 순서 */
  private int wishlist_seqno;
  
  
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
  public int getWishlist_wishlistno() {
    return wishlist_wishlistno;
  }
  public void setWishlist_wishlistno(int wishlist_wishlistno) {
    this.wishlist_wishlistno = wishlist_wishlistno;
  }
  public String getWishlist_date() {
    return wishlist_date;
  }
  public void setWishlist_date(String wishlist_date) {
    this.wishlist_date = wishlist_date;
  }
  public int getWishlist_seqno() {
    return wishlist_seqno;
  }
  public void setWishlist_seqno(int wishlist_seqno) {
    this.wishlist_seqno = wishlist_seqno;
  }
  
  public int getGame_sale() {
    return game_sale;
  }
  public void setGame_sale(int game_sale) {
    this.game_sale = game_sale;
  }

  
  
  
}
