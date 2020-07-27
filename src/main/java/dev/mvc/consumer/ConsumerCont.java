package dev.mvc.consumer;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.soap.AddressingFeature.Responses;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.javassist.expr.Instanceof;
//import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UrlPathHelper;

import org.json.simple.JSONArray;


//import org.json.simple.parser.JSONParser;

import com.github.scribejava.core.model.OAuth2AccessToken;

import dev.mvc.admin.AdminProcInter;
import dev.mvc.admin.AdminVO;
import dev.mvc.login.LoginProcInter;


@Controller
public class ConsumerCont {
  @Autowired
  private UserMailSendService mailsender;

  @Autowired
  @Qualifier("dev.mvc.consumer.ConsumerProc")
  private ConsumerProcInter consumerProc;
  
  @Autowired
  @Qualifier("dev.mvc.admin.AdminProc")
  private AdminProcInter adminProc;
  
  @Autowired
  @Qualifier("dev.mvc.login.LoginProc")
  private LoginProcInter loginProc;
  
  public ConsumerCont() {
    System.out.println("--> ConsumerCont created.");
  }
  
  // http://localhost:9090/team5/consumer/create.do
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/consumer/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/consumer/create"); // webapp/consumer/create.jsp
    
    return mav; // forward
  }
  
  // http://localhost:9090/team5/consumer/create.do
  /**
   * 등록 처리
   * @param consumerVO
   * @return
   */
  @Inject
  BCryptPasswordEncoder passwordEncoder;
  
  
  @RequestMapping(value="/consumer/create.do", method=RequestMethod.POST )
  public ModelAndView create(ConsumerVO consumerVO ,HttpServletRequest request, RedirectAttributes redirectAttributes) {
    
    ModelAndView mav = new ModelAndView();
    int sender_cnt = 0;
    String encPassword = passwordEncoder.encode(consumerVO.getConsumer_passwd());
    consumerVO.setConsumer_passwd(encPassword);
    System.out.println(encPassword);
    int create_cnt = this.consumerProc.create(consumerVO); // 등록 처리
    if(create_cnt == 1) {
      try {
        mailsender.mailSendWithUserKey(consumerVO.getConsumer_email(), consumerVO.getConsumer_id(), request);
        sender_cnt = 1;
      } catch (Exception e) {
        // 가입 시도한 회원 삭제
        HashMap hashmap  = new HashMap();
        ConsumerVO consumerVO1 = this.consumerProc.readById(consumerVO.getConsumer_id());
        hashmap.put("consumer_no", consumerVO1.getConsumer_no());
        hashmap.put("consumer_id", consumerVO1.getConsumer_id());
        this.consumerProc.delete(hashmap); // 삭제 처리
        sender_cnt = 0;
      }
    }

    HashMap hashmap1  = new HashMap();
    hashmap1.put("create_cnt", create_cnt);
    hashmap1.put("sender_cnt", sender_cnt);
    redirectAttributes.addFlashAttribute("hashmap", hashmap1);
    //redirectAttributes.addFlashAttribute("create_cnt", create_cnt);
//    redirectAttributes.addAttribute("create_cnt", create_cnt);
//    redirectAttributes.addAttribute("sender_cnt", sender_cnt);
    //mav.addObject("create_cnt", create_cnt); // request에 저장, request.setAttribute("cnt", cnt)
    //mav.addObject("sender_cnt", sender_cnt); // request에 저장, request.setAttribute("cnt", cnt)
    //mav.addObject("id", consumerVO.getConsumer_id());
    mav.setViewName("redirect:/consumer/create.do"); // webapp/consumer/create.jsp



    return mav; // forward
  }
  
  /**
   * 아이디 찾기시 메일 전송
   * @param consumerVO
   * @return
   */
  @RequestMapping(value="/consumer/sendmail.do", method=RequestMethod.POST )
  public ModelAndView send_id(String consumer_name, String consumer_email, HttpServletRequest request, RedirectAttributes redirectAttributes) {
    
    ModelAndView mav = new ModelAndView();
    //System.out.println(consumer_email);
    
    String consumer_id = this.consumerProc.readByEmail(consumer_email);

    int id_cnt = mailsender.mailSendid(consumer_id, consumer_name, consumer_email, request);

    mav.addObject("id_cnt", id_cnt);
    //redirectAttributes.addFlashAttribute("cnt", cnt);
    //redirectAttributes.addFlashAttribute(cnt);
    //redirectAttributes.addFlashAttribute("cnt", cnt);
    mav.setViewName("redirect:/consumer/findconsumer.jsp");

    return mav; // forward
  }
  
  /**
   * 비밀번호 찾기시 메일 전송
   * @param consumerVO
   * @return
   */
  @RequestMapping(value="/consumer/sendmail2.do", method=RequestMethod.POST )
  public ModelAndView send_passwd(String consumer_id, String consumer_email, HttpServletRequest request) {
    
    ModelAndView mav = new ModelAndView();

    System.out.println(consumer_id);
    System.out.println(consumer_email);

    int consumer_no = this.consumerProc.readById(consumer_id).getConsumer_no();
    int passwd_cnt = mailsender.mailSendpasswd(consumer_id, consumer_email, consumer_no, request);
    mav.addObject("passwd_cnt", passwd_cnt);
    mav.setViewName("redirect:/consumer/findconsumer.jsp"); 

    return mav; // forward
  }
  
