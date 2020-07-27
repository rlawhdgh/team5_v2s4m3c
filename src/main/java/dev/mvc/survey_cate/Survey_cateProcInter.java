package dev.mvc.survey_cate;

import java.util.List;

public interface Survey_cateProcInter {

  /**
   * 등록
   * @param survey_cateVO
   * @return
   */
  public int create(Survey_cateVO survey_cateVO);
  

  /**
   * 조회, 수정폼
   * @param survey_categrpno 카테고리 그룹 번호, PK
   * @return
   */
  public Survey_cateVO read(int survey_cateno);
  
  /**
   * 수정 
   * @param survey_cateVO
   * @return
   */
  public int update(Survey_cateVO survey_cateVO);
  
  /**
   * 삭제 처리
   * @param survey_cateno
   * @return
   */
  public int delete(int survey_cateno);
  
   

  /**
   * <xmp>
   *  통합 VO 기반 join
   *  <select id="list_join" resultType="Categrp_Cate_join"> 
   * </xmp>
   * @return
   */
  public List<Survey_categrp_Cate_join> list_join();
  
  /**
   * <xmp>
   *  categrpno 별 cate 목록: categrp + cate inner join,  1 : 다, 통합 VO
   *  <select id="list_join_by_categrpno" resultType="Categrp_Cate_join" parameterType="int">
   * </xmp>
   * @param categrpno
   * @return
   */
  public List<Survey_categrp_Cate_join> list_join_by_categrpno(int survey_categrpno);
  
  /**
   * <xmp>
   * 전체 카테고리 목록
   * <resultMap type="Categrp_Cate_VO" id="Categrp_Cate_VO_Map">
   *                                      ↑                                    ↑
   *                       ┌────┘                                    └──┐                 
   *                       │                                                            │          
   *                       │      <select id="list_all" resultMap="Categrp_Cate_VO_Map">
   * public List<Categrp_Cate_VO> list_all();
   * </xmp>
   * @return
   */
  public List<Survey_categrp_Cate_VO> list_all();
  
  /**
   * <xmp>
   * categrpno 변수의 값에 해당하는 cate 목록만 추출
   * <resultMap type="Categrp_Cate_VO_list" id="Categrp_Cate_VO_list_Map">
   *                                           ↑                                    ↑
   *                ┌────────┘                                    └──┐                 
   *                │                                                                        │     
   *                │<select id="list_by_categrpno" resultMap="Categrp_Cate_VO_list_Map"  
   *                │                                            parameterType="int">
   * public Categrp_Cate_VO_list list_by_categrpno();                                            
   * </xmp>
   * @return
   */
  public Survey_categrp_Cate_VO_list list_by_categrpno(int survey_categrpno);
  
  /**
   * 글 수 증가
   * <update id="increaseCnt" parameterType="int">
   * @return
   */
  public int increaseCnt(int survey_cateno);    

  /**
   * 글 수 감소
   * <update id="decreaseCnt" parameterType="int">
   * @return
   */
  public int decreaseCnt(int survey_cateno);    
}
