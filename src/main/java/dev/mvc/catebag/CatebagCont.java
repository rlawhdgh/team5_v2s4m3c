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
//�ٸ� �����ڰ� ���� ���� ���� �� �ڵ��� ����.
  
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
  * ��� ��
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
   * ��� �ߺ� ó��
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
    System.out.println("üũ �ֳ�����"+cnt);
     if (cnt > 0 ) {
      int delete_cnt = this.catebagProc.delete_check(game_gameno);
       if (delete_cnt == 1) {       
        int create_cnt = this.catebagProc.create(catebagVO);
         // if(create_cnt == 1) {
           // System.out.println("�μ�Ʈ"+create_cnt);
          //}
         
        }      
       System.out.println("����"+delete_cnt);
     } else if( cnt == 0) {
       int delete_cnt = this.catebagProc.delete_check(game_gameno);
       if (delete_cnt == 0) {  
       int create_cnt = this.catebagProc.create(catebagVO);
      }
     } 
     
     System.out.println("���ӹ�ȣ"+game_gameno);
     
     JSONObject json = new JSONObject();
     json.put("cnt", cnt);
     
     return json.toString();
 }
  
  /**
   * ��� ó��
   * @param PayVO
   * @return
   */ 
 @ResponseBody 
 @RequestMapping(value="/catebag/create2.do", method=RequestMethod.POST, produces = "text/plain;charset=UTF-8" )
 public String create(int wishlist_wishlistno,
                            @RequestParam(value="nowPage", defaultValue="1") int nowPage) {
     
   int order_cnt = 0; 
   
     WishlistVO wishlistVO =this.wishlistProc.read(wishlist_wishlistno);
     
     // ���ø���Ʈ --> ����īƮ 
     CatebagVO catebagVO = new CatebagVO(); 
     
       
       catebagVO.setGame_gameno(wishlistVO.getGame_gameno());
       catebagVO.setConsumer_no(wishlistVO.getConsumer_no());
       catebagVO.setCatebag_cnt(1);
       
       
       
       int cnt = this.catebagProc.create(catebagVO);  // �ֹ�
       if(cnt == 1) {  // �ֹ� ���� �ߴٸ�
          order_cnt = order_cnt + 1;  // �ֹ� ��ǰ ī��Ʈ
         int delete_cnt = this.wishlistProc.delete2(wishlist_wishlistno); //�ֹ� ��ǰ ����
         if (delete_cnt == 1) {  // �ֹ� ��ǰ ���� Ȯ��
            System.out.println(wishlist_wishlistno + " �� ��ǰ �ֹ� �Ϸ�");    
      
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
  * ��ü ���
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
  * ÷�� ���� 1�� ���� ó��
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
   System.out.println("�α��ε� ȸ����ȣ:"+consumer_no);
   
// -------------------------------------------------------------------------------------
   // ������ �������� ���ڵ� �������� ������ ��ȣ -1 ó��
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
   
   
   // ������ ���� ������ �о��.
   CatebagVO catebagVO = catebagProc.read(catebag_catebagno);
   
   ConsumerVO consumerVO = this.consumerProc.read(catebagVO.getConsumer_no());
   mav.addObject("consumerVO", consumerVO);
   
   //String upDir = Tool.getRealPath(request, "/attachfile/storage"); // ���� ���
   //Tool.deleteFile(upDir, attachfileVO.getFupname()); // Folder���� 1���� ���� ����
   //Tool.deleteFile(upDir, attachfileVO.getThumb()); // 1���� Thumb ���� ����
   
   // DBMS���� 1���� ���� ����
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
  // map.put("nowPage", nowPage); // �������� ����� ���ڵ��� ������ �����ϱ����� ���
  // ������ ���� ������ �о��.
  CatebagVO catebagVO = catebagProc.read(catebag_catebagno);

  ConsumerVO consumerVO = this.consumerProc.read(catebagVO.getConsumer_no());
  mav.addObject("consumerVO", consumerVO);

  // String upDir = Tool.getRealPath(request, "/attachfile/storage"); // ���� ���
  //Tool.deleteFile(upDir, attachfileVO.getFupname()); // Folder���� 1���� ���� ����
  //Tool.deleteFile(upDir, attachfileVO.getThumb()); // 1���� Thumb ���� ����
  // -------------------------------------------------------------------------------------

  // DBMS���� 1���� ���� ����
  catebagProc.delete(catebag_catebagno);

  List<CatebagVO> list = catebagProc.list_all();
  mav.addObject("list", list);


  mav.setViewName("redirect:/catebag/game_by_consumer_no.do"+"?nowPage="+nowPage); 

  return mav; 
  }
 
//http://localhost:9090/resort/categrp/update_seqno_up.do?categrpno=1
// http://localhost:9090/resort/categrp/update_seqno_up.do?categrpno=1000
/**
 * ���� ���� up 1 �� 10
 * @param catebag_catebagno ��ȸ�� ī�װ� ��ȣ
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
  System.out.println("�α��ε� ȸ����ȣ:"+consumer_no); 
  
  
  CatebagVO catebagVO = this.catebagProc.read(catebag_catebagno);
  mav.addObject("catebagVO", catebagVO);  // request ��ü�� ����
  
  ConsumerVO consumerVO = this.consumerProc.read(catebagVO.getConsumer_no());
  mav.addObject("consumerVO", consumerVO);
  
  //catebagProc.update_cnt_up(catebag_catebagno);
  
  List<CatebagVO> list = catebagProc.list_all();
  mav.addObject("list", list);
  
  int cnt = this.catebagProc.update_cnt_up(catebag_catebagno);  // �켱 ���� ���� ó��
  mav.addObject("cnt", cnt);  // request ��ü�� ����
 
  
  mav.setViewName("redirect:/catebag/catebag_by_consumer_no.do"+"?nowPage="+nowPage+"&catebag_cnt"+catebag_cnt); // update_seqno_up_msg.jsp
  return mav;
}  

// http://localhost:9090/resort/categrp/update_seqno_down.do?categrpno=1
// http://localhost:9090/resort/categrp/update_seqno_down.do?categrpno=1000
/**
 * ���� ���� up 10 �� 1
 * @param catebag_catebagno ��ȸ�� ī�װ� ��ȣ
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
  System.out.println("�α��ε� ȸ����ȣ:"+consumer_no);
  
  CatebagVO catebagVO = this.catebagProc.read(catebag_catebagno);
  mav.addObject("catebagVO", catebagVO);  // request ��ü�� ����
  
  ConsumerVO consumerVO = this.consumerProc.read(catebagVO.getConsumer_no());
  mav.addObject("consumerVO", consumerVO);
  
  //catebagProc.update_cnt_down(catebag_catebagno);
  
  List<CatebagVO> list = catebagProc.list_all();
  mav.addObject("list", list);
  
  int cnt = this.catebagProc.update_cnt_down(catebag_catebagno);  // �켱 ���� ���� ó��
  mav.addObject("cnt", cnt);  // request ��ü�� ����

  mav.setViewName("redirect:/catebag/catebag_by_consumer_no.do"+"?nowPage="+nowPage+"&catebag_cnt"+catebag_cnt); // update_seqno_up_msg.jsp
  return mav;
 }  
  
  /**
   * ���� ó��
   * @param categrpVO
   * @return
   */
  @RequestMapping(value="/catebag/update.do", method=RequestMethod.POST )
  public ModelAndView update(int catebag_cnt, int catebag_catebagno) {
    // CategrpVO categrpVO <FORM> �±��� ������ �ڵ� ������.
    // request.setAttribute("categrpVO", categrpVO); �ڵ� ����
    
    ModelAndView mav = new ModelAndView();
    
    CatebagVO catebagVO = this.catebagProc.read(catebag_catebagno);
    mav.addObject("catebagVO", catebagVO);
    
    int cnt = this.catebagProc.update_cnt(catebag_cnt);
    mav.addObject("cnt", cnt); // request�� ����
    
    mav.setViewName("/catebag/update_msg"); // webapp/categrp/update_msg.jsp
    
    return mav;
  }
  
  
  //http://localhost:9090/resort/catebag/catebag_by_memberno.do
  /**
   * ȸ���� �� ��ü ���
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
        System.out.println("�α��ε� ȸ����ȣ:"+consumer_no);
      
      // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("consumer_no", consumer_no); // #{cateno}
      map.put("nowPage", nowPage); // �������� ����� ���ڵ��� ������ �����ϱ����� ���
      
      // �˻� ���
      List<Game_Catebag_VO> list = catebagProc.catebag_by_consumer_no_paging(map);
      mav.addObject("list", list);
          
      /// �հ�-------------------------------------
      
      int tot =0;
      for(int i=0; i<list.size(); i++) {
        int a =  list.get(i).getCatebag_cnt()* list.get(i).getGame_sale();
        tot += a;
      }
      
      System.out.println(tot);
      mav.addObject("tot", tot);  
      
      ///-----------------------------------------

      // �˻��� ���ڵ� ����
      int search_count = catebagProc.search_count(map);
      mav.addObject("search_count", search_count);

      ConsumerVO consumerVO = this.consumerProc.read(consumer_no);
      mav.addObject("consumerVO", consumerVO);
      
     
      

      /*
       * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� ���� ������: 11 / 22 [����] 11 12 13 14 15 16 17
       * 18 19 20 [����]
       * 
       * @param listFile ��� ���ϸ�
       * 
       * @param cateno ī�װ���ȣ
       * 
       * @param search_count �˻�(��ü) ���ڵ��
       * 
       * @param nowPage ���� ������
       * 
       * @param word �˻���
       * 
       * @return ����¡ ���� ���ڿ�
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
 
 
 
 

