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
   * 등록 폼
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
   * 등록 처리
   * @param gameVO
   * @return
   */
  @RequestMapping(value="/game/create.do", method=RequestMethod.POST )
  public ModelAndView create(GameVO gameVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.gameProc.create(gameVO); // Call By Reference로 전송
    mav.addObject("cnt", cnt);
    
    if (cnt == 1) {
      mav.setViewName("redirect:/game/list_join.do?kind_kindno="+gameVO.getKind_kindno());
    } else {
      mav.setViewName("/list/create_msg"); 
    }
    
    return mav;
  }
  /**
   * 전체 목록
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
   * 전체 목록
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
   * 조회
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
   * 이미지 등록
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
   * 이미지 등록처리
   * @param cateno 카테고리 번호
   * @param contentsno 글번호
   * @param youtube 지도 스크립트
   * @return
   */
  @RequestMapping(value="/game/list_image_create.do", 
                              method=RequestMethod.POST )
  public ModelAndView mp3_create(HttpServletRequest request,
                                                    GameVO gameVO) {
    ModelAndView mav = new ModelAndView();
    // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String game_image = ""; // list_image 파일
    
    String upDir = Tool.getRealPath(request, "/game/storage/images"); // 절대 경로
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    MultipartFile mf = gameVO.getGame_imageMF(); // 파일 목록
    long fsize = mf.getSize();  // 파일 크기
    if (fsize > 0) { // 파일 크기 체크
      // mp3 = mf.getOriginalFilename(); // 원본 파일명, spring.jpg
      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
      game_image = Upload.saveFileSpring(mf, upDir); 
    }    
    // -------------------------------------------------------------------
    // 파일 전송 코드 종료
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
  * 이미지 삭제 폼
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
  * 이미지 삭제 처리
  * @param cateno 카테고리 번호
  * @param contentsno 글번호
  * @param paswd 패스워드  
  * @param map 지도 스크립트
  * @return
  */
 @RequestMapping(value="/game/list_image_delete.do", 
                             method=RequestMethod.POST )
 public ModelAndView list_image_delete(HttpServletRequest request,
                                                           int game_gameno, 
                                                           int kind_kindno) {
   ModelAndView mav = new ModelAndView();
   
   // -------------------------------------------------------------------
   // 파일 삭제 코드 시작
   // -------------------------------------------------------------------
   // 삭제할 파일 정보를 읽어옴.
   GameVO gameVO = this.gameProc.read(game_gameno);
   
   String upDir = Tool.getRealPath(request, "/game/storage/images"); // 절대 경로
   boolean sw = Tool.deleteFile(upDir, gameVO.getGame_image());  // Folder에서 1건의 파일 삭제
   System.out.println("sw: " + sw);
   // -------------------------------------------------------------------
   // 파일 삭제 종료 시작
   // -------------------------------------------------------------------
   
   HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
   hashMap.put("game_image", ""); // map 삭제
   hashMap.put("game_gameno", game_gameno);
   
   this.gameProc.game_image(hashMap);
   
   mav.addObject("game_gameno", game_gameno);
   
   mav.setViewName("redirect:/game/read1.do"); // webapp/contents/list.jsp
   
   return mav;
 }
 
 /**
  * Youtube 등록 폼
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
  * Youtube 등록 처리
  * @param list_listno 카테고리 번호
  * @param kind_kindno 글번호
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
   
   
   
   this.gameProc.game_youtube(hashMap); // youtube 등록
   
   mav.addObject("game_gameno", game_gameno);
   
   mav.setViewName("redirect:/game/read1.do");
   
   return mav;
 }
 
 /**
  * 유투브 삭제 폼
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
  * youtube 삭제 처리
  * @param list_listno 카테고리 번호
  * @param kind_kindno 글번호
  * @param youtube 
  * @return
  */
 @RequestMapping(value="/game/list_youtube_delete.do", method=RequestMethod.POST )
 public ModelAndView list_youtube_delete(HttpServletRequest request,
                                                       int game_gameno, int kind_kindno) {
   ModelAndView mav = new ModelAndView();

   HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
   hashMap.put("game_youtube", ""); // youtube 삭제
   hashMap.put("game_gameno", game_gameno);
   
   this.gameProc.game_youtube(hashMap); // youtube 삭제 처리
   
   mav.addObject("game_gameno", game_gameno);
   
   mav.setViewName("redirect:/list/read1.do"); 
   
   return mav;
 }
 
 /**
  * 전체 목록
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
  * 최신 게임순
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
  * 할인 게임순 
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
  * 무료 게임순
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
  * 수정 폼
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
  * 수정 처리
  * @param listVO
  * @return
  */
 @RequestMapping(value="/game/update.do", method=RequestMethod.POST )
 public ModelAndView update(GameVO gameVO) {
   ModelAndView mav = new ModelAndView();
   
   KindVO kindVO = this.kindProc.read(gameVO.getKind_kindno());
   // mav.addObject("cateVO", cateVO); // 전달안됨.
   mav.addObject("kind_kindno", kindVO.getKind_kindno());
   
   mav.addObject("game_gameno", gameVO.getGame_gameno());
   
   HashMap<String, Object> hashMap = new HashMap<String, Object>();
   hashMap.put("game_gameno", gameVO.getGame_gameno());
   
   int cnt = 0;             // 수정된 레코드 갯수 
   cnt = this.gameProc.update(gameVO);

   mav.addObject("cnt", cnt); // request에 저장
       
   if (cnt == 1) {
     mav.setViewName("redirect:/game/update_msg.jsp"); // webapp/contents/update_msg.jsp
   } else { 
     mav.setViewName("/game/update_msg"); // webapp/contents/update_msg.jsp
   }
   
   return mav;
 }

 /**
  * 삭제 처리
  * @param list_listno 조회할 카테고리 번호
  * @return
  */
 @RequestMapping(value="/game/delete.do", method=RequestMethod.GET )
 public ModelAndView delete(int game_gameno) {
   ModelAndView mav = new ModelAndView();
   
   GameVO gameVO = this.gameProc.read(game_gameno);
   mav.addObject("gameVO", gameVO);  // request 객체에 저장
   
   int kind_kindno = gameVO.getKind_kindno();
   mav.addObject("kind_kindno", kind_kindno);
   
   this.game_imagesProc.delete_all(game_gameno);
   
   int cnt = this.gameProc.delete(game_gameno); // 삭제 처리
   mav.addObject("cnt", cnt);  // request 객체에 저장
   
   mav.setViewName("redirect:/game/list_join.do"); 
   

   return mav;
 }
 
 /**
  * 결합된 카테고리 그룹별 카테고리 목록
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
  
//  StringBuffer url = new StringBuffer(); // 링크 조합 때 사용

  // 카테고리 그룹 갯수 만큼 순환
  for (int index = 0; index < kind_list.size(); index++) {
    KindVO kindVO = kind_list.get(index); // 하나의 카테고리 그룹 추출
    
    if(index==5) {
      break;
    }
    
    name_title_list.add("<a style='background-color: #111;padding-bottom: 0px; font-size: 16px;' "
                            + "href='"+request.getContextPath()+"/game/list_join.do?kind_kindno="
                            +kindVO.getKind_kindno()+"&word='>"+kindVO.getKind_kindname()+"</a>");

/* 게임->카테고리->또다른 카테고리 기술
//    name_title_list.add("<a data-toggle='collapse' data-parent='#accordion' href='#index_game"+kindVO.getKind_kindname()+"'style='background-color: #111;padding-bottom: 0px; font-size: 20px;'>"+
//                           kindVO.getKind_kindname()+"</a>");
    
    // 카테고리 Join 목록
//    List<Kind_Game_join> game_list = gameProc.game_join_by_kindno(kindVO.getKind_kindno());
//    
//    
//    
//    name_title_list.add("<div id='index_game"+kindVO.getKind_kindname()+"' class='panel-collapse collapse'>");
//      name_title_list.add("<div style='margin-left: 15px;'>");
//    // 카테고리 갯수만큼 순환
//    for (int j=0; j < game_list.size(); j++) {
//      Kind_Game_join kind_Game_join = game_list.get(j);
//      
//      String name = kind_Game_join.getGame_title(); // 카테고리 이름
//      
//      if(j==3) {
//        break;
//      }
//      url.append("  <A style='font-size: 16px; padding-bottom: 0px;' href='" + request.getContextPath()+ "/game/list_join.do?kind_kindno="+ kind_Game_join.getKind_kindno()+"&word='>");
//      url.append(name);
//      url.append("  </A>");
//    
//      name_title_list.add(url.toString()); // 출력 목록에 하나의 cate 추가 
//      
//      url.delete(0, url.toString().length()); // 새로운 카테고리 목록을 구성하기위해 StringBuffer 문자열 삭제
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
