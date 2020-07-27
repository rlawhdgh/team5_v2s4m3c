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
    System.out.println("Game_imagesCont ȣ���");
  }

//http://localhost:9090/resort/list_images/create.do
 /**
  * ��� ��
  * @return
  */
 @RequestMapping(value="/game_images/create.do", method=RequestMethod.GET )
 public ModelAndView create(int game_gameno) {
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/game_images/create"); // webapp/list_images/create.jsp
   
   return mav;
 }
 
 /**
  * ���� ���
  * @param request
  * @param game_imagesVO
  * @param cateno �Խ��� ī�װ� ��ȣ
  * @return
  */
 @RequestMapping(value = "/game_images/create.do", method = RequestMethod.POST)
 public ModelAndView create(HttpServletRequest request,
                                          Game_imagesVO game_imagesVO,
                                          int kind_kindno) {
   
   ModelAndView mav = new ModelAndView();
   System.out.println(kind_kindno);
   // -----------------------------------------------------
   // ���� ���� �ڵ� ����
   // -----------------------------------------------------
   int game_gameno = game_imagesVO.getGame_gameno(); // �θ�� ��ȣ
   String game_fname = ""; // ���� ���ϸ�
   String game_fupname = ""; // ���ε�� ���ϸ�
   long game_fsize = 0;  // ���� ������
   String game_thumb = ""; // Preview �̹���
   int upload_count = 0; // ����ó���� ���ڵ� ����
   
   String upDir = Tool.getRealPath(request, "/game_images/storage"); // ���� ���
   // ���� ������ ����� fnamesMF ��ü�� ������.
   List<MultipartFile> fnamesMF = game_imagesVO.getGame_fnamesMF();// ���� ���
   
   int count = fnamesMF.size(); // ���� ���� ����
   if (count > 0) { // ������ ������ �ִٸ�
     for (MultipartFile multipartFile:fnamesMF) { // ���� ����
       game_fsize = multipartFile.getSize();  // ���� ũ��
       if (game_fsize > 0) { // ���� ũ�� üũ
         game_fname = multipartFile.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
         
         // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
         game_fupname = Upload.saveFileSpring(multipartFile, upDir); 
         
         if (Tool.isImage(game_fname)) { // �̹������� �˻�
           // thumb �̹��� ������ ���ϸ� ���ϵ�, width: 120, height: 80
           game_thumb = Tool.preview(upDir, game_fupname, 120, 80); 
         }
       }
       
       Game_imagesVO vo = new Game_imagesVO();
       
       vo.setGame_gameno(game_gameno);
       vo.setGame_fname(game_fname);
       vo.setGame_fupname(game_fupname);
       vo.setGame_thumb(game_thumb);
       vo.setGame_fsize(game_fsize);
        
       upload_count = upload_count + this.game_imagesProc.create(vo); // ���� 1�� ��� ���� dbms ����
       
       System.out.println("upload_count" + upload_count);
     }
   }    
   
   mav.addObject("upload_count", upload_count);
   
   mav.addObject("game_gameno",  game_imagesVO.getGame_gameno());
  
   mav.setViewName("redirect:/game_images/create_msg.jsp");
   return mav;
 }
 
 /**
  * ��ü ���
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
  * �ش� ���
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
  * ÷�� ���� 1�� ���� ó��
  * 
  * @return
  */
 @RequestMapping(value = "/game_images/delete.do", 
                            method = RequestMethod.GET)
 public ModelAndView delete_proc(HttpServletRequest request,
                                             int game_imagesno) {
   ModelAndView mav = new ModelAndView();

   // ������ ���� ������ �о��.
   Game_imagesVO game_imagesVO = this.game_imagesProc.read(game_imagesno);
   
   int game_gameno = game_imagesVO.getGame_gameno();
   mav.addObject("game_gameno", game_gameno);
   
   String upDir = Tool.getRealPath(request, "/game_images/storage"); // ���� ���
   Tool.deleteFile(upDir, game_imagesVO.getGame_fupname()); // Folder���� 1���� ���� ����
   Tool.deleteFile(upDir, game_imagesVO.getGame_thumb()); // 1���� Thumb ���� ����
   
   // DBMS���� 1���� ���� ����
   this.game_imagesProc.delete(game_imagesno);
       
   List<Game_imagesVO> list = this.game_imagesProc.list();
   mav.addObject("list", list);
   
   mav.setViewName("redirect:/game_images/list.do"); 

   return mav;
 }
  
  
}