//e-mail 인증 컨트롤러
 @RequestMapping(value = "/user/key_alter", method = RequestMethod.GET)
 public ModelAndView key_alterConfirm(@RequestParam("consumer_id") String consumer_id, @RequestParam("user_key") String key) {
   ModelAndView mav = new ModelAndView();
   Throwable cause = null;
   int sendmail_cnt = 0;
   try {
     mailsender.alter_userKey_service(consumer_id, key); // mailsender의 경우 @Autowired
     sendmail_cnt = 1;
   } catch (Exception e) {
     e.initCause(cause);
   }
   //consumer_no, consumer_id, consumer_passwd, consumer_name, consumer_nickname, consumer_phone_num , consumer_key
   ConsumerVO consumerVO =  this.consumerProc.readById(consumer_id);
   mav.addObject("sendmail_cnt", sendmail_cnt);
   mav.addObject("consumerVO", consumerVO);
   mav.setViewName("/consumer/create_msg2"); // webapp/consumer/create_msg.jsp
   return mav;
 }


  
  // http://localhost:9090/team5/consumer/list.do
  /**
   * 전체 목록
   * @return
   */
//  @RequestMapping(value="/consumer/list.do", method=RequestMethod.GET )
//  public ModelAndView list() {
//    ModelAndView mav = new ModelAndView();
//    
//    // List<CategrpVO> list = this.categrpProc.list_categrpno_asc();
//    List<ConsumerVO> list = this.consumerProc.list();
//    
//    mav.addObject("list", list); // request.setAttribute("list", list);
//    
//    mav.setViewName("/consumer/list"); // webapp/consumer/list.jsp
//    return mav;
//  }
  
  // http://localhost:9090/team5/consumer/list.do
  /**
   * 전체 목록( 회원 등급이름 포함 )
   * @return
   */
  @RequestMapping(value="/consumer/list1.do", method=RequestMethod.GET )
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    List<Consumer_grade_nameVO> list = this.consumerProc.list_grade_name();
    mav.addObject("list", list); // request.setAttribute("list", list);
    if(session.getAttribute("admin") != null) {
    mav.setViewName("/consumer/list"); // webapp/consumer/list.jsp
    }else {
    mav.setViewName("/index");
    }
    return mav;
  }
  //--------------------------------------------------------------------------------------------
  /**
   * 목록 + 검색 + 페이징 지원
   * http://localhost:9090/team5/consumer/list1.do
   * http://localhost:9090/team5/consumer/list1.do?&word=스위스&nowPage=1
   * @param cateno
   * @param word
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/consumer/list.do", 
                                       method = RequestMethod.GET)
  public ModelAndView list_by_search_paging(
      @RequestParam(value="word", defaultValue="") String word,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage,
      HttpSession session) { 
    System.out.println("--> nowPage: " + nowPage);
    
    ModelAndView mav = new ModelAndView();
    
    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("word", word);     // #{word}
    map.put("nowPage", nowPage);  // 페이지에 출력할 레코드의 범위를 산출하기위해 사용     
    
    // 검색 목록
    List<ConsumerVO> list = consumerProc.list_by_search_paging(map);
    mav.addObject("list", list);
    
    // 검색된 레코드 갯수
    int search_count = consumerProc.search_count(map);
    mav.addObject("search_count", search_count);
  
    /*
     * CateVO cateVO = cateProc.read(cateno); mav.addObject("cateVO", cateVO);
     * 
     * CategrpVO categrpVO = categrpProc.read(cateVO.getCategrpno());
     * mav.addObject("categrpVO", categrpVO);
     */

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
    String paging = consumerProc.pagingBox("list.do", search_count, nowPage, word);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);

    if(session.getAttribute("admin") != null) {
      mav.setViewName("/consumer/list");   
      }else {
      mav.setViewName("/index");
      }
    // /contents/list_by_cateno_search_paging.jsp
    
    return mav;
  }    
  //--------------------------------------------------------------------------------------------
  
  // http://localhost:9090/team5/consumer/update_mypage.do?consumer_no=4
  /**
   * 마이페이지 + 수정
   * @param AdminVO
   * @return
   */
  @RequestMapping(value="/consumer/update_mypage.do", method= {RequestMethod.POST} )
  public ModelAndView update_mypage(int consumer_no, HttpSession session, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    if(session.getAttribute("consumer_id") != null) {
    int session_consumer_no = (int)session.getAttribute("consumer_no");
    if(session_consumer_no == consumer_no) { //자기꺼 눌렀을떄
      ConsumerVO consumerVO = this.consumerProc.read(session_consumer_no);
      mav.addObject("consumerVO", consumerVO); // request에 저장
    }else { // 자기꺼말고 다른거 눌렀을떄
      ConsumerVO consumerVO = this.consumerProc.read(consumer_no);
      mav.addObject("consumerVO", consumerVO); // request에 저장
    }
    
    mav.setViewName("/consumer/update_mypage"); // webapp/consumer/update_mypage.jsp
    } else {
      mav.setViewName("/index");
    }
    
    
    return mav; // forward
  }
  
  
  
  // http://localhost:9090/team5/consumer/update_profile.do?consumer_no=4
  /**
   * 프로필 수정 폼
   * @param consumer_no
   * @return
   */
  @RequestMapping(value="/consumer/update_profile.do", method= {RequestMethod.POST})
  public ModelAndView update_profile(int consumer_no ,HttpSession session ,HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    
    int session_consumer_no = (int)session.getAttribute("consumer_no");
    if(session_consumer_no == consumer_no) { //자기꺼 눌렀을때
      ConsumerVO consumerVO = this.consumerProc.read(session_consumer_no);
      mav.addObject("consumerVO", consumerVO); // request에 저장
    }else {
      ConsumerVO consumerVO = this.consumerProc.read(consumer_no);
      mav.addObject("consumerVO", consumerVO); // request에 저장
    }
    mav.setViewName("/consumer/update_profile"); // webapp/consumer/update_profile.jsp
    
    return mav; // forward
  }
  
  // http://localhost:9090/team5/consumer/update_mypage.do
  /**
   * 프로필 수정 처리
   * @param categrpVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/consumer/update_profile_proc.do", method= {RequestMethod.POST} )
  public String update_profile_proc(int consumer_no, String consumer_id , String consumer_nickname , String consumer_age, RedirectAttributes redirectAttributes) {
    ModelAndView mav = new ModelAndView();

    HashMap hashmap = new HashMap();
    hashmap.put("consumer_no", consumer_no);
    hashmap.put("consumer_id", consumer_id);    
    hashmap.put("consumer_nickname", consumer_nickname);
    hashmap.put("consumer_age", consumer_age);
    int cnt = 0 ;
    try {
      int cnt_sucsess = this.consumerProc.update_profile(hashmap);
      if(cnt_sucsess == 1) {
        cnt = 1;
      }
    } catch (Exception e) {
       cnt = 0;
    }
    //redirectAttributes.addFlashAttribute("cnt", cnt);
    //redirectAttributes.addAttribute("consumer_no", consumer_no);
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString(); 
  }
  
  // http://localhost:9090/team5/consumer/update_contact.do?consumer_no=4
  /**
   * 연락처 수정 폼
   * @param consumer_no
   * @return
   */
  @RequestMapping(value="/consumer/update_contact.do", method=RequestMethod.POST )
  public ModelAndView update_contact(int consumer_no ,HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    int session_consumer_no = (int)session.getAttribute("consumer_no");
    if(session_consumer_no == consumer_no) { //자기꺼 눌렀을때
      ConsumerVO consumerVO = this.consumerProc.read(session_consumer_no);
      mav.addObject("consumerVO", consumerVO); // request에 저장
    }else {
      ConsumerVO consumerVO = this.consumerProc.read(consumer_no);
      mav.addObject("consumerVO", consumerVO); // request에 저장
    }
    mav.setViewName("/consumer/update_contact"); // webapp/consumer/update_contact.jsp
    
    return mav; // forward
  }
  
  // http://localhost:9090/team5/consumer/update_contact.do
  /**
   * 연락처 수정 이메일 처리
   * @param categrpVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/consumer/update_contact1.do", method=RequestMethod.POST )
  public String update_contact1(int consumer_no, String consumer_email ,RedirectAttributes redirectAttributes) {
    ModelAndView mav = new ModelAndView();
    System.out.println(consumer_no);
    System.out.println(consumer_email);

    int check_cnt = 0;
    HashMap hashmap = new HashMap();
    hashmap.put("consumer_no", consumer_no);
    hashmap.put("consumer_email", consumer_email);
    hashmap.put("check_cnt", check_cnt);
    //System.out.println("업데이트 1" + consumer_no);
    //System.out.println("업데이트 1" + consumer_email);
    int cnt = this.consumerProc.update_contact(hashmap);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString(); 
  }
  
  // http://localhost:9090/team5/consumer/update_contact.do
  /**
   * 연락처 수정 전화번호 처리
   * @param categrpVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/consumer/update_contact2.do", method=RequestMethod.POST )
  public String update_contact2(int consumer_no, String consumer_phone_num ,RedirectAttributes redirectAttributes) {
    ModelAndView mav = new ModelAndView();

    int check_cnt = 1;
    HashMap hashmap = new HashMap();
    hashmap.put("consumer_no", consumer_no);
    hashmap.put("consumer_phone_num", consumer_phone_num);
    hashmap.put("check_cnt", check_cnt);
    //System.out.println("업데이트 2" + consumer_no);
    //System.out.println("업데이트 2" + consumer_phone_num);
    int cnt = this.consumerProc.update_contact(hashmap);

    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString(); 
  }
  
  
  // http://localhost:9090/team5/consumer/update_paynum.do?consumer_no=4
  /**
   * 계좌번호 수정 폼
   * @param consumer_no
   * @return
   */
  @RequestMapping(value="/consumer/update_paynum.do", method=RequestMethod.POST )
  public ModelAndView update_paynum(int consumer_no, HttpSession session) {
    ModelAndView mav = new ModelAndView();
   
    int session_consumer_no = (int)session.getAttribute("consumer_no");
    if(session_consumer_no == consumer_no) { //자기꺼 눌렀을때
      ConsumerVO consumerVO = this.consumerProc.read(session_consumer_no);
      mav.addObject("consumerVO", consumerVO); // request에 저장
    }else {
      ConsumerVO consumerVO = this.consumerProc.read(consumer_no);
      mav.addObject("consumerVO", consumerVO); // request에 저장
    }
    mav.setViewName("/consumer/update_paynum"); // webapp/consumer/update_paynum.jsp
    
    return mav; // forward
  }
  
  // http://localhost:9090/team5/consumer/update_paynum.do
  /**
   * 계좌번호 수정 처리
   * @param categrpVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/consumer/update_paynum_proc.do", method=RequestMethod.POST )
  public String update_paynum_proc(int consumer_no, String consumer_allpaynum, RedirectAttributes redirectAttributes ) {
    ModelAndView mav = new ModelAndView();
    HashMap hashmap = new HashMap();
    hashmap.put("consumer_no", consumer_no);
    hashmap.put("consumer_pay_num", consumer_allpaynum);
    
    int cnt = this.consumerProc.update_paynum(hashmap);
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString(); 
  }
  
  // http://localhost:9090/team5/consumer/update_passwd.do?consumer_no=4
  /**
   * 비밀번호 수정 폼
   * @param consumer_no
   * @return
   */
  @RequestMapping(value="/consumer/update_passwd.do", method=RequestMethod.POST )
  public ModelAndView update_passwd(int consumer_no ,HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    int session_consumer_no = (int)session.getAttribute("consumer_no");
    if(session_consumer_no == consumer_no) { //자기꺼 눌렀을때
      ConsumerVO consumerVO = this.consumerProc.read(session_consumer_no);
      mav.addObject("consumerVO", consumerVO); // request에 저장
    }else {
      ConsumerVO consumerVO = this.consumerProc.read(consumer_no);
      mav.addObject("consumerVO", consumerVO); // request에 저장
    }
    mav.setViewName("/consumer/update_passwd"); // webapp/consumer/update_passwd.jsp
    
    return mav; // forward
  }
  
  // http://localhost:9090/team5/consumer/update_passwd.do
  /**
   * 비밀번호 수정 처리
   * @param categrpVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/consumer/update_passwd_proc.do", method=RequestMethod.POST )
  public String update_passwd_proc(int consumer_no, String consumer_passwd1, RedirectAttributes redirectAttributes) {
    ModelAndView mav = new ModelAndView();
    HashMap hashmap = new HashMap();
    
    String encPassword = passwordEncoder.encode(consumer_passwd1);
    
    
    hashmap.put("consumer_no", consumer_no);
    hashmap.put("consumer_passwd", encPassword);
    
    int cnt = this.consumerProc.update_passwd(hashmap);
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString(); 
  }


  
  
  
  
  
  // http://localhost:9090/team5/consumer/delete.do
  /**
   * 회원 삭제
   * @param categrpno 조회할 카테고리 번호
   * @return
   */
  @RequestMapping(value="/consumer/delete.do", method=RequestMethod.GET )
  public ModelAndView delete(@RequestParam int consumer_no, @RequestParam String consumer_id) {
    ModelAndView mav = new ModelAndView();
    //ConsumerVO consumerVO = this.consumerProc.read(consumer_no); // 삭제 정보 전달
    //mav.addObject("consumer_id", consumerVO.getConsumer_id());
    int cnt = this.adminProc.admin_cnt(consumer_no);
    System.out.println(cnt);
    if(cnt == 1) { // 관리자 삭제시
      this.adminProc.delete_by_consumer_no(consumer_no);
      HashMap hashmap  = new HashMap();
      hashmap.put("consumer_no", consumer_no);
      hashmap.put("consumer_id", consumer_id);
      this.consumerProc.delete(hashmap); // 삭제 처리
    }else { // 회원 삭제시
      HashMap hashmap  = new HashMap();
      hashmap.put("consumer_no", consumer_no);
      hashmap.put("consumer_id", consumer_id);
      this.consumerProc.delete(hashmap); // 삭제 처리
    }
    //mav.addObject("cnt", cnt); 



    return mav;
  }
 
  // http://localhost:9090/resort/member/checkName.do
