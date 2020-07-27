package dev.mvc.wishlist;

public class WishlistVO {
 /* wishlist_wishlistno                 NUMBER(10)       NOT NULL        PRIMARY KEY,
  list_contentsno                     NUMBER(10)       NULL ,
  wishlist_date                       DATE         NOT NULL,
  wishlist_seqno                      NUMBER(10)       NOT NULL,
  consumer_no                         NUMBER(10)       NULL ,
FOREIGN KEY (list_contentsno) REFERENCES list (list_contentsno),
FOREIGN KEY (consumer_no) REFERENCES consumer (consumer_no)
);

COMMENT ON TABLE wishlist is '���ø���Ʈ';
COMMENT ON COLUMN wishlist.wishlist_wishlistno is '���ø���Ʈ��ȣ';
COMMENT ON COLUMN wishlist.list_contentsno is '��ǰ��ȣ';
COMMENT ON COLUMN wishlist.wishlist_date is '������';
COMMENT ON COLUMN wishlist.wishlist_seqno is '���ø���Ʈ��¼���';
COMMENT ON COLUMN wishlist.consumer_no is 'ȸ����ȣ';
*/
  /**���ø���Ʈ ��ȣ */
  private int wishlist_wishlistno;
  /**��ǰ ��ȣ */
  private int game_gameno;
  /**������ */
  private String wishlist_date;
  /**���ø���Ʈ ��� ���� */
  private int wishlist_seqno;
  /**ȸ����ȣ*/
  private int consumer_no;
  
  public int getWishlist_wishlistno() {
    return wishlist_wishlistno;
  }
  public void setWishlist_wishlistno(int wishlist_wishlistno) {
    this.wishlist_wishlistno = wishlist_wishlistno;
  }
  
  public int getGame_gameno() {
    return game_gameno;
  }
  public void setGame_gameno(int game_gameno) {
    this.game_gameno = game_gameno;
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
  public int getConsumer_no() {
    return consumer_no;
  }
  public void setConsumer_no(int consumer_no) {
    this.consumer_no = consumer_no;
  }
  
  
  
  
  
}
