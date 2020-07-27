package dev.mvc.catebag;

import java.util.HashMap;
import java.util.List;

import dev.mvc.pay.PayVO;

public interface CatebagProcInter {
  
  
  /**
   * �ߺ� üũ
   * <select id="read_check" resultType="int" parameterType="int">
   * @param game_gameno
   * @return
   */
  public int read_check(int game_gameno);
  
  /**
   * �ߺ��� ���� �� ��ٱ��� ����
   * <delete id="delete_check" parameterType="int">
   * @param game_gameno
   * @return
   */
  public int delete_check(int game_gameno);
  
  /**
   * ��ǰ �ߺ� üũ 
   * <select id="checklist_contentsno" resultType="int" parameterType="int">
   * @param game_gameno
   * @return 0: �ߺ� �ƴ�, 1: �ߺ�
   */
  public int checklist_contentsno(HashMap<String, Object> hashMap);
  
  
  /**
   * <insert id="create" parameterType="CatebagVO">
   * @param catebagVO
   * @return
   */
  public int create(CatebagVO catebagVO);
  
  /**
   * 
   * <insert id="create" parameterType="PayVO">
   * @param payVO
   * @return
   */
  public int create2(PayVO payVO);
  
  
  /**
   * <select id="list_all" resultType="CatebagVO">
   * ����Ʈ
   * @return
   */
  public List<CatebagVO> list_all();
  
  /**
   * <delete id="delete" parameterType="int">
   * @param catebag_catebagno
   * @return
   */
  public int delete(int catebag_catebagno);
  
  /**
   * <delete id="delete" parameterType="int">
   * @param catebag_catebagno
   * @return
   */
  public int delete2(int catebag_catebagno);
  
  
  
  
  /**
   * <select id="read" resultType="CatebagVO" parameterType="int">
   * @param catebag_catebagno
   * @return
   */
  public CatebagVO read(int catebag_catebagno);
  
  /**
   * ���� ����
   * <xmp>
   *  <update id="update_cnt_up" parameterType="int">
   * </xmp>
   * @param categrpno
   * @return ó���� ���ڵ� ����
   */
  public int update_cnt_up(int catebag_catebagno);
 
  /**
   * ���� ����
   * <xmp>
   * <update id="update_cnt_down" parameterType="int">
   * </xmp>
   * @param catebag_catebagno
   * @return ó���� ���ڵ� ����
   */
  public int update_cnt_down(int catebag_catebagno); 
  
  /**
   *  <update id="update_cnt" parameterType="CatebagVO">
   * @param catebagVO
   * @return
   */
  public int update_cnt(int catebag_cnt);
  
  
  /**ȸ�� �� ���ø���Ʈ
   * <select id="list_catebag_consumer_no_list" parameterType="int" resultMap="List_Catebag_VO_Map">
   * @param consumer_no
   * @return
   */
  public List<Game_Catebag_VO> game_catebag_consumer_no_list(int consumer_no);
  
  /**
   * <select id="catebag_pay_read" parameterType="int" resultType="Catebag_Pay_VO">
   * @param catebag_catebagno
   * @return
   */
  public Catebag_Pay_VO catebag_pay_read(int catebag_catebagno);
  
  
  
  /**
   * ������ ī����
   * <select id="search_count" resultType="int" parameterType="HashMap">
   * 
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * ȸ���� ��ٱ��� + ����¡
   * <select id="catebag_by_consumer_no_paging" resultType="List_Catebag_Consumer_VO" parameterType="HashMap">
   * @return
   */
  public List<Game_Catebag_VO> catebag_by_consumer_no_paging(HashMap<String, Object> map);
   
  /**
   * ������ ��� ���ڿ� ����, Box ����
   * @param listFile ��� ���ϸ� 
   * @param consumer_no ȸ����ȣ
   * @param nowPage ���� ������, nowPage�� 1���� ����
   * @return
   */
  public String pagingBox(String listFile, int search_count, int nowPage);
}