//  /**
//   * 이름 중복 체크, JSON 출력
//   * @return
//   */
//  @ResponseBody
//  @RequestMapping(value="/consumer/checkName.do", method=RequestMethod.GET ,
//                              produces = "text/plain;charset=UTF-8" )
//  public String checkName(String consumer_name) {
//    int cnt = this.consumerProc.checkName(consumer_name);
//    JSONObject json = new JSONObject();
//    json.put("cnt", cnt);
//    
//    return json.toString(); 
//  }
  
  
  
  // http://localhost:9090/resort/consumer/checkID.do
  /**
   * ID 중복 체크, JSON 출력
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/consumer/checkID.do", method=RequestMethod.GET ,
                              produces = "text/plain;charset=UTF-8" )
  public String checkID(String consumer_id) {
    int cnt = this.consumerProc.checkID(consumer_id);
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString(); 
  }
  
  // http://localhost:9090/resort/consumer/checkEmail.do
  /**
   * Email 중복 체크, JSON 출력
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/consumer/checkEmail.do", method=RequestMethod.GET ,
                              produces = "text/plain;charset=UTF-8" )
  public String checkEmail(String consumer_email) {
    //System.out.println(consumer_email);
    int cnt = this.consumerProc.checkEmail(consumer_email);
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString(); 
  }
  
  // http://localhost:9090/resort/consumer/checkID.do
  /**
   * Name과 Email 매칭 확인(아이디 찾기) JSON 출력
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/consumer/matchNameEmail.do", method=RequestMethod.GET ,
                              produces = "text/plain;charset=UTF-8" )
  public String matchNameEmail(String consumer_email, String consumer_name) {
    HashMap hashmap = new HashMap();
    hashmap.put("consumer_email", consumer_email);
    hashmap.put("consumer_name", consumer_name);
    int cnt = this.consumerProc.matchNameEmail(hashmap);
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString(); 
  }
  
  // http://localhost:9090/resort/consumer/checkID.do
  /**
   * ID과 Email 매칭 확인(아이디 찾기) JSON 출력
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/consumer/matchIdEmail.do", method=RequestMethod.GET ,
                              produces = "text/plain;charset=UTF-8" )
  public String matchIdEmail(String consumer_email, String consumer_id) {
    HashMap hashmap = new HashMap();
    hashmap.put("consumer_email", consumer_email);
    hashmap.put("consumer_id", consumer_id);
    int cnt = this.consumerProc.matchIdEmail(hashmap);
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString(); 
  }
  
  
  /**
   * 로그인 처리
   * @param request Cookie를 읽기위해 필요
   * @param response Cookie를 쓰기위해 필요
   * @param session 로그인정보를 메모리에 기록
   * @param id 회원 아이디
   * @param passwd 회원 패스워드
   * @param id_save 회원 아이디 Cookie에 저장 여부
   * @param passwd_save 패스워드 Cookie에 저장 여부
   * @return
   */
  // http://localhost:9090/ojt/member/login.do 
  @RequestMapping(value = "/consumer/login.do", 
                             method = RequestMethod.POST)
  public ModelAndView login_proc(HttpServletRequest request,
                                                 HttpServletResponse response,
                                                 HttpSession session,
                                                 String id, String passwd,
                                                 @RequestParam(value="id_save", defaultValue="") String id_save,
                                                 @RequestParam(value="passwd_save", defaultValue="") String passwd_save,
                                                 String now_url, 
                                                 String adminlogin) {
    ModelAndView mav = new ModelAndView();

    
    String url = request.getHeader("REFERER"); // 현재 url
    Map<Object, Object> map = new HashMap<Object, Object>();
    map.put("id", id); //id 값 입력받음
    map.put("passwd", passwd); // 패스워드값 입력 받음
    
//    String encPassword = passwordEncoder.encode(passwd);
//    System.out.println(encPassword);
    //$2a$10$wto5qtVcp9Db0PS9YK.M0OMT/kwQdzj6vhmnSVExKHZkgqPPVnBZW
    
    ConsumerVO consumerVO = consumerProc.readById(id); //값 저장
    if(consumerVO == null) {
      int Noconsumer_cnt = 1;
      mav.addObject("Noconsumer_cnt", Noconsumer_cnt);
      //session.invalidate();
      mav.setViewName("redirect:/consumer/AllModal.jsp"); //없는 회원 로그인 시
      return mav;
    }
    
    
//    boolean bo = passwordEncoder.matches(passwd, consumerVO.getConsumer_passwd());
//    System.out.println(bo);
    System.out.println("패스워드:"+passwd);
    System.out.println("암호화:"+consumerVO.getConsumer_passwd());
    if(passwordEncoder.matches(passwd, consumerVO.getConsumer_passwd())) {// 암호화 비밀번호와 일치
    // if(1==1) {
      System.out.println("매치확인");
      String ip = null;
      String consumer_key = consumerVO.getConsumer_key();
      System.out.println(consumer_key);
      if(!consumer_key.equals("Y")) {  
        int Keyerror_cnt = 1;
        mav.addObject("Keyerror_cnt", Keyerror_cnt);
        mav.setViewName("redirect:/consumer/AllModal.jsp");
      }else {
      session.setAttribute("consumer_no", consumerVO.getConsumer_no());
      session.setAttribute("consumer_id", id);
      session.setAttribute("mname", consumerVO.getConsumer_name());
      session.setAttribute("consumer_nickname", consumerVO.getConsumer_nickname());
      }
      System.out.println("adminlogin:"+adminlogin);
      if(adminlogin != null) { // 관리자 로그인시
        map.put("consumer_no", consumerVO.getConsumer_no()); //회원 번호 저장
        int cnt = adminProc.login(map); // admin 테이블에 저장된 회원번호면 1 아니면 0
        System.out.println("관리자:"+cnt);
        if(cnt ==1) { //관리자 로그인 성공시
          AdminVO adminVO = adminProc.readById(consumerVO.getConsumer_no());
          
          
          try { ip = InetAddress.getLocalHost().getHostAddress(); } // 로그인시 현재 ip 가져오기
          catch (UnknownHostException e1) { e1.printStackTrace(); ip = "123"; }
          HashMap hashmap = new HashMap();
          hashmap.put("consumer_no", consumerVO.getConsumer_no());
          System.out.println(ip);
          hashmap.put("ip", ip);
          this.loginProc.create(hashmap); // 로그인 이력 기록
          session.setAttribute("admin", "Y");
          session.setAttribute("admin_no", adminVO.getAdmin_no());            
          mav.setViewName("redirect:"+url);// 관리자 로그인 성공시
        } else { 
          int Manerror_cnt = 1;
          mav.addObject("Manerror_cnt", Manerror_cnt);
          session.invalidate();
          mav.setViewName("redirect:/consumer/AllModal.jsp"); //관리자 로그인 실패시
        }
      } else { 
        try { ip = InetAddress.getLocalHost().getHostAddress(); } // 로그인시 현재 ip 가져오기
        catch (UnknownHostException e1) { e1.printStackTrace(); ip = ""; }
        HashMap hashmap = new HashMap();
        hashmap.put("consumer_no", consumerVO.getConsumer_no());
        hashmap.put("ip", ip);
        this.loginProc.create(hashmap); // 로그인 이력 기록
        mav.setViewName("redirect:"+url); //회원 로그인 성공시
      } 
    }else {
      System.out.println("매치불가");
      int Conerror_cnt = 1;
      mav.addObject("Conerror_cnt", Conerror_cnt);
      mav.setViewName("redirect:/consumer/AllModal.jsp"); //회원 로그인 실패시
    } 
 
//    int count = consumerProc.login(map);
//    if (count == 1) {  //회원 로그인
//      String ip = null;
//      String consumer_key = consumerVO.getConsumer_key();
//      
//      if(!consumer_key.equals("Y")) {  
//        int Keyerror_cnt = 1;
//        mav.addObject("Keyerror_cnt", Keyerror_cnt);
//        mav.setViewName("redirect:/consumer/AllModal.jsp");
//      }else {
//      session.setAttribute("consumer_no", consumerVO.getConsumer_no());
//      session.setAttribute("consumer_id", id);
//      session.setAttribute("mname", consumerVO.getConsumer_name());
//      session.setAttribute("consumer_nickname", consumerVO.getConsumer_nickname());
//      }
//      if(adminlogin != null) { // 관리자 로그인시
//        map.put("consumer_no", consumerVO.getConsumer_no()); //회원 번호 저장
//        int cnt = adminProc.login(map); // admin 테이블에 저장된 회원번호면 1 아니면 0
//        System.out.println(cnt);
//        if(cnt ==1) { //관리자 로그인 성공시
//          AdminVO adminVO = adminProc.readById(consumerVO.getConsumer_no());
//          
//          try { ip = InetAddress.getLocalHost().getHostAddress(); } // 로그인시 현재 ip 가져오기
//          catch (UnknownHostException e1) { e1.printStackTrace(); ip = ""; }
//          HashMap hashmap = new HashMap();
//          hashmap.put("consumer_no", consumerVO.getConsumer_no());
//          hashmap.put("ip", ip);
//          this.loginProc.create(hashmap); // 로그인 이력 기록
//          session.setAttribute("admin", "Y");
//          session.setAttribute("admin_no", adminVO.getAdmin_no());            
//          mav.setViewName("redirect:"+url);// 관리자 로그인 성공시
//        } else { 
//          int Manerror_cnt = 1;
//          mav.addObject("Manerror_cnt", Manerror_cnt);
//          session.invalidate();
//          mav.setViewName("redirect:/consumer/AllModal.jsp"); //관리자 로그인 실패시
//        }
//      } else { 
//        try { ip = InetAddress.getLocalHost().getHostAddress(); } // 로그인시 현재 ip 가져오기
//        catch (UnknownHostException e1) { e1.printStackTrace(); ip = ""; }
//        HashMap hashmap = new HashMap();
//        hashmap.put("consumer_no", consumerVO.getConsumer_no());
//        hashmap.put("ip", ip);
//        this.loginProc.create(hashmap); // 로그인 이력 기록
//        mav.setViewName("redirect:"+url); //회원 로그인 성공시
//      }        
//    }else {
//      int Conerror_cnt = 1;
//      mav.addObject("Conerror_cnt", Conerror_cnt);
//      mav.setViewName("redirect:/consumer/AllModal.jsp"); //회원 로그인 실패시
//    }   
  return mav;
  }

  /**
   * 로그아웃 처리
   * @param session
   * @return
   */
  @RequestMapping(value="/consumer/logout.do", 
                             method=RequestMethod.GET)
  public ModelAndView logout(HttpSession session){
    ModelAndView mav = new ModelAndView();
    session.invalidate(); // 모든 session 변수 삭제
    
    mav.setViewName("redirect:/index.jsp");
    
    return mav;
  }
  
  
  
  
  
  /* NaverLoginBO */
  private NaverLoginBO naverLoginBO;
  private String apiResult = null;
  @Autowired
  private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
  this.naverLoginBO = naverLoginBO;
  }
  //로그인 첫 화면 요청 메소드
  @RequestMapping(value = "/consumer/naverlogin.do", method = { RequestMethod.GET, RequestMethod.POST })
  public String naverlogin( HttpSession session) {
  //  ModelAndView mav = new ModelAndView();
  /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
  String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
  //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
  //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
  //System.out.println("네이버:" + naverAuthUrl);
  //네이버
  //mav.addObject("url", naverAuthUrl);
  //mav.setViewName("/consumer/login");
  return "redirect:" +naverAuthUrl;
  //return mav;
  }
  
