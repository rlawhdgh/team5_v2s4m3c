package dev.mvc.kind;

import java.util.List;

public interface KindDAOInter {
  
  /**
   * ���
   * <xmp>
   *   <insert id="create" parameterType="KindVO">
   * </xmp>
   * @param kindVO
   * @return
   */
  public int create(KindVO kindVO);
  
  /**
   * ���
   * <xmp>
   *    <select id="list_asc" resultType="KindVO">
   * <xmp>
   */
  public List<KindVO> list_asc();
  
  /**
   * ��ȸ, ������
   * <xmp>
   *   <select id="read" resultType="KindVO" parameterType="int">
   * </xmp>
   * @param kind_kindno
   * @return
   */
  public KindVO read(int kind_kindno); 
  
  /**
   * ���� ó��
   * <xmp>
   *  <update id="update" parameterType="KindVO">
   * </xmp>
   * @param kindVO
   * @return
   */
  public int update(KindVO kindVO);
  
  /**
   * ���� ó��
   * <xmp>
   *  <delete id="delete" parameterType="int">
   * </xmp>
   * @param kind_kindno
   * @return
   */
  public int delete(int kind_kindno);
  
  /**
   * ��� ���� ����
   * <xmp>
   *   <update id="update_up" parameterType="int">
   * </xmp>
   * @param kind_kindno
   * @return
   */
  public int update_up(int kind_kindno);
  
  /**
   * ��� ���� ����
   * <xmp>
   *   <update id="update_down" parameterType="int">
   * </xmp>
   * @param kind_kindno
   * @return
   */
  public int update_down(int kind_kindno);
  
  /**
   * �� �� ����
   * <update id="increaseCnt" parameterType="int">
   * @return
   */
  public int increaseCnt(int kind_kindno);    

  /**
   * �� �� ����
   * <update id="decreaseCnt" parameterType="int">
   * @return
   */
  public int decreaseCnt(int kind_kindno);    
  
}