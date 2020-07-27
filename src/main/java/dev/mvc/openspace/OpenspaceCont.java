package dev.mvc.openspace;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.openspace_img.Openspace_imgProcInter;
import dev.mvc.openspace_img.Openspace_imgVO;
import dev.mvc.openspace_reply.Openspace_replyProcInter;
import dev.mvc.openspace_reply.Openspace_replyVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;


@Controller
public class OpenspaceCont {
  @Autowired
  @Qualifier("dev.mvc.openspace.OpenspaceProc")
  private OpenspaceProcInter openspaceProc;
  
  @Autowired
  @Qualifier("dev.mvc.openspace_img.Openspace_imgProc")
  private Openspace_imgProcInter openspace_imgProc;
  
  @Autowired
  @Qualifier("dev.mvc.openspace_reply.Openspace_replyProc")
  private Openspace_replyProcInter openspace_replyProc;

  public OpenspaceCont() {
    System.out.println("--> OpenspaceCont created.");
  }

  // http://localhost:9090/team5/openspace/create.do
  /**
   * 등록 폼
   * 
   * @return
   */
  @RequestMapping(value = "/openspace/create.do", method = RequestMethod.GET)
  public ModelAndView create(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    //int consumer_no = Integer.parseInt(session.getAttribute("consumer_no").toString());
    // System.out.println("로그인된 회원번호:"+consumer_no);
    if(session.getAttribute("admin") != null) {
    mav.setViewName("/openspace/create");// webapp/contents/create.jsp
    } else {
    mav.setViewName("/openspace/x");
    }
    return mav;
  }

  // http://localhost:9090/team5/openspace/create.do
  /**
   * 등록 처리
   * 
   * @param cateVO
   * @return
   */
  @RequestMapping(value = "/openspace/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, OpenspaceVO openspaceVO, Openspace_imgVO openspace_imgVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.openspaceProc.create(openspaceVO);
    mav.addObject("cnt", cnt); // request에 저장
    
    int openspace_no = openspaceVO.getOpenspace_no();
    mav.addObject("openspace_no",openspace_no);
    
    Date a = new Date();
    System.out.println("공지사항 등록됨"+a.toLocaleString());
    

    //  파일 첨부가 있으면
    if(openspace_imgVO.getFnamesMF().get(0).getSize() > 0) {     
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
          

          upload_count = upload_count + openspace_imgProc.create(vo); // 파일 1건 등록 dbms 저장
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
    }
    
    


    if (cnt == 1) {
      // mav.setViewName("redirect:/openspace/list.do"); //spring 재호출
      mav.setViewName("redirect:/openspace/list.do");

    } else {
      mav.setViewName("/openspace/create_msg");// webapp/contents/create_msg.jsp
    }
    return mav;
  }

  /**
   * 내가 쓴 공지사항 목록
   * 
   * @return
   */
 @RequestMapping(value = "/openspace/consumer_list.do", method = RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    if(session.getAttribute("consumer_no") != null) {
    int consumer_no = (int) session.getAttribute("consumer_no");
      List<OpenspaceVO> list = this.openspaceProc.consumer_openspace_list(consumer_no);
      mav.addObject("list", list); // request.setAttribute("list",list);
     
      mav.setViewName("/openspace/consumer_list");
    } else {
      mav.setViewName("/openspace/x");
    }

    return mav;
  }

  /**
   * 공지사항 제목 나열 http://localhost:9090/team5/openspace/list_index_left.do
   * 
   * @param request
   * @return
   */
  @RequestMapping(value = "/openspace/list_index_left.do", method = RequestMethod.GET)
  public ModelAndView list_index_left(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/openspace/list_index_left"); 

    // List<OpenspaceVO> openspace_title = openspaceProc.list(); 
    HashMap<String, Object> map = new HashMap<String, Object>();
    if(session.getAttribute("admin") == null) {
    map.put("abc", "abc"); 
    }
    List<OpenspaceVO> openspace_title = openspaceProc.list(map);
    
    ArrayList<String> name_title_list = new ArrayList<String>();
    

    int a = openspace_title.size();
    if(a<5) { // 출력될 내용이 5개 이하인 경우
      for (int i = 0; i < a; i++) {
        OpenspaceVO openspaceVO = openspace_title.get(i); 
        if(openspaceVO.getOpenspace_title().length() <12) { //등록된 문자열이 12개 보다 적을경우 그대로 출력
          name_title_list.add("<A href='/team5/openspace/read.do?openspace_no=" + openspaceVO.getOpenspace_no() + "'>"
              +"["+openspaceVO.getOpenspace_division()+"] " + openspaceVO.getOpenspace_title() + "<A>"); 
        } else if (openspaceVO.getOpenspace_title().length() >= 12) { // 등록된 문자열이 12개 이상이면 생략
          name_title_list.add("<A href='/team5/openspace/read.do?openspace_no=" + openspaceVO.getOpenspace_no() + "'>"
              +"["+openspaceVO.getOpenspace_division()+"] " + openspaceVO.getOpenspace_title().substring(0,12)+"..." + "<A>");             
        }
      }            
    } else { // 출력될 내용이 5개 이상인 경우 최신순5개 출력
      for (int i = 0; i < 5; i++) {
        OpenspaceVO openspaceVO = openspace_title.get(i); 
        if(openspaceVO.getOpenspace_title().length() <12) {//등록된 문자열이 12개 보다 적을경우 그대로 출력
          name_title_list.add("<A href='/team5/openspace/read.do?openspace_no=" + openspaceVO.getOpenspace_no() + "'>"
              +"["+openspaceVO.getOpenspace_division()+"] " + openspaceVO.getOpenspace_title() + "<A>"); 
        } else if (openspaceVO.getOpenspace_title().length() >= 12) { // 등록된 문자열이 12개 이상이면 생략
          name_title_list.add("<A href='/team5/openspace/read.do?openspace_no=" + openspaceVO.getOpenspace_no() + "'>"
              +"["+openspaceVO.getOpenspace_division()+"] " + openspaceVO.getOpenspace_title().substring(0,12)+"..." + "<A>");             
        }
      }
    }
    mav.addObject("name_title_list", name_title_list);
    return mav;
  }

  // http://localhost:9090/team5/contents/read.do
  /**
   * 조회
   * 
   * @param contentsno
   *          조회할 카테고리 번호(PK)
   * @return
   */
  @RequestMapping(value = "/openspace/read.do", method = RequestMethod.GET)
  public ModelAndView read(OpenspaceVO openspaceVO, String word, String search, HttpSession session) {
    ModelAndView mav = new ModelAndView();

    openspaceVO = this.openspaceProc.read(openspaceVO.getOpenspace_no());
    mav.addObject("openspaceVO", openspaceVO); 
    this.openspaceProc.cnt_up(openspaceVO.getOpenspace_no()); //조회수 증가
    HashMap<String, Object> map = new HashMap<String, Object>();
    int openspace_seqno= openspaceVO.getOpenspace_seqno();
    map.put("openspace_seqno", openspace_seqno);
    if(session.getAttribute("admin") == null) {
    map.put("abc", "abc"); 
    }
    OpenspaceVO a=this.openspaceProc.read_up_down(map); //다음글 이전글
    mav.addObject("a",a); // 이전글 다음글
   
    List<Openspace_imgVO> list = this.openspace_imgProc.list_by_openspace(openspaceVO.getOpenspace_no());
    mav.addObject("list", list); // 이미지 파일 리스트
    
    mav.addObject("size",list.size()); // 이미지 파일 리스트 갯수
    
    List<Openspace_replyVO> reply = this.openspace_replyProc.list(openspaceVO.getOpenspace_no());
    mav.addObject("reply", reply);
    
    mav.addObject("reply_size",reply.size());
   
    
   
    if(openspaceVO.getOpenspace_visible().equals("Y")||session.getAttribute("admin") != null) {
      mav.setViewName("/openspace/read");      
    }else {
      mav.setViewName("/openspace/x");
    }

    return mav; 
  }

  // http://localhost:9090/team5/contents/read.do
  /**
   * 수정폼
   * @param contentsno
   * @return
   */
  @RequestMapping(value = "/openspace/update.do", method = RequestMethod.GET)
  public ModelAndView update(int openspace_no, String word, String search, 
      @RequestParam(value="nowPage", defaultValue="1")int nowPage,
      HttpSession session) {
    ModelAndView mav = new ModelAndView();
    if(session.getAttribute("admin") != null) {
    OpenspaceVO openspaceVO = this.openspaceProc.read(openspace_no);
    mav.addObject("openspaceVO", openspaceVO); 
    
    mav.addObject("youtube", openspaceVO.getOpenspace_youtube());
    
    List<Openspace_imgVO> list = this.openspace_imgProc.list_by_openspace(openspaceVO.getOpenspace_no());
    mav.addObject("list", list);
    
    mav.addObject("size",list.size());

    mav.setViewName("/openspace/update");
    } else {
      mav.setViewName("/openspace/x");
    }
    
    return mav; 
  }
  
