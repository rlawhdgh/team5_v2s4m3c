package dev.mvc.index_img;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.openspace_img.Openspace_imgVO;
import dev.mvc.openspace_reply.Openspace_replyVO;
import dev.mvc.question.QuestionVO;
import dev.mvc.questiongrp.QuestiongrpVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;





@Controller
public class Index_imgCont {
  @Autowired
  @Qualifier("dev.mvc.index_img.Index_imgProc")
  private Index_imgProcInter index_imgProc;

  public Index_imgCont() {
    System.out.println("--> Index_imgCont created.");
  }
  
  /**
   * ��� ��
   * 
   * @return
   */
/*  @RequestMapping(value = "/index/create.do", method = RequestMethod.GET)
  public String create() {
    JSONObject obj = new JSONObject();
    

    return obj.toString();
  }*/

  /**
   * ���� ���
   * 
   * @param request
   * @param attachfileVO
   * @param cateno
   *          �Խ��� ī�װ� ��ȣ
   * @return
   */
 /* @RequestMapping(value = "/index/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, Index_imgVO index_imgVO) {
    System.out.println(index_imgVO.getFnamesMF());

    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    String index_img_fname = ""; // ���� ���ϸ�
    String index_img_fupname = ""; // ���ε�� ���ϸ�
    long index_img_fsize = 0; // ���� ������
    int upload_count = 0; // ����ó���� ���ڵ� ����
    String index_img_url = index_imgVO.getIndex_img_url();
    String index_img_division= index_imgVO.getIndex_img_division();

    String upDir = Tool.getRealPath(request, "/storage"); // ���� ���
    // ���� ������ ����� fnamesMF ��ü�� ������.
    List<MultipartFile> fnamesMF = index_imgVO.getFnamesMF(); // ���� ���
    int count = fnamesMF.size(); // ���� ���� ����
    if (count > 0) { // ������ ������ �ִٸ�
      for (MultipartFile multipartFile : fnamesMF) { // ���� ����
        index_img_fsize = multipartFile.getSize(); // ���� ũ��
        if (index_img_fsize > 0) { // ���� ũ�� üũ
          index_img_fname = multipartFile.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
          // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
          index_img_fupname = Upload.saveFileSpring(multipartFile, upDir);


        }
        Index_imgVO vo = new Index_imgVO();
        vo.setIndex_img_fname(index_img_fname);
        vo.setIndex_img_fupname(index_img_fupname);
        vo.setIndex_img_fsize(index_img_fsize);
        vo.setIndex_img_url(index_img_url);
        vo.setIndex_img_division(index_img_division);

        upload_count = upload_count + index_imgProc.create(vo); // ���� 1�� ���  dbms ����
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
    mav.addObject("index_img_no", index_imgVO.getIndex_img_no());

    // mav.setViewName("/attachfile/create_msg"); // /attachfile/create_msg.jsp
    mav.setViewName("redirect:/index.do");
    return mav;
  }*/
  
  
/*  @RequestMapping(value = "/index/create.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public String create(HttpServletRequest request, Index_imgVO index_imgVO) {
   

    JSONObject obj = new JSONObject();
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    String index_img_fname = ""; // ���� ���ϸ�
    String index_img_fupname = ""; // ���ε�� ���ϸ�
    long index_img_fsize = 0; // ���� ������
    int upload_count = 0; // ����ó���� ���ڵ� ����
    String index_img_url = index_imgVO.getIndex_img_url();
    String index_img_division= index_imgVO.getIndex_img_division();

    String upDir = Tool.getRealPath(request, "/storage"); // ���� ���
    // ���� ������ ����� fnamesMF ��ü�� ������.
    List<MultipartFile> fnamesMF = index_imgVO.getFnamesMF(); // ���� ���
    int count = fnamesMF.size(); // ���� ���� ����
    if (count > 0) { // ������ ������ �ִٸ�
      for (MultipartFile multipartFile : fnamesMF) { // ���� ����
        index_img_fsize = multipartFile.getSize(); // ���� ũ��
        if (index_img_fsize > 0) { // ���� ũ�� üũ
          index_img_fname = multipartFile.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
          // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
          index_img_fupname = Upload.saveFileSpring(multipartFile, upDir);


        }
        Index_imgVO vo = new Index_imgVO();
        vo.setIndex_img_fname(index_img_fname);
        vo.setIndex_img_fupname(index_img_fupname);
        vo.setIndex_img_fsize(index_img_fsize);
        vo.setIndex_img_url(index_img_url);
        vo.setIndex_img_division(index_img_division);

        upload_count = upload_count + index_imgProc.create(vo); // ���� 1�� ���  dbms ����
      }
    }
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------

    // ra.addAttribute("upload_count", upload_count);
    // ra.addAttribute("categrpno", categrpno);
    // ra.addAttribute("contentsno", attachfileVO.getContentsno());

    

    obj.put("upload_count",upload_count);
    // mav.addObject("cateno", cateno);

    obj.put("index_img_no",index_imgVO.getIndex_img_no());

    // mav.setViewName("/attachfile/create_msg"); // /attachfile/create_msg.jsp
    
    return obj.toString();
  }*/
  
