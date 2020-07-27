
package dev.mvc.survey_cate;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.survey_categrp.Survey_categrpProcInter;
import dev.mvc.survey_categrp.Survey_categrpVO;


@Controller
public class Survey_cateCont {
  @Autowired
  @Qualifier("dev.mvc.survey_categrp.Survey_categrpProc")
  private Survey_categrpProcInter survey_categrpProc;

  @Autowired
  @Qualifier("dev.mvc.survey_cate.Survey_cateProc")
  private Survey_cateProcInter survey_cateProc;


// http://localhost:9090/team5/survey_cate/survey_create.do
/**
 * 등록 폼
 * @return
 */
@RequestMapping(value="/survey_cate/survey_create.do", method=RequestMethod.GET )
public ModelAndView create() {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/survey_cate/survey_create"); // webapp/cate/create.jsp
  
  return mav;
}

// http://localhost:9090/team5/survey_cate/survey_create.do
/**
 * 등록 처리
 * @param Survey_cateVO
 * @return
 */
@RequestMapping(value="/survey_cate/survey_create.do", method=RequestMethod.POST )
public ModelAndView create(Survey_cateVO survey_cateVO) {
  ModelAndView mav = new ModelAndView();
  
  int cnt = this.survey_cateProc.create(survey_cateVO);
  mav.addObject("cnt", cnt); // request에 저장
  
  Survey_categrpVO survey_categrpVO = this.survey_categrpProc.read(survey_cateVO.getSurvey_categrpno());
  mav.addObject("survey_categrpVO", survey_categrpVO);
  
  if (cnt == 1) {
    mav.setViewName("/survey_cate/survey_create_msg"); // webapp/cate/create_msg.jsp
    // mav.setViewName("redirect:/cate/list.do"); // spring 재호출
  } else { 
    mav.setViewName("/survey_cate/survey_create_msg"); // webapp/cate/create_msg.jsp
  }
  
  return mav;
}
/*// http://localhost:9090/team5/survey_cate/survey_list.do
*//**
 * 전체 목록
 * @return
 *//*
@RequestMapping(value="/survey_cate/survey_list.do", method=RequestMethod.GET )
public ModelAndView list() {
  ModelAndView mav = new ModelAndView();
  
  List<Survey_cateVO> list = this.survey_cateProc.list_seqno_asc();
  mav.addObject("list", list); // request.setAttribute("list", list);

  mav.setViewName("/survey_cate/survey_list"); // webapp/cate/list.jsp
  return mav;
}*/
/**
 * 조회 + 수정폼
 * @param cateno 조회할 카테고리 번호
 * @return
 */
@RequestMapping(value="/survey_cate/survey_read_update.do", method=RequestMethod.GET )
public ModelAndView read_update(int survey_cateno) {

  
  ModelAndView mav = new ModelAndView();
  
  Survey_cateVO survey_cateVO = this.survey_cateProc.read(survey_cateno);
  mav.addObject("survey_cateVO", survey_cateVO);  
  
 /* List<Survey_cateVO> list = this.survey_cateProc.list_seqno_asc();
  mav.addObject("list", list); */

  mav.setViewName("/survey_cate/survey_read_update"); // webapp/cate/read_update.jsp
  return mav; // forward
}

// http://localhost:9090/resort/cate/update.do
/**
 * 수정 처리
 * @param cateVO
 * @return
 */
@RequestMapping(value="/survey_cate/survey_update.do", method=RequestMethod.POST )
public ModelAndView update(Survey_cateVO survey_cateVO) {
  ModelAndView mav = new ModelAndView();
  
  int cnt = this.survey_cateProc.update(survey_cateVO);
  mav.addObject("cnt", cnt); 
  
  if (cnt == 1) {

    mav.setViewName("redirect:/survey_cate/survey_list_all.do"); 
  } else { 
    mav.setViewName("/survey_cate/survey_update_msg"); 
  }
  
  return mav;
}

// http://localhost:9090/resort/cate/read_delete.do
/**
 * 조회 + 삭제폼
 * @param cateno 삭제할 카테고리 번호
 * @return
 */
@RequestMapping(value="/survey_cate/survey_read_delete.do", method=RequestMethod.GET )
public ModelAndView read_delete(int survey_cateno) {
  
  ModelAndView mav = new ModelAndView();
  
  Survey_cateVO survey_cateVO = this.survey_cateProc.read(survey_cateno);
  mav.addObject("survey_cateVO", survey_cateVO);  // request 객체에 저장
  
/*  List<Survey_cateVO> list = this.survey_cateProc.list_seqno_asc();
  mav.addObject("list", list);  // request 객체에 저장
*/
  mav.setViewName("/survey_cate/survey_read_delete"); // webapp/cate/read_delete.jsp
  return mav; // forward
}

// http://localhost:9090/resort/cate/delete.do
/**
 * 삭제 처리
 * @param cateVO
 * @return
 */
@RequestMapping(value="/survey_cate/survey_delete.do", method=RequestMethod.POST )
public ModelAndView delete(int survey_cateno) {
  ModelAndView mav = new ModelAndView();
  
  int cnt = this.survey_cateProc.delete(survey_cateno);
  mav.addObject("cnt", cnt); // request에 저장
  
  if (cnt == 1) {
    // mav.setViewName("/cate/delete_msg"); // webapp/cate/delete_msg.jsp
    mav.setViewName("redirect:/survey_cate/survey_list_all.do"); // spring 재호출
  } else { 
    mav.setViewName("/survey_cate/survey_delete_msg"); // webapp/cate/delete_msg.jsp
  }
  
  return mav;
}
// http://localhost:9090/resort/cate/list_join.do
/**
 * categrp + cate join 전체 목록
 * @return
 */
@RequestMapping(value="/survey_cate/survey_list_join.do", method=RequestMethod.GET )
public ModelAndView list_join() {
  ModelAndView mav = new ModelAndView();
  
  List<Survey_categrp_Cate_join> list = this.survey_cateProc.list_join();
  mav.addObject("list", list); // request.setAttribute("list", list);

  mav.setViewName("/survey_cate/survey_list_join"); // webapp/cate/list_join.jsp
  return mav;
}

// http://localhost:9090/resort/cate/list_join_by_categrpno.do
/**
 * categrp + cate join 전체 목록
 * @return
 */
@RequestMapping(value="/survey_cate/survey_list_join_by_categrpno.do", method=RequestMethod.GET )
public ModelAndView list_join_by_categrpno(int survey_categrpno) {
  ModelAndView mav = new ModelAndView();
  
  Survey_categrpVO survey_categrpVO = this.survey_categrpProc.read(survey_categrpno);
  mav.addObject("survey_categrpVO", survey_categrpVO);
  
  List<Survey_categrp_Cate_join> list = this.survey_cateProc.list_join_by_categrpno(survey_categrpno);
  mav.addObject("list", list); // request.setAttribute("list", list);

  mav.setViewName("/survey_cate/survey_list_join_by_categrpno"); // webapp/cate/list_join_by_categrpno.jsp
  return mav;
}

// http://localhost:9090/resort/cate/list_all.do
/**
 * categrp + cate join 전체 목록
 * @return
 */
@RequestMapping(value="/survey_cate/survey_list_all.do", method=RequestMethod.GET )
public ModelAndView list_all() {
  ModelAndView mav = new ModelAndView();
  
  List<Survey_categrp_Cate_VO> list = this.survey_cateProc.list_all();
  mav.addObject("list", list); // request.setAttribute("list", list);

  mav.setViewName("/survey_cate/survey_list_all"); // webapp/cate/list_all.jsp
  return mav;
}

// http://localhost:9090/resort/cate/list_by_categrpno.do
/**
 * categrp + cate join categrpno 별 목록
 * @return
 */
@RequestMapping(value="/survey_cate/survey_list_by_categrpno.do", method=RequestMethod.GET )
public ModelAndView list_by_categrpno(int survey_categrpno) {
  ModelAndView mav = new ModelAndView();
  
  // List<Categrp_Cate_VO_list> 아님
  Survey_categrp_Cate_VO_list list = this.survey_cateProc.list_by_categrpno(survey_categrpno);
  mav.addObject("list", list); // request.setAttribute("list", list);

  mav.setViewName("/survey_cate/survey_list_by_categrpno"); // webapp/cate/list_by_categrpno.jsp
  return mav;
}
// http://localhost:9090/resort/cate/update_seqno_up.do?cateno=1


/**
 * 결합된 카테고리 그룹별 카테고리 목록
 * http://localhost:9090/resort/cate/list_index_left.do
 * @param request
 * @return
 */
@RequestMapping(value="/survey_cate/survey_list_index_left.do", method=RequestMethod.GET)
public ModelAndView list_index_left(HttpServletRequest request){
 // System.out.println("--> list_index() GET called.");
 ModelAndView mav = new ModelAndView();
 mav.setViewName("/survey_cate/survey_list_index_left"); // webapp/cate/list_index_left.jsp
 
 List<Survey_categrpVO> survey_categrp_list = survey_categrpProc.list_seqno_asc(); // 카테고리 그룹 목록
 
 // Categrp: name, Cate: name 결합 목록
 ArrayList<String> survey_name_title_list = new ArrayList<String>();   
 
 StringBuffer url = new StringBuffer(); // 카테고리 제목 링크 조합

 // 카테고리 그룹 갯수 만큼 순환
 for (int index = 0; index < survey_categrp_list.size(); index++) {
   Survey_categrpVO survey_categrpVO = survey_categrp_list.get(index); // 하나의 카테고리 그룹 추출

   survey_name_title_list.add("<LI class='survey_categrp_name'>"+ survey_categrpVO.getSurvey_name() + "</LI>");

   // 카테고리 Join 목록
   List<Survey_categrp_Cate_join> survey_cate_list = survey_cateProc.list_join_by_categrpno(survey_categrpVO.getSurvey_categrpno()); 
   
   // 카테고리 갯수만큼 순환
   for (int j=0; j < survey_cate_list.size(); j++) {
     Survey_categrp_Cate_join survey_categrp_Cate_join = survey_cate_list.get(j);
     
     String name = survey_categrp_Cate_join.getSurvey_name(); // 카테고리 이름
     int cnt = survey_categrp_Cate_join.getSurvey_cnt();
     
     url.append("<LI class='survey_cate_survey_name'>");
     url.append("  <A href='" + request.getContextPath()+ "/contents/list.do?cateno="+survey_categrp_Cate_join.getSurvey_cateno()+"&word='>");
     url.append(name);
     url.append("  </A>");
     url.append("  <span style='font-size: 0.9em; color: #555555;'>("+cnt+")</span>");
     url.append("</LI>");
     survey_name_title_list.add(url.toString()); // 출력 목록에 하나의 cate 추가 
     
     url.delete(0, url.toString().length()); // 새로운 카테고리 목록을 구성하기위해 StringBuffer 문자열 삭제
     
   }
 }
 
 mav.addObject("survey_name_title_list", survey_name_title_list);
/* mav.addObject("total_count", survey_contentsProc.total_count());*/
 
 return mav;
} 

}