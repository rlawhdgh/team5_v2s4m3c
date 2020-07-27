package dev.mvc.survey_cate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.survey_categrp.Survey_categrpVO;



@Component("dev.mvc.survey_cate.Survey_cateProc")
public class Survey_cateProc implements Survey_cateProcInter {
  @Autowired
  private Survey_cateDAOInter survey_cateDAO;
  
  @Override
  public int create(Survey_cateVO survey_cateVO) {
    int cnt = this.survey_cateDAO.create(survey_cateVO);
    return cnt;
  }


  @Override
  public Survey_cateVO read(int survey_cateno) {
    Survey_cateVO survey_cateVO = null;
    survey_cateVO = this.survey_cateDAO.read(survey_cateno);
    
    return survey_cateVO;
  }

  @Override
  public int update(Survey_cateVO survey_cateVO) {
    int cnt = 0;
    cnt = this.survey_cateDAO.update(survey_cateVO);
    return cnt;
  }

  @Override
  public int delete(int survey_cateno) {
    int cnt = 0;
    cnt = this.survey_cateDAO.delete(survey_cateno);
    return cnt;
  }
 

  @Override
  public List<Survey_categrp_Cate_join> list_join() {
    List<Survey_categrp_Cate_join> list = this.survey_cateDAO.list_join();
    return list;
  }

  @Override
  public List<Survey_categrp_Cate_join> list_join_by_categrpno(int survey_categrpno) {
    List<Survey_categrp_Cate_join> list = this.survey_cateDAO.list_join_by_categrpno(survey_categrpno);
    return list;
  }
  
  @Override
  public List<Survey_categrp_Cate_VO> list_all() {
    List<Survey_categrp_Cate_VO> list_all = this.survey_cateDAO.list_all();
    
    return list_all;
  }

  @Override
  public Survey_categrp_Cate_VO_list list_by_categrpno(int survey_categrpno) {
    Survey_categrp_Cate_VO_list list = this.survey_cateDAO.list_by_categrpno(survey_categrpno);
    
    return list;
  }

  @Override
  public int increaseCnt(int survey_cateno) {
    int cnt = 0;
    cnt = this.survey_cateDAO.increaseCnt(survey_cateno);
    return cnt;
  }

  @Override
  public int decreaseCnt(int survey_cateno) {
    int cnt = 0;
    cnt = this.survey_cateDAO.decreaseCnt(survey_cateno);
    return cnt;
  }

  
}
