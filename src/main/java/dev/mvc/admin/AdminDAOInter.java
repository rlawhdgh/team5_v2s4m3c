package dev.mvc.admin;


import java.util.List;
import java.util.Map;


public interface AdminDAOInter {
  
  /**
   * ������ ���
   *   <insert id="create" parameterType="AdminVO">
   * @param adminVO
   * @return ����� ���ڵ� ����
   */
  public int create(AdminVO adminVO); 

  
  /**
   * ������ ���
   *     <select id="list" resultType="Admin_list_Map">
   * @return
   */
  public List<Admin_listVO> list();
  
  /**
   * ������ ��ȸ
   *   <select id="read" parameterType="int" resultType="AdminVO">
   * @param admin_no
   * @return
   */
  public AdminVO read(int admin_no);
  
  /**
   * <select id="login" resultType="int" parameterType="Map">
   * @param map
   * @return
   */
  public int login(Map map);
  
  /**
   * ���̵�� ��ȸ
   * <select id="readbyId" parameterType="String" resultType="AdminVO">
   * @param admin_id
   * @return
   */
  public AdminVO readById(int consumer_no);
  
  /**
   * ������ ����
   *   <update id="update" parameterType="AdminVO">
   * @param adminVO
   * @return
   */
  public int update(AdminVO adminVO);

  /**
   * ������ ����
   *   <delete id="delete" parameterType="int">
   * @param admin_no
   * @return
   */
  public int delete (int consumer_no);
  
  /**
   * ȸ����ȣ�� ���� ����
   * <delete id="delete_by_consumer_no" parameterType="int">
   * @param consumer_no
   * @return
   */
  public int delete_by_consumer_no(int consumer_no);
  
  /**
   * ȸ����ȣ�� ������ ���� Ȯ��
   * <select id="admin_cnt" parameterType="int" resultType="int">
   * @param consumer_no
   * @return
   */
  public int admin_cnt (int consumer_no);
  
}
