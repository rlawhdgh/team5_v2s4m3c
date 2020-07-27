package dev.mvc.survey_cate;

public class Survey_cateVO {
  /** 카테고리 번호 */
  private int survey_cateno;  
  /** 카테고리 그룹 번호 */
  private int survey_categrpno;
  /**  카테고리 이름 */
  private String survey_name;
  /** 등록일 */
  private String survey_rdate;
  /** 등록된 글 수 */
  private int survey_cnt; 
  


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
