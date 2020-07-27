package dev.mvc.save;

public class SaveVO {
  
  private int makeno;  
  private int survey_cateno; 
  private String question;    
  private String item1;
  private String item2;
  private String item3;
  private int period;
  private String wdate; 
  private String word;  
  private int cnt;
  private int vote;
  private int passwd;
  
  public int getPasswd() {
    return passwd;
  }
  public void setPasswd(int passwd) {
    this.passwd = passwd;
  }
  public String getItem1() {
    return item1;
  }
  public void setItem1(String item1) {
    this.item1 = item1;
  }
  public String getItem2() {
    return item2;
  }
  public void setItem2(String item2) {
    this.item2 = item2;
  }
  public String getItem3() {
    return item3;
  }
  public void setItem3(String item3) {
    this.item3 = item3;
  }
  public int getMakeno() {
    return makeno;
  }
  public void setMakeno(int makeno) {
    this.makeno = makeno;
  }
  public int getSurvey_cateno() {
    return survey_cateno;
  }
  public void setSurvey_cateno(int survey_cateno) {
    this.survey_cateno = survey_cateno;
  }
  public String getQuestion() {
    return question;
  }
  public void setQuestion(String question) {
    this.question = question;
  }
 
  public int getPeriod() {
    return period;
  }
  public void setPeriod(int period) {
    this.period = period;
  }
  public String getWdate() {
    return wdate;
  }
  public void setWdate(String wdate) {
    this.wdate = wdate;
  }
  public String getWord() {
    return word;
  }
  public void setWord(String word) {
    this.word = word;
  }
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  public int getVote() {
    return vote;
  }
  public void setVote(int vote) {
    this.vote = vote;
  }

 
 
  
}
