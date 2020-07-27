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
   * 등록 폼
   * 
   * @return
   */
/*  @RequestMapping(value = "/index/create.do", method = RequestMethod.GET)
  public String create() {
    JSONObject obj = new JSONObject();
    

    return obj.toString();
  }*/

  /**
   * 파일 등록
   * 
   * @param request
   * @param attachfileVO
   * @param cateno
   *          게시판 카테고리 번호
   * @return
   */
 /* @RequestMapping(value = "/index/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, Index_imgVO index_imgVO) {
    System.out.println(index_imgVO.getFnamesMF());

    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // 파일 전송 코드 시작
    // -----------------------------------------------------
    String index_img_fname = ""; // 원본 파일명
    String index_img_fupname = ""; // 업로드된 파일명
    long index_img_fsize = 0; // 파일 사이즈
    int upload_count = 0; // 정상처리된 레코드 갯수
    String index_img_url = index_imgVO.getIndex_img_url();
    String index_img_division= index_imgVO.getIndex_img_division();

    String upDir = Tool.getRealPath(request, "/storage"); // 절대 경로
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    List<MultipartFile> fnamesMF = index_imgVO.getFnamesMF(); // 파일 목록
    int count = fnamesMF.size(); // 전송 파일 갯수
    if (count > 0) { // 전송할 파일이 있다면
      for (MultipartFile multipartFile : fnamesMF) { // 파일 추출
        index_img_fsize = multipartFile.getSize(); // 파일 크기
        if (index_img_fsize > 0) { // 파일 크기 체크
          index_img_fname = multipartFile.getOriginalFilename(); // 원본 파일명, spring.jpg
          // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
          index_img_fupname = Upload.saveFileSpring(multipartFile, upDir);


        }
        Index_imgVO vo = new Index_imgVO();
        vo.setIndex_img_fname(index_img_fname);
        vo.setIndex_img_fupname(index_img_fupname);
        vo.setIndex_img_fsize(index_img_fsize);
        vo.setIndex_img_url(index_img_url);
        vo.setIndex_img_division(index_img_division);

        upload_count = upload_count + index_imgProc.create(vo); // 파일 1건 등록  dbms 저장
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
    mav.addObject("index_img_no", index_imgVO.getIndex_img_no());

    // mav.setViewName("/attachfile/create_msg"); // /attachfile/create_msg.jsp
    mav.setViewName("redirect:/index.do");
    return mav;
  }*/
  
  