//네이버 로그인 성공시 callback호출 메소드
@RequestMapping(value = "/callback", method = { RequestMethod.GET})
public String callback(HttpServletRequest request, Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
    //System.out.println("여기는 callback");
    String url = request.getHeader("REFERER"); // 현재 url
    
    OAuth2AccessToken oauthToken;
    oauthToken = naverLoginBO.getAccessToken(session, code, state);
   // System.out.println(oauthToken);
    //1. 로그인 사용자 정보를 읽어온다.
    apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
 //   System.out.println(apiResult);
    /** apiResult json 구조
    {"resultcode":"00",
    "message":"success",
    "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
    **/
    //2. String형식인 apiResult를 json형태로 바꿈
    JSONParser parser = new JSONParser();
    Object obj = parser.parse(apiResult);
    JSONObject jsonObj = (JSONObject) obj;
    //3. 데이터 파싱
    //Top레벨 단계 _response 파싱
    JSONObject response_obj = (JSONObject)jsonObj.get("response");
    //response의 nickname값 파싱
    String naver_id = (String)response_obj.get("id");
    String naver_name = (String)response_obj.get("name");
    String naver_nickname = (String)response_obj.get("nickname");
    String naver_gender = (String)response_obj.get("gender");
    String naver_email = (String)response_obj.get("email");
    session.setAttribute("naver_id", naver_id);
    session.setAttribute("naver_name", naver_name);
    session.setAttribute("naver_nickname", naver_nickname);
    session.setAttribute("naver_gender", naver_gender);
    session.setAttribute("naver_email", naver_email);
    
//    57868415
//    박근서
//    parkgeu****
//    M
//    parkgeunseo@naver.com
//    System.out.println(naver_id);
//    System.out.println(naver_name);
//    System.out.println(naver_nickname);
//    System.out.println(naver_gender);
//    System.out.println(naver_email);
    //4.파싱 닉네임 세션으로 저장
    //session.setAttribute("sessionId",nickname); //세션 생성
    //model.addAttribute("result", apiResult);
    return "index";
}



  
  
  
}