   //���
/*  @RequestMapping(value = "/index/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();

    List<Index_imgVO> list = this.index_imgProc.list();
    mav.addObject("list", list); // request.setAttribute("list",list);
    
    List<Index_imgVO> list_main = this.index_imgProc.list_main();
    mav.addObject("list_main", list_main); 
    
    List<Index_imgVO> list_event = this.index_imgProc.list_event();
    mav.addObject("list_event", list_event);
    
   
    mav.setViewName("/index/list");

    return mav;
  }*/
  
   //���
  @RequestMapping(value = "/index/list_img.do", method = RequestMethod.GET)
  public ModelAndView list_img() {
    ModelAndView mav = new ModelAndView();

    List<Index_imgVO> list = this.index_imgProc.list();
    mav.addObject("list", list); // request.setAttribute("list",list);
    
    List<Index_imgVO> list_main = this.index_imgProc.list_main();
    mav.addObject("list_main", list_main); 
    
    List<Index_imgVO> list_event = this.index_imgProc.list_event();
    mav.addObject("list_event", list_event);
    
   
    mav.setViewName("/index/list_img");

    return mav;
  }
  
  @ResponseBody
  @RequestMapping(value = "/index/img_list.do",
                            method = RequestMethod.GET,
                            produces = "text/plain;charset=UTF-8")
  public String list() {
    List<Index_imgVO> list = this.index_imgProc.list();
   
    List<Index_imgVO> list_main = this.index_imgProc.list_main();
    
    List<Index_imgVO> list_event = this.index_imgProc.list_event();
    
    JSONObject obj = new JSONObject();
    obj.put("list", list);
    obj.put("list_main", list_main);
    obj.put("list_event", list_event);
 
    return obj.toString(); 

  }

  
  
  /** �Ⱒ
   * ��� + �˻� + ����¡ ����
   * http://localhost:9090/resort/contents/list.do
   * http://localhost:9090/resort/contents/list.do?cateno=1&word=������&nowPage=1
   * @param cateno
   * @param word
   * @param nowPage
   * @return
   */
//  @RequestMapping(value = "/index/list.do", 
//                                       method = RequestMethod.GET)
//  public ModelAndView list_by_cateno_search_paging(
//      @RequestParam(value="nowPage", defaultValue="1") int nowPage
//
//      ) 
//  { 
//    
//    ModelAndView mav = new ModelAndView();
//
//    // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
//    HashMap<String, Object> map = new HashMap<String, Object>();
//    map.put("nowPage", nowPage); // �������� ����� ���ڵ��� ������ �����ϱ����� ���
//    //�����ͺ��̽� �÷��� �ƴ� rownum�� ã�Ƴ��� ���� ���ذ�
//    
//    // �˻� ���
//    List<Index_imgVO> list = index_imgProc.list_by_paging(map);
//    mav.addObject("list", list);   
//
//    // �˻��� ���ڵ� ����
//   int search_count = list.size();
//  //  mav.addObject("search_count", search_count);   
//    mav.addObject("list", list);
//
//    String paging = index_imgProc .pagingBox("list.do", search_count, nowPage);
//    mav.addObject("paging", paging);
//  
//    mav.addObject("nowPage", nowPage);
//    
//    mav.setViewName("/index/list");   
//    
//    
//    return mav;
//  }    
//  
  
