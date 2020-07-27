package dev.mvc.questiongrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.questiongrp.QuestiongrpProcInter;



@Component("dev.mvc.questiongrp.QuestiongrpProc")
public class QuestiongrpProc implements QuestiongrpProcInter{
  @Autowired
  private QuestiongrpDAOInter QuestiongrpDAO;

  @Override
  public int create(QuestiongrpVO questiongrpVO) {
    int cnt = this.QuestiongrpDAO.create(questiongrpVO);
    return cnt;
  }

  @Override
  public List<QuestiongrpVO> list() {
    List<QuestiongrpVO> list = this.QuestiongrpDAO.list();
    return list;
  }

  @Override
  public int update(QuestiongrpVO questiongrpVO) {
    int cnt = this.QuestiongrpDAO.update(questiongrpVO);
    return cnt;
  }

  @Override
  public int delete(int questiongrp_no) {
    int cnt = this.QuestiongrpDAO.delete(questiongrp_no);
    return cnt;
  }
  
  
  
}
