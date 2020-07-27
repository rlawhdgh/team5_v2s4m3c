package dev.mvc.save;

import java.util.HashMap;
import java.util.List;



public interface SaveProcInter {
  /**
   * ��� ó��
   * @param saveVO
   * @return
   */
  public int create(SaveVO saveVO);

  /**
   * ��ȸ
   * @param makeno
   * @return
   */
  public SaveVO read(int makeno);
  
  /**
   * ��ü ��� 
   * @return
   */
  public List<SaveVO> survey_list_all();
  
  /**
   * ���� ��
   * 
   * @param saveVO
   * @return
   */
  public SaveVO update(int makeno);

  /**
   * �н����� �˻�
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap hashMap);
  /**
   * ���� ó��
   * 
   * @param saveVO
   * @return
   */
  public int update(SaveVO saveVO);
  
  /**
   * ����
   * 
   * @param makeno
   * @return
   */
  public int delete(int makeno);
  
  /**
   * ī�װ��� �˻� ���ڵ� ����
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);

  /**
   * <xmp> cateno�� ���
   * <select id="list" resultType="ContentsVO" parameterType="int"> </xmp>
   * 
   * @return
   */
  public List<SaveVO> list(int makeno);
  
  /**
   * ī�װ��� �˻� ���
   * @param hashMap
   * @return
   */
  public List<SaveVO> list_by_survey_cateno_search(HashMap<String, Object> hashMap);
/*  *//**
   * ������ ��� ���ڿ� ����, Box ����
   * @param listFile ��� ���ϸ� 
   * @param categrpno ī�װ���ȣ
   * @param search_count �˻� ����
   * @param nowPage ���� ������, nowPage�� 1���� ����
   * @param word �˻���
   * @return
   */
  public String pagingBox(String listFile, int survey_cateno, int search_count, int nowPage, String word);
  
  /**
   * <xmp>
   * �˻� + ����¡ ���
   * <select id="list_by_cateno_search_paging" resultType="ContentsVO" parameterType="HashMap">
   * </xmp>
   * @param map
   * @return
   */
  public List<SaveVO> list_by_survey_cateno_search_paging(HashMap<String, Object> map);

}
