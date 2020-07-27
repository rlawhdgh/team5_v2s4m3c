package dev.mvc.survey_categrp;

import java.util.List;



public interface Survey_categrpProcInter {
  /**
   * 등록
   * @param surveyVO
   * @return
   */
  public int create(Survey_categrpVO survey_categrpVO);
  
  /**
   * 목록
   * <xmp>
   * <select id="list_categrpno_asc" resultType="Survey_categrpVO">
   * </xmp> 
   * @return 레코드 목록
   */
  public List<Survey_categrpVO> list_categrpno_asc();  
  
  /**
   * 출력 순서별 목록
   * @return
   */
  public List<Survey_categrpVO> list_seqno_asc();
  
  
  /**
   * 조회, 수정폼
   * <xmp>
   *   <select id="read" resultType="Survey_categrpVO" parameterType="int">
   * </xmp>  
   * @param survey_categrpno 카테고리 그룹 번호, PK
   * @return
   */
  public Survey_categrpVO read(int survey_categrpno);
  
  /**
   * 수정 처리
   * <xmp>
   *   <update id="update" parameterType="Survey_categrpVO"> 
   * </xmp>
   * @param Survey_categrpVO
   * @return 처리된 레코드 갯수
   */
  public int update(Survey_categrpVO survey_categrpVO);
  
  /**
   * 삭제 처리
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param survey_categrpno
   * @return 처리된 레코드 갯수
   */
  public int delete(int survey_categrpno);
  
  /**
   * 출력 순서 상향
   * <xmp>
   * <update id="update_seqno_up" parameterType="int">
   * </xmp>
   * @param survey_categrpno
   * @return 처리된 레코드 갯수
   */
  public int update_seqno_up(int survey_categrpno);
 
  /**
   * 출력 순서 하향
   * <xmp>
   * <update id="update_seqno_down" parameterType="int">
   * </xmp>
   * @param survey_categrpno
   * @return 처리된 레코드 갯수
   */
  public int update_seqno_down(int survey_categrpno); 

}

