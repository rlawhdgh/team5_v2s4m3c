package dev.mvc.grade;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class GradeCont {
  @Autowired
  @Qualifier("dev.mvc.grade.GradeProc")
  private GradeProcInter gradeProc;
  
//http://localhost:9090/team5/grade/create.do
 /**
  * 등록 폼
  * @return
  */
 @RequestMapping(value="/grade/create.do", method=RequestMethod.GET )
 public ModelAndView create(HttpSession session) {
   ModelAndView mav = new ModelAndView();
   
   if(session.getAttribute("admin") != null) {
     mav.setViewName("/grade/create"); // webapp/grade/create.jsp
     }else {
     mav.setViewName("/index");
     }
   
   return mav; // forward
 }
 
 // http://localhost:9090/team5/grade/create.do
 /**
  * 등록 처리
  * @param gradeVO
  * @return
  */
 @RequestMapping(value="/grade/create.do", method=RequestMethod.POST )
 public ModelAndView create(GradeVO gradeVO) {

   ModelAndView mav = new ModelAndView();
   
   int cnt = this.gradeProc.create(gradeVO); // 등록 처리
   mav.addObject("cnt", cnt); // request에 저장, request.setAttribute("cnt", cnt)
   mav.addObject("grade_name", gradeVO.getGrade_name());
   mav.setViewName("/grade/create_msg"); // webapp/grade/create_msg.jsp

   return mav; // forward
 }
 
 // http://localhost:9090/team5/grade/list.do
 /**
  * 전체 목록
  * @return
  */
 @RequestMapping(value="/grade/list.do", method=RequestMethod.GET )
 public ModelAndView list(HttpSession session) {
   ModelAndView mav = new ModelAndView();
   
   List<GradeVO> list = this.gradeProc.list();
   
   mav.addObject("list", list); // request.setAttribute("list", list);
   
   if(session.getAttribute("admin") != null) {
     mav.setViewName("/grade/list"); // webapp/grade/list.jsp
     }else {
     mav.setViewName("/index");
     }
   return mav;
 }
 
 // http://localhost:9090/team5/grade/update.do?grade_no=4
 /**
  * 수정 폼
  * @param grade_no
  * @return
  */
 @RequestMapping(value="/grade/update.do", method=RequestMethod.GET )
 public ModelAndView update(int grade_no,HttpSession session) {
   ModelAndView mav = new ModelAndView();
  
   GradeVO gradeVO = this.gradeProc.read(grade_no);
   mav.addObject("gradeVO", gradeVO); // request에 저장
   if(session.getAttribute("admin") != null) {
     mav.setViewName("/grade/update"); // webapp/grade/update.jsp
     }else {
     mav.setViewName("/index");
     }
   return mav; // forward
 }
 
 // http://localhost:9090/team5/grade/update.do
 /**
  * 수정 처리
  * @param categrpVO
  * @return
  */
 @RequestMapping(value="/grade/update.do", method=RequestMethod.POST )
 public ModelAndView update(GradeVO gradeVO) {
   ModelAndView mav = new ModelAndView();
   

   int cnt = this.gradeProc.update(gradeVO);
   
   mav.addObject("cnt", cnt); // request에 저장
   
   mav.setViewName("/grade/update_msg"); // webapp/grade/update_msg.jsp
   
   return mav;
 }

 // http://localhost:9090/team5/grade/delete.do?grade_no=4
 /**
  * 회원 삭제
  * @param categrpno 조회할 카테고리 번호
  * @return
  */
 @RequestMapping(value="/grade/delete.do", method=RequestMethod.GET )
 public ModelAndView delete(int grade_no) {
   ModelAndView mav = new ModelAndView();
   
   this.gradeProc.delete(grade_no); // 삭제 처리


   return mav;
 }

}
