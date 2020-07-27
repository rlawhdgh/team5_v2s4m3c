package dev.mvc.pay;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
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

import dev.mvc.catebag.Catebag;
import dev.mvc.catebag.CatebagProcInter;
import dev.mvc.catebag.CatebagVO;
import dev.mvc.catebag.Catebag_Pay_VO;
import dev.mvc.catebag.Game_Catebag_VO;
import dev.mvc.consumer.ConsumerProcInter;
import dev.mvc.consumer.ConsumerVO;
import dev.mvc.game.GameProcInter;
import dev.mvc.game.GameVO;
import dev.mvc.point.PointProcInter;
import dev.mvc.point.PointVO;

@Controller
public class PayCont {
  
  @Autowired
  @Qualifier("dev.mvc.point.PointProc")
  private PointProcInter pointProc;
  
  @Autowired
  @Qualifier("dev.mvc.consumer.ConsumerProc")
  private ConsumerProcInter consumerProc;
  
  @Autowired
  @Qualifier("dev.mvc.game.GameProc")
  private GameProcInter gameProc;
  
  @Autowired
  @Qualifier("dev.mvc.catebag.CatebagProc")
  private CatebagProcInter catebagProc;
  
  //-----------------------------------------
  @Autowired
  @Qualifier("dev.mvc.pay.PayProc")
  private PayProcInter payProc;
  
//http://localhost:9090/team5/pay/create.do
 /**
  * 등록 폼
  * @return
  */
  /*
   * @RequestMapping(value="/pay/create.do", method=RequestMethod.GET ) public
   * ModelAndView create() { ModelAndView mav = new ModelAndView();
   * 
   * mav.setViewName("/pay/create"); // webapp/categrp/create.jsp
   * 
   * return mav; // forward
   * 
   * }
   */
   
 //http://localhost:9090/team5/pay/create.do
   /**
    * 등록 폼
    * @param PayVO
    * @return
    */
 @RequestMapping(value="/pay/create.do", method=RequestMethod.GET )
 public ModelAndView create(int[] checkOne, HttpSession session) {  
   
   ModelAndView mav = new ModelAndView();
   
   
   String checkOnes = "";
   
   ArrayList<Catebag_Pay_VO> list = new ArrayList<Catebag_Pay_VO>();

   
   for (int catebag_catebagno : checkOne) {   //cartno 받아와서      
     checkOnes = checkOnes + catebag_catebagno + "/";
     System.out.println(catebag_catebagno);
     Catebag_Pay_VO catebag_Pay_VO = this.catebagProc.catebag_pay_read(catebag_catebagno);
     //System.out.println("dd:"+this.catebagProc.catebag_pay_read(1));
     System.out.println("catebag_Pay_VO"+catebag_Pay_VO);
     list.add(catebag_Pay_VO);
     
     
     

    }
   checkOnes = checkOnes.substring(0, checkOnes.length()-1);
   System.out.println("checkOnes: " + checkOnes);  
   
   
 /// 합계-------------------------------------     
   int tot =0;
   for(int i=0; i<list.size(); i++) {
     int a =  list.get(i).getCatebag_cnt()* list.get(i).getGame_price();
     tot += a;
   }
   
   System.out.println(tot);
   mav.addObject("tot", tot);  
   
   ///-----------------------------------------  
      
   
   mav.addObject("list", list); // request.setAttribute("list", list)
    
   mav.addObject("checkOnes", checkOnes); // 쇼핑카트 번호  
 
   
   mav.setViewName("/pay/create"); // webapp/categrp/create.jsp
   
   return mav; 
 }
  
 //http://localhost:9090/team5/pay/create.do
 /**
  * 등록 처리
  * @param PayVO
  * @return
  */

