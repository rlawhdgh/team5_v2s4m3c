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
   * ��� ��
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
   * ���� ���
   * 
   * @param request
   * @param attachfileVO
   * @param cateno
   *          �Խ��� ī�װ� ��ȣ
   * @return
   */
  @RequestMapping(value = "/openspace_img/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, Openspace_imgVO openspace_imgVO) {

    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    int openspace_no = openspace_imgVO.getOpenspace_no(); // �θ�� ��ȣ
    String openspace_img_fname = ""; // ���� ���ϸ�
    String openspace_img_fupname = ""; // ���ε�� ���ϸ�
    long openspace_img_fsize = 0; // ���� ������
    String openspace_img_thumb = ""; // Preview �̹���
    int upload_count = 0; // ����ó���� ���ڵ� ����
    
    
    String upDir = Tool.getRealPath(request, "/openspace_img/storage"); // ���� ���
    // ���� ������ ����� fnamesMF ��ü�� ������.
    List<MultipartFile> fnamesMF = openspace_imgVO.getFnamesMF(); // ���� ���
    int count = fnamesMF.size(); // ���� ���� ����
    if (count > 0) { // ������ ������ �ִٸ�
      for (MultipartFile multipartFile : fnamesMF) { // ���� ����
        openspace_img_fsize = multipartFile.getSize(); // ���� ũ��
        if (openspace_img_fsize > 0) { // ���� ũ�� üũ
          openspace_img_fname = multipartFile.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
          // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
          openspace_img_fupname = Upload.saveFileSpring(multipartFile, upDir);

          if (Tool.isImage(openspace_img_fname)) { // �̹������� �˻�
            // thumb �̹��� ������ ���ϸ� ���ϵ�, width: 120, height: 80
            openspace_img_thumb = Tool.preview(upDir, openspace_img_fupname, 120, 80);
          }
        }
        Openspace_imgVO vo = new Openspace_imgVO();
        vo.setOpenspace_no(openspace_no);
        vo.setOpenspace_img_fname(openspace_img_fname);
        vo.setOpenspace_img_fupname(openspace_img_fupname);
        vo.setOpenspace_img_thumb(openspace_img_thumb);
        vo.setOpenspace_img_fsize(openspace_img_fsize);

        upload_count = upload_count + openspace_imgProc.create(vo); // ���� 1�� ��� ���� dbms ����
      }
    }
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
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
   * ÷�� ���� 1�� ���� ó��
   * 
   * @return
   */
  @RequestMapping(value = "/openspace_img/delete.do", 
                             method = RequestMethod.GET)
  public ModelAndView delete_proc(HttpServletRequest request,
                                                int openspace_img_no, int openspace_no, String word, String search, int nowPage ) {
    ModelAndView mav = new ModelAndView();

    // ������ ���� ������ �о��.
    Openspace_imgVO openspace_imgVO = openspace_imgProc.read(openspace_img_no);
    
    String upDir = Tool.getRealPath(request, "/openspace_img/storage"); // ���� ���
    Tool.deleteFile(upDir, openspace_imgVO.getOpenspace_img_fname()); // Folder���� 1���� ���� ����
    Tool.deleteFile(upDir, openspace_imgVO.getOpenspace_img_thumb()); // 1���� Thumb ���� ����
    
    // DBMS���� 1���� ���� ����
    openspace_imgProc.delete(openspace_img_no);
    
     
     mav.setViewName("redirect:/openspace/update.do?openspace_no="+openspace_no+"&search="+search+"&word="+word+"&nowPage="+nowPage); 

    return mav;
  }
  
  /**
   * �������׿� ��ϵ� ��� ���� ���� ó��
   * 
   * @return
   */
  @RequestMapping(value = "/openspace_img/delete_all.do", 
                             method = RequestMethod.GET)
  public ModelAndView delete(HttpServletRequest request, int openspace_no, String word, String search, int nowPage ) {
    ModelAndView mav = new ModelAndView();

    // ������ ���� ������ �о��.
    
    
    
    
    List<Openspace_imgVO> list= openspace_imgProc.list_by_openspace(openspace_no);
    for(int i=0; i<list.size(); i++) {
      int no = list.get(i).getOpenspace_img_no();
      String fname = list.get(i).getOpenspace_img_fname();
      String thumb = list.get(i).getOpenspace_img_thumb();
      
      System.out.println("no"+no);
      System.out.println("fname"+fname);
      System.out.println("thumb"+thumb);
      
      String upDir = Tool.getRealPath(request, "/openspace_img/storage"); // ���� ���
      Tool.deleteFile(upDir, list.get(i).getOpenspace_img_fname()); // Folder���� 1���� ���� ����
      Tool.deleteFile(upDir, list.get(i).getOpenspace_img_thumb()); // 1���� Thumb ���� ����
    }
    
    
    
   
    // DBMS���� ��� ���� ����
    openspace_imgProc.delete_all(openspace_no);
      

    
     mav.setViewName("redirect:/openspace/update.do?openspace_no="+openspace_no+"&search="+search+"&word="+word+"&nowPage="+nowPage); 
     

    return mav;
  }
  
  
 
  
}
