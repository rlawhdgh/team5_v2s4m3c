package dev.mvc.question;

import java.util.List;

import dev.mvc.openspace.OpenspaceVO;

public interface QuestionProcInter {
  
  /**
   * ���
   * <xmp>
   *  <insert id="create" parameterType="QuestionVO">
   *  </xmp>
   * @return
   */
  public int create(QuestionVO questionVO);
  
  /**
   * ���
   * <xmp>
   * <select id="list" resultType="OpenspaceVO">
   * </xmp> 
   * @return ���ڵ� ���
   */
  public List<QuestionVO> list();    
  
  /**
   * �׷캰 ���
   * @param questiongrp_no
   * @return
   */
  public List<QuestionVO> list_by_question(int questiongrp_no);
  
  
  
  /**
   * ���
   * <xmp>
   * <select id="division_list1" resultType="QuestionVO">
   * </xmp> 
   * @return ���ڵ� ���
   */
  public List<QuestionVO> division_list1();  
  
  /**
   * ���
   * <xmp>
   * <select id="division_list2" resultType="QuestionVO">
   * </xmp> 
   * @return ���ڵ� ���
   */
  public List<QuestionVO> division_list2();

  public List<QuestionVO> list(QuestionVO questionVO);  
  
  /**
   * ��ȸ
   * @param question_no
   * @return
   */
  public QuestionVO read(int question_no);
  
  
  /**
   * ����
   * @param openspaceVO
   * @return
   */
  public int update(QuestionVO questionVO);
  
  /**
   * ���� ó��
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param question_no
   * @return ó���� ���ڵ� ����
   */
  public int delete(int question_no);
  
  /**
   * �׷쿡 ���� ���� ó��
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param questiongrp_no
   * @return ó���� ���ڵ� ����
   */
  public int delete_all(int questiongrp_no);

}
