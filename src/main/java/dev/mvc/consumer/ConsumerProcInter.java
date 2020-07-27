package dev.mvc.consumer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ConsumerProcInter {

  
  /**
   * �̸� �ߺ� üũ
   * <select id="checkName" resultType="int" parameterType="String">
   * @param consumer_name
   * @return
   */
  public int checkName(String consumer_name);
  
  /**
   * �̸��� �̸��� ��ġ Ȯ��( ���̵� ã�⿡ ���)
   * <select id="matchNameEmail" resultType="int" parameterType="HashMap">
   * @param hashmap
   * @return
   */
  public int matchNameEmail(HashMap hashmap);
  
  /**
   * ���̵�� �̸��� ��ġ Ȯ��( ��й�ȣ ã�⿡ ���)
   * <select id="matchIdEmail" resultType="int" parameterType="HashMap">
   * @param hashmap
   * @return
   */
  public int matchIdEmail(HashMap hashmap);
  
  /**
   * ���̵� �ߺ� üũ 
   * @param id
   * @return 0: �ߺ� �ƴ�, 1: �ߺ�
   */
  public int checkID(String consumer_id);
  
  /**
   * �̸��� �ߺ� üũ
   * <select id="checkEmail" resultType="int" parameterType="String">
   * @param consumer_email
   * @return
   */
  public int checkEmail(String consumer_email);
  
  
  /**
   * <insert id="create" parameterType="ConsumerVO">
   * @param consumerVO
   * @return ����� ���ڵ� ����
   */
  public int create(ConsumerVO consumerVO); 
  
  /**
   * <select id="list" resultType="ConsumerVO">
   * @return
   */
  public List<ConsumerVO> list();
  
  /**
   * ȸ�� ��ȸ
   * <select id="read" parameterType="int" resultType="ConsumerVO">
   * @param consumer_no
   * @return
   */
  public ConsumerVO read(int consumer_no);
  
  /**
   * ȸ�� ������� ���
   * <select id="list_grade_name" resultMap="Consumer_grade_name_Map">  
   * @return
   */
  public List<Consumer_grade_nameVO> list_grade_name();
  
  /**
   * ���ɴ뺰 ��(��� �׷����� ���)
   * <select id="age_cnt" resultType="statistics_age_Map">
   * @return
   */
  public List<Consumer_statistics_ageVO> age_cnt();
  
  /**
   * ��ȣ���Ӻ� ��(��� �׷����� ���)
   *   <select id="game_tend_cnt" resultMap="statistics_geme_tend_Map">
   * @return
   */
  public List<Consumer_statistics_game_tendVO> game_tend_cnt();
  
  /**
   * ������ ����
   *  <update id="update_profile" parameterType="HashMap">
   * @param consumerVO
   * @return
   */
  public int update_profile(HashMap hashmap);
  
  /**
   * ����ó ����
   * <update id="update_contact" parameterType="HashMap">
   * @param hashmap
   * @return
   */
  public int update_contact(HashMap hashmap);
  
  /**
   * ���¹�ȣ ����
   * <update id="update_paynum" parameterType="HashMap">
   * @param hashmap
   * @return
   */
  public int update_paynum(HashMap hashmap);
  
  /**
   * ��й�ȣ ����
   * <update id="update_passwd" parameterType="HashMap">
   * @param hashmap
   * @return
   */
  public int update_passwd(HashMap hashmap);
  
  
  /**
   * ȸ�� ����
   * <delete id="delete" parameterType="int">
   * @param consumer_no, consumer_id
   * @return
   */
  public int delete (HashMap hashmap);
  

  public int alter_userKey(String consumer_id, String key);
  
  /**
   * �α���
   * <select id="login" resultType="int" parameterType="Map">
   * @param map
   * @return
   */
  public int login (Map map);
  
  /**
   * ȸ������ ��ȸ
   * @param id
   * @return
   */
  public ConsumerVO readById(String consumer_id);
  
  /**
   * �̸��Ϸ� ���̵� ã��
   * <select id="readByEmail" parameterType="String" resultType="String">
   * @return
   */
  public String readByEmail(String consumer_email);
  
  /**
   * ������ ��� ���ڿ� ����, Box ����
   * @param listFile ��� ���ϸ� 
   * @param categrpno ī�װ���ȣ
   * @param search_count �˻� ����
   * @param nowPage ���� ������, nowPage�� 1���� ����
   * @param word �˻���
   * @return
   */
  public String pagingBox(String listFile, int search_count, int nowPage, String word);
   
  
  /**
   * <xmp>
   * �˻� + ����¡ ���
   * <select id="list_by_search_paging" resultType="ConsumerVO" parameterType="HashMap">
   * </xmp>
   * @param map
   * @return
   */
  public List<ConsumerVO> list_by_search_paging(HashMap<String, Object> map);
  
  /**
   * ī�װ��� �˻� ���ڵ� ����
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * ������ ����� ȸ����޹�ȣ ����
   * <update id="update_grade_no" parameterType="int">
   * @param consumer_no
   * @return
   */
  public int update_grade_no (int consumer_no);
  
  /**
   * ������ ���� ������ ȸ����� 0 ����
   * <update id="update_grade_no_down" parameterType="int">
   * @param consumer_no
   * @return
   */
  public int update_grade_no_down (int consumer_no);
  
}