  //http://localhost:9090/team5/openspace/update.do
  /**
   * 수정 처리
   * @param openspaceVO
   * @return
   */
  @RequestMapping(value="/openspace/update.do", method=RequestMethod.POST)
  public ModelAndView update(OpenspaceVO openspaceVO, String word, String search, 
      @RequestParam(value="nowPage", defaultValue="1")int nowPage) {

    ModelAndView mav = new ModelAndView();
    
    int cnt=this.openspaceProc.update(openspaceVO);
    mav.addObject("cnt",cnt); //request에 저장
    

    if(cnt==1) { // 수정 성공
      mav.setViewName("redirect:/openspace/read.do?openspace_no="+openspaceVO.getOpenspace_no()+"&search="+search+"&word="+word+"&nowPage="+nowPage); //spring 재호출
      // search=title&word=&nowPage=3
    } else { // 수정 실패
      mav.setViewName("/openspace/update_msg");//webapp/categrp/create_msg.jsp 
    }
    
    
    return mav;
  }
  
  //http://localhost:9090/resort/contents/update.do
  /**
   * 삭제 폼
   * @param contentsno 조회할 카테고리 번호(PK)
   * @return
   */
  @RequestMapping(value="/openspace/delete.do", method=RequestMethod.GET)
  public ModelAndView delete_read(int openspace_no,HttpSession session) {
    ModelAndView mav = new ModelAndView();
    if(session.getAttribute("admin") != null) {
    OpenspaceVO openspaceVO = this.openspaceProc.read(openspace_no);
    mav.addObject("openspaceVO",openspaceVO); //request 객체에 저장
    // 이미지
    List<Openspace_imgVO> list = this.openspace_imgProc.list_by_openspace(openspace_no);
    mav.addObject("list",list);
    
    mav.addObject("size",list.size());
    
    
    // 댓글
    List<Openspace_replyVO> reply = this.openspace_replyProc.list(openspace_no);
    mav.addObject("reply", reply);
    
    mav.addObject("reply_size",reply.size());
    
    mav.setViewName("/openspace/delete");//webapp/contents/read.jsp
    } else {
      mav.setViewName("/openspace/x");
    }
    return mav; //forward
  } 
  
  // http://localhost:9090/resort/categrp/delete.do
  /**
   * 삭제 처리
   * 
   * @param categrpVO
   * @return
   */
  @RequestMapping(value = "/openspace/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(HttpServletRequest request, int openspace_no, String word, String search, 
      @RequestParam(value="nowPage", defaultValue="1")int nowPage) {
    ModelAndView mav = new ModelAndView();

    OpenspaceVO openspaceVO = this.openspaceProc.read(openspace_no); // 삭제 정보
    mav.addObject("openspaceVO", openspaceVO); // request에 저장
  
    // System.out.println("전체 레코드 갯수"+this.openspaceProc.list().size());
    
    // 마지막 페이지가 없을 경우
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("word", word);
    map.put("nowPage", nowPage); // 페이지에 출력할 레코드의 범위를 산출하기위해 사용
    map.put("search", search); 
    
    int search_count = openspaceProc.search_count(map);
    mav.addObject("search_count", search_count);
    
    // System.out.println("search_count"+search_count);
    int RECORD_PER_PAGE=Contents.RECORD_PER_PAGE;
    // System.out.println("마지막 전 페이지: "+search_count/RECORD_PER_PAGE);
    // System.out.println("현제 페이지: "+nowPage );
    if(search_count % RECORD_PER_PAGE == 1) { // 마지막에서 1개의 레코드가 남았을때
      if(nowPage !=1) {
        if(nowPage-1 == search_count/RECORD_PER_PAGE)
          nowPage = nowPage-1;
      }
    }
    // 이미지 파일 삭제 
    List<Openspace_imgVO> list= openspace_imgProc.list_by_openspace(openspace_no);
    if(list.size()>0) {
      for(int i=0; i<list.size(); i++) {        
        String upDir = Tool.getRealPath(request, "/openspace_img/storage"); // 절대 경로
        Tool.deleteFile(upDir, list.get(i).getOpenspace_img_fname()); // Folder에서 1건의 파일 삭제
        Tool.deleteFile(upDir, list.get(i).getOpenspace_img_thumb()); // 1건의 Thumb 파일 삭제
      }
    }
      
    // DBMS에서 모든 파일 삭제
    openspace_imgProc.delete_all(openspace_no);
    // 모든 댓글 삭제
    openspace_replyProc.delete_all(openspace_no);
    

    
    

    int cnt = this.openspaceProc.delete(openspace_no); 
    mav.addObject("cnt", cnt);
    mav.setViewName("redirect:/openspace/list.do?search="+search+"&word="+word+"&nowPage="+nowPage);
    //redirect:/openspace/read.do?openspace_no="+openspaceVO.getOpenspace_no()+"&search="+search+"&word="+word+"&nowPage="+nowPage


    return mav;
    
    
  }
  
