package dev.mvc.survey_cate;

import java.util.List;

public class Survey_categrp_Cate_VO_list {
  // ���� ����
  // <select id="list_by_categrpno" resultMap="Categrp_Cate_VO_list_Map"  parameterType="int">
  /** ī�װ� �׷� ��ȣ */
  private int survey_categrpno;
  /**  ī�װ� �̸� */
  private String survey_name;
  /** ��� ���� */
  private int survey_seqno;
  /** ����� */
  private String survey_rdate;
  /** ȸ����ȣ */
 

  // <select id="list_seqno_asc_by_categrpno" resultType="CateVO" parameterType="int">
  /** ī�װ� ��� */
  private List<Survey_cateVO> survey_cate_list;

  public int getSurvey_categrpno() {
    return survey_categrpno;
  }

  public void setSurvey_categrpno(int survey_categrpno) {
    this.survey_categrpno = survey_categrpno;
  }

  public String getSurvey_name() {
    return survey_name;
  }

  public void setSurvey_name(String survey_name) {
    this.survey_name = survey_name;
  }

  public int getSurvey_seqno() {
    return survey_seqno;
  }

  public void setSurvey_seqno(int survey_seqno) {
    this.survey_seqno = survey_seqno;
  }

  public String getSurvey_rdate() {
    return survey_rdate;
  }

  public void setSurvey_rdate(String survey_rdate) {
    this.survey_rdate = survey_rdate;
  }

  public List<Survey_cateVO> getSurvey_cate_list() {
    return survey_cate_list;
  }

  public void setSurvey_cate_list(List<Survey_cateVO> survey_cate_list) {
    this.survey_cate_list = survey_cate_list;
  }  




  
}







