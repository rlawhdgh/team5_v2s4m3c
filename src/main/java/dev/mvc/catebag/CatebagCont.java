package dev.mvc.catebag;

import java.util.HashMap;
import java.util.List;

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


import dev.mvc.consumer.ConsumerProcInter;
import dev.mvc.consumer.ConsumerVO;
import dev.mvc.game.GameProcInter;
import dev.mvc.game.GameVO;
import dev.mvc.pay.PayProcInter;
import dev.mvc.pay.PayVO;
import dev.mvc.point.PointProcInter;
import dev.mvc.tool.Tool;
import dev.mvc.wishlist.Wishlist;
import dev.mvc.wishlist.WishlistProcInter;
import dev.mvc.wishlist.WishlistVO;


@Controller
public class CatebagCont {
//다른 개발자가 만든 것을 쓸때 이 코딩을 쓴다.
  
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
  @Qualifier("dev.mvc.wishlist.WishlistProc")
  private WishlistProcInter wishlistProc;
  
  @Autowired
  @Qualifier("dev.mvc.pay.PayProc")
  private PayProcInter payProc;

  //@Autowired
  //@Qualifier("dev.mvc.wishlist.WishlistProc")
  //private WishlistProcInter wishlistProc;
  
  //------------------------------------------
  @Autowired
  @Qualifier("dev.mvc.catebag.CatebagProc")
  private CatebagProcInter catebagProc;
  public CatebagCont() {
    System.out.println("--> Catebag created.");
  }
  
  

  
  
//http://localhost:9090/team5/catebag/create.do
 /**
  * 등록 폼
  * @return
  */
 @RequestMapping(value="/catebag/create.do", method=RequestMethod.GET )
 public ModelAndView create() {
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/catebag/create"); // webapp/categrp/create.jsp
   
   return mav; // forward
 }
 
//http://localhost:9090/team5/catebag/create.do
  /**
   * 등록 중복 처리
   * @param catebagVO
   * @return
   */
  @ResponseBody 
  @RequestMapping(value="/catebag/create.do", method=RequestMethod.POST, produces = "text/plain;charset=UTF-8" )
  public String create(int game_gameno, HttpSession session) {
  
    GameVO gameVO = this.gameProc.read(game_gameno);
    CatebagVO catebagVO = new CatebagVO();
    
    int consumer_no = Integer.parseInt(session.getAttribute("consumer_no").toString());
    
    catebagVO.setGame_gameno(gameVO.getGame_gameno());
    catebagVO.setConsumer_no(consumer_no);
    catebagVO.setCatebag_cnt(1);
    catebagVO.setCatebag_seqno(1);
    catebagVO.setCatebag_sum(1);
    
  
    

    int cnt = this.catebagProc.read_check(game_gameno); 
    System.out.println("체크 있나없나"+cnt);
     if (cnt > 0 ) {
      int delete_cnt = this.catebagProc.delete_check(game_gameno);
       if (delete_cnt == 1) {       
        int create_cnt = this.catebagProc.create(catebagVO);
         // if(create_cnt == 1) {
           // System.out.println("인서트"+create_cnt);
          //}
         
        }      
       System.out.println("삭제"+delete_cnt);
     } else if( cnt == 0) {
       int delete_cnt = this.catebagProc.delete_check(game_gameno);
       if (delete_cnt == 0) {  
       int create_cnt = this.catebagProc.create(catebagVO);
      }
     } 
     
     System.out.println("게임번호"+game_gameno);
     
     JSONObject json = new JSONObject();
     json.put("cnt", cnt);
     
     return json.toString();
 }
  