  /**
   * 검색별 목록
   * 
   * @return
   */
/*  @RequestMapping(value = "/openspace/search_list.do", method = RequestMethod.GET)
  public ModelAndView title_list(@RequestParam(value="word", defaultValue="")String word, 
                                               @RequestParam(value="search", defaultValue="title")String search) {
    ModelAndView mav = new ModelAndView();
    List<OpenspaceVO> list = null;

    if (search.equals("title")) {
      list = this.openspaceProc.title_list("%" + word + "%");
    } else if (search.equals("contents")) {
      list = this.openspaceProc.content_list("%" + word + "%");
    } else if (search.equals("name_contents")) {
      list = this.openspaceProc.title_content_list("%" + word + "%");
    }
    mav.addObject("list", list);
    int size = list.size();
    mav.addObject("size",size);
    mav.addObject("word",word);
    mav.addObject("search",search);

    mav.setViewName("/openspace/title_list");
    

    return mav;
  }*/
  
  
  /**
   * 목록 + 검색 + 페이징 지원
   * http://localhost:9090/resort/contents/list.do
   * http://localhost:9090/resort/contents/list.do?cateno=1&word=스위스&nowPage=1
   * @param cateno
   * @param word
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/openspace/list.do", 
                                       method = RequestMethod.GET)
  public ModelAndView list_by_cateno_search_paging(
      @RequestParam(value="word", defaultValue="") String word,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage,
      @RequestParam(value="search", defaultValue="")String search,
      HttpSession session
      ) 
  { 
    
    ModelAndView mav = new ModelAndView();
    

    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("word", word);     // #{word}
    map.put("nowPage", nowPage); // 페이지에 출력할 레코드의 범위를 산출하기위해 사용
    map.put("search", search); 
    if(session.getAttribute("admin") == null) {
    map.put("abc", "abc"); 
    }
    
    
    //데이터베이스 컬럼이 아님 rownum을 찾아내기 위한 기준값
    
    // 검색 목록
    List<OpenspaceVO> list = openspaceProc.list_by_search_paging(map);
    System.out.println(list);
    System.out.println(openspaceProc.list(map));
    mav.addObject("list", list);   
    
//    int tot =0;
//    for(int i=0; i<list.size(); i++) {
//      int a =  list.get(i).getOpenspace_cnt();
//      tot += a;
//    }
//
//    mav.addObject("tot", tot);  

    // 검색된 레코드 갯수
    int search_count = openspaceProc.search_count(map);
    mav.addObject("search_count", search_count);   
    mav.addObject("list", list);
    mav.addObject("word",word);
    mav.addObject("search",search);
    
    String paging = openspaceProc.pagingBox("list.do", search_count, nowPage, word, search);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);
    // System.out.println(session.getAttribute("admin"));
    
    if(session.getAttribute("admin") == null) {
      mav.setViewName("/openspace/title_list_page_m");
    } else {
      mav.setViewName("/openspace/title_list_page");   
    }
    
    return mav;
  }    
  
  /**
   * 출력 모드의 변경
   * @param cateVO
   * @return
   */
  @RequestMapping(value="/openspace/update_visible.do", 
      method=RequestMethod.GET )
  public ModelAndView update_visible(OpenspaceVO openspaceVO) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.openspaceProc.update_visible(openspaceVO);
    mav.addObject("cnt", cnt); // request에 저장
    
      mav.setViewName("redirect:/openspace/list.do"); // request 객체가 전달이 안됨. 

    return mav;
  }  
  
 

}
