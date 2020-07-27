package dev.mvc.save;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;








@Component("dev.mvc.save.SaveProc")
public class SaveProc implements SaveProcInter {
  @Autowired  // DI, Spring framework이 자동 구현한 DAO가 자동 할당됨.
  private SaveDAOInter saveDAO;

  @Override
  public int create(SaveVO saveVO) {
    int cnt = 0;
    cnt = this.saveDAO.create(saveVO);
    return cnt;
  }
  @Override
  public SaveVO read(int makeno) {
    SaveVO saveVO = null;
    saveVO = this.saveDAO.read(makeno);
    
    return saveVO;
  }
  @Override
  public SaveVO update(int makeno) {
    SaveVO saveVO = this.saveDAO.read(makeno);
    
    return saveVO;
  }
  
  @Override
  public List<SaveVO> survey_list_all() {
    List<SaveVO> list = this.saveDAO.survey_list_all();
    return list;
  }
  @Override
  public int update(SaveVO saveVO) {
    int cnt = 0;
    cnt = this.saveDAO.update(saveVO);
    return cnt;
}
  public int passwd_check(HashMap hashMap) {
    int survey_passwd_cnt = 0;
    survey_passwd_cnt = this.saveDAO.passwd_check(hashMap);
    return survey_passwd_cnt;
  }
  @Override
  public int delete(int makeno) {
    int cnt = 0;
    cnt = this.saveDAO.delete(makeno);
    return cnt;
  }
  @Override
  public int search_count(HashMap<String, Object> hashMap) {
  int cnt = 0;
  cnt = this.saveDAO.search_count(hashMap);
  return cnt;
}

  @Override
  public List<SaveVO> list(int makeno) {
    List<SaveVO> list = this.saveDAO.list(makeno);
    return list;
  }
  @Override
  public List<SaveVO> list_by_survey_cateno_search(HashMap<String, Object> hashMap) {
    List<SaveVO> list = this.saveDAO.list_by_survey_cateno_search(hashMap);
    return list;
  }
  @Override
  public String pagingBox(String listFile, int survey_cateno, int search_count, int nowPage, String word){ 
     int totalPage = (int)(Math.ceil((double)search_count/Save.RECORD_PER_PAGE)); // 전체 페이지  
    int totalGrp = (int)(Math.ceil((double)totalPage/Save.PAGE_PER_BLOCK));// 전체 그룹 
    int nowGrp = (int)(Math.ceil((double)nowPage/Save.PAGE_PER_BLOCK));    // 현재 그룹 
    int startPage = ((nowGrp - 1) * Save.PAGE_PER_BLOCK) + 1; // 특정 그룹의 페이지 목록 시작  
    int endPage = (nowGrp * Save.PAGE_PER_BLOCK);             // 특정 그룹의 페이지 목록 종료   
     
    StringBuffer str = new StringBuffer(); 
     
    str.append("<style type='text/css'>"); 
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
 
    // 이전 10개 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // 현재 2그룹일 경우: (2 - 1) * 10 = 1그룹의 마지막 페이지 10
    // 현재 3그룹일 경우: (3 - 1) * 10 = 2그룹의 마지막 페이지 20
    int _nowPage = (nowGrp-1) * Save.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&word="+word+"&nowPage="+_nowPage+"&survey_cateno="+survey_cateno+"'>이전</A></span>"); 
    } 
 
    // 중앙의 페이지 목록
    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){ // 마지막 페이지를 넘어갔다면 페이 출력 종료
        break; 
      } 
  
      if (nowPage == i){ // 페이지가 현재페이지와 같다면 CSS 강조(차별을 둠)
        str.append("<span class='span_box_2'>"+i+"</span>"); // 현재 페이지, 강조 
      }else{
        // 현재 페이지가 아닌 페이지는 이동이 가능하도록 링크를 설정
        str.append("<span class='span_box_1'><A href='"+listFile+"?word="+word+"&nowPage="+i+"&survey_cateno="+survey_cateno+"'>"+i+"</A></span>");   
      } 
    } 
 
    // 10개 다음 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // 현재 1그룹일 경우: (1 * 10) + 1 = 2그룹의 시작페이지 11
    // 현재 2그룹일 경우: (2 * 10) + 1 = 3그룹의 시작페이지 21
    _nowPage = (nowGrp * Save.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&word="+word+"&nowPage="+_nowPage+"&survey_cateno="+survey_cateno+"'>다음</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }
 
 
  @Override
  public List<SaveVO> list_by_survey_cateno_search_paging(HashMap<String, Object> map) {
    /* 
    페이지에서 출력할 시작 레코드 번호 계산 기준값, nowPage는 1부터 시작
    1 페이지: nowPage = 1, (1 - 1) * 10 --> 0 
    2 페이지: nowPage = 2, (2 - 1) * 10 --> 10
    3 페이지: nowPage = 3, (3 - 1) * 10 --> 20
    */
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * Save.RECORD_PER_PAGE;
   
    // 시작 rownum
    // 1 페이지 = 0 + 1, 2 페이지 = =10 + 1, 3 페이지 =  20 + 1 
    int startNum = beginOfPage + 1; 
    //  종료 rownum
    // 1 페이지 = 0 + 10, 2 페이지 = 0 +20, 3 페이지 =  0+ 30
    int endNum = beginOfPage + Save.RECORD_PER_PAGE;   
    /*
    1 페이지: WHERE r >= 1 AND r <= 10
    2 페이지: WHERE r >= 11 AND r <= 20
    3 페이지: WHERE r >= 21 AND r <= 30
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
   
    List<SaveVO> list = saveDAO.list_by_survey_cateno_search_paging(map);
    
    return list;
  }
  
}
