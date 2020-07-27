package dev.mvc.admin;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.consumer.ConsumerProcInter;

@Controller
public class AdminCont {
  @Autowired
  @Qualifier("dev.mvc.admin.AdminProc")
  private AdminProcInter adminProc;
  
  @Autowired
  @Qualifier("dev.mvc.consumer.ConsumerProc")
  private ConsumerProcInter consumerProc;
  
  public AdminCont() {
    System.out.println("--> AdminCont created.");
  }
  
  // http://localhost:9090/team5/admin/create.do
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/admin/create.do", method=RequestMethod.GET )
  public ModelAndView create(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    if(session.getAttribute("admin") != null) {
      mav.setViewName("/admin/create"); // webapp/admin/create.jsp
      }else {
      mav.setViewName("/index");
      }
    return mav; // forward
  }
  
  // http://localhost:9090/team5/admin/create.do
  /**
   * 등록 처리
   * @param adminVO
   * @return
   */
  @RequestMapping(value="/admin/create.do", method=RequestMethod.POST )
  public ModelAndView create(AdminVO adminVO, int consumer_no) {
    // CategrpVO categrpVO <FORM> 태그의 값으로 자동 생성됨.
    // request.setAttribute("categrpVO", categrpVO); 자동 실행
    
    ModelAndView mav = new ModelAndView();
    int admin_cnt = 0;
    try {
      admin_cnt = this.adminProc.create(adminVO); // 등록 처리
      this.consumerProc.update_grade_no(consumer_no);
      mav.addObject("Admin_cnt", admin_cnt);
      mav.setViewName("redirect:../consumer/AllModal.jsp");
      return mav; // forward
    } catch (Exception e) {
      admin_cnt = 0;
      mav.addObject("Admin_cnt", admin_cnt);
      mav.setViewName("redirect:../consumer/AllModal.jsp");
      return mav; // forward
    }

  }
  
  // http://localhost:9090/team5/admin/list.do
  /**
   * 전체 목록
   * @return
   */
  @RequestMapping(value="/admin/list.do", method=RequestMethod.GET )
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    List<Admin_listVO> list = this.adminProc.list();
    
    
    mav.addObject("list", list); // request.setAttribute("list", list);
    
    if(session.getAttribute("admin") != null) {
      mav.setViewName("/admin/list"); // webapp/admin/list.jsp
      }else {
      mav.setViewName("/index");
      }
    return mav;
  }
  
  // http://localhost:9090/team5/consumer/list_grade_name.do
//  /**
//   * 전체 목록( 회원 등급이름 포함 )
//   * @return
//   */
//  @RequestMapping(value="/consumer/list_grade_name.do", method=RequestMethod.GET )
//  public ModelAndView list_grade_name() {
//    ModelAndView mav = new ModelAndView();
//    
//    List<Consumer_grade_nameVO> list = this.consumerProc.list_grade_name();
//    mav.addObject("list", list); // request.setAttribute("list", list);
//    
//    mav.setViewName("/consumer/list"); // webapp/consumer/list.jsp
//    return mav;
//  }
  
  // http://localhost:9090/team5/admin/update.do?admin_no=4
  /**
   * 수정 폼
   * @param AdminVO
   * @return
   */
  @RequestMapping(value="/admin/update.do", method=RequestMethod.GET )
  public ModelAndView update(int admin_no, HttpSession session) {
    ModelAndView mav = new ModelAndView();
   
    AdminVO adminVO = this.adminProc.read(admin_no);
    mav.addObject("adminVO", adminVO); // request에 저장
    
    if(session.getAttribute("admin") != null) {
      mav.setViewName("/admin/update"); // webapp/admin/update.jsp
      }else {
      mav.setViewName("/index");
      }
    
    return mav; // forward
  }
 
  // http://localhost:9090/team5/admin/update.do
  /**
   * 수정 처리
   * @param categrpVO
   * @return
   */
  @RequestMapping(value="/admin/update.do", method=RequestMethod.POST )
  public ModelAndView update(AdminVO adminVO) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.adminProc.update(adminVO);
    mav.addObject("cnt", cnt); // request에 저장
    
    mav.setViewName("/admin/update_msg"); // webapp/admin/update_msg.jsp
    
    return mav;
  }

  // http://localhost:9090/team5/admin/delete.do
  /**
   * 관리자 삭제
   * @param admin_no
   * @return
   */
  @RequestMapping(value="/admin/delete.do", method=RequestMethod.GET )
  public ModelAndView delete(int consumer_no) {
    ModelAndView mav = new ModelAndView();
    this.consumerProc.update_grade_no_down(consumer_no);
    this.adminProc.delete(consumer_no); // 삭제 처리


    return mav;
  }

}
