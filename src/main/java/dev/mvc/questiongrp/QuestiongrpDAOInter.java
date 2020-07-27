package dev.mvc.questiongrp;

import java.util.List;





public interface QuestiongrpDAOInter {
  
  
  /**
   * ���
   * <xmp>
   *  <insert id="create" parameterType="QuestiongrpVO">
   *  </xmp>
   * @return
   */
  public int create(QuestiongrpVO questiongrpVO);
  
  /**
   * ���
   * <xmp>
   * <select id="list" resultType="QuestiongrpVO">
   * </xmp> 
   * @return ���ڵ� ���
   */
  public List<QuestiongrpVO> list();  
  
  /**
   * ����
   * @param openspaceVO
   * @return
   */
  public int update(QuestiongrpVO questiongrpVO);
  
  /**
   * ���� ó��
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param questiongrp_no
   * @return ó���� ���ڵ� ����
   */
  public int delete(int questiongrp_no);
  
  
  

}
