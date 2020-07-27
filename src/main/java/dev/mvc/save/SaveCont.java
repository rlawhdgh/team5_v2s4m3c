package dev.mvc.save;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.result.ResultProcInter;
import dev.mvc.result.ResultVO;
import dev.mvc.survey_cate.Survey_cateProcInter;
import dev.mvc.survey_cate.Survey_cateVO;
import dev.mvc.survey_categrp.Survey_categrpVO;
import dev.mvc.survey_categrp.Survey_categrpProcInter;


@Controller
public class SaveCont {
  
  @Autowired
  @Qualifier("dev.mvc.survey_categrp.Survey_categrpProc")
  private Survey_categrpProcInter survey_categrpProc;
  
  @Autowired
  @Qualifier("dev.mvc.survey_cate.Survey_cateProc")
  private Survey_cateProcInter survey_cateProc;
  
  @Autowired
  @Qualifier("dev.mvc.save.SaveProc")
  private SaveProcInter saveProc;
  
  @Autowired
  @Qualifier("dev.mvc.result.ResultProc")
  private ResultProcInter resultProc;
  
  // http://localhost:9090/team5/survey_make/survey_create.do
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/save/survey_create.do", method=RequestMethod.GET )
  public ModelAndView create(int survey_cateno) {
    ModelAndView mav = new ModelAndView();
    
    Survey_cateVO survey_cateVO = this.survey_cateProc.read(survey_cateno);
    mav.addObject("survey_cateVO", survey_cateVO);
    
    mav.setViewName("/save/survey_create"); // webapp/contents/create.jsp
    
    return mav;
  }
  // http://localhost:9090/team5/survey_make/survey_create.do
  // http://localhost:9090/team5/survey_make/survey_create.do
  /**
   * 등록 처리
   * @param cateVO
   * @return
   */
  @RequestMapping(value="/save/survey_create.do", method=RequestMethod.POST )
  public ModelAndView create(HttpServletRequest request, SaveVO saveVO) {
    ModelAndView mav = new ModelAndView();
    
    // ontentsVO.setIp(request.getRemoteAddr()); // 접속자 IP
    
  
    int cnt = this.saveProc.create(saveVO); // Call By Reference로 전송
    System.out.println("cnt: " + cnt);
    mav.addObject("cnt", cnt);
    
    Survey_cateVO survey_cateVO = this.survey_cateProc.read(saveVO.getSurvey_cateno());
    mav.addObject("survey_cateVO", survey_cateVO);

    
    if (cnt == 1) {
      mav.setViewName("/save/survey_create_msg"); // webapp/cate/create_msg.jsp
      // mav.setViewName("redirect:/cate/list.do"); // spring 재호출
    } else { 
      mav.setViewName("/save/survey_create_msg"); // webapp/cate/create_msg.jsp
    }
    
    return mav;
  }
  /**
   * 등록 처리
   * @param PayVO
   * @return
   */ 
 @ResponseBody 
 @RequestMapping(value="/save/survey_create2.do", method=RequestMethod.POST )
 public String create(int makeno,
                            @RequestParam(value="nowPage", defaultValue="1") int nowPage) {
     
   int vote_cnt = 0; 
   
   SaveVO saveVO =this.saveProc.read(makeno);
     
     // 투표창 --> 투표결과 
   ResultVO resultVO = new ResultVO(); 
     
       
     resultVO.setItem1no(saveVO.getItem1());
     resultVO.setItem2no(saveVO.getItem2());
     resultVO.setItem3no(saveVO.getItem3());
     
     
     
     System.out.println("makeno"+makeno);

   
       int cnt = this.saveProc.create(saveVO);  
       if(cnt == 1) {  
         vote_cnt = vote_cnt + 1;  
                               
     }
      System.out.println("cnt -->"+cnt);
 
      
      JSONObject json = new JSONObject();
      json.put("cnt", cnt);
      
      return json.toString();

}
  
  /**
   * 전체 목록
   * @return
   */
  @RequestMapping(value="/save/pollList_all.do", method=RequestMethod.GET )
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    List<SaveVO> list = this.saveProc.survey_list_all();
    mav.addObject("list", list); // request.setAttribute("list", list);

