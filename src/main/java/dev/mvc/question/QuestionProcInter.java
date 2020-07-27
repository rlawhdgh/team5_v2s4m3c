package dev.mvc.question;

import java.util.List;

import dev.mvc.openspace.OpenspaceVO;

public interface QuestionProcInter {
  
  /**
   * 등록
   * <xmp>
   *  <insert id="create" parameterType="QuestionVO">
   *  </xmp>
   * @return
   */
  public int create(QuestionVO questionVO);
  
  /**
   * 목록
   * <xmp>
   * <select id="list" resultType="OpenspaceVO">
   * </xmp> 
   * @return 레코드 목록
   */
  public List<QuestionVO> list();    
  
  /**
   * 그룹별 목록
   * @param questiongrp_no
   * @return
   */
  public List<QuestionVO> list_by_question(int questiongrp_no);
  
  
  
  /**
   * 목록
   * <xmp>
   * <select id="division_list1" resultType="QuestionVO">
   * </xmp> 
   * @return 레코드 목록
   */
  public List<QuestionVO> division_list1();  
  
  /**
   * 목록
   * <xmp>
   * <select id="division_list2" resultType="QuestionVO">
   * </xmp> 
   * @return 레코드 목록
   */
  public List<QuestionVO> division_list2();

  public List<QuestionVO> list(QuestionVO questionVO);  
  
  /**
   * 조회
   * @param question_no
   * @return
   */
  public QuestionVO read(int question_no);
  
  
  /**
   * 수정
   * @param openspaceVO
   * @return
   */
  public int update(QuestionVO questionVO);
  
  /**
   * 삭제 처리
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param question_no
   * @return 처리된 레코드 갯수
   */
  public int delete(int question_no);
  
  /**
   * 그룹에 따른 삭제 처리
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param questiongrp_no
   * @return 처리된 레코드 갯수
   */
  public int delete_all(int questiongrp_no);

}
