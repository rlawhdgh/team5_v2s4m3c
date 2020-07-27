package dev.mvc.survey_categrp;

public class Survey_categrpVO {
  
  /** 카테고리 그룹 번호 */
  private int survey_categrpno;
  
  /** 카테고리 이름 */
  private String survey_name;
  
  /** 카테고리 출력 순서 */
  private int survey_seqno;
 
  /** 카테고리 생성일 */
  private String survey_rdate;
  
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
 

  
}
