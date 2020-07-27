package dev.mvc.wishlist;

import java.util.HashMap;
import java.util.List;



public interface WishlistDAOInter {
  
  /**
   * �ߺ� üũ
   * <select id="read_check" resultType="int" parameterType="int">
   * @param game_gameno
   * @return
   */
  public int read_check(int game_gameno);
  
  /**
   * �ߺ� �Ȱ� ����
   * <delete id="delete_check" parameterType="int">
   * @param game_gameno
   * @return
   */
  public int delete_check(int game_gameno);
  
 /**
  * ���
  * <insert id="create" parameterType="WishlistVO"> 
  * @return
  */
 public int create(WishlistVO wishlistVO); 
  
  /**
   * ��ü ���
   * <select id="list_all" resultType="WishlistVO">
   * 
   */
 public List<WishlistVO> list_all();
 
 
 /**
  * ��ȸ
  * <select id="read" resultType="WishlistVO" parameterType="int">
  * @param wishlist_wishlistno
  * @return
  */
 public WishlistVO read(int wishlist_wishlistno);
 
 
 
 /**
  * ����
  * <delete id="delete" parameterType="int">
  * @param wishlist_wishlistno
  * @return
  */
 public int delete(int wishlist_wishlistno);
 
 /**
  * ����
  * <delete id="delete" parameterType="int">
  * @param wishlist_wishlistno
  * @return
  */
 public int delete2(int wishlist_wishlistno);
 
 /**
  * ȸ���� ��ü ����
  * <delete id="delete_consumer" parameterType="int">
  * @param consumer_no
  * @return
  */
 public int delete_consumer(int consumer_no);
 

 
 /**ȸ�� �� ���ø���Ʈ
  * <select id="list_wishlist_consumer_no_list" parameterType="int" resultMap="List_Wishlist_VO_Map">
  * @param consumer_no
  * @return
  */
 public List<Game_Wishlist_VO> game_wishlist_consumer_no_list(int consumer_no);
 
 /**
  * <select id="search_count" resultType="int" parameterType="HashMap">
  * 
  * @return
  */
 public int search_count(HashMap<String, Object> hashMap);
 
 /**
  * ����¡
  * <select id="list_by_consumer_no_paging" resultType="List_Wishlist_Consumer_VO" parameterType="HashMap">
  * @return
  */
 public List<Game_Wishlist_VO> game_by_consumer_no_paging(HashMap<String, Object> map);
 
}
