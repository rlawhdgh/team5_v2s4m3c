package dev.mvc.wishlist;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.catebag.CatebagProcInter;
import dev.mvc.catebag.CatebagVO;
import dev.mvc.consumer.ConsumerProcInter;
import dev.mvc.consumer.ConsumerVO;
import dev.mvc.game.GameProcInter;
import dev.mvc.game.GameVO;
import dev.mvc.tool.Tool;


@Controller
public class WishlistCont {
//�ٸ� �����ڰ� ���� ���� ���� �� �ڵ��� ����.
  @Autowired
  @Qualifier("dev.mvc.consumer.ConsumerProc")
  private ConsumerProcInter consumerProc;
  
  @Autowired
  @Qualifier("dev.mvc.game.GameProc")
  private GameProcInter gameProc;
  
  @Autowired
  @Qualifier("dev.mvc.catebag.CatebagProc")
  private CatebagProcInter catebagProc;
  // ------------------------------------------
  @Autowired
  @Qualifier("dev.mvc.wishlist.WishlistProc")
  private WishlistProcInter wishlistProc;

  public WishlistCont() {
    System.out.println("--> WishlistCont created.");
  }
  
 
  

//http://localhost:9090/team5/wishlist/create.do
 /**
  * ��� ��
  * @return
  */
 @RequestMapping(value="/wishlist/create.do", method=RequestMethod.GET )
 public ModelAndView create() {
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/wishlist/create"); // webapp/categrp/create.jsp
   
   return mav; // forward
 }
 
//http://localhost:9090/team5/catebag/create.do
 /**
  * ��� �ߺ� ó��
  * @param catebagVO
  * @return
  */
 @ResponseBody 
 @RequestMapping(value="/wishlist/create.do", method=RequestMethod.POST, produces = "text/plain;charset=UTF-8" )
 public String create(int game_gameno, HttpSession session) {
 
   GameVO gameVO = this.gameProc.read(game_gameno);
   WishlistVO wishlistVO = new WishlistVO();
   
   int consumer_no = Integer.parseInt(session.getAttribute("consumer_no").toString());
   
   wishlistVO.setGame_gameno(gameVO.getGame_gameno());
   wishlistVO.setConsumer_no(consumer_no);
   wishlistVO.setWishlist_seqno(1);
  
   int cnt = this.wishlistProc.read_check(game_gameno); 
   System.out.println("üũ �ֳ�����"+cnt);
    if (cnt > 0 ) {
     int delete_cnt = this.wishlistProc.delete_check(game_gameno);
      if (delete_cnt == 1) {       
       int create_cnt = this.wishlistProc.create(wishlistVO);
        // if(create_cnt == 1) {
          // System.out.println("�μ�Ʈ"+create_cnt);
         //}
        
       }      
      System.out.println("����"+delete_cnt);
    } else if( cnt == 0) {
      int delete_cnt = this.wishlistProc.delete_check(game_gameno);
      if (delete_cnt == 0) {  
      int create_cnt = this.wishlistProc.create(wishlistVO);
     }
    } 
    
    System.out.println("���ӹ�ȣ"+game_gameno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
}
  
  
//http://localhost:9090/team5/wishlist/list_all.do
  /**
  * ��ü ���
  * 
  * @return
  */
 @RequestMapping(value = "/wishlist/list_all.do", method = RequestMethod.GET)
 public ModelAndView list() {
   ModelAndView mav = new ModelAndView();

   List<WishlistVO> list = this.wishlistProc.list_all();
   mav.addObject("list", list); // request.setAttribute("list", list);
   
   mav.setViewName("/wishlist/list_all"); // /webapp/wishlist/list_all.jsp
   return mav;
 }
 /**
  * ÷�� ���� 1�� ���� ó��
  * 
  * @return
  */
 @RequestMapping(value = "/wishlist/delete.do", 
                            method = RequestMethod.GET)
 public ModelAndView delete_proc(HttpServletRequest request, HttpSession session, 
                                               int wishlist_wishlistno,                                                                                            
                                               @RequestParam(value="nowPage", defaultValue="1") int nowPage
                                               ) {
   ModelAndView mav = new ModelAndView();
   
// -------------------------------------------------------------------------------------
   // ������ �������� ���ڵ� �������� ������ ��ȣ -1 ó��
   int consumer_no = Integer.parseInt(session.getAttribute("consumer_no").toString());
   System.out.println("�α��ε� ȸ����ȣ:"+consumer_no);
   
   HashMap<String, Object> map = new HashMap<String, Object>();
   map.put("consumer_no", consumer_no);
   
   int search_count = wishlistProc.search_count(map);
   mav.addObject("search_count", search_count);
   
   
   
   System.out.println(search_count/Wishlist.RECORD_PER_PAGE);
   
   if (wishlistProc.search_count(map) % Wishlist.RECORD_PER_PAGE == 1) {
     if(nowPage == search_count/Wishlist.RECORD_PER_PAGE-1) {
     nowPage = nowPage - 1;
       } 
       if (nowPage < 1) {
         nowPage = 1;
       }
     }
   // -------------------------------------------------------------------------------------
   
   
  // HashMap<String, Object> map = new HashMap<String, Object>();
  // map.put("nowPage", nowPage); // �������� ����� ���ڵ��� ������ �����ϱ����� ���
   // ������ ���� ������ �о��.
   WishlistVO wishlistVO = wishlistProc.read(wishlist_wishlistno);
   
   ConsumerVO consumerVO = this.consumerProc.read(wishlistVO.getConsumer_no());
   mav.addObject("consumerVO", consumerVO);
    
  // String upDir = Tool.getRealPath(request, "/attachfile/storage"); // ���� ���
   //Tool.deleteFile(upDir, attachfileVO.getFupname()); // Folder���� 1���� ���� ����
   //Tool.deleteFile(upDir, attachfileVO.getThumb()); // 1���� Thumb ���� ����
   // -------------------------------------------------------------------------------------
  
   // DBMS���� 1���� ���� ����
   wishlistProc.delete(wishlist_wishlistno);
       
   List<WishlistVO> list = wishlistProc.list_all();
   mav.addObject("list", list);
   
   
   mav.setViewName("redirect:/wishlist/game_by_consumer_no.do"+"?nowPage="+nowPage); 

   return mav;
 }
 ///-----------------------------------------------------------------------------
 @RequestMapping(value = "/wishlist/delete2.do", 
     method = RequestMethod.GET)
public ModelAndView delete2(HttpServletRequest request, HttpSession session, 
                        int wishlist_wishlistno,                                                                                            
                        @RequestParam(value="nowPage", defaultValue="1") int nowPage
                        ) {
ModelAndView mav = new ModelAndView();

// HashMap<String, Object> map = new HashMap<String, Object>();
// map.put("nowPage", nowPage); // �������� ����� ���ڵ��� ������ �����ϱ����� ���
// ������ ���� ������ �о��.
WishlistVO wishlistVO = wishlistProc.read(wishlist_wishlistno);

ConsumerVO consumerVO = this.consumerProc.read(wishlistVO.getConsumer_no());
mav.addObject("consumerVO", consumerVO);

// String upDir = Tool.getRealPath(request, "/attachfile/storage"); // ���� ���
//Tool.deleteFile(upDir, attachfileVO.getFupname()); // Folder���� 1���� ���� ����
//Tool.deleteFile(upDir, attachfileVO.getThumb()); // 1���� Thumb ���� ����
// -------------------------------------------------------------------------------------

// DBMS���� 1���� ���� ����
wishlistProc.delete(wishlist_wishlistno);

List<WishlistVO> list = wishlistProc.list_all();
mav.addObject("list", list);


mav.setViewName("redirect:/wishlist/game_by_consumer_no.do"+"?nowPage="+nowPage); 

return mav;
}
 
 /**
  * ��ü ���� ���� ó��
  * 
  * @return
  */
 @RequestMapping(value = "/wishlist/delete_consumer.do", 
                            method = RequestMethod.GET)
 public ModelAndView delete_consumer(HttpServletRequest request, HttpSession session, 
                                               int wishlist_wishlistno, 
                                                                                                                                        
                                               @RequestParam(value="nowPage", defaultValue="1") int nowPage
                                               ) {
   ModelAndView mav = new ModelAndView();
   int consumer_no = Integer.parseInt(session.getAttribute("consumer_no").toString());
   System.out.println("�α��ε� ȸ����ȣ:"+consumer_no);
   
// -------------------------------------------------------------------------------------
   // ������ �������� ���ڵ� �������� ������ ��ȣ -1 ó��
   HashMap<String, Object> map = new HashMap<String, Object>();
   map.put("consumer_no", consumer_no);
   
   int search_count = wishlistProc.search_count(map);
   mav.addObject("search_count", search_count);
   
   
   
   System.out.println(search_count/Wishlist.RECORD_PER_PAGE);
   
   if (wishlistProc.search_count(map) % Wishlist.RECORD_PER_PAGE == 1) {
     if(nowPage == search_count/Wishlist.RECORD_PER_PAGE-1) {
     nowPage = nowPage - 1;
       } 
       if (nowPage < 1) {
         nowPage = 1;
       }
     }
   // -------------------------------------------------------------------------------------
   
   
  // HashMap<String, Object> map = new HashMap<String, Object>();
  // map.put("nowPage", nowPage); // �������� ����� ���ڵ��� ������ �����ϱ����� ���
   // ������ ���� ������ �о��.
   WishlistVO wishlistVO = wishlistProc.read(wishlist_wishlistno);
   
   ConsumerVO consumerVO = this.consumerProc.read(wishlistVO.getConsumer_no());
   mav.addObject("consumerVO", consumerVO);
    
  // String upDir = Tool.getRealPath(request, "/attachfile/storage"); // ���� ���
   //Tool.deleteFile(upDir, attachfileVO.getFupname()); // Folder���� 1���� ���� ����
   //Tool.deleteFile(upDir, attachfileVO.getThumb()); // 1���� Thumb ���� ����
   // -------------------------------------------------------------------------------------
  
   // DBMS���� 1���� ���� ����
   wishlistProc.delete_consumer(consumer_no);
       
   List<WishlistVO> list = wishlistProc.list_all();
   mav.addObject("list", list);
   
   
   mav.setViewName("redirect:/wishlist/game_by_consumer_no.do"+"?nowPage="+nowPage); 

   return mav;
 }
 
  //http://localhost:9090/resort/contents/list_by_memberno.do
  /**
   * ȸ���� �� ��ü ���
   * 
   * @return
   */
  /*
   * @RequestMapping(value = "/wishlist/list_by_consumer_no.do", method =
   * RequestMethod.GET) public ModelAndView list_by_consumer_no(int consumer_no) {
   * ModelAndView mav = new ModelAndView();
   * 
   * // Type 1 ConsumerVO consumerVO = this.consumerProc.read(consumer_no);
   * List<List_Wishlist_VO> list =
   * this.wishlistProc.list_wishlist_consumer_no_list(consumer_no);
   * mav.addObject("consumerVO", consumerVO); mav.addObject("list", list);
   * 
   * // Type 2 // Cate_Contents_Member_VO vo = new Cate_Contents_Member_VO(); //
   * vo.setMemberVO(memberVO); // vo.setCate_contents_memberno_list(list); //
   * mav.addObject("vo", vo);
   * 
   * mav.setViewName("/wishlist/list_by_consumer_no"); //
   * /webapp/contents/list_by_memberno.jsp return mav; }
   * return mav;
   */
  
  @RequestMapping(value = "/wishlist/game_by_consumer_no.do", method = RequestMethod.GET)
  public ModelAndView game_by_consumer_no_paging(HttpSession session,

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
    List<Game_Wishlist_VO> list = wishlistProc.game_by_consumer_no_paging(map);
    mav.addObject("list", list);

    // �˻��� ���ڵ� ����
    int search_count = wishlistProc.search_count(map);
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
    String paging = wishlistProc.pagingBox("game_by_consumer_no.do", search_count, nowPage);
    mav.addObject("paging", paging);

    mav.addObject("nowPage", nowPage);

    // /contents/list_by_cateno_search_paging.jsp
    mav.setViewName("/wishlist/game_by_consumer_no_paging");
    }
    else {
      mav.setViewName("/index");
    }
    return mav;
  }
   
}