  @ResponseBody
  @RequestMapping(value="/pay/create.do", method=RequestMethod.POST, 
                                       produces = "text/plain;charset=UTF-8" )
  public String create(int [] checkOne, String pay_kind) {  
 

   // 1. 쇼핑카트에서 번호에 해당하는 레코드를 조회
   int order_cnt = 0; 
   
   for (int catebag_catebagno : checkOne) {   //cartno 받아와서 
   
     // 쇼핑카트 --> 주문 
     CatebagVO catebagVO =this.catebagProc.read(catebag_catebagno); 
     PayVO payVO = new PayVO(); 
     //PointVO pointVO = new PointVO();
     
     payVO.setGame_gameno(catebagVO.getGame_gameno());
     payVO.setConsumer_no(catebagVO.getConsumer_no());
     payVO.setPay_cnt(catebagVO.getCatebag_cnt());    
     payVO.setPay_kind(pay_kind);  
     
     
    int cnt = this.payProc.create(payVO);  // 주문
    if(cnt == 1) {  // 주문 성공 했다면
       order_cnt = order_cnt + 1;  // 주문 상품 카운트
       int delete_cnt = this.catebagProc.delete(catebag_catebagno); //주문 상품 삭제
       
       
       if (delete_cnt == 1) {  // 주문 상품 삭제 확인
         System.out.println(catebag_catebagno + " 번 상품 주문 완료");
        
       }
     }   
  
     System.out.println("Game_gameno-->"+catebagVO.getGame_gameno());
     System.out.println("consumer_no-->"+catebagVO.getConsumer_no());   
     System.out.println("pay_cnt-->"+catebagVO.getCatebag_cnt());
    }
 
    JSONObject json = new JSONObject();
    json.put("pay_kind", pay_kind);
    json.put("order_cnt", order_cnt);
   
    return json.toString(); 
}
 
 
 
//  @RequestMapping(value="/pay/create.do", method=RequestMethod.POST )
//   public ModelAndView pay(PayVO payVO) {
//    // CategrpVO categrpVO <FORM> 태그의 값으로 자동 생성됨.
//    // request.setAttribute("categrpVO", categrpVO); 자동 실행
//
//    ModelAndView mav = new ModelAndView();
//    int cnt = this.payProc.create(payVO); // 등록 처리
//    mav.addObject("cnt", cnt); // request에 저장, request.setAttribute("cnt", cnt)
//  
//
//    mav.setViewName("/pay/create_msg"); // webapp/categrp/create_msg.jsp
//
//    return mav; // forward
//  }
 
 
//http://localhost:9090/team5/catebag/list_all.do
  /**
  * 전체 목록
  * 
  * @return
  */
 @RequestMapping(value = "/pay/list_all.do", method = RequestMethod.GET)
 public ModelAndView list() {
   ModelAndView mav = new ModelAndView();

   List<PayVO> list = this.payProc.list_all();
   mav.addObject("list", list); // request.setAttribute("list", list);
   
   mav.setViewName("/pay/list_all"); // /webapp/wishlist/list_all.jsp
   return mav;
 }
 
