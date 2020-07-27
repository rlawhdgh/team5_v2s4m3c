package dev.mvc.openspace_img;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class Openspace_imgCont {
  @Autowired
  @Qualifier("dev.mvc.openspace_img.Openspace_imgProc")
  private Openspace_imgProcInter openspace_imgProc;

  public Openspace_imgCont() {
    System.out.println("--> Openspace_imgCont created.");
  }

  // http://localhost:9090/resort/attachfile/create.do
  /**
   * 등록 폼
   * 
   * @return
   */
  @RequestMapping(value = "/openspace_img/create.do", method = RequestMethod.GET)
  public ModelAndView create(int openspace_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/openspace_img/create"); // webapp/attachfile/create.jsp

    return mav;
  }

  /**
   * 파일 등록
   * 
   * @param request
   * @param attachfileVO
   * @param cateno
   *          게시판 카테고리 번호
   * @return
   */
  @RequestMapping(value = "/openspace_img/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, Openspace_imgVO openspace_imgVO) {

    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // 파일 전송 코드 시작
    // -----------------------------------------------------
    int openspace_no = openspace_imgVO.getOpenspace_no(); // 부모글 번호
    String openspace_img_fname = ""; // 원본 파일명
    String openspace_img_fupname = ""; // 업로드된 파일명
    long openspace_img_fsize = 0; // 파일 사이즈
    String openspace_img_thumb = ""; // Preview 이미지
    int upload_count = 0; // 정상처리된 레코드 갯수
    
    
    String upDir = Tool.getRealPath(request, "/openspace_img/storage"); // 절대 경로
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    List<MultipartFile> fnamesMF = openspace_imgVO.getFnamesMF(); // 파일 목록
    int count = fnamesMF.size(); // 전송 파일 갯수
    if (count > 0) { // 전송할 파일이 있다면
      for (MultipartFile multipartFile : fnamesMF) { // 파일 추출
        openspace_img_fsize = multipartFile.getSize(); // 파일 크기
        if (openspace_img_fsize > 0) { // 파일 크기 체크
          openspace_img_fname = multipartFile.getOriginalFilename(); // 원본 파일명, spring.jpg
          // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
          openspace_img_fupname = Upload.saveFileSpring(multipartFile, upDir);

          if (Tool.isImage(openspace_img_fname)) { // 이미지인지 검사
            // thumb 이미지 생성후 파일명 리턴됨, width: 120, height: 80
            openspace_img_thumb = Tool.preview(upDir, openspace_img_fupname, 120, 80);
          }
        }
        Openspace_imgVO vo = new Openspace_imgVO();
        vo.setOpenspace_no(openspace_no);
        vo.setOpenspace_img_fname(openspace_img_fname);
        vo.setOpenspace_img_fupname(openspace_img_fupname);
        vo.setOpenspace_img_thumb(openspace_img_thumb);
        vo.setOpenspace_img_fsize(openspace_img_fsize);

        upload_count = upload_count + openspace_imgProc.create(vo); // 파일 1건 등록 정도 dbms 저장
      }
    }
    // -----------------------------------------------------
    // 파일 전송 코드 종료
    // -----------------------------------------------------

    // ra.addAttribute("upload_count", upload_count);
    // ra.addAttribute("categrpno", categrpno);
    // ra.addAttribute("contentsno", attachfileVO.getContentsno());

    mav.addObject("upload_count", upload_count);
    // mav.addObject("cateno", cateno);
    mav.addObject("openspace_no", openspace_imgVO.getOpenspace_no());

    // mav.setViewName("/attachfile/create_msg"); // /attachfile/create_msg.jsp
    mav.setViewName("redirect:/openspace/read.do?openspace_no="+openspace_no);
    return mav;
  }
  
  /**
   * 첨부 파일 1건 삭제 처리
   * 
   * @return
   */
  @RequestMapping(value = "/openspace_img/delete.do", 
                             method = RequestMethod.GET)
  public ModelAndView delete_proc(HttpServletRequest request,
                                                int openspace_img_no, int openspace_no, String word, String search, int nowPage ) {
    ModelAndView mav = new ModelAndView();

    // 삭제할 파일 정보를 읽어옴.
    Openspace_imgVO openspace_imgVO = openspace_imgProc.read(openspace_img_no);
    
    String upDir = Tool.getRealPath(request, "/openspace_img/storage"); // 절대 경로
    Tool.deleteFile(upDir, openspace_imgVO.getOpenspace_img_fname()); // Folder에서 1건의 파일 삭제
    Tool.deleteFile(upDir, openspace_imgVO.getOpenspace_img_thumb()); // 1건의 Thumb 파일 삭제
    
    // DBMS에서 1건의 파일 삭제
    openspace_imgProc.delete(openspace_img_no);
    
     
     mav.setViewName("redirect:/openspace/update.do?openspace_no="+openspace_no+"&search="+search+"&word="+word+"&nowPage="+nowPage); 

    return mav;
  }
  
  /**
   * 공지사항에 등록된 모든 파일 삭제 처리
   * 
   * @return
   */
  @RequestMapping(value = "/openspace_img/delete_all.do", 
                             method = RequestMethod.GET)
  public ModelAndView delete(HttpServletRequest request, int openspace_no, String word, String search, int nowPage ) {
    ModelAndView mav = new ModelAndView();

    // 삭제할 파일 정보를 읽어옴.
    
    
    
    
    List<Openspace_imgVO> list= openspace_imgProc.list_by_openspace(openspace_no);
    for(int i=0; i<list.size(); i++) {
      int no = list.get(i).getOpenspace_img_no();
      String fname = list.get(i).getOpenspace_img_fname();
      String thumb = list.get(i).getOpenspace_img_thumb();
      
      System.out.println("no"+no);
      System.out.println("fname"+fname);
      System.out.println("thumb"+thumb);
      
      String upDir = Tool.getRealPath(request, "/openspace_img/storage"); // 절대 경로
      Tool.deleteFile(upDir, list.get(i).getOpenspace_img_fname()); // Folder에서 1건의 파일 삭제
      Tool.deleteFile(upDir, list.get(i).getOpenspace_img_thumb()); // 1건의 Thumb 파일 삭제
    }
    
    
    
   
    // DBMS에서 모든 파일 삭제
    openspace_imgProc.delete_all(openspace_no);
      

    
     mav.setViewName("redirect:/openspace/update.do?openspace_no="+openspace_no+"&search="+search+"&word="+word+"&nowPage="+nowPage); 
     

    return mav;
  }
  
  
 
  
}