  /**
   * 등록 처리
   * @param PayVO
   * @return
   */ 
 @ResponseBody 
 @RequestMapping(value="/catebag/create2.do", method=RequestMethod.POST, produces = "text/plain;charset=UTF-8" )
 public String create(int wishlist_wishlistno,
                            @RequestParam(value="nowPage", defaultValue="1") int nowPage) {
     
   int order_cnt = 0; 
   
     WishlistVO wishlistVO =this.wishlistProc.read(wishlist_wishlistno);
     
     // 위시리스트 --> 쇼핑카트 
     CatebagVO catebagVO = new CatebagVO(); 
     
       
       catebagVO.setGame_gameno(wishlistVO.getGame_gameno());
       catebagVO.setConsumer_no(wishlistVO.getConsumer_no());
       catebagVO.setCatebag_cnt(1);
       
       
       
       int cnt = this.catebagProc.create(catebagVO);  // 주문
       if(cnt == 1) {  // 주문 성공 했다면
          order_cnt = order_cnt + 1;  // 주문 상품 카운트
         int delete_cnt = this.wishlistProc.delete2(wishlist_wishlistno); //주문 상품 삭제
         if (delete_cnt == 1) {  // 주문 상품 삭제 확인
            System.out.println(wishlist_wishlistno + " 번 상품 주문 완료");    
      
         }
         
     }
      System.out.println("cnt -->"+cnt);
      
      
      JSONObject json = new JSONObject();
      json.put("cnt", cnt);
      
      return json.toString();

   //mav.setViewName("redirect:/wishlist/list_by_consumer_no.do"+"?nowPage="+nowPage);   
   //return mav; // forward
}
  
  
//http://localhost:9090/team5/catebag/list_all.do
  /**
  * 전체 목록
  * 
  * @return
  */
 @RequestMapping(value = "/catebag/list_all.do", method = RequestMethod.GET)
 public ModelAndView list() {
   ModelAndView mav = new ModelAndView();

   List<CatebagVO> list = this.catebagProc.list_all();
   mav.addObject("list", list); // request.setAttribute("list", list);
   
   mav.setViewName("/catebag/list_all"); // /webapp/wishlist/list_all.jsp
   return mav;
 }
 