 /**
  * 첨부 파일 1건 삭제 처리
  * 
  * @return
  */
 @RequestMapping(value = "/pay/delete.do", 
                            method = RequestMethod.GET)
 public ModelAndView delete_proc(HttpServletRequest request, HttpSession session,
                                               int pay_payno,
                                                                                                                                          
                                               @RequestParam(value="nowPage", defaultValue="1") int nowPage) {
   
   int consumer_no = Integer.parseInt(session.getAttribute("consumer_no").toString());
   System.out.println("로그인된 회원번호:"+consumer_no);
   
   System.out.println("회원 번호-->"+consumer_no);
   System.out.println("nowPage-->"+nowPage);
   ModelAndView mav = new ModelAndView();

// -------------------------------------------------------------------------------------
   // 마지막 페이지의 레코드 삭제시의 페이지 번호 -1 처리
   HashMap<String, Object> map = new HashMap<String, Object>();
   map.put("consumer_no", consumer_no);
   
   int search_count = payProc.search_count(map);
   mav.addObject("search_count", search_count);
   
   
   
   System.out.println(search_count/Pay.RECORD_PER_PAGE);
   
   if (payProc.search_count(map) % Pay.RECORD_PER_PAGE == 1) {
     if(nowPage == search_count/Pay.RECORD_PER_PAGE-1) {
     nowPage = nowPage - 1;
       } 
       if (nowPage < 1) {
         nowPage = 1;
       }
     }
   // -------------------------------------------------------------------------------------
   
   
   // 삭제할 파일 정보를 읽어옴.
   PayVO payVO = payProc.read(pay_payno);
   
   ConsumerVO consumerVO = this.consumerProc.read(payVO.getConsumer_no());
   mav.addObject("consumerVO", consumerVO);
   
   //String upDir = Tool.getRealPath(request, "/attachfile/storage"); // 절대 경로
   //Tool.deleteFile(upDir, attachfileVO.getFupname()); // Folder에서 1건의 파일 삭제
   //Tool.deleteFile(upDir, attachfileVO.getThumb()); // 1건의 Thumb 파일 삭제
   
   // DBMS에서 1건의 파일 삭제
   payProc.delete(pay_payno);
       
   List<PayVO> list = payProc.list_all();
   mav.addObject("list", list);
   
   mav.setViewName("redirect:/pay/pay_by_consumer_no.do"+"?nowPage="+nowPage); 

   return mav;
 }
 
//http://localhost:9090/resort/catebag/catebag_by_memberno.do
 /**
  * 회원별 글 전체 목록
  * 
  * @return
  */
 
//   @RequestMapping(value = "/pay/pay_by_consumer_no.do", method = RequestMethod.GET) 
//   public ModelAndView pay_by_consumer_no(int consumer_no) {
//   ModelAndView mav = new ModelAndView();
//   
//   // Type 1 
//   ConsumerVO consumerVO = this.consumerProc.read(consumer_no);
//   List<List_Pay_VO> list = this.payProc.list_pay_consumer_no_list(consumer_no);
//   mav.addObject("consumerVO", consumerVO); mav.addObject("list", list);
//   
//  // Type 2 // 
//  // Cate_Contents_Member_VO vo = new Cate_Contents_Member_VO(); //   
//  // vo.setMemberVO(memberVO); // vo.setCate_contents_memberno_list(list); //
//  // mav.addObject("vo", vo);
//   
//   mav.setViewName("/pay/pay_by_consumer_no"); //webapp/contents/list_by_memberno.jsp 
//   return mav; 
//   }
 
 @RequestMapping(value = "/pay/pay_by_consumer_no.do", method = RequestMethod.GET)
 public ModelAndView pay_by_consumer_no_paging(HttpSession session,                                                                                               
                                               @RequestParam(value = "nowPage", defaultValue = "1") int nowPage) {
   System.out.println("--> nowPage: " + nowPage);
   
   ModelAndView mav = new ModelAndView();   
   if(session.getAttribute("consumer_no") != null) {
   
      int consumer_no = Integer.parseInt(session.getAttribute("consumer_no").toString());
      System.out.println("로그인된 회원번호:"+consumer_no);
   
   
     
   // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
   HashMap<String, Object> map = new HashMap<String, Object>();
   map.put("consumer_no", consumer_no); // #{cateno}
   map.put("nowPage", nowPage); // 페이지에 출력할 레코드의 범위를 산출하기위해 사용
   
   // 검색 목록
   List<Game_Pay_VO> list = payProc.pay_by_consumer_no_paging(map);
   mav.addObject("list", list);
   
 /// 합계-------------------------------------
   
   int tot =0;
   for(int i=0; i<list.size(); i++) {
     int a =  list.get(i).getPay_cnt()* list.get(i).getGame_sale();
     tot += a;
   }
   
   System.out.println(tot);
   mav.addObject("tot", tot);  
   
   ///-----------------------------------------
   
   

   // 검색된 레코드 갯수
   int search_count = payProc.search_count(map);
   mav.addObject("search_count", search_count);
   
   ConsumerVO consumerVO = this.consumerProc.read(consumer_no);
   mav.addObject("consumerVO", consumerVO);
   
 
  
   

   /*
    * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
    * 18 19 20 [다음]
    * 
    * @param listFile 목록 파일명
    * 
    * @param cateno 카테고리번호
    * 
    * @param search_count 검색(전체) 레코드수
    * 
    * @param nowPage 현재 페이지
    * 
    * @param word 검색어
    * 
    * @return 페이징 생성 문자열
    */
   String paging = payProc.pagingBox("pay_by_consumer_no.do", search_count, nowPage);
   mav.addObject("paging", paging);

   mav.addObject("nowPage", nowPage);

   // /contents/list_by_cateno_search_paging.jsp
   mav.setViewName("/pay/pay_by_consumer_no_paging");
   } else {
     mav.setViewName("/index");
   }
   return mav;
 }
 
 //-----------------mail-------------------------------
 
 
}
 
