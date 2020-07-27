package dev.mvc.survey_cate;

import java.util.List;

public interface Survey_cateProcInter {

  /**
   * ���
   * @param survey_cateVO
   * @return
   */
  public int create(Survey_cateVO survey_cateVO);
  

  /**
   * ��ȸ, ������
   * @param survey_categrpno ī�װ� �׷� ��ȣ, PK
   * @return
   */
  public Survey_cateVO read(int survey_cateno);
  
  /**
   * ���� 
   * @param survey_cateVO
   * @return
   */
  public int update(Survey_cateVO survey_cateVO);
  
  /**
   * ���� ó��
   * @param survey_cateno
   * @return
   */
  public int delete(int survey_cateno);
  
   

  /**
   * <xmp>
   *  ���� VO ��� join
   *  <select id="list_join" resultType="Categrp_Cate_join"> 
   * </xmp>
   * @return
   */
  public List<Survey_categrp_Cate_join> list_join();
  
  /**
   * <xmp>
   *  categrpno �� cate ���: categrp + cate inner join,  1 : ��, ���� VO
   *  <select id="list_join_by_categrpno" resultType="Categrp_Cate_join" parameterType="int">
   * </xmp>
   * @param categrpno
   * @return
   */
  public List<Survey_categrp_Cate_join> list_join_by_categrpno(int survey_categrpno);
  
  /**
   * <xmp>
   * ��ü ī�װ� ���
   * <resultMap type="Categrp_Cate_VO" id="Categrp_Cate_VO_Map">
   *                                      ��                                    ��
   *                       ������������                                    ��������                 
   *                       ��                                                            ��          
   *                       ��      <select id="list_all" resultMap="Categrp_Cate_VO_Map">
   * public List<Categrp_Cate_VO> list_all();
   * </xmp>
   * @return
   */
  public List<Survey_categrp_Cate_VO> list_all();
  
  /**
   * <xmp>
   * categrpno ������ ���� �ش��ϴ� cate ��ϸ� ����
   * <resultMap type="Categrp_Cate_VO_list" id="Categrp_Cate_VO_list_Map">
   *                                           ��                                    ��
   *                ��������������������                                    ��������                 
   *                ��                                                                        ��     
   *                ��<select id="list_by_categrpno" resultMap="Categrp_Cate_VO_list_Map"  
   *                ��                                            parameterType="int">
   * public Categrp_Cate_VO_list list_by_categrpno();                                            
   * </xmp>
   * @return
   */
  public Survey_categrp_Cate_VO_list list_by_categrpno(int survey_categrpno);
  
  /**
   * �� �� ����
   * <update id="increaseCnt" parameterType="int">
   * @return
   */
  public int increaseCnt(int survey_cateno);    

  /**
   * �� �� ����
   * <update id="decreaseCnt" parameterType="int">
   * @return
   */
  public int decreaseCnt(int survey_cateno);    
}