  /**
   * ÷�� ���� 1�� ���� ó��
   * 
   * @return
   */
  @RequestMapping(value = "/index/delete.do", 
                             method = RequestMethod.GET)
  public ModelAndView delete_proc(HttpServletRequest request,
                                                int index_img_no ) {
    ModelAndView mav = new ModelAndView();

    // ������ ���� ������ �о��.
   Index_imgVO index_imgVO = index_imgProc.read(index_img_no);
    
    String upDir = Tool.getRealPath(request, "/storage"); // ���� ���
    Tool.deleteFile(upDir, index_imgVO.getIndex_img_fupname()); // Folder���� 1���� ���� ����
    
    // DBMS���� 1���� ���� ����
    index_imgProc.delete(index_img_no);    
     mav.setViewName("redirect:/index.do"); 

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
/*  @RequestMapping(value = "/index/update.do", method = RequestMethod.POST)
  public ModelAndView update(HttpServletRequest request, Index_imgVO index_imgVO) {
   ModelAndView mav = new ModelAndView();
   int index_img_no = index_imgVO.getIndex_img_no();
   index_imgVO = index_imgProc.read(index_img_no);
   
   String upDir = Tool.getRealPath(request, "/storage"); // ���� ���
   Tool.deleteFile(upDir, index_imgVO.getIndex_img_fupname()); // Folder���� 1���� ���� ����
   
   // DBMS���� 1���� ���� ����
   index_imgProc.delete(index_img_no);
   
   
   
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    String index_img_fname = ""; // ���� ���ϸ�
    String index_img_fupname = ""; // ���ε�� ���ϸ�
    long index_img_fsize = 0; // ���� ������
    int upload_count = 0; // ����ó���� ���ڵ� ����
    String index_img_url = index_imgVO.getIndex_img_url();
    String index_img_division= index_imgVO.getIndex_img_division();
   

    upDir = Tool.getRealPath(request, "/storage"); // ���� ���
    // ���� ������ ����� fnamesMF ��ü�� ������.
    List<MultipartFile> fnamesMF = index_imgVO.getFnamesMF(); // ���� ���
    int count = fnamesMF.size(); // ���� ���� ����
    if (count > 0) { // ������ ������ �ִٸ�
      for (MultipartFile multipartFile : fnamesMF) { // ���� ����
        index_img_fsize = multipartFile.getSize(); // ���� ũ��
        if (index_img_fsize > 0) { // ���� ũ�� üũ
          index_img_fname = multipartFile.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
          // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
          index_img_fupname = Upload.saveFileSpring(multipartFile, upDir);


        }
        Index_imgVO vo = new Index_imgVO();
        vo.setIndex_img_no(index_img_no);
        vo.setIndex_img_fname(index_img_fname);
        vo.setIndex_img_fupname(index_img_fupname);
        vo.setIndex_img_fsize(index_img_fsize);
        vo.setIndex_img_url(index_img_url);
        vo.setIndex_img_division(index_img_division);

        upload_count = upload_count + index_imgProc.update(vo); // ���� 1�� ���  dbms ����
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
    mav.addObject("index_img_no", index_imgVO.getIndex_img_no());

    // mav.setViewName("/attachfile/create_msg"); // /attachfile/create_msg.jsp
    mav.setViewName("redirect:/index.do");
    return mav;
  }*/
  
  
  //http://localhost:9090/team5/question/update.do
  /**
   * ���� ó��
   * @param questionVO
   * @return
   */
/*  @RequestMapping(value="/index/update.do", method=RequestMethod.POST)
  public ModelAndView update(Index_imgVO index_imgVO, HttpServletRequest request) {


    ModelAndView mav = new ModelAndView();
    
    int cnt=this.index_imgProc.update(index_imgVO);
    mav.addObject("cnt",cnt); //request�� ����
      //mav.setViewName("redirect:/index.do"); //spring ��ȣ��
    mav.setViewName("redirect:/index.do"); 

    
    return mav;
  }*/
  
  
  /**
   * �̹��� ���
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/index/create1.do", method=RequestMethod.POST ,
                              produces = "text/plain;charset=UTF-8" )
  public String create1(HttpServletRequest request, Index_imgVO index_imgVO) {
    System.out.println(index_imgVO.getFnamesMF());
    
    String index_img_fname = ""; // ���� ���ϸ�
    String index_img_fupname = ""; // ���ε�� ���ϸ�
    long index_img_fsize = 0; // ���� ������
    int upload_count = 0; // ����ó���� ���ڵ� ����
    String index_img_url = index_imgVO.getIndex_img_url();
    String index_img_division= index_imgVO.getIndex_img_division();
    


    String upDir = Tool.getRealPath(request, "/storage"); // ���� ���
    // ���� ������ ����� fnamesMF ��ü�� ������.
    List<MultipartFile> fnamesMF = index_imgVO.getFnamesMF(); // ���� ���
    
    int count = fnamesMF.size(); // ���� ���� ����
    if (count > 0) { // ������ ������ �ִٸ�
      for (MultipartFile multipartFile : fnamesMF) { // ���� ����
        index_img_fsize = multipartFile.getSize(); // ���� ũ��
        if (index_img_fsize > 0) { // ���� ũ�� üũ
          index_img_fname = multipartFile.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
          // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
          index_img_fupname = Upload.saveFileSpring(multipartFile, upDir);


        }
        Index_imgVO vo = new Index_imgVO();
        vo.setIndex_img_fname(index_img_fname);
        vo.setIndex_img_fupname(index_img_fupname);
        vo.setIndex_img_fsize(index_img_fsize);
        vo.setIndex_img_url(index_img_url);
        vo.setIndex_img_division(index_img_division);

        upload_count = upload_count + index_imgProc.create(vo); // ���� 1�� ���  dbms ����
      }
    }
    

    
  
    JSONObject json = new JSONObject();
    json.put("upload_count", upload_count);


    
    return json.toString(); 
  }
  
  
  
  /**
   * ���� ó��
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/index/update.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String update(Index_imgVO index_imgVO) {
    int count=this.index_imgProc.update(index_imgVO);
    
    JSONObject obj = new JSONObject();
    obj.put("count",count);
 
    return obj.toString(); // {"count":1}

  }
  
  /**
   * ÷�� ���� 1�� ���� ó��
   * 
   * @return
   */
  @RequestMapping(value = "/index/delete1.do", 
                             method = RequestMethod.GET)
  public String delete(HttpServletRequest request,
                                                int index_img_no ) {

    JSONObject obj = new JSONObject();
    // ������ ���� ������ �о��.
   Index_imgVO index_imgVO = index_imgProc.read(index_img_no);   
    String upDir = Tool.getRealPath(request, "/storage"); // ���� ���
    Tool.deleteFile(upDir, index_imgVO.getIndex_img_fupname()); // Folder���� 1���� ���� ����
    
    // DBMS���� 1���� ���� ����
    index_imgProc.delete(index_img_no);    


     return obj.toString();
  }
  
  
}
