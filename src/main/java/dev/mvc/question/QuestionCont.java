package dev.mvc.question;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.openspace.OpenspaceVO;
import dev.mvc.questiongrp.QuestiongrpProcInter;
import dev.mvc.questiongrp.QuestiongrpVO;

@Controller
public class QuestionCont {
  @Autowired
  @Qualifier("dev.mvc.question.QuestionProc")
  private QuestionProcInter questionProc = null;
  
  @Autowired
  @Qualifier("dev.mvc.questiongrp.QuestiongrpProc")
  private QuestiongrpProcInter questiongrpProc;
  
  public QuestionCont() {
    System.out.println("--> QuestionCont created.");
  }
  
  // http://localhost:9090/team5/question/create.do
  /**
   * 등록 폼
   * 
   * @return
   */
  @RequestMapping(value = "/question/create.do", method = RequestMethod.GET)
  public ModelAndView create(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/question/create");
    if(session.getAttribute("admin") != null) {
    List<QuestiongrpVO> listgrp = this.questiongrpProc.list();
    mav.addObject("listgrp", listgrp); 
    } else {
      mav.setViewName("/openspace/x");
    }
    
    return mav;
  }
  
  
  // http://localhost:9090/team5/question/create.do

  /**
   * 등록 처리
   * @param questionVO
   * @return
   */
  @RequestMapping(value = "/question/create.do", method = RequestMethod.POST)
  public ModelAndView create(QuestionVO questionVO) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.questionProc.create(questionVO);
    mav.addObject("cnt", cnt); // request에 저장

    if (cnt == 1) {
      // mav.setViewName("redirect:/openspace/list.do"); //spring 재호출
      mav.setViewName("redirect:/question/list.do");

    } else {
      mav.setViewName("/question/create_msg");// webapp/contents/create_msg.jsp
    }
    return mav;
  }
  
  /**
   * 목록
   * 
   * @return
   */
/* @RequestMapping(value = "/question/list10.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();  
    
    List<QuestionVO> list = this.questionProc.list();
    mav.addObject("list", list); 
    for(int i=0; i<=list.size(); i++) {
      
    }
    
  
    mav.setViewName("/question/list");

    return mav;
  }
*/
  
  @RequestMapping(value = "/question/list.do", method = RequestMethod.GET)
  public ModelAndView list(@RequestParam(value="questiongrp_no", defaultValue="0") int questiongrp_no) {
    ModelAndView mav = new ModelAndView();  
    
//    List<QuestionVO> list = this.questionProc.list();

    if(questiongrp_no >0) {
    List<QuestionVO> list = this.questionProc.list_by_question(questiongrp_no);
    mav.addObject("list", list); 
    mav.addObject("size",list.size());
    } else {
      List<QuestionVO> list = this.questionProc.list();
      mav.addObject("list", list); 
      mav.addObject("size",list.size());
    }
   
    List<QuestiongrpVO> listgrp = this.questiongrpProc.list();
    mav.addObject("listgrp", listgrp);     
    mav.addObject("a",questiongrp_no);
    //mav.addObject("name",listgrp.get(questiongrp_no).getQuestiongrp_name());
    
    mav.addObject("grpsize",listgrp.size());
    
    
    mav.setViewName("/question/list");

    return mav;
  }
  
  // http://localhost:9090/team5/question/read.do
  /**
   * 수정폼
   * @param contentsno
   * @return
   */
  @RequestMapping(value = "/question/update.do", method = RequestMethod.GET)
  public ModelAndView update(int question_no, HttpSession session) {
    ModelAndView mav = new ModelAndView();
    if(session.getAttribute("admin") != null) {
    QuestionVO questionVO = this.questionProc.read(question_no);
    mav.addObject("questionVO", questionVO); 

    mav.setViewName("/question/update");
    } else {
      mav.setViewName("/question/x");
    }
    return mav; 
  }
  
  //http://localhost:9090/team5/question/update.do
  /**
   * 수정 처리
   * @param questionVO
   * @return
   */
  @RequestMapping(value="/question/update.do", method=RequestMethod.POST)
  public ModelAndView update(QuestionVO questionVO) {

    ModelAndView mav = new ModelAndView();
    
    int cnt=this.questionProc.update(questionVO);
    mav.addObject("cnt",cnt); //request에 저장

      mav.setViewName("redirect:/question/list.do"); //spring 재호출

    
    return mav;
  }
  
  // http://localhost:9090/resort/categrp/delete.do
  /**
   * 삭제 처리
   * 
   * @param categrpVO
   * @return
   */
  @RequestMapping(value = "/question/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int question_no) {
    ModelAndView mav = new ModelAndView();

    QuestionVO questionVO = this.questionProc.read(question_no); // 삭제 정보
    mav.addObject("questionVO", questionVO); // request에 저장

    int cnt = this.questionProc.delete(question_no); 
    mav.addObject("cnt", cnt);
    mav.setViewName("redirect:/question/list.do");


    return mav;
    
    
  }
  
}
