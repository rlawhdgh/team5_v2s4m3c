package dev.mvc.survey_categrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;




@Component("dev.mvc.survey_categrp.Survey_categrpProc")
public class Survey_categrpProc implements Survey_categrpProcInter {
  @Autowired
  private Survey_categrpDAOInter survey_categrpDAO;

  @Override
  public int create(Survey_categrpVO survey_categrpVO) {
    int cnt = 0;
    cnt = this.survey_categrpDAO.create(survey_categrpVO);
    return cnt;
  }

  @Override
  public List<Survey_categrpVO> list_categrpno_asc() {
    List<Survey_categrpVO> list = null;
    list = this.survey_categrpDAO.list_categrpno_asc();
    return list;
  }

  @Override
  public List<Survey_categrpVO> list_seqno_asc() {
    List<Survey_categrpVO> list = null;
    list = this.survey_categrpDAO.list_seqno_asc();
    return list;
  }
  
  @Override
  public Survey_categrpVO read(int survey_categrpno) {
    Survey_categrpVO survey_categrpVO = null;
    survey_categrpVO = this.survey_categrpDAO.read(survey_categrpno);
    
    return survey_categrpVO;
  }

  @Override
  public int update(Survey_categrpVO survey_categrpVO) {
    int cnt = 0;
    cnt = this.survey_categrpDAO.update(survey_categrpVO);
    
    return cnt;
  }

  @Override
  public int delete(int survey_categrpno) {
    int cnt = 0;
    cnt = this.survey_categrpDAO.delete(survey_categrpno);
    
    return cnt;
  }

  @Override
  public int update_seqno_up(int survey_categrpno) {
    int cnt = 0;
    cnt = this.survey_categrpDAO.update_seqno_up(survey_categrpno);
    
    return cnt;
  }

  @Override
  public int update_seqno_down(int survey_categrpno) {
    int cnt = 0;
    cnt = this.survey_categrpDAO.update_seqno_down(survey_categrpno);    
    return cnt;
  }
 
 
}