    mav.setViewName("/save/pollList_all"); // /webapp/contents/list_all.jsp
    return mav;
  }

  @RequestMapping(value="/save/survey_read.do", method=RequestMethod.GET )
  public ModelAndView read(int makeno) {
    ModelAndView mav = new ModelAndView();
    
    List<SaveVO> list = this.saveProc.survey_list_all();
    mav.addObject("list", list); 

    SaveVO saveVO = this.saveProc.read(makeno);
    mav.addObject("saveVO", saveVO); // request.setAttribute("contentsVO", contentsVO);

    Survey_cateVO survey_cateVO = this.survey_cateProc.read(saveVO.getSurvey_cateno());
    mav.addObject("survey_cateVO", survey_cateVO); 

 
    
    // 첨부 파일 목록
    /*List<AttachfileVO> attachfile_list = this.attachfileProc.list_by_contentsno(contentsno);
    mav.addObject("attachfile_list", attachfile_list); 
    */
    mav.setViewName("/save/survey_read"); // /webapp/contents/read.jsp
    return mav;
  }
  /**
   * 목록 + 검색 + 페이징 지원
   * http://localhost:9090/team5/survey_make/survey_list.do
   * http://localhost:9090/team5/survey_make/survey_list.do?survey_cateno=1&word=스위스&nowPage=1
   * @param survey_cateno
   * @param word
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/save/pollList.do", 
                                       method = RequestMethod.GET)
  public ModelAndView list_by_survey_cateno_search_paging(
      @RequestParam(value="survey_cateno", defaultValue="1") int survey_cateno,
     @RequestParam(value="word", defaultValue="") String word,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage
      ) { 
    System.out.println("--> nowPage: " + nowPage);
    
    ModelAndView mav = new ModelAndView();
    
    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("survey_cateno", survey_cateno); // #{cateno}
    map.put("word", word);     // #{word}
    map.put("nowPage", nowPage);  // 페이지에 출력할 레코드의 범위를 산출하기위해 사용     
    
    // 검색 목록
    List<SaveVO> list = saveProc.list_by_survey_cateno_search_paging(map);
    mav.addObject("list", list);
    
    // 검색된 레코드 갯수
    int search_count = saveProc.search_count(map);
    mav.addObject("search_count", search_count);
  
    Survey_cateVO survey_cateVO = survey_cateProc.read(survey_cateno);
    mav.addObject("survey_cateVO", survey_cateVO);
    
/*   Survey_categrpVO survey_categrpVO = survey_categrpProc.read(survey_cateVO.getSurvey_categrpno());
    mav.addObject("survey_categrpVO", survey_categrpVO);*/

    /*
     * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
     * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
     * 
     * @param listFile 목록 파일명 
     * @param cateno 카테고리번호 
     * @param search_count 검색(전체) 레코드수 
     * @param nowPage     현재 페이지
     * @param word 검색어
     * @return 페이징 생성 문자열
     */ 
    String paging = saveProc.pagingBox("pollList.do", survey_cateno, search_count, nowPage, word);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);

    // /contents/list_by_cateno_search_paging.jsp
    mav.setViewName("/save/list_by_survey_cateno_search_paging");   
    
    return mav;
  }    
  /**
   * 수정 폼
   * @return
   */
  @RequestMapping(value="/save/survey_update.do", method=RequestMethod.GET )
  public ModelAndView update(int makeno) {
    ModelAndView mav = new ModelAndView();
    
    SaveVO saveVO = this.saveProc.update(makeno);
    mav.addObject("saveVO", saveVO); // request.setAttribute("contentsVO", contentsVO);
    
    mav.setViewName("/save/survey_update"); // webapp/contents/update.jsp
    
    return mav;
  }
  
  // http://localhost:9090/resort/contents/update.do
  /**
   * 수정 처리
   * @param contentsVO
   * @return
   */
  @RequestMapping(value="/save/survey_update.do", method=RequestMethod.POST )
  public ModelAndView update(SaveVO saveVO) {
    ModelAndView mav = new ModelAndView();
    
    Survey_cateVO survey_cateVO = this.survey_cateProc.read(saveVO.getSurvey_cateno());
    // mav.addObject("cateVO", cateVO); // 전달안됨.
    mav.addObject("survey_cate_name", survey_cateVO.getSurvey_name());
    mav.addObject("survey_cateno", survey_cateVO.getSurvey_cateno());

    Survey_categrpVO survey_categrpVO = this.survey_categrpProc.read(survey_cateVO.getSurvey_categrpno());
    // mav.addObject("categrpVO", categrpVO); // 전달안됨.
    mav.addObject("survey_categrp_name", survey_categrpVO.getSurvey_name());
    
    mav.addObject("makeno", saveVO.getMakeno());
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("makeno", saveVO.getMakeno());
   // hashMap.put("survey_passwd", survey_makeVO.getSurvey_passwd());
    
    int survey_passwd_cnt = 0; // 패스워드 일치 레코드 갯수
    int survey_cnt = 0;             // 수정된 레코드 갯수 
    
    survey_passwd_cnt = this.saveProc.passwd_check(hashMap);
    
    if (survey_passwd_cnt == 1) { // 패스워드 일치
      survey_cnt = this.saveProc.update(saveVO);
    }

    mav.addObject("survey_cnt", survey_cnt); // request에 저장
    mav.addObject("survey_passwd_cnt", survey_passwd_cnt); // request에 저장
        
    if (survey_passwd_cnt == 1 && survey_cnt == 1) {
      mav.setViewName("redirect:/save/survey_update_msg.jsp"); // webapp/contents/update_msg.jsp
      // mav.setViewName("/contents/update_msg"); // webapp/contents/update_msg.jsp
      // mav.setViewName("redirect:/contents/list.do"); // spring 재호출
    } else { 
      mav.setViewName("/save/survey_update_msg"); // webapp/contents/update_msg.jsp
    }
    
    return mav;
  }
  /**
   * 삭제 폼
   * @return
   */
  @RequestMapping(value="/save/survey_delete.do", method=RequestMethod.GET )
  public ModelAndView delete(int makeno) {
    ModelAndView mav = new ModelAndView();
    
    SaveVO saveVO = this.saveProc.update(makeno);
    mav.addObject("saveVO", saveVO); // request.setAttribute("contentsVO", contentsVO);
    
    mav.setViewName("/save/survey_delete"); // webapp/contents/delete.jsp
    
    return mav;
  }
  
  // http://localhost:9090/team5/survey_make/survey_delete.do
  /**
   * 삭제 처리
   * @param contentsVO
   * @return
   */
  @RequestMapping(value="/save/survey_delete.do", method=RequestMethod.POST )
  public ModelAndView delete(int makeno, String passwd) {
    ModelAndView mav = new ModelAndView();

    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("makeno", makeno);
    hashMap.put("passwd", passwd);
    
   int survey_passwd_cnt = 0; // 패스워드 일치 레코드 갯수
    int survey_cnt = 0;             // 삭제된 레코드 갯수 
    
   survey_passwd_cnt = this.saveProc.passwd_check(hashMap);
    
    SaveVO saveVO = this.saveProc.read(makeno); 
    String question = saveVO.getQuestion(); // 제목
    mav.addObject("question", question);
    
    if (survey_passwd_cnt == 1) { // 패스워드 일치
      survey_cnt = this.saveProc.delete(makeno);
    }

    mav.addObject("survey_cnt", survey_cnt); // request에 저장
    mav.addObject("survey_passwd_cnt", survey_passwd_cnt); // request에 저장
        
    if (survey_passwd_cnt == 1 && survey_cnt == 1) {
      this.survey_cateProc.decreaseCnt(saveVO.getSurvey_cateno());  // 글수 감소
      mav.setViewName("/save/survey_delete_msg"); // webapp/contents/delete_msg.jsp
      // mav.setViewName("redirect:/contents/list.do"); // spring 재호출
    } else { 
      mav.setViewName("/save/survey_delete_msg"); // webapp/contents/delete_msg.jsp
    }
    
    return mav;
  }
}

