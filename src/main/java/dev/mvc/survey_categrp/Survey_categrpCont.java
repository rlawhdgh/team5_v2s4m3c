package dev.mvc.survey_categrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class Survey_categrpCont {
  @Autowired
  @Qualifier("dev.mvc.survey_categrp.Survey_categrpProc")
  private Survey_categrpProcInter survey_categrpProc;
  
  
  public Survey_categrpCont() {
    System.out.println("--> Survey_categrpCont created.");
}
// http://localhost:9090/team5/survey_categrp/survey_create.do
/**
 * 등록 폼
 * @return
 */
@RequestMapping(value="/survey_categrp/survey_create.do", method=RequestMethod.GET )
public ModelAndView create() {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/survey_categrp/survey_create"); // webapp/cate/create.jsp
  
  return mav;
}

// http://localhost:9090/team5/survey_categrp/create.do
/**
 * 등록 처리
 * @param surveyVO
 * @return
 */
@RequestMapping(value="/survey_categrp/survey_create.do", method=RequestMethod.POST )
public ModelAndView create(Survey_categrpVO survey_categrpVO) {

  ModelAndView mav = new ModelAndView();  
  int cnt = this.survey_categrpProc.create(survey_categrpVO); // 등록 처리
  mav.addObject("cnt", cnt); // request에 저장, request.setAttribute("cnt", cnt)
  
  mav.setViewName("/survey_categrp/survey_create_msg"); // webapp/categrp/create_msg.jsp

  return mav; // forward
}
// http://localhost:9090/team5/survey_categrp/list.do
/**
 * 전체 목록
 * @return
 *
 */
@RequestMapping(value="/survey_categrp/survey_list.do", method=RequestMethod.GET )
public ModelAndView list() {
  ModelAndView mav = new ModelAndView();
  
  List<Survey_categrpVO> list = this.survey_categrpProc.list_seqno_asc();
  mav.addObject("list", list); // request.setAttribute("list", list);

  mav.setViewName("/survey_categrp/survey_list"); // webapp/cate/list.jsp
  return mav;
}
// http://localhost:9090/team5/survey_categrp/read_update.do
/**
 * 조회 + 수정폼
 * @param survey_categrpno 조회할 카테고리 번호
 * @return
 */
@RequestMapping(value="/survey_categrp/survey_read_update.do", method=RequestMethod.GET )
public ModelAndView read_update(int survey_categrpno) {

  
  ModelAndView mav = new ModelAndView();
  
  Survey_categrpVO survey_categrpVO = this.survey_categrpProc.read(survey_categrpno);
  mav.addObject("survey_categrpVO", survey_categrpVO);  // request 객체에 저장
  
  List<Survey_categrpVO> list = this.survey_categrpProc.list_categrpno_asc();
  mav.addObject("list", list);  // request 객체에 저장

  mav.setViewName("/survey_categrp/survey_read_update"); 
  return mav; // forward
}

// http://localhost:9090/team5/survey_categrp/update.do
/**
 * 수정 처리
 * @param survey_categrpVO
 * @return
 */
@RequestMapping(value="/survey_categrp/survey_update.do", method=RequestMethod.POST )
public ModelAndView update(Survey_categrpVO survey_categrpVO) {

  
  ModelAndView mav = new ModelAndView();
  
  int cnt = this.survey_categrpProc.update(survey_categrpVO);
  mav.addObject("cnt", cnt); // request에 저장
  
  mav.setViewName("/survey_categrp/survey_update_msg"); 
  
  return mav;
}

// http://localhost:9090/team5/survey_categrp/read_delete.do
/**
 * 조회 + 삭제폼
 * @param survey_categrpno 조회할 카테고리 번호
 * @return
 */
@RequestMapping(value="/survey_categrp/survey_read_delete.do", method=RequestMethod.GET )
public ModelAndView read_delete(int survey_categrpno) {
  ModelAndView mav = new ModelAndView();
  
  Survey_categrpVO survey_categrpVO = this.survey_categrpProc.read(survey_categrpno); // 삭제할 자료 읽기
  mav.addObject("survey_categrpVO", survey_categrpVO);  // request 객체에 저장
  
  List<Survey_categrpVO> list = this.survey_categrpProc.list_categrpno_asc(); // 목록
  mav.addObject("list", list);  // request 객체에 저장

  mav.setViewName("/survey_categrp/survey_read_delete"); 
  return mav;
}

// http://localhost:9090/team5/survey_categrp/delete.do
/**
 * 삭제
 * @param categrpno 조회할 카테고리 번호
 * @return
 */
@RequestMapping(value="/survey_categrp/survey_delete.do", method=RequestMethod.POST )
public ModelAndView delete(int survey_categrpno) {
  ModelAndView mav = new ModelAndView();
  
  Survey_categrpVO survey_categrpVO = this.survey_categrpProc.read(survey_categrpno); // 삭제 정보
  mav.addObject("survey_categrpVO", survey_categrpVO);  // request 객체에 저장
  
  int cnt = this.survey_categrpProc.delete(survey_categrpno); // 삭제 처리
  mav.addObject("cnt", cnt);  // request 객체에 저장
  
  mav.setViewName("/survey_categrp/survey_delete_msg"); // webapp/categrp/delete_msg.jsp

  
  return mav;
}
// http://localhost:9090/team5/survey_categrp/survey_update_seqno_up.do?survey_categrpno=1
// http://localhost:9090/team5/survey_categrp/survey_update_seqno_up.do?survey_categrpno=1000
/**
 * 우선순위 상향 up 10 ▷ 1
 * @param survey_categrpno 조회할 카테고리 번호
 * @return
 */
@RequestMapping(value="/survey_categrp/survey_update_seqno_up.do", 
                            method=RequestMethod.GET )
public ModelAndView update_seqno_up(int survey_categrpno) {
  ModelAndView mav = new ModelAndView();
  
  Survey_categrpVO survey_categrpVO = this.survey_categrpProc.read(survey_categrpno); // 카테고리 그룹 정보
  mav.addObject("survey_categrpVO", survey_categrpVO);  // request 객체에 저장
  
  int cnt = this.survey_categrpProc.update_seqno_up(survey_categrpno);  // 우선 순위 상향 처리
  mav.addObject("cnt", cnt);  // request 객체에 저장

  mav.setViewName("/survey_categrp/survey_update_seqno_up_msg"); // update_seqno_up_msg.jsp
  return mav;
}  

// http://localhost:9090/team5/survey_categrp/survey_update_seqno_down.do?categrpno=1
// http://localhost:9090/team5/survey_categrp/survey_update_seqno_down.do?categrpno=1000
/**
 * 우선순위 상향 up 10 ▷ 1
 * @param survey_categrpno 조회할 카테고리 번호
 * @return
 */
@RequestMapping(value="/survey_categrp/survey_update_seqno_down.do", 
                            method=RequestMethod.GET )
public ModelAndView update_seqno_down(int survey_categrpno) {
  ModelAndView mav = new ModelAndView();
  
  Survey_categrpVO survey_categrpVO = this.survey_categrpProc.read(survey_categrpno); // 카테고리 그룹 정보
  mav.addObject("survey_categrpVO", survey_categrpVO);  // request 객체에 저장
  
  int cnt = this.survey_categrpProc.update_seqno_down(survey_categrpno);
  mav.addObject("cnt", cnt);  // request 객체에 저장

  mav.setViewName("/survey_categrp/survey_update_seqno_down_msg"); // update_seqno_down_msg.jsp

  return mav;
}  


}
