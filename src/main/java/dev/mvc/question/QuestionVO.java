package dev.mvc.question;

import dev.mvc.tool.Tool;

public class QuestionVO {
  
  /*
   *question_no                       NUMBER(10)     NOT NULL    PRIMARY KEY,
    admin_no                       NUMBER(10)  NOT NULL,       
    question_title                    VARCHAR2(100)    NOT NULL,
    question_content                  CLOB     NOT NULL,
    question_division                 VARCHAR2(50)     NOT NULL,
    question_seqno                    NUMBER(3)    NOT NULL,
    question_date                     DATE     NOT NULL,
   */
  
  /**�θ����̺� �̸� */
  private String questiongrp_name;
  

  /** ���ֹ��� ���� ��ȣ */
  private int question_no;
  /** �׷� ��ȣ */
  private int questiongrp_no;
  /** ���ֹ��� ���� ���� */
  private String question_title;
  /** ���ֹ��� ���� ���� */
  private String question_content;
  /** ���ֹ��� ���� ���� */
  private String question_division;
  /** ���ֹ��� ���� ��� ���� */
  private int question_seqno;
  /** ���ֹ��� ���� url */
  private String question_url;
  /** ����� */
  private String question_date;
  
  
  
  

  public String getQuestiongrp_name() {
    return questiongrp_name;
  }
  public void setQuestiongrp_name(String questiongrp_name) {
    this.questiongrp_name = questiongrp_name;
  }
  public int getQuestiongrp_no() {
    return questiongrp_no;
  }
  public void setQuestiongrp_no(int questiongrp_no) {
    this.questiongrp_no = questiongrp_no;
  }
  public String getQuestion_content_br() {
    return Tool.convertChar(question_content);
  }
  public void setQuestion_content_br(String question_content_br) {
    this.question_content = question_content_br;
  }
  public String getQuestion_title() {
    return question_title;
  }
  public void setQuestion_title(String question_title) {
    this.question_title = question_title;
  }
  public String getQuestion_url() {
    return question_url;
  }
  public void setQuestion_url(String question_url) {
    this.question_url = question_url;
  }
  public int getQuestion_no() {
    return question_no;
  }
  public void setQuestion_no(int question_no) {
    this.question_no = question_no;
  }
  public String getQuestion_content() {
    return question_content;
  }
  public void setQuestion_content(String question_content) {
    this.question_content = question_content;
  }
  public String getQuestion_division() {
    return question_division;
  }
  public void setQuestion_division(String question_division) {
    this.question_division = question_division;
  }
  public int getQuestion_seqno() {
    return question_seqno;
  }
  public void setQuestion_seqno(int question_seqno) {
    this.question_seqno = question_seqno;
  }
  public String getQuestion_date() {
    return question_date;
  }
  public void setQuestion_date(String question_date) {
    this.question_date = question_date;
  }
  
  
  
  
  
}
