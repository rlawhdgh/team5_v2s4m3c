package dev.mvc.save;

import java.util.HashMap;
import java.util.List;





public interface SaveDAOInter {
  
  /**
   * 등록 처리
   * @param saveVO
   * @return
   */
  public int create(SaveVO saveVO);

  /**
   * 조회
   * @param makeno
   * @return
   */
  public SaveVO read(int makeno);
  
  /**
   * 전체 목록 
   * @return
   */
  public List<SaveVO> survey_list_all();
  
  /**
   * 수정 처리
   * @param saveVO
   * @return
   */
  public int update(SaveVO saveVO);
  
  /**
   * 삭제
   * @param makeno
   * @return
   */
  public int delete(int makeno);
  
  /**
   * 패스워드 검사
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap hashMap);
  
  /**
  <xmp>
    cateno별 목록
    <select id="list" resultType="SaveVO" parameterType="int">
  </xmp>
  @return
  */
 public List<SaveVO> list(int makeno);
 
 /**
  * 카테고리별 검색 레코드 갯수
  * @param hashMap
  * @return
  */
 public int search_count(HashMap<String, Object> hashMap);
 
 /**
  * 카테고리별 검색 목록
  * @param hashMap
  * @return
  */
 public List<SaveVO> list_by_survey_cateno_search(HashMap<String, Object> hashMap);
 
 /**
  * <xmp>
  * 검색 + 페이징 목록
  * <select id="list_by_cateno_search_paging" resultType="SaveVO" parameterType="HashMap">
  * </xmp>
  * @param map
  * @return
  */
 public List<SaveVO> list_by_survey_cateno_search_paging(HashMap<String, Object> map);
}


