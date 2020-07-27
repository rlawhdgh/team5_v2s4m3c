package dev.mvc.admin;


import java.util.List;
import java.util.Map;


public interface AdminDAOInter {
  
  /**
   * 관리자 등록
   *   <insert id="create" parameterType="AdminVO">
   * @param adminVO
   * @return 등록한 레코드 갯수
   */
  public int create(AdminVO adminVO); 

  
  /**
   * 관리자 목록
   *     <select id="list" resultType="Admin_list_Map">
   * @return
   */
  public List<Admin_listVO> list();
  
  /**
   * 관리자 조회
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
   * 아이디로 조회
   * <select id="readbyId" parameterType="String" resultType="AdminVO">
   * @param admin_id
   * @return
   */
  public AdminVO readById(int consumer_no);
  
  /**
   * 관리자 수정
   *   <update id="update" parameterType="AdminVO">
   * @param adminVO
   * @return
   */
  public int update(AdminVO adminVO);

  /**
   * 관리자 삭제
   *   <delete id="delete" parameterType="int">
   * @param admin_no
   * @return
   */
  public int delete (int consumer_no);
  
  /**
   * 회원번호에 의한 삭제
   * <delete id="delete_by_consumer_no" parameterType="int">
   * @param consumer_no
   * @return
   */
  public int delete_by_consumer_no(int consumer_no);
  
  /**
   * 회원번호가 관리자 인지 확인
   * <select id="admin_cnt" parameterType="int" resultType="int">
   * @param consumer_no
   * @return
   */
  public int admin_cnt (int consumer_no);
  
}
