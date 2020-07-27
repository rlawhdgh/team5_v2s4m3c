package dev.mvc.index_img;

import java.util.HashMap;
import java.util.List;

public interface Index_imgProcInter {
  
  /**
   * ���
   * <xmp>
   * <insert id="create"parameterType="Index_imgVO">
   * </xmp>
   * @param Index_imgVO
   * @return ��ϵ� ���ڵ� ����
   */
  public int create(Index_imgVO index_imgVO);
  
  /**
   * ����
   * <xmp>
   * <insert id="create"parameterType="Index_imgVO">
   * </xmp>
   * @param Index_imgVO
   * @return ��ϵ� ���ڵ� ����
   */
  public int update(Index_imgVO index_imgVO);
  
  /**
   * ���
   * <xmp>
   * <select id="list" resultType="Index_imgVO">
   * </xmp> 
   * @return ���ڵ� ���
   */
  public List<Index_imgVO> list();    

  
  /**
   * ���
   * <xmp>
   * <select id="list" resultType="OpenspaceVO">
   * </xmp> 
   * @return ���ڵ� ���
   */
  public List<Index_imgVO> list_main();   
  
  /**
   * ���
   * <xmp>
   * <select id="list" resultType="OpenspaceVO">
   * </xmp> 
   * @return ���ڵ� ���
   */
  public List<Index_imgVO> list_event();   
  
  
  public List<Index_imgVO> list_by_paging(HashMap<String, Object> map);
  
  public String pagingBox(String listFile, int total_count, int nowPage);
  
  
  /**
   * ��ȸ
   * @param contentsno
   * @return
   */
  public Index_imgVO read(int index_img_no);
  
  
  /**
   * ���� ó��
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param index_img_no
   * @return ó���� ���ڵ� ����
   */
  public int delete(int index_img_no);
  
  
}
