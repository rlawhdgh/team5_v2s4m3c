package dev.mvc.index_img;

import java.util.HashMap;
import java.util.List;

public interface Index_imgProcInter {
  
  /**
   * 등록
   * <xmp>
   * <insert id="create"parameterType="Index_imgVO">
   * </xmp>
   * @param Index_imgVO
   * @return 등록된 레코드 갯수
   */
  public int create(Index_imgVO index_imgVO);
  
  /**
   * 수정
   * <xmp>
   * <insert id="create"parameterType="Index_imgVO">
   * </xmp>
   * @param Index_imgVO
   * @return 등록된 레코드 갯수
   */
  public int update(Index_imgVO index_imgVO);
  
  /**
   * 목록
   * <xmp>
   * <select id="list" resultType="Index_imgVO">
   * </xmp> 
   * @return 레코드 목록
   */
  public List<Index_imgVO> list();    

  
  /**
   * 목록
   * <xmp>
   * <select id="list" resultType="OpenspaceVO">
   * </xmp> 
   * @return 레코드 목록
   */
  public List<Index_imgVO> list_main();   
  
  /**
   * 목록
   * <xmp>
   * <select id="list" resultType="OpenspaceVO">
   * </xmp> 
   * @return 레코드 목록
   */
  public List<Index_imgVO> list_event();   
  
  
  public List<Index_imgVO> list_by_paging(HashMap<String, Object> map);
  
  public String pagingBox(String listFile, int total_count, int nowPage);
  
  
  /**
   * 조회
   * @param contentsno
   * @return
   */
  public Index_imgVO read(int index_img_no);
  
  
  /**
   * 삭제 처리
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param index_img_no
   * @return 처리된 레코드 갯수
   */
  public int delete(int index_img_no);
  
  
}
