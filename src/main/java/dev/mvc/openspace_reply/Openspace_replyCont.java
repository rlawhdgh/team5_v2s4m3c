package dev.mvc.openspace_reply;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.consumer.ConsumerProcInter;
import dev.mvc.index_img.Index_imgVO;
import dev.mvc.openspace.OpenspaceVO;
import dev.mvc.question.QuestionVO;



@Controller
public class Openspace_replyCont {
  @Autowired
  @Qualifier("dev.mvc.openspace_reply.Openspace_replyProc")
  private Openspace_replyProcInter openspace_replyProc;
  
  @Autowired
  @Qualifier("dev.mvc.consumer.ConsumerProc")
  private ConsumerProcInter consumerProc;
  
  
  /**
   * 등록 처리
   * @param questionVO
   * @return
   */
  @RequestMapping(value = "/openspace_reply/create.do", method = RequestMethod.POST)
  public ModelAndView create(Openspace_replyVO openspace_replyVO, String word, String search, 
      @RequestParam(value="nowPage", defaultValue="1")int nowPage) {
    ModelAndView mav = new ModelAndView();
    int cnt = this.openspace_replyProc.create(openspace_replyVO);
    mav.addObject("cnt", cnt); // request에 저장
    int openspace_reply_no = openspace_replyVO.getOpenspace_no();


    mav.setViewName("redirect:/openspace/read.do?openspace_no="+openspace_reply_no+"&search="+search+"&word="+word+"&nowPage="+nowPage+"");


    return mav;
  }
  
  
  /**
   * 회원 별 댓글 목록
   * @param openspace_no
   * @return
   */
  @RequestMapping(value = "/openspace_reply/consumer_reply.do", method = RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    if(session.getAttribute("consumer_no") != null) {
      int consumer_no = (int) session.getAttribute("consumer_no");
      
      List<Openspace_replyVO> list = this.openspace_replyProc.consumer_list(consumer_no);
      mav.addObject("list", list); // request.setAttribute("list",list);
      mav.addObject("consumer_no",consumer_no);      
      mav.setViewName("/openspace_reply/consumer_list");
    } else {
      mav.setViewName("/openspace/x");
    }
    return mav;
  }
  
  
  /**
   * 목록 + 검색 + 페이징 지원
   * http://localhost:9090/resort/contents/list.do
   * http://localhost:9090/resort/contents/list.do?cateno=1&word=스위스&nowPage=1
   * @param cateno
   * @param word
   * @param nowPage
   * @return
   */
/*  @RequestMapping(value = "/openspace_reply/list.do", 
                                       method = RequestMethod.GET)
  public ModelAndView list_by_cateno_search_paging(
      @RequestParam(value="nowPage", defaultValue="1") int nowPage,
      @RequestParam(value="openspace_no", defaultValue="1") int openspace_no
      ) 
  { 
    
    ModelAndView mav = new ModelAndView();

    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("openspace_no", openspace_no);

    map.put("nowPage", nowPage); // 페이지에 출력할 레코드의 범위를 산출하기위해 사용

    //데이터베이스 컬럼이 아님 rownum을 찾아내기 위한 기준값
    
    // 검색 목록
    List<Openspace_replyVO> list = openspace_replyProc.reply_list_paging(map);
    mav.addObject("list", list);   

    // 검색된 레코드 갯수
    int search_count = 50;
    mav.addObject("search_count", search_count);   
    mav.addObject("list", list);

    String paging = openspace_replyProc.pagingBox("list.do", search_count, nowPage, openspace_no);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);
    
    mav.setViewName("/openspace_reply/list");   
    
    
    return mav;
  }    
*/
  
  
  
  //http://localhost:9090/team5/question/update.do
  /**
   * 수정 처리
   * @param questionVO
   * @return
   */
  @RequestMapping(value="/openspace_reply/update.do", method=RequestMethod.POST)
  public ModelAndView update(Openspace_replyVO openspace_replyVO, String word, String search, 
      @RequestParam(value="nowPage", defaultValue="1")int nowPage) {

    ModelAndView mav = new ModelAndView();
    

    int cnt= this.openspace_replyProc.update(openspace_replyVO);
    mav.addObject("cnt",cnt); //request에 저장


    int openspace_reply_no = openspace_replyVO.getOpenspace_no();
    mav.setViewName("redirect:/openspace/read.do?openspace_no="+openspace_reply_no+"&search="+search+"&word="+word+"&nowPage="+nowPage+"");

    
    return mav;
  }
  /**
   * 삭제 처리
   * @param question_no
   * @return
   */
/*  @RequestMapping(value = "/openspace_reply/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(HttpSession session, int openspace_reply_no, String word, String search, 
      @RequestParam(value="nowPage", defaultValue="1")int nowPage, int openspace_no) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.openspace_replyProc.delete(openspace_reply_no); 
    mav.addObject("cnt", cnt);
    mav.setViewName("redirect:/openspace/read.do?openspace_no="+openspace_no+"&search="+search+"&word="+word+"&nowPage="+nowPage+"");

    return mav;
 
  }*/
  
  /**
   * 댓글 등록
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/openspace_reply/create1.do", method=RequestMethod.POST ,
                              produces = "text/plain;charset=UTF-8" )
  public String create1(Openspace_replyVO openspace_replyVO) {
    int cnt = this.openspace_replyProc.create(openspace_replyVO);
  
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);


    
    return json.toString(); 
  }
  
  /**
   * 댓글 수정
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/openspace_reply/update1.do", method=RequestMethod.POST ,
                              produces = "text/plain;charset=UTF-8" )
  public String update1(Openspace_replyVO openspace_replyVO) {
   
    int cnt = this.openspace_replyProc.update(openspace_replyVO);
  
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);


    
    return json.toString(); 
  }
  /**
   * 페이징 댓글 목록
   * @param openspace_no
   * @param endNum
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/openspace_reply/list_page.do",
      method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
  public String list(int openspace_no, int replyPage) {
    
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("openspace_no", openspace_no);
    map.put("replyPage", replyPage); // 댓글 페이지 번호
    List<Openspace_replyVO> list = openspace_replyProc.reply_list_paging(map);

    
    List<Openspace_replyVO> list_all = this.openspace_replyProc.list(openspace_no);
    int b = list.size();
    int a = list_all.size()%5;
    int tot = a+b;

    list_all.size();
    JSONObject obj = new JSONObject();
    obj.put("list", list);
    obj.put("list_all", list_all.size());
    if(a==0) {
    obj.put("tot", tot+1);
    }
    if(a !=0) {
    obj.put("tot", tot);  
    }
 
    return obj.toString(); 
  }
  
  
  /**
   * 댓글 삭제
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/openspace_reply/delete1.do", method=RequestMethod.POST ,
                              produces = "text/plain;charset=UTF-8" )
  public String delete(int openspace_reply_no) {
    int cnt = this.openspace_replyProc.delete(openspace_reply_no);
  
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
   
    return json.toString(); 
  }
  
  
  
}
