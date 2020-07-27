package dev.mvc.openspace;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


import dev.mvc.tool.Tool;

@Component("dev.mvc.openspace.OpenspaceProc")
public class OpenspaceProc implements OpenspaceProcInter {
  @Autowired
  private OpenspaceDAOInter OpenspaceDAO;

  @Override
  public int create(OpenspaceVO openspaceVO) {
    int cnt = this.OpenspaceDAO.create(openspaceVO);

    return cnt;
  }

  @Override
  public List<OpenspaceVO> list(HashMap<String, Object> map) {
    List<OpenspaceVO> list = this.OpenspaceDAO.list(map);
    return list;
  }

  @Override
  public OpenspaceVO read(int openspace_no) {
    OpenspaceVO openspaceVO = this.OpenspaceDAO.read(openspace_no);    
    
    
    // String content = openspaceVO.getOpenspace_content();
    // content = Tool.convertChar(content); 
    // openspaceVO.setOpenspace_content(content);
    return openspaceVO;
  }

  @Override
  public int cnt_up(int openspace_no) {
    int cnt = this.OpenspaceDAO.cnt_up(openspace_no);
    return cnt;
  }
  
  @Override
  public OpenspaceVO update_read(int openspace_no) {
    OpenspaceVO openspaceVO = this.OpenspaceDAO.read(openspace_no);
    return openspaceVO;
    
  }

  @Override
  public int update(OpenspaceVO openspaceVO) {
    int cnt = this.OpenspaceDAO.update(openspaceVO);
    return cnt;
  }

  @Override
  public int delete(int openspace_no) {
    int cnt = this.OpenspaceDAO.delete(openspace_no);
    return cnt;
  }

  @Override
  public OpenspaceVO read_up_down(HashMap<String, Object> map) {
    OpenspaceVO openspaceVO = this.OpenspaceDAO.read_up_down(map);
    return openspaceVO;
  }

  @Override
  public List<OpenspaceVO> title_list(String word) {
    List<OpenspaceVO> list = this.OpenspaceDAO.title_list(word);
    return list;
  }

  @Override
  public List<OpenspaceVO> content_list(String word) {
    List<OpenspaceVO> list = this.OpenspaceDAO.content_list(word);
    return list;
  }

  @Override
  public List<OpenspaceVO> title_content_list(String word) {
    List<OpenspaceVO> list = this.OpenspaceDAO.title_content_list(word);
    return list;
  }

  @Override
  public int total_count() {
    int cnt = this.OpenspaceDAO.total_count();
    return cnt;
    
  }
  
  @Override
  public int search_count(HashMap<String, Object> hashMap) {
    int count = this.OpenspaceDAO.search_count(hashMap);
    return count;
  }
  
  
  
  /** 
   * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
   * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
   *
   * @param listFile 목록 파일명 
   * @param categrpno 카테고리번호 
   * @param search_count 검색(전체) 레코드수 
   * @param nowPage     현재 페이지
   * @param word 검색어
   * @return 페이징 생성 문자열
   */ 
  @Override
  public String pagingBox(String listFile, int search_count, int nowPage, String word, String search){ 
    //페이징 알고리즘
    int totalPage = (int)(Math.ceil((double)search_count/Contents.RECORD_PER_PAGE)); // 전체 페이지  
    int totalGrp = (int)(Math.ceil((double)totalPage/Contents.PAGE_PER_BLOCK));// 전체 그룹 
    int nowGrp = (int)(Math.ceil((double)nowPage/Contents.PAGE_PER_BLOCK));    // 현재 그룹 
    int startPage = ((nowGrp - 1) * Contents.PAGE_PER_BLOCK) + 1; // 특정 그룹의 페이지 목록 시작  
    int endPage = (nowGrp * Contents.PAGE_PER_BLOCK);             // 특정 그룹의 페이지 목록 종료   
     
    StringBuffer str = new StringBuffer(); 
     //버튼 css
    str.append("<style type='text/css'>"); 
    // #은 아이디로 .은 클래스로
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
    str.append("  #paging A:link {text-decoration:none; color:#c7d5e0; font-size: 1em;}"); 
    str.append("  #paging A:hover{text-decoration:none; background-color: #668db4; color:#c7d5e0; font-size: 1em;}"); 
    str.append("  #paging A:visited {text-decoration:none; font-size: 1em;}"); 
    str.append("  .span_box_1{"); 
    str.append("    text-align: center;");    
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc; "); 
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("  }"); 
    str.append("  .span_box_2{"); 
    str.append("    text-align: center;");    
    str.append("    background-color: #668db4;"); 
    str.append("    color: #FFFFFF;"); 
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc; "); 
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("  }"); 
    str.append("</style>"); 
    str.append("<DIV id='paging'>"); 
//    str.append("현재 페이지: " + nowPage + " / " + totalPage + "  "); 
 
    // 이전 10개 페이지로 이동 이전 그룹의 마지막페이지
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // 현재 2그룹일 경우: (2 - 1) * 10 = 1그룹의 마지막 페이지10
    // 현재 3그룹일 경우: (3 - 1) * 10 = 2그룹의 마지막 페이지20
    int _nowPage = (nowGrp-1) * Contents.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?search="+search+"&word="+word+"&nowPage="+_nowPage+"'>이전</A></span>"); 
    } 
 
