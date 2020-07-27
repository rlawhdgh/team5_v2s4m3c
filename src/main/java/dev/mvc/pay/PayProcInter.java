package dev.mvc.pay;

import java.util.HashMap;
import java.util.List;

import dev.mvc.catebag.Catebag_Pay_VO;



public interface PayProcInter {
  
  /**
   * ����ϱ�
   * <insert id="create" parameterType="PayVO">
   * @param payVO
   * @return
   */
  public int create(PayVO payVO);
   
  /**
   * <select id="list_all" resultType="PayVO">
   * ����Ʈ
   * @return
   */
  public List<PayVO> list_all();
  
  /**
   * ���� �ϱ�
   * <delete id="delete" parameterType="int">
   * @param int pay_payno
   * @return
   */
  public int delete(int pay_payno);
  
  /**
   * <delete id="delete_catebag" parameterType="int">
   * @param catebag_catebagno
   * @return
   */
  public int delete_catebag(int catebag_catebagno);
  
  /**
   * <select id="read" resultType="PayVO" parameterType="int">
   * @param pay_payno
   * @return
   */
  public PayVO read(int pay_payno);
  
  /**ȸ�� �� ����
   * <select id="list_pay_consumer_no_list" parameterType="int" resultMap="List_Pay_VO_Map">
   * @param consumer_no
   * @return
   */
  public List<Game_Pay_VO> game_pay_consumer_no_list(int consumer_no);
  
  
  /**
   * ������ ���� ����
   * <select id="search_count" resultType="int" parameterType="HashMap">
   * 
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * ȸ�� ���� ���� ����¡
   * <select id="pay_by_consumer_no_paging" resultType="List_Pay_Consumer_VO" parameterType="HashMap">
   * @return
   */
  public List<Game_Pay_VO> pay_by_consumer_no_paging(HashMap<String, Object> map);
   
  /**
   * ������ ��� ���ڿ� ����, Box ����
   * @param listFile ��� ���ϸ� 
   * @param consumer_no ȸ����ȣ
   * @param nowPage ���� ������, nowPage�� 1���� ����
   * @return
   */
  public String pagingBox(String listFile, int search_count, int nowPage);
  
}
