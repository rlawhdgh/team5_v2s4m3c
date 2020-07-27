package dev.mvc.survey_cate;

/*
    SELECT r.categrpno as r_categrpno, r.name as r_name,
               c.cateno, c.categrpno, c.name, c.seqno, c.visible, c.rdate, c.cnt    FROM categrp r, cate c
    WHERE r.categrpno = c.categrpno
    ORDER BY r.categrpno ASC, c.seqno ASC
 */
public class Survey_categrp_Cate_join {

  /** �θ� ���̺� ī�װ� �׷� ��ȣ */
  private int r_survey_categrpno;
  /** �θ� ���̺� ī�װ� �׷� �̸� */
  private String r_survey_name;
  /** ī�װ� ��ȣ */
  
  // -------------------------------------------------------------------
  // Cate table
  // -------------------------------------------------------------------  
  private int survey_cateno;  
  /** ī�װ� �׷� ��ȣ */
  private int survey_categrpno;
  /**  ī�װ� �̸� */
  private String survey_name;
  /** ��� ���� */
  private int survey_seqno;
  /** ����� */
  private String survey_rdate;
  /** ��ϵ� �� �� */
  private int survey_cnt;

  public int getR_survey_categrpno() {
    return r_survey_categrpno;
  }
  public void setR_survey_categrpno(int r_survey_categrpno) {
    this.r_survey_categrpno = r_survey_categrpno;
  }
  public String getR_survey_name() {
    return r_survey_name;
  }
  public void setR_survey_name(String r_survey_name) {
    this.r_survey_name = r_survey_name;
  }
  public int getSurvey_cateno() {
    return survey_cateno;
  }
  public void setSurvey_cateno(int survey_cateno) {
    this.survey_cateno = survey_cateno;
  }
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
  public int getSurvey_cnt() {
    return survey_cnt;
  }
  public void setSurvey_cnt(int survey_cnt) {
    this.survey_cnt = survey_cnt;
  }
  
  
  
}








