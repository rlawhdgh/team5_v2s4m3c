package dev.mvc.index_img;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.index_img.Contents1;
import dev.mvc.openspace.OpenspaceVO;
import dev.mvc.openspace_img.Openspace_imgVO;

@Component("dev.mvc.index_img.Index_imgProc")
public class Index_imgProc implements Index_imgProcInter{
  @Autowired
  private Index_imgDAOInter Index_imgDAO;

  @Override
  public int create(Index_imgVO index_imgVO) {
    int cnt = this.Index_imgDAO.create(index_imgVO);
    return cnt;
  }

  @Override
  public List<Index_imgVO> list() {
    List<Index_imgVO> list = this.Index_imgDAO.list();
    return list;
  }

  @Override
  public List<Index_imgVO> list_main() {
    List<Index_imgVO> list = this.Index_imgDAO.list_main();
    return list;
  }

  @Override
  public List<Index_imgVO> list_event() {
    List<Index_imgVO> list = this.Index_imgDAO.list_event();
    return list;
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
  public String pagingBox(String listFile, int search_count, int nowPage){ 
    //페이징 알고리즘
    int totalPage = (int)(Math.ceil((double)search_count/Contents1.RECORD_PER_PAGE)); // 전체 페이지  
    int totalGrp = (int)(Math.ceil((double)totalPage/Contents1.PAGE_PER_BLOCK));// 전체 그룹 
    int nowGrp = (int)(Math.ceil((double)nowPage/Contents1.PAGE_PER_BLOCK));    // 현재 그룹 
    int startPage = ((nowGrp - 1) * Contents1.PAGE_PER_BLOCK) + 1; // 특정 그룹의 페이지 목록 시작  
    int endPage = (nowGrp * Contents1.PAGE_PER_BLOCK);             // 특정 그룹의 페이지 목록 종료   
     
    StringBuffer str = new StringBuffer(); 
     //버튼 css
    str.append("<style type='text/css'>"); 
    // #은 아이디로 .은 클래스로
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
    str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}"); 
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
    str.append("  .span_box_1{"); 
    str.append("    text-align: center;");    
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
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
    str.append("    border-color: #cccccc;"); 
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
    int _nowPage = (nowGrp-1) * Contents1.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&nowPage="+_nowPage+"'>이전</A></span>"); 
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
        str.append("<span class='span_box_1'><A href='"+listFile+"?&nowPage="+i+"'>"+i+"</A></span>");   
      } 
    } 
 
    // 10개 다음 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // 현재 1그룹일 경우: (1 * 10) + 1 = 2그룹의 시작페이지11
    // 현재 2그룹일 경우: (2 * 10) + 1 = 3그룹의 시작페이지21
    _nowPage = (nowGrp * Contents1.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&nowPage="+_nowPage+"'>다음</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }
 
 
  @Override  
  public List<Index_imgVO> list_by_paging(HashMap<String, Object> map) {
    /* 
    페이지에서 출력할 시작 레코드 번호 계산 기준값, nowPage는 1부터 시작
    1 페이지: nowPage = 1, (1 - 1) * 10 --> 0 
    2 페이지: nowPage = 2, (2 - 1) * 10 --> 10
    3 페이지: nowPage = 3, (3 - 1) * 10 --> 20
    */
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * Contents1.RECORD_PER_PAGE;
   
    // 시작 rownum, 1 페이지: 1 / 2 페이지: 11 / 3 페이지: 21 
    int startNum = beginOfPage + 1; 
    //  종료 rownum, 1 페이지: 10 / 2 페이지: 20 / 3 페이지: 30
    int endNum = beginOfPage + Contents1.RECORD_PER_PAGE;   
    /*
    1 페이지: WHERE r >= 1 AND r <= 10
    2 페이지: WHERE r >= 11 AND r <= 20
    3 페이지: WHERE r >= 21 AND r <= 30
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
   
    List<Index_imgVO> list = Index_imgDAO.list_by_paging(map);
    
    return list;
  }

  @Override
  public int delete(int index_img_no) {
    int cnt = this.Index_imgDAO.delete(index_img_no);
    return cnt;
  }

  @Override
  public Index_imgVO read(int index_img_no) {
    Index_imgVO index_imgVO = this.Index_imgDAO.read(index_img_no);
    return index_imgVO;
  }

  @Override
  public int update(Index_imgVO index_imgVO) {
    int cnt = this.Index_imgDAO.update(index_imgVO);
    return cnt;
  }

  
  
  
  
  
  
  

}
