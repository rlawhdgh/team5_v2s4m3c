package dev.mvc.game;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.admin.AdminProcInter;
import dev.mvc.consumer.ConsumerProcInter;
import dev.mvc.game_images.Game_imagesProcInter;
import dev.mvc.game_images.Game_imagesVO;
import dev.mvc.kind.KindProcInter;
import dev.mvc.kind.KindVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class GameCont {
  
  @Autowired
  @Qualifier("dev.mvc.consumer.ConsumerProc")
  private ConsumerProcInter consumerProc;
  
  @Autowired
  @Qualifier("dev.mvc.admin.AdminProc")
  private AdminProcInter adminProc;
  
  @Autowired
  @Qualifier("dev.mvc.kind.KindProc")
  private KindProcInter kindProc;

  @Autowired
  @Qualifier("dev.mvc.game.GameProc")
  private GameProcInter gameProc;
  
  @Autowired
  @Qualifier("dev.mvc.game_images.Game_imagesProc")
  private Game_imagesProcInter game_imagesProc;

  public GameCont() {
    
  }
  
  //http://localhost:9090/resort/list/create.do
  /**
   * ��� ��
   * @return
   */
  @RequestMapping(value="/game/create.do", method=RequestMethod.GET )
  public ModelAndView create(int kind_kindno,HttpSession session) {
    ModelAndView mav = new ModelAndView();

    if(session.getAttribute("admin") != null) {       
      KindVO kindVO = this.kindProc.read(kind_kindno);
      mav.addObject("kindVO", kindVO);
      
      List<KindVO> list = this.kindProc.list_asc();
      mav.addObject("list", list);
    
      mav.setViewName("/game/create"); // webapp/list/create.jsp
    } else {
      mav.setViewName("../kind/x");
    }

    return mav;
  }

  //http://localhost:9090/resort/list/create.do
  /**
   * ��� ó��
   * @param gameVO
   * @return
   */
  @RequestMapping(value="/game/create.do", method=RequestMethod.POST )
  public ModelAndView create(GameVO gameVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.gameProc.create(gameVO); // Call By Reference�� ����
    mav.addObject("cnt", cnt);
    
    if (cnt == 1) {
      mav.setViewName("redirect:/game/list_join.do?kind_kindno="+gameVO.getKind_kindno());
    } else {
      mav.setViewName("/list/create_msg"); 
    }
    
    return mav;
  }
  /**
   * ��ü ���
   * @return
   */
  @RequestMapping(value="/game/list_all.do", method=RequestMethod.GET )
  public ModelAndView list_all() {
    ModelAndView mav = new ModelAndView();
    
    List<GameVO> list = this.gameProc.list_all();
    mav.addObject("list", list); // request.setAttribute("list", list);

    mav.setViewName("/game/list_all"); // /webapp/contents/list_all.jsp
    return mav;
  }
  
  // http://localhost:9090/resort/list/list_join.do
  /**
   * ��ü ���
   * @return
   */
  @RequestMapping(value="/game/list_join.do", method=RequestMethod.GET )
  public ModelAndView list(int kind_kindno,HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
      KindVO kindVO = this.kindProc.read(kind_kindno);
      mav.addObject("kindVO", kindVO);
      
      List<GameVO> list = this.gameProc.list_join(kind_kindno);
      mav.addObject("list", list); // request.setAttribute("list", list);
      if(session.getAttribute("admin")!=null) { 
      
      mav.setViewName("/game/list_join"); // /webapp/contents/list_all.jsp
    } else {
      mav.setViewName("/game/list_join_nolog");
    }
    return mav;
  }
  
  /**
   * ��ȸ
   * @return
   */
  @RequestMapping(value="/game/read1.do", method=RequestMethod.GET )
  public ModelAndView read(int game_gameno) {
    ModelAndView mav = new ModelAndView();

    GameVO gameVO = this.gameProc.read(game_gameno);
    mav.addObject("gameVO", gameVO);
    
    KindVO kindVO = this.kindProc.read(gameVO.getKind_kindno());
    mav.addObject("kindVO", kindVO);
    
    List<Game_imagesVO> images_list = this.game_imagesProc.by_game_gameno(game_gameno);
    mav.addObject("images_list", images_list);
    
     int cnt  = images_list.size();
     System.out.println(cnt);
     
     if(cnt > 0 ) {
       String one = images_list.get(0).getGame_fname();
       mav.addObject("one", one);
     }
       
    mav.setViewName("/game/read1"); // /webapp/contents/read1.jsp
    return mav;
  }
  
  // http://localhost:9090/resort/list/list_image_create.do?list_listno=25&kind_kindno=28
  /**
   * �̹��� ���
   * @return
   */
  @RequestMapping(value="/game/list_image_create.do", 
                              method=RequestMethod.GET )
  public ModelAndView list_image_create(int game_gameno, int kind_kindno) {
    ModelAndView mav = new ModelAndView();
    
    GameVO gameVO = this.gameProc.read(game_gameno);
    mav.addObject("gameVO", gameVO);
    
    KindVO kindVO = this.kindProc.read(kind_kindno);
    mav.addObject("kinVO", kindVO);

    mav.setViewName("/game/list_image_create"); // webapp/list/list_image_create.jsp
    
    return mav;
  }
  
  // http://localhost:9090/resort/list/kind_kindno.do?list_listno=25&kind_kindno=28
  /**
   * �̹��� ���ó��
   * @param cateno ī�װ� ��ȣ
   * @param contentsno �۹�ȣ
   * @param youtube ���� ��ũ��Ʈ
   * @return
   */
  @RequestMapping(value="/game/list_image_create.do", 
                              method=RequestMethod.POST )
  public ModelAndView mp3_create(HttpServletRequest request,
                                                    GameVO gameVO) {
    ModelAndView mav = new ModelAndView();
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    String game_image = ""; // list_image ����
    
    String upDir = Tool.getRealPath(request, "/game/storage/images"); // ���� ���
    // ���� ������ ����� fnamesMF ��ü�� ������.
    MultipartFile mf = gameVO.getGame_imageMF(); // ���� ���
    long fsize = mf.getSize();  // ���� ũ��
    if (fsize > 0) { // ���� ũ�� üũ
      // mp3 = mf.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
      // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
      game_image = Upload.saveFileSpring(mf, upDir); 
    }    
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------

    HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
    hashMap.put("game_image", game_image);
    hashMap.put("game_gameno", gameVO.getGame_gameno());
    
    this.gameProc.game_image(hashMap); 
    
    mav.addObject("game_gameno", gameVO.getGame_gameno());
    
    mav.setViewName("redirect:/game/read1.do"); // webapp/list/read1.jsp
    
    return mav;
  }
  
 /**
  * �̹��� ���� ��
  * @return
  */
 @RequestMapping(value="/game/list_image_delete.do", 
                             method=RequestMethod.GET )
 public ModelAndView list_image_delete(int game_gameno, int kind_kindno) {
   ModelAndView mav = new ModelAndView();
   
   GameVO gameVO = this.gameProc.read(game_gameno);
   mav.addObject("gameVO", gameVO);
   
   KindVO kindVO = this.kindProc.read(kind_kindno);
   mav.addObject("kindVO", kindVO);

   mav.setViewName("/game/list_image_delete"); 
   
   return mav;
 }
 
 /**
  * �̹��� ���� ó��
  * @param cateno ī�װ� ��ȣ
  * @param contentsno �۹�ȣ
  * @param paswd �н�����  
  * @param map ���� ��ũ��Ʈ
  * @return
  */
 @RequestMapping(value="/game/list_image_delete.do", 
                             method=RequestMethod.POST )
 public ModelAndView list_image_delete(HttpServletRequest request,
                                                           int game_gameno, 
                                                           int kind_kindno) {
   ModelAndView mav = new ModelAndView();
   
   // -------------------------------------------------------------------
   // ���� ���� �ڵ� ����
   // -------------------------------------------------------------------
   // ������ ���� ������ �о��.
   GameVO gameVO = this.gameProc.read(game_gameno);
   
   String upDir = Tool.getRealPath(request, "/game/storage/images"); // ���� ���
   boolean sw = Tool.deleteFile(upDir, gameVO.getGame_image());  // Folder���� 1���� ���� ����
   System.out.println("sw: " + sw);
   // -------------------------------------------------------------------
   // ���� ���� ���� ����
   // -------------------------------------------------------------------
   
   HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
   hashMap.put("game_image", ""); // map ����
   hashMap.put("game_gameno", game_gameno);
   
   this.gameProc.game_image(hashMap);
   
   mav.addObject("game_gameno", game_gameno);
   
   mav.setViewName("redirect:/game/read1.do"); // webapp/contents/list.jsp
   
   return mav;
 }
 
 /**
  * Youtube ��� ��
  * @return
  */
 @RequestMapping(value="/game/list_youtube_create.do", 
                             method=RequestMethod.GET )
 public ModelAndView list_youtube_create(int game_gameno, int kind_kindno) {
   ModelAndView mav = new ModelAndView();
   
   GameVO gameVO = this.gameProc.read(game_gameno);
   mav.addObject("gameVO", gameVO);
   
   KindVO kindVO = this.kindProc.read(kind_kindno);
   mav.addObject("kindVO", kindVO);

   mav.setViewName("/game/list_youtube_create");
   
   return mav;
 }
 
 // http://localhost:9090/resort/list/list_youtube_create.do?list_listno=25&kind_kindno=28
 /**
  * Youtube ��� ó��
  * @param list_listno ī�װ� ��ȣ
  * @param kind_kindno �۹�ȣ
  * @param youtube 
  * @return
  */
 @RequestMapping(value="/game/list_youtube_create.do", 
                             method=RequestMethod.POST )
 public ModelAndView list_youtube_create(int game_gameno, int kind_kindno, String game_youtube) {
   ModelAndView mav = new ModelAndView();

   HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
   hashMap.put("game_youtube", game_youtube);
   hashMap.put("game_gameno", game_gameno);
   
   
   
   this.gameProc.game_youtube(hashMap); // youtube ���
   
   mav.addObject("game_gameno", game_gameno);
   
   mav.setViewName("redirect:/game/read1.do");
   
   return mav;
 }
 
 /**
  * ������ ���� ��
  * @return
  */
 @RequestMapping(value="/game/list_youtube_delete.do", 
                             method=RequestMethod.GET )
 public ModelAndView list_youtube_delete(int game_gameno, int kind_kindno) {
   ModelAndView mav = new ModelAndView();
   
   GameVO gameVO = this.gameProc.read(game_gameno);
   mav.addObject("gameVO", gameVO);
   
   KindVO kindVO = this.kindProc.read(kind_kindno);
   mav.addObject("kindVO", kindVO);

   mav.setViewName("/game/list_youtube_delete"); // webapp/list/list_image_create.jsp
   
   return mav;
 }
 
 // http://localhost:9090/resort/list/list_youtube_delete.do?list_listno=25&kind_kindno=28
 /**
  * youtube ���� ó��
  * @param list_listno ī�װ� ��ȣ
  * @param kind_kindno �۹�ȣ
  * @param youtube 
  * @return
  */
 @RequestMapping(value="/game/list_youtube_delete.do", method=RequestMethod.POST )
 public ModelAndView list_youtube_delete(HttpServletRequest request,
                                                       int game_gameno, int kind_kindno) {
   ModelAndView mav = new ModelAndView();

   HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
   hashMap.put("game_youtube", ""); // youtube ����
   hashMap.put("game_gameno", game_gameno);
   
   this.gameProc.game_youtube(hashMap); // youtube ���� ó��
   
   mav.addObject("game_gameno", game_gameno);
   
   mav.setViewName("redirect:/list/read1.do"); 
   
   return mav;
 }
 
 /**
  * ��ü ���
  * @return
  */
 @RequestMapping(value="/game/list_index.do", method=RequestMethod.GET )
 public ModelAndView list_index() {
   ModelAndView mav = new ModelAndView();
   
   List<GameVO> list = this.gameProc.list_all();
   mav.addObject("list", list); // request.setAttribute("list", list);

   mav.setViewName("/game/list_index"); // /webapp/contents/list_all.jsp
   return mav;
 }
 
 
 /**
  * �ֽ� ���Ӽ�
  * @return
  */
 @RequestMapping(value="/game/list_rdate.do", method=RequestMethod.GET )
 public ModelAndView list_rdate() {
   ModelAndView mav = new ModelAndView(); 
   
   List<GameVO> list = this.gameProc.list_rdate();
   mav.addObject("list", list); // request.setAttribute("list", list);

   mav.setViewName("/game/list_rdate"); // /webapp/contents/list_all.jsp
   return mav;
 }
 
 /**
  * ���� ���Ӽ� 
  * @return
  */
 @RequestMapping(value="/game/list_sale.do", method=RequestMethod.GET )
 public ModelAndView list_sale() {
   ModelAndView mav = new ModelAndView(); 
   
   List<GameVO> list = this.gameProc.list_sale();
   mav.addObject("list", list); // request.setAttribute("list", list);

   mav.setViewName("/game/list_sale"); // /webapp/contents/list_all.jsp
   return mav;
 }
 
 /**
  * ���� ���Ӽ�
  * @return
  */
 @RequestMapping(value="/game/list_free.do", method=RequestMethod.GET )
 public ModelAndView list_free() {
   ModelAndView mav = new ModelAndView(); 
   
   List<GameVO> list = this.gameProc.list_free();
   mav.addObject("list", list); // request.setAttribute("list", list);

   mav.setViewName("/game/list_free"); // /webapp/contents/list_all.jsp
   return mav;
 }
 
 /**
  * ���� ��
  * @return
  */
 @RequestMapping(value="/game/update.do", method=RequestMethod.GET )
 public ModelAndView update(int game_gameno) {
   ModelAndView mav = new ModelAndView();
   
   GameVO gameVO  = this.gameProc.update(game_gameno);
   mav.addObject("gameVO", gameVO); // request.setAttribute("contentsVO", contentsVO);
   
   mav.setViewName("/game/update"); // webapp/contents/update.jsp
   
   return mav;
 }
 
 /**
  * ���� ó��
  * @param listVO
  * @return
  */
 @RequestMapping(value="/game/update.do", method=RequestMethod.POST )
 public ModelAndView update(GameVO gameVO) {
   ModelAndView mav = new ModelAndView();
   
   KindVO kindVO = this.kindProc.read(gameVO.getKind_kindno());
   // mav.addObject("cateVO", cateVO); // ���޾ȵ�.
   mav.addObject("kind_kindno", kindVO.getKind_kindno());
   
   mav.addObject("game_gameno", gameVO.getGame_gameno());
   
   HashMap<String, Object> hashMap = new HashMap<String, Object>();
   hashMap.put("game_gameno", gameVO.getGame_gameno());
   
   int cnt = 0;             // ������ ���ڵ� ���� 
   cnt = this.gameProc.update(gameVO);

   mav.addObject("cnt", cnt); // request�� ����
       
   if (cnt == 1) {
     mav.setViewName("redirect:/game/update_msg.jsp"); // webapp/contents/update_msg.jsp
   } else { 
     mav.setViewName("/game/update_msg"); // webapp/contents/update_msg.jsp
   }
   
   return mav;
 }

 /**
  * ���� ó��
  * @param list_listno ��ȸ�� ī�װ� ��ȣ
  * @return
  */
 @RequestMapping(value="/game/delete.do", method=RequestMethod.GET )
 public ModelAndView delete(int game_gameno) {
   ModelAndView mav = new ModelAndView();
   
   GameVO gameVO = this.gameProc.read(game_gameno);
   mav.addObject("gameVO", gameVO);  // request ��ü�� ����
   
   int kind_kindno = gameVO.getKind_kindno();
   mav.addObject("kind_kindno", kind_kindno);
   
   this.game_imagesProc.delete_all(game_gameno);
   
   int cnt = this.gameProc.delete(game_gameno); // ���� ó��
   mav.addObject("cnt", cnt);  // request ��ü�� ����
   
   mav.setViewName("redirect:/game/list_join.do"); 
   

   return mav;
 }
 
 /**
  * ���յ� ī�װ� �׷캰 ī�װ� ���
  * http://localhost:9090/resort/list/list_index_left.do
  * @param request
  * @return
  */
@RequestMapping(value="/game/list_index_left.do", method=RequestMethod.GET)
public ModelAndView list_index_left(HttpServletRequest request){
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/game/list_index_left"); // webapp/cate/list_index_left.jsp
  
  List<KindVO> kind_list = kindProc.list_asc();
  
  ArrayList<String> name_title_list = new ArrayList<String>();   
  
//  StringBuffer url = new StringBuffer(); // ��ũ ���� �� ���

  // ī�װ� �׷� ���� ��ŭ ��ȯ
  for (int index = 0; index < kind_list.size(); index++) {
    KindVO kindVO = kind_list.get(index); // �ϳ��� ī�װ� �׷� ����
    
    if(index==5) {
      break;
    }
    
    name_title_list.add("<a style='background-color: #111;padding-bottom: 0px; font-size: 16px;' "
                            + "href='"+request.getContextPath()+"/game/list_join.do?kind_kindno="
                            +kindVO.getKind_kindno()+"&word='>"+kindVO.getKind_kindname()+"</a>");

/* ����->ī�װ�->�Ǵٸ� ī�װ� ���
//    name_title_list.add("<a data-toggle='collapse' data-parent='#accordion' href='#index_game"+kindVO.getKind_kindname()+"'style='background-color: #111;padding-bottom: 0px; font-size: 20px;'>"+
//                           kindVO.getKind_kindname()+"</a>");
    
    // ī�װ� Join ���
//    List<Kind_Game_join> game_list = gameProc.game_join_by_kindno(kindVO.getKind_kindno());
//    
//    
//    
//    name_title_list.add("<div id='index_game"+kindVO.getKind_kindname()+"' class='panel-collapse collapse'>");
//      name_title_list.add("<div style='margin-left: 15px;'>");
//    // ī�װ� ������ŭ ��ȯ
//    for (int j=0; j < game_list.size(); j++) {
//      Kind_Game_join kind_Game_join = game_list.get(j);
//      
//      String name = kind_Game_join.getGame_title(); // ī�װ� �̸�
//      
//      if(j==3) {
//        break;
//      }
//      url.append("  <A style='font-size: 16px; padding-bottom: 0px;' href='" + request.getContextPath()+ "/game/list_join.do?kind_kindno="+ kind_Game_join.getKind_kindno()+"&word='>");
//      url.append(name);
//      url.append("  </A>");
//    
//      name_title_list.add(url.toString()); // ��� ��Ͽ� �ϳ��� cate �߰� 
//      
//      url.delete(0, url.toString().length()); // ���ο� ī�װ� ����� �����ϱ����� StringBuffer ���ڿ� ����
//      
//    }
//      name_title_list.add("</div>");
//    name_title_list.add("</div>");
  */  
  }
  
  mav.addObject("name_title_list", name_title_list);
  
  return mav;
} 


 
 
 
}