 /**
  * 첨부 파일 1건 삭제 처리
  * 
  * @return
  */
 @RequestMapping(value = "/catebag/delete.do", 
                            method = RequestMethod.GET)
 public ModelAndView delete_proc(HttpServletRequest request, HttpSession session,
                                               int catebag_catebagno,                                                                                           
                                               @RequestParam(value="nowPage", defaultValue="1") int nowPage) {
   ModelAndView mav = new ModelAndView();
   
   int consumer_no = Integer.parseInt(session.getAttribute("consumer_no").toString());
   System.out.println("로그인된 회원번호:"+consumer_no);
   
// -------------------------------------------------------------------------------------
   // 마지막 페이지의 레코드 삭제시의 페이지 번호 -1 처리
   HashMap<String, Object> map = new HashMap<String, Object>();
   map.put("consumer_no", consumer_no);
   
   int search_count = catebagProc.search_count(map);
   mav.addObject("search_count", search_count);
   
   
   
   System.out.println(search_count/Catebag.RECORD_PER_PAGE);
   
   if (catebagProc.search_count(map) % Catebag.RECORD_PER_PAGE == 1) {
     if(nowPage == search_count/Catebag.RECORD_PER_PAGE-1) {
     nowPage = nowPage - 1;
       } 
       if (nowPage < 1) {
         nowPage = 1;
       }
     }
   // -------------------------------------------------------------------------------------
   
   
   // 삭제할 파일 정보를 읽어옴.
   CatebagVO catebagVO = catebagProc.read(catebag_catebagno);
   
   ConsumerVO consumerVO = this.consumerProc.read(catebagVO.getConsumer_no());
   mav.addObject("consumerVO", consumerVO);
   
   //String upDir = Tool.getRealPath(request, "/attachfile/storage"); // 절대 경로
   //Tool.deleteFile(upDir, attachfileVO.getFupname()); // Folder에서 1건의 파일 삭제
   //Tool.deleteFile(upDir, attachfileVO.getThumb()); // 1건의 Thumb 파일 삭제
   
   // DBMS에서 1건의 파일 삭제
   catebagProc.delete(catebag_catebagno);
       
   List<CatebagVO> list = catebagProc.list_all();
   mav.addObject("list", list);
   
   mav.setViewName("redirect:/catebag/catebag_by_consumer_no.do"+"?nowPage="+nowPage); 

   return mav;
 }
 
 
  @RequestMapping(value = "/catebag/delete2.do", 
       method = RequestMethod.GET)
  public ModelAndView delete2(HttpServletRequest request, HttpSession session, 
                          int catebag_catebagno,                                                                                            
                          @RequestParam(value="nowPage", defaultValue="1") int nowPage
                          ) {
  ModelAndView mav = new ModelAndView();

  // HashMap<String, Object> map = new HashMap<String, Object>();
  // map.put("nowPage", nowPage); // 페이지에 출력할 레코드의 범위를 산출하기위해 사용
  // 삭제할 파일 정보를 읽어옴.
  CatebagVO catebagVO = catebagProc.read(catebag_catebagno);

  ConsumerVO consumerVO = this.consumerProc.read(catebagVO.getConsumer_no());
  mav.addObject("consumerVO", consumerVO);

  // String upDir = Tool.getRealPath(request, "/attachfile/storage"); // 절대 경로
  //Tool.deleteFile(upDir, attachfileVO.getFupname()); // Folder에서 1건의 파일 삭제
  //Tool.deleteFile(upDir, attachfileVO.getThumb()); // 1건의 Thumb 파일 삭제
  // -------------------------------------------------------------------------------------

  // DBMS에서 1건의 파일 삭제
  catebagProc.delete(catebag_catebagno);

  List<CatebagVO> list = catebagProc.list_all();
  mav.addObject("list", list);


  mav.setViewName("redirect:/catebag/game_by_consumer_no.do"+"?nowPage="+nowPage); 

  return mav; 
  }
 
//http://localhost:9090/resort/categrp/update_seqno_up.do?categrpno=1
// http://localhost:9090/resort/categrp/update_seqno_up.do?categrpno=1000
/**
 * 수량 상향 up 1 ▷ 10
 * @param catebag_catebagno 조회할 카테고리 번호
 * @return
 */
@RequestMapping(value="/catebag/update_cnt_up.do", 
                            method=RequestMethod.GET )
public ModelAndView update_cnt_up(int catebag_catebagno,
                                  HttpSession session,                                                                                           
                                  @RequestParam(value="nowPage", defaultValue="1") int nowPage,
                                  @RequestParam(value = "catebag_cnt", defaultValue = "")int catebag_cnt) {
  ModelAndView mav = new ModelAndView();
  int consumer_no = Integer.parseInt(session.getAttribute("consumer_no").toString());
  System.out.println("로그인된 회원번호:"+consumer_no); 
  
  
  CatebagVO catebagVO = this.catebagProc.read(catebag_catebagno);
  mav.addObject("catebagVO", catebagVO);  // request 객체에 저장
  
  ConsumerVO consumerVO = this.consumerProc.read(catebagVO.getConsumer_no());
  mav.addObject("consumerVO", consumerVO);
  
  //catebagProc.update_cnt_up(catebag_catebagno);
  
  List<CatebagVO> list = catebagProc.list_all();
  mav.addObject("list", list);
  
  int cnt = this.catebagProc.update_cnt_up(catebag_catebagno);  // 우선 순위 상향 처리
  mav.addObject("cnt", cnt);  // request 객체에 저장
 
  
  mav.setViewName("redirect:/catebag/catebag_by_consumer_no.do"+"?nowPage="+nowPage+"&catebag_cnt"+catebag_cnt); // update_seqno_up_msg.jsp
  return mav;
}  

// http://localhost:9090/resort/categrp/update_seqno_down.do?categrpno=1
// http://localhost:9090/resort/categrp/update_seqno_down.do?categrpno=1000
/**
 * 수량 하향 up 10 ▷ 1
 * @param catebag_catebagno 조회할 카테고리 번호
 * @return
 */
  @RequestMapping(value="/catebag/update_cnt_down.do", 
                              method=RequestMethod.GET )
  public ModelAndView update_cnt_down(int catebag_catebagno,
                                      HttpSession session,                                                                                           
                                      @RequestParam(value="nowPage", defaultValue="1") int nowPage,
                                      @RequestParam(value = "catebag_cnt", defaultValue = "")int catebag_cnt) {
  ModelAndView mav = new ModelAndView();
  
  int consumer_no = Integer.parseInt(session.getAttribute("consumer_no").toString());
  System.out.println("로그인된 회원번호:"+consumer_no);
  
  CatebagVO catebagVO = this.catebagProc.read(catebag_catebagno);
  mav.addObject("catebagVO", catebagVO);  // request 객체에 저장
  
  ConsumerVO consumerVO = this.consumerProc.read(catebagVO.getConsumer_no());
  mav.addObject("consumerVO", consumerVO);
  
  //catebagProc.update_cnt_down(catebag_catebagno);
  
  List<CatebagVO> list = catebagProc.list_all();
  mav.addObject("list", list);
  
  int cnt = this.catebagProc.update_cnt_down(catebag_catebagno);  // 우선 순위 상향 처리
  mav.addObject("cnt", cnt);  // request 객체에 저장

  mav.setViewName("redirect:/catebag/catebag_by_consumer_no.do"+"?nowPage="+nowPage+"&catebag_cnt"+catebag_cnt); // update_seqno_up_msg.jsp
  return mav;
 }  
  
