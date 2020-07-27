package dev.mvc.question;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.openspace.OpenspaceVO;
import dev.mvc.question.QuestionVO;
import dev.mvc.tool.Tool;

@Component("dev.mvc.question.QuestionProc")
public class QuestionProc implements QuestionProcInter {
  @Autowired
  private QuestionDAOInter QuestionDAO;
  

  @Override
  public int create(QuestionVO questionVO) {
    int cnt = this.QuestionDAO.create(questionVO);
    return cnt;
  }

  @Override
  public List<QuestionVO> list() {
    List<QuestionVO> list = this.QuestionDAO.list();
    for(int i=0; i<list.size(); i++) {
      String content = list.get(i).getQuestion_content();
      Tool.convertChar(content);
 
    }
    
    
    return list;
  }
  @Override
  public List<QuestionVO> list(QuestionVO questionVO) {
    List<QuestionVO> list = this.QuestionDAO.list();
    
    return list;
  }

  @Override
  public List<QuestionVO> division_list1() {
    List<QuestionVO> list = this.QuestionDAO.division_list1();
    return list;
  }

  @Override
  public List<QuestionVO> division_list2() {
    List<QuestionVO> list = this.QuestionDAO.division_list2();
    return list;
  }

  @Override
  public QuestionVO read(int question_no) {
    QuestionVO questionVO = this.QuestionDAO.read(question_no); 
    return questionVO;
  }

  @Override
  public int update(QuestionVO questionVO) {
    int cnt = this.QuestionDAO.update(questionVO);
    return cnt;
  }

  @Override
  public int delete(int question_no) {
    int cnt = this.QuestionDAO.delete(question_no);
    return cnt;
  }

  @Override
  public List<QuestionVO> list_by_question(int questiongrp_no) {
    List<QuestionVO> list= this.QuestionDAO.list_by_question(questiongrp_no);
    return list;
  }

  @Override
  public int delete_all(int questiongrp_no) {
    int cnt = this.QuestionDAO.delete_all(questiongrp_no);
    return cnt;
  }


    
  
  
}