/*  @RequestMapping(value = "/index/create.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public String create(HttpServletRequest request, Index_imgVO index_imgVO) {
   

    JSONObject obj = new JSONObject();
    // -----------------------------------------------------
    // 파일 전송 코드 시작
    // -----------------------------------------------------
    String index_img_fname = ""; // 원본 파일명
    String index_img_fupname = ""; // 업로드된 파일명
    long index_img_fsize = 0; // 파일 사이즈
    int upload_count = 0; // 정상처리된 레코드 갯수
    String index_img_url = index_imgVO.getIndex_img_url();
    String index_img_division= index_imgVO.getIndex_img_division();

    String upDir = Tool.getRealPath(request, "/storage"); // 절대 경로
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    List<MultipartFile> fnamesMF = index_imgVO.getFnamesMF(); // 파일 목록
    int count = fnamesMF.size(); // 전송 파일 갯수
    if (count > 0) { // 전송할 파일이 있다면
      for (MultipartFile multipartFile : fnamesMF) { // 파일 추출
        index_img_fsize = multipartFile.getSize(); // 파일 크기
        if (index_img_fsize > 0) { // 파일 크기 체크
          index_img_fname = multipartFile.getOriginalFilename(); // 원본 파일명, spring.jpg
          // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
          index_img_fupname = Upload.saveFileSpring(multipartFile, upDir);


        }
        Index_imgVO vo = new Index_imgVO();
        vo.setIndex_img_fname(index_img_fname);
        vo.setIndex_img_fupname(index_img_fupname);
        vo.setIndex_img_fsize(index_img_fsize);
        vo.setIndex_img_url(index_img_url);
        vo.setIndex_img_division(index_img_division);

        upload_count = upload_count + index_imgProc.create(vo); // 파일 1건 등록  dbms 저장
      }
    }
    // -----------------------------------------------------
    // 파일 전송 코드 종료
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
  
   //목록
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
  
   //목록
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

  
  
  /** 기각
   * 목록 + 검색 + 페이징 지원
   * http://localhost:9090/resort/contents/list.do
   * http://localhost:9090/resort/contents/list.do?cateno=1&word=스위스&nowPage=1
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
//    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
//    HashMap<String, Object> map = new HashMap<String, Object>();
//    map.put("nowPage", nowPage); // 페이지에 출력할 레코드의 범위를 산출하기위해 사용
//    //데이터베이스 컬럼이 아님 rownum을 찾아내기 위한 기준값
//    
//    // 검색 목록
//    List<Index_imgVO> list = index_imgProc.list_by_paging(map);
//    mav.addObject("list", list);   
//
//    // 검색된 레코드 갯수
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
   * 첨부 파일 1건 삭제 처리
   * 
   * @return
   */
  @RequestMapping(value = "/index/delete.do", 
                             method = RequestMethod.GET)
  public ModelAndView delete_proc(HttpServletRequest request,
                                                int index_img_no ) {
    ModelAndView mav = new ModelAndView();

    // 삭제할 파일 정보를 읽어옴.
   Index_imgVO index_imgVO = index_imgProc.read(index_img_no);
    
    String upDir = Tool.getRealPath(request, "/storage"); // 절대 경로
    Tool.deleteFile(upDir, index_imgVO.getIndex_img_fupname()); // Folder에서 1건의 파일 삭제
    
    // DBMS에서 1건의 파일 삭제
    index_imgProc.delete(index_img_no);    
     mav.setViewName("redirect:/index.do"); 

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
/*  @RequestMapping(value = "/index/update.do", method = RequestMethod.POST)
  public ModelAndView update(HttpServletRequest request, Index_imgVO index_imgVO) {
   ModelAndView mav = new ModelAndView();
   int index_img_no = index_imgVO.getIndex_img_no();
   index_imgVO = index_imgProc.read(index_img_no);
   
   String upDir = Tool.getRealPath(request, "/storage"); // 절대 경로
   Tool.deleteFile(upDir, index_imgVO.getIndex_img_fupname()); // Folder에서 1건의 파일 삭제
   
   // DBMS에서 1건의 파일 삭제
   index_imgProc.delete(index_img_no);
   
   
   
    // -----------------------------------------------------
    // 파일 전송 코드 시작
    // -----------------------------------------------------
    String index_img_fname = ""; // 원본 파일명
    String index_img_fupname = ""; // 업로드된 파일명
    long index_img_fsize = 0; // 파일 사이즈
    int upload_count = 0; // 정상처리된 레코드 갯수
    String index_img_url = index_imgVO.getIndex_img_url();
    String index_img_division= index_imgVO.getIndex_img_division();
   

    upDir = Tool.getRealPath(request, "/storage"); // 절대 경로
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    List<MultipartFile> fnamesMF = index_imgVO.getFnamesMF(); // 파일 목록
    int count = fnamesMF.size(); // 전송 파일 갯수
    if (count > 0) { // 전송할 파일이 있다면
      for (MultipartFile multipartFile : fnamesMF) { // 파일 추출
        index_img_fsize = multipartFile.getSize(); // 파일 크기
        if (index_img_fsize > 0) { // 파일 크기 체크
          index_img_fname = multipartFile.getOriginalFilename(); // 원본 파일명, spring.jpg
          // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
          index_img_fupname = Upload.saveFileSpring(multipartFile, upDir);


        }
        Index_imgVO vo = new Index_imgVO();
        vo.setIndex_img_no(index_img_no);
        vo.setIndex_img_fname(index_img_fname);
        vo.setIndex_img_fupname(index_img_fupname);
        vo.setIndex_img_fsize(index_img_fsize);
        vo.setIndex_img_url(index_img_url);
        vo.setIndex_img_division(index_img_division);

        upload_count = upload_count + index_imgProc.update(vo); // 파일 1건 등록  dbms 저장
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
    mav.addObject("index_img_no", index_imgVO.getIndex_img_no());

    // mav.setViewName("/attachfile/create_msg"); // /attachfile/create_msg.jsp
    mav.setViewName("redirect:/index.do");
    return mav;
  }*/
  
  
  //http://localhost:9090/team5/question/update.do
  /**
   * 수정 처리
   * @param questionVO
   * @return
   */
/*  @RequestMapping(value="/index/update.do", method=RequestMethod.POST)
  public ModelAndView update(Index_imgVO index_imgVO, HttpServletRequest request) {


    ModelAndView mav = new ModelAndView();
    
    int cnt=this.index_imgProc.update(index_imgVO);
    mav.addObject("cnt",cnt); //request에 저장
      //mav.setViewName("redirect:/index.do"); //spring 재호출
    mav.setViewName("redirect:/index.do"); 

    
    return mav;
  }*/
  
  
  /**
   * 이미지 등록
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/index/create1.do", method=RequestMethod.POST ,
                              produces = "text/plain;charset=UTF-8" )
  public String create1(HttpServletRequest request, Index_imgVO index_imgVO) {
    System.out.println(index_imgVO.getFnamesMF());
    
    String index_img_fname = ""; // 원본 파일명
    String index_img_fupname = ""; // 업로드된 파일명
    long index_img_fsize = 0; // 파일 사이즈
    int upload_count = 0; // 정상처리된 레코드 갯수
    String index_img_url = index_imgVO.getIndex_img_url();
    String index_img_division= index_imgVO.getIndex_img_division();
    


    String upDir = Tool.getRealPath(request, "/storage"); // 절대 경로
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    List<MultipartFile> fnamesMF = index_imgVO.getFnamesMF(); // 파일 목록
    
    int count = fnamesMF.size(); // 전송 파일 갯수
    if (count > 0) { // 전송할 파일이 있다면
      for (MultipartFile multipartFile : fnamesMF) { // 파일 추출
        index_img_fsize = multipartFile.getSize(); // 파일 크기
        if (index_img_fsize > 0) { // 파일 크기 체크
          index_img_fname = multipartFile.getOriginalFilename(); // 원본 파일명, spring.jpg
          // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
          index_img_fupname = Upload.saveFileSpring(multipartFile, upDir);


        }
        Index_imgVO vo = new Index_imgVO();
        vo.setIndex_img_fname(index_img_fname);
        vo.setIndex_img_fupname(index_img_fupname);
        vo.setIndex_img_fsize(index_img_fsize);
        vo.setIndex_img_url(index_img_url);
        vo.setIndex_img_division(index_img_division);

        upload_count = upload_count + index_imgProc.create(vo); // 파일 1건 등록  dbms 저장
      }
    }
    

    
  
    JSONObject json = new JSONObject();
    json.put("upload_count", upload_count);


    
    return json.toString(); 
  }
  
  
  
  /**
   * 수정 처리
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
   * 첨부 파일 1건 삭제 처리
   * 
   * @return
   */
  @RequestMapping(value = "/index/delete1.do", 
                             method = RequestMethod.GET)
  public String delete(HttpServletRequest request,
                                                int index_img_no ) {

    JSONObject obj = new JSONObject();
    // 삭제할 파일 정보를 읽어옴.
   Index_imgVO index_imgVO = index_imgProc.read(index_img_no);   
    String upDir = Tool.getRealPath(request, "/storage"); // 절대 경로
    Tool.deleteFile(upDir, index_imgVO.getIndex_img_fupname()); // Folder에서 1건의 파일 삭제
    
    // DBMS에서 1건의 파일 삭제
    index_imgProc.delete(index_img_no);    


     return obj.toString();
  }
  
  
}