  /**
   * 수정 처리
   * @param categrpVO
   * @return
   */
  @RequestMapping(value="/catebag/update.do", method=RequestMethod.POST )
  public ModelAndView update(int catebag_cnt, int catebag_catebagno) {
    // CategrpVO categrpVO <FORM> 태그의 값으로 자동 생성됨.
    // request.setAttribute("categrpVO", categrpVO); 자동 실행
    
    ModelAndView mav = new ModelAndView();
    
    CatebagVO catebagVO = this.catebagProc.read(catebag_catebagno);
    mav.addObject("catebagVO", catebagVO);
    
    int cnt = this.catebagProc.update_cnt(catebag_cnt);
    mav.addObject("cnt", cnt); // request에 저장
    
    mav.setViewName("/catebag/update_msg"); // webapp/categrp/update_msg.jsp
    
    return mav;
  }
  
  
  //http://localhost:9090/resort/catebag/catebag_by_memberno.do
  /**
   * 회원별 글 전체 목록
   * 
   * @return
   */
  
    //@RequestMapping(value = "/catebag/catebag_by_consumer_no.do", method = RequestMethod.GET) 
    //public ModelAndView catebag_by_consumer_no(int consumer_no) {
    //ModelAndView mav = new ModelAndView();
    
    // Type 1 
    //ConsumerVO consumerVO = this.consumerProc.read(consumer_no);
    //List<List_Catebag_VO> list = this.catebagProc.list_catebag_consumer_no_list(consumer_no);
    //mav.addObject("consumerVO", consumerVO); mav.addObject("list", list);
    
   // Type 2 // 
   // Cate_Contents_Member_VO vo = new Cate_Contents_Member_VO(); //   
   // vo.setMemberVO(memberVO); // vo.setCate_contents_memberno_list(list); //
   // mav.addObject("vo", vo);
    
    //mav.setViewName("/catebag/catebag_by_consumer_no"); //webapp/contents/list_by_memberno.jsp 
    //return mav; 
    //}
    
    @RequestMapping(value = "/catebag/catebag_by_consumer_no.do", method = RequestMethod.GET)
    public ModelAndView catebag_by_consumer_no_paging(HttpSession session,
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
      List<Game_Catebag_VO> list = catebagProc.catebag_by_consumer_no_paging(map);
      mav.addObject("list", list);
          
      /// 합계-------------------------------------
      
      int tot =0;
      for(int i=0; i<list.size(); i++) {
        int a =  list.get(i).getCatebag_cnt()* list.get(i).getGame_sale();
        tot += a;
      }
      
      System.out.println(tot);
      mav.addObject("tot", tot);  
      
      ///-----------------------------------------

      // 검색된 레코드 갯수
      int search_count = catebagProc.search_count(map);
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
      String paging = catebagProc.pagingBox("catebag_by_consumer_no.do", search_count, nowPage);
      mav.addObject("paging", paging);

      mav.addObject("nowPage", nowPage);

      // /contents/list_by_cateno_search_paging.jsp
      mav.setViewName("/catebag/catebag_by_consumer_no_paging");
      }
      else {
        mav.setViewName("/index");
      }
      return mav;
    }
   
  
}  
 
 
 
 

