package dev.mvc.questiongrp;

public class QuestiongrpVO {
  
  /*
    questiongrp_no                        NUMBER(10)     NOT NULL    PRIMARY KEY,
    admin_no                                NUMBER(10)         NOT NULL,       
    questiongrp_name                  VARCHAR2(50)     NOT NULL,
    questiongrp_seqno                 NUMBER(7)        DEFAULT 0     NOT NULL,
   */
  
  /** �׷� ��ȣ */
  private int questiongrp_no;
  /** ������ ��ȣ */
  private int admin_no;
  /** �׷� �̸� */
  private String questiongrp_name;
  /** ��� ���� */
  private int questiongrp_seqno;
  
  
  
  public int getQuestiongrp_no() {
    return questiongrp_no;
  }
  public void setQuestiongrp_no(int questiongrp_no) {
    this.questiongrp_no = questiongrp_no;
  }
  public int getAdmin_no() {
    return admin_no;
  }
  public void setAdmin_no(int admin_no) {
    this.admin_no = admin_no;
  }
  public String getQuestiongrp_name() {
    return questiongrp_name;
  }
  public void setQuestiongrp_name(String questiongrp_name) {
    this.questiongrp_name = questiongrp_name;
  }
  public int getQuestiongrp_seqno() {
    return questiongrp_seqno;
  }
  public void setQuestiongrp_seqno(int questiongrp_seqno) {
    this.questiongrp_seqno = questiongrp_seqno;
  }
  
  
  

}
