package dev.mvc.survey_categrp;

import java.util.List;



public interface Survey_categrpProcInter {
  /**
   * ���
   * @param surveyVO
   * @return
   */
  public int create(Survey_categrpVO survey_categrpVO);
  
  /**
   * ���
   * <xmp>
   * <select id="list_categrpno_asc" resultType="Survey_categrpVO">
   * </xmp> 
   * @return ���ڵ� ���
   */
  public List<Survey_categrpVO> list_categrpno_asc();  
  
  /**
   * ��� ������ ���
   * @return
   */
  public List<Survey_categrpVO> list_seqno_asc();
  
  
  /**
   * ��ȸ, ������
   * <xmp>
   *   <select id="read" resultType="Survey_categrpVO" parameterType="int">
   * </xmp>  
   * @param survey_categrpno ī�װ� �׷� ��ȣ, PK
   * @return
   */
  public Survey_categrpVO read(int survey_categrpno);
  
  /**
   * ���� ó��
   * <xmp>
   *   <update id="update" parameterType="Survey_categrpVO"> 
   * </xmp>
   * @param Survey_categrpVO
   * @return ó���� ���ڵ� ����
   */
  public int update(Survey_categrpVO survey_categrpVO);
  
  /**
   * ���� ó��
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param survey_categrpno
   * @return ó���� ���ڵ� ����
   */
  public int delete(int survey_categrpno);
  
  /**
   * ��� ���� ����
   * <xmp>
   * <update id="update_seqno_up" parameterType="int">
   * </xmp>
   * @param survey_categrpno
   * @return ó���� ���ڵ� ����
   */
  public int update_seqno_up(int survey_categrpno);
 
  /**
   * ��� ���� ����
   * <xmp>
   * <update id="update_seqno_down" parameterType="int">
   * </xmp>
   * @param survey_categrpno
   * @return ó���� ���ڵ� ����
   */
  public int update_seqno_down(int survey_categrpno); 

}

