package dev.mvc.openspace;

import java.util.HashMap;
import java.util.List;

public interface OpenspaceProcInter {
  
  /**
   * 등록
   * <xmp>
   * <insert id="create"parameterType="OpenspaceVO">
   * </xmp>
   * @param OpenspaceVO
   * @return 등록된 레코드 갯수
   */
  public int create(OpenspaceVO openspaceVO);

  
  /**
   * 목록
   * <xmp>
   * <select id="list" resultType="OpenspaceVO">
   * </xmp> 
   * @return 레코드 목록
   */
  public List<OpenspaceVO> list(HashMap<String, Object> map);    
  
  /**
   * 조회
   * @param contentsno
   * @return
   */
  public OpenspaceVO read(int openspace_no);
  
  /**
   * 조회수 증가
   * @param openspace_no
   * @return
   */
  public int cnt_up(int openspace_no);
  
  /**
   * 수정 폼
   * @param openspace_no
   * @return
   */
  public OpenspaceVO update_read(int openspace_no); 
  
  /**
   * 수정
   * @param openspaceVO
   * @return
   */
  public int update(OpenspaceVO openspaceVO);
  
  /**
   * 삭제 처리
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param openspace_no
   * @return 처리된 레코드 갯수
   */
  public int delete(int openspace_no);
  
  /**
   * 다음글 이전글
   * @param openspace_no
   * @return
   */
  public OpenspaceVO read_up_down(HashMap<String, Object> map);
  
  /**
   * 제목 검색
   * <xmp>
   * <select id="title_read" resultType="OpenspaceVO" parameterType="String">
   *</xmp>
   */
  public List<OpenspaceVO> title_list(String word);
  
  /**
   * 내용 검색
   * <xmp>
   * <select id="content_list" resultType="OpenspaceVO" parameterType="String">
   *</xmp>
   */
  public List<OpenspaceVO> content_list(String word);
  
  /**
   * 제목 + 내용 검색
   * <xmp>
   * <select id="content_list" resultType="OpenspaceVO" parameterType="String">
   *</xmp>
   */
  public List<OpenspaceVO> title_content_list(String word);
  
  /**
   * 전체 게시글 수
   * @return
   */
  public int total_count();
  
  /**
   * 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * <xmp>
   * 검색 + 페이징 목록
   * <select id="list_by_cateno_search_paging" resultType="ContentsVO" parameterType="HashMap">
   * </xmp>
   * @param map
   * @return
   */
  public List<OpenspaceVO> list_by_search_paging(HashMap<String, Object> map);
  
  /**
   * 페이지 목록 문자열 생성, Box 형태
   * @param listFile 목록 파일명 
   * @param cateno 카테고리번호
   * @param search_count 검색 갯수
   * @param nowPage 현재 페이지, nowPage는 1부터 시작
   * @param word 검색어
   * @return
   */
  public String pagingBox(String listFile, int total_count, int nowPage, String word, String search);

  
  /**
   * 출력 모드의 변경
   * @param cateVO
   * @return
   */
  public int update_visible(OpenspaceVO openspaceVO);
  
  
  /**
   * 회원별 공지사항 목록
   * <xmp>
   * <select id="consumer_openspace_list" resultType="OpenspaceVO">
   * </xmp> 
   * @return 레코드 목록
   */
  public List<OpenspaceVO> consumer_openspace_list(int consumer_no);  
}
