package dev.mvc.questiongrp;

import java.util.List;





public interface QuestiongrpDAOInter {
  
  
  /**
   * 등록
   * <xmp>
   *  <insert id="create" parameterType="QuestiongrpVO">
   *  </xmp>
   * @return
   */
  public int create(QuestiongrpVO questiongrpVO);
  
  /**
   * 목록
   * <xmp>
   * <select id="list" resultType="QuestiongrpVO">
   * </xmp> 
   * @return 레코드 목록
   */
  public List<QuestiongrpVO> list();  
  
  /**
   * 수정
   * @param openspaceVO
   * @return
   */
  public int update(QuestiongrpVO questiongrpVO);
  
  /**
   * 삭제 처리
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param questiongrp_no
   * @return 처리된 레코드 갯수
   */
  public int delete(int questiongrp_no);
  
  
  

}
