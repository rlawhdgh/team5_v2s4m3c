package dev.mvc.game_images;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class Game_imagesCont {
  @Autowired
  @Qualifier("dev.mvc.game_images.Game_imagesProc")
  private Game_imagesProcInter game_imagesProc;
  
  public Game_imagesCont() {
    System.out.println("Game_imagesCont 호출됨");
  }

//http://localhost:9090/resort/list_images/create.do
 /**
  * 등록 폼
  * @return
  */
 @RequestMapping(value="/game_images/create.do", method=RequestMethod.GET )
 public ModelAndView create(int game_gameno) {
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/game_images/create"); // webapp/list_images/create.jsp
   
   return mav;
 }
 
 /**
  * 파일 등록
  * @param request
  * @param game_imagesVO
  * @param cateno 게시판 카테고리 번호
  * @return
  */
 @RequestMapping(value = "/game_images/create.do", method = RequestMethod.POST)
 public ModelAndView create(HttpServletRequest request,
                                          Game_imagesVO game_imagesVO,
                                          int kind_kindno) {
   
   ModelAndView mav = new ModelAndView();
   System.out.println(kind_kindno);
   // -----------------------------------------------------
   // 파일 전송 코드 시작
   // -----------------------------------------------------
   int game_gameno = game_imagesVO.getGame_gameno(); // 부모글 번호
   String game_fname = ""; // 원본 파일명
   String game_fupname = ""; // 업로드된 파일명
   long game_fsize = 0;  // 파일 사이즈
   String game_thumb = ""; // Preview 이미지
   int upload_count = 0; // 정상처리된 레코드 갯수
   
   String upDir = Tool.getRealPath(request, "/game_images/storage"); // 절대 경로
   // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
   List<MultipartFile> fnamesMF = game_imagesVO.getGame_fnamesMF();// 파일 목록
   
   int count = fnamesMF.size(); // 전송 파일 갯수
   if (count > 0) { // 전송할 파일이 있다면
     for (MultipartFile multipartFile:fnamesMF) { // 파일 추출
       game_fsize = multipartFile.getSize();  // 파일 크기
       if (game_fsize > 0) { // 파일 크기 체크
         game_fname = multipartFile.getOriginalFilename(); // 원본 파일명, spring.jpg
         
         // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
         game_fupname = Upload.saveFileSpring(multipartFile, upDir); 
         
         if (Tool.isImage(game_fname)) { // 이미지인지 검사
           // thumb 이미지 생성후 파일명 리턴됨, width: 120, height: 80
           game_thumb = Tool.preview(upDir, game_fupname, 120, 80); 
         }
       }
       
       Game_imagesVO vo = new Game_imagesVO();
       
       vo.setGame_gameno(game_gameno);
       vo.setGame_fname(game_fname);
       vo.setGame_fupname(game_fupname);
       vo.setGame_thumb(game_thumb);
       vo.setGame_fsize(game_fsize);
        
       upload_count = upload_count + this.game_imagesProc.create(vo); // 파일 1건 등록 정도 dbms 저장
       
       System.out.println("upload_count" + upload_count);
     }
   }    
   
   mav.addObject("upload_count", upload_count);
   
   mav.addObject("game_gameno",  game_imagesVO.getGame_gameno());
  
   mav.setViewName("redirect:/game_images/create_msg.jsp");
   return mav;
 }
 
 /**
  * 전체 목록
  * http://localhost:9090/resort/list_images/list.do
  * 
  * @return
  */
 @RequestMapping(value = "/game_images/list_all.do", method = RequestMethod.GET)
 public ModelAndView list() {
   ModelAndView mav = new ModelAndView();

   List<Game_imagesVO> list = this.game_imagesProc.list();
   mav.addObject("list", list);

   mav.setViewName("/game_images/list");

   return mav;
 }
 
 /**
  * 해당 목록
  * http://localhost:9090/resort/list_images/list.do?list_listno=1
  * 
  * @return
  */
 @RequestMapping(value = "/game_images/list.do", method = RequestMethod.GET)
 public ModelAndView list(int game_gameno) {
   ModelAndView mav = new ModelAndView();

   List<Game_imagesVO> list = this.game_imagesProc.by_game_gameno(game_gameno);
   mav.addObject("list", list);

   mav.setViewName("/game_images/list");

   return mav;
 }
 
 /**
  * 첨부 파일 1건 삭제 처리
  * 
  * @return
  */
 @RequestMapping(value = "/game_images/delete.do", 
                            method = RequestMethod.GET)
 public ModelAndView delete_proc(HttpServletRequest request,
                                             int game_imagesno) {
   ModelAndView mav = new ModelAndView();

   // 삭제할 파일 정보를 읽어옴.
   Game_imagesVO game_imagesVO = this.game_imagesProc.read(game_imagesno);
   
   int game_gameno = game_imagesVO.getGame_gameno();
   mav.addObject("game_gameno", game_gameno);
   
   String upDir = Tool.getRealPath(request, "/game_images/storage"); // 절대 경로
   Tool.deleteFile(upDir, game_imagesVO.getGame_fupname()); // Folder에서 1건의 파일 삭제
   Tool.deleteFile(upDir, game_imagesVO.getGame_thumb()); // 1건의 Thumb 파일 삭제
   
   // DBMS에서 1건의 파일 삭제
   this.game_imagesProc.delete(game_imagesno);
       
   List<Game_imagesVO> list = this.game_imagesProc.list();
   mav.addObject("list", list);
   
   mav.setViewName("redirect:/game_images/list.do"); 

   return mav;
 }
  
  
}
