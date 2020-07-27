package dev.mvc.openspace;

import java.util.HashMap;
import java.util.List;

public interface OpenspaceProcInter {
  
  /**
   * ���
   * <xmp>
   * <insert id="create"parameterType="OpenspaceVO">
   * </xmp>
   * @param OpenspaceVO
   * @return ��ϵ� ���ڵ� ����
   */
  public int create(OpenspaceVO openspaceVO);

  
  /**
   * ���
   * <xmp>
   * <select id="list" resultType="OpenspaceVO">
   * </xmp> 
   * @return ���ڵ� ���
   */
  public List<OpenspaceVO> list(HashMap<String, Object> map);    
  
  /**
   * ��ȸ
   * @param contentsno
   * @return
   */
  public OpenspaceVO read(int openspace_no);
  
  /**
   * ��ȸ�� ����
   * @param openspace_no
   * @return
   */
  public int cnt_up(int openspace_no);
  
  /**
   * ���� ��
   * @param openspace_no
   * @return
   */
  public OpenspaceVO update_read(int openspace_no); 
  
  /**
   * ����
   * @param openspaceVO
   * @return
   */
  public int update(OpenspaceVO openspaceVO);
  
  /**
   * ���� ó��
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param openspace_no
   * @return ó���� ���ڵ� ����
   */
  public int delete(int openspace_no);
  
  /**
   * ������ ������
   * @param openspace_no
   * @return
   */
  public OpenspaceVO read_up_down(HashMap<String, Object> map);
  
  /**
   * ���� �˻�
   * <xmp>
   * <select id="title_read" resultType="OpenspaceVO" parameterType="String">
   *</xmp>
   */
  public List<OpenspaceVO> title_list(String word);
  
  /**
   * ���� �˻�
   * <xmp>
   * <select id="content_list" resultType="OpenspaceVO" parameterType="String">
   *</xmp>
   */
  public List<OpenspaceVO> content_list(String word);
  
  /**
   * ���� + ���� �˻�
   * <xmp>
   * <select id="content_list" resultType="OpenspaceVO" parameterType="String">
   *</xmp>
   */
  public List<OpenspaceVO> title_content_list(String word);
  
  /**
   * ��ü �Խñ� ��
   * @return
   */
  public int total_count();
  
  /**
   * �˻� ���ڵ� ����
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * <xmp>
   * �˻� + ����¡ ���
   * <select id="list_by_cateno_search_paging" resultType="ContentsVO" parameterType="HashMap">
   * </xmp>
   * @param map
   * @return
   */
  public List<OpenspaceVO> list_by_search_paging(HashMap<String, Object> map);
  
  /**
   * ������ ��� ���ڿ� ����, Box ����
   * @param listFile ��� ���ϸ� 
   * @param cateno ī�װ���ȣ
   * @param search_count �˻� ����
   * @param nowPage ���� ������, nowPage�� 1���� ����
   * @param word �˻���
   * @return
   */
  public String pagingBox(String listFile, int total_count, int nowPage, String word, String search);

  
  /**
   * ��� ����� ����
   * @param cateVO
   * @return
   */
  public int update_visible(OpenspaceVO openspaceVO);
  
  
  /**
   * ȸ���� �������� ���
   * <xmp>
   * <select id="consumer_openspace_list" resultType="OpenspaceVO">
   * </xmp> 
   * @return ���ڵ� ���
   */
  public List<OpenspaceVO> consumer_openspace_list(int consumer_no);  
}
