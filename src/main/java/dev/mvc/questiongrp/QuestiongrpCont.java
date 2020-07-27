package dev.mvc.questiongrp;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.question.QuestionProc;
import dev.mvc.question.QuestionProcInter;
import dev.mvc.question.QuestionVO;




@Controller
public class QuestiongrpCont {
  @Autowired
  @Qualifier("dev.mvc.questiongrp.QuestiongrpProc")
  private QuestiongrpProcInter questiongrpProc;
  
  @Autowired
  @Qualifier("dev.mvc.question.QuestionProc")
  private QuestionProcInter questionProc;
  
  public QuestiongrpCont() {}
  
  // http://localhost:9090/team5/question/create.do
  /**
   * 등록 폼
   * 
   * @return
   */
  @RequestMapping(value = "/questiongrp/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/questiongrp/create");

    return mav;
  }
  
  
  // http://localhost:9090/team5/question/create.do

  /**
   * 등록 처리
   * @param questionVO
   * @return
   */
  @RequestMapping(value = "/questiongrp/create.do", method = RequestMethod.POST)
  public ModelAndView create(QuestiongrpVO questiongrpVO) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.questiongrpProc.create(questiongrpVO);
    mav.addObject("cnt", cnt); // request에 저장

    if (cnt == 1) {
      // mav.setViewName("redirect:/openspace/list.do"); //spring 재호출
      mav.setViewName("redirect:/question/list.do");
    } else {
      mav.setViewName("/question/create_msg");// webapp/contents/create_msg.jsp
    }
    return mav;
  }
  
  
  //http://localhost:9090/team5/question/update.do
  /**
   * 수정 처리
   * @param questionVO
   * @return
   */
/*  @RequestMapping(value="/questiongrp/update.do", method=RequestMethod.POST)
  public ModelAndView update(QuestiongrpVO questiongrpVO) {

    ModelAndView mav = new ModelAndView();
    
    int cnt=this.questiongrpProc.update(questiongrpVO);
    mav.addObject("cnt",cnt); //request에 저장

    mav.setViewName("redirect:/question/list.do"); //spring 재호출

    
    return mav;
  }*/
  
  // http://localhost:9090/resort/categrp/delete.do
  /**
   * 삭제 처리
   * 
   * @param categrpVO
   * @return
   */
  @RequestMapping(value = "/questiongrp/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int questiongrp_no) {
    ModelAndView mav = new ModelAndView();

    List<QuestionVO> list = questionProc.list_by_question(questiongrp_no);
    mav.addObject("list", list);

    this.questionProc.delete_all(questiongrp_no);
    int cnt = this.questiongrpProc.delete(questiongrp_no); 
    mav.addObject("cnt", cnt);
    mav.setViewName("redirect:/question/list.do");

    return mav;
    
    
  }
  
  /**
   * 수정 처리
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/questiongrp/update.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String update(QuestiongrpVO questiongrpVO) {
    int count = questiongrpProc.update(questiongrpVO);
    
    JSONObject obj = new JSONObject();
    obj.put("count",count);
 
    return obj.toString(); // {"count":1}

  }
  
  /**
   * 리스트
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/questiongrp/list.do",
                            method = RequestMethod.GET,
                            produces = "text/plain;charset=UTF-8")
  public String list() {
    List<QuestiongrpVO> listgrp = this.questiongrpProc.list();
    
    JSONObject obj = new JSONObject();
    obj.put("listgrp", listgrp);
 
    return obj.toString(); 

  }


  /**
   * 삭제 처리
   * @return
   */
/*  @ResponseBody
  @RequestMapping(value = "/questiongrp/delete.do",
                            method = RequestMethod.GET,
                            produces = "text/plain;charset=UTF-8")
  public String delete(int questiongrp_no) {
    List<QuestionVO> list = questionProc.list_by_question(questiongrp_no);


    this.questionProc.delete_all(questiongrp_no);
    int cnt = this.questiongrpProc.delete(questiongrp_no); 
    
    JSONObject obj = new JSONObject();
    obj.put("list", list);
    obj.put("cnt", cnt);
 
    return obj.toString(); 

  }*/
  

  
}


