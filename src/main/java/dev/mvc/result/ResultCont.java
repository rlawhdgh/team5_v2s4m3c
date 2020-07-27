package dev.mvc.result;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ResultCont {

  @Autowired
  @Qualifier("dev.mvc.result.ResultProc")
  private ResultProcInter resultProc;
  
  // http://localhost:9090/resort/categrp/create.do
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/result/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/result/create"); // webapp/categrp/create.jsp
    
    return mav; // forward
  }
  
  // http://localhost:9090/resort/categrp/create.do
  /**
   * 등록 처리
   * @param categrpVO
   * @return
   */
  @RequestMapping(value="/result/create.do", method=RequestMethod.POST,
      produces = "text/plain;charset=UTF-8")
  public ModelAndView create(HttpServletRequest request, ResultVO resultVO ) {
 
    
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.resultProc.create(resultVO); // 등록 처리
    mav.addObject("cnt", cnt); // request에 저장, request.setAttribute("cnt", cnt)
    
    mav.setViewName("/result/create_msg"); // webapp/categrp/create_msg.jsp

    return mav; // forward
  }
  // http://localhost:9090/resort/cate/list.do
  /**
   * 전체 목록
   * @return
   */
  @RequestMapping(value="/result/list.do", method=RequestMethod.GET )
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    List<ResultVO> list = this.resultProc.list();
    mav.addObject("list", list); // request.setAttribute("list", list);

    mav.setViewName("/result/list"); // webapp/cate/list.jsp
    return mav;
  }
  /**
   * 전체 목록
   * @return
   */
  @RequestMapping(value="/result/read.do", method=RequestMethod.GET )
  public ModelAndView read(int resultno) {
    ModelAndView mav = new ModelAndView();

    ResultVO resultVO = this.resultProc.read(resultno);
    mav.addObject("resultVO", resultVO); // request.setAttribute("contentsVO", contentsVO);

    
    mav.setViewName("/result/read"); // /webapp/contents/read.jsp
    return mav;
  }
}