    //중앙의 페이지 목록
    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){  // 마지막 페이지를 넘어갔다면 페이지 출력 종료
        break; 
      } 
  
      if (nowPage == i){  //페이지가 현재페이지와 같다면 css 강조(차별을 둠) 이동할 필요가 없음
        str.append("<span class='span_box_2'>"+i+"</span>"); // 현재 페이지, 강조 
      }else{
        // 현재 페이지가 아닌 페이지는 이동이 가능하도록 링크 설정
        str.append("<span class=''><A class='span_box_1' href='"+listFile+"?search="+search+"&word="+word+"&nowPage="+i+"'>"+i+"</A></span>");   
      } 
    } 
 
    // 10개 다음 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // 현재 1그룹일 경우: (1 * 10) + 1 = 2그룹의 시작페이지11
    // 현재 2그룹일 경우: (2 * 10) + 1 = 3그룹의 시작페이지21
    _nowPage = (nowGrp * Contents.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class=''><A class='span_box_1' href='"+listFile+"?&word="+word+"&nowPage="+_nowPage+"'>다음</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }
 
 
  @Override  
  public List<OpenspaceVO> list_by_search_paging(HashMap<String, Object> map) {
    /* 
    페이지에서 출력할 시작 레코드 번호 계산 기준값, nowPage는 1부터 시작
    1 페이지: nowPage = 1, (1 - 1) * 10 --> 0 
    2 페이지: nowPage = 2, (2 - 1) * 10 --> 10
    3 페이지: nowPage = 3, (3 - 1) * 10 --> 20
    */
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * Contents.RECORD_PER_PAGE;
   
    // 시작 rownum, 1 페이지: 1 / 2 페이지: 11 / 3 페이지: 21 
    int startNum = beginOfPage + 1; 
    //  종료 rownum, 1 페이지: 10 / 2 페이지: 20 / 3 페이지: 30
    int endNum = beginOfPage + Contents.RECORD_PER_PAGE;   
    /*
    1 페이지: WHERE r >= 1 AND r <= 10
    2 페이지: WHERE r >= 11 AND r <= 20
    3 페이지: WHERE r >= 21 AND r <= 30
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
   
    List<OpenspaceVO> list = OpenspaceDAO.list_by_search_paging(map);

    
    return list;
  }

  @Override
  public int update_visible(OpenspaceVO openspaceVO) {
    int cnt = 0;
    if (openspaceVO.getOpenspace_visible().toUpperCase().equals("Y")) {
      openspaceVO.setOpenspace_visible("N");
    } else {
      openspaceVO.setOpenspace_visible("Y");
    }
    cnt = this.OpenspaceDAO.update_visible(openspaceVO);
    return cnt;
  }

  @Override
  public List<OpenspaceVO> consumer_openspace_list(int consumer_no) {
    List<OpenspaceVO> list = OpenspaceDAO.consumer_openspace_list(consumer_no);
    return list;
  }


  
  
  

}
