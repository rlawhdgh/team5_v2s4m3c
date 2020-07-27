package dev.mvc.point;

import java.util.List;

public interface PointDAOInter {
  
 /**
  * <insert id="create" parameterType="PointVO">
  * @param pointVO
  * @return
  */
  public int create(PointVO pointVO);
  
  /**
   * <select id="list_all" resultType="PointVO">
   * @return
   */
  public List<PointVO> list_all();
  
  /**
   * <update id="update_point" parameterType="PointVO">
   * @param pointVO
   * @return
   */
  public int update_point(PointVO pointVO);
  
 /**
  * <select id="read" resultType="PointVO" parameterType="int">
  * @param consumer_no
  * @return
  */
  public PointVO read(int consumer_no);
}
