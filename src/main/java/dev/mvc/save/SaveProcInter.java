package dev.mvc.save;

import java.util.HashMap;
import java.util.List;



public interface SaveProcInter {
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
   * 수정 폼
   * 
   * @param saveVO
   * @return
   */
  public SaveVO update(int makeno);

  /**
   * 패스워드 검사
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap hashMap);
  /**
   * 수정 처리
   * 
   * @param saveVO
   * @return
   */
  public int update(SaveVO saveVO);
  
  /**
   * 삭제
   * 
   * @param makeno
   * @return
   */
  public int delete(int makeno);
  
  /**
   * 카테고리별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);

  /**
   * <xmp> cateno별 목록
   * <select id="list" resultType="ContentsVO" parameterType="int"> </xmp>
   * 
   * @return
   */
  public List<SaveVO> list(int makeno);
  
  /**
   * 카테고리별 검색 목록
   * @param hashMap
   * @return
   */
  public List<SaveVO> list_by_survey_cateno_search(HashMap<String, Object> hashMap);
/*  *//**
   * 페이지 목록 문자열 생성, Box 형태
   * @param listFile 목록 파일명 
   * @param categrpno 카테고리번호
   * @param search_count 검색 갯수
   * @param nowPage 현재 페이지, nowPage는 1부터 시작
   * @param word 검색어
   * @return
   */
  public String pagingBox(String listFile, int survey_cateno, int search_count, int nowPage, String word);
  
  /**
   * <xmp>
   * 검색 + 페이징 목록
   * <select id="list_by_cateno_search_paging" resultType="ContentsVO" parameterType="HashMap">
   * </xmp>
   * @param map
   * @return
   */
  public List<SaveVO> list_by_survey_cateno_search_paging(HashMap<String, Object> map);

}
