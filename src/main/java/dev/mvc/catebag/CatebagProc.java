package dev.mvc.catebag;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.pay.PayVO;
import dev.mvc.tool.Tool;





@Component("dev.mvc.catebag.CatebagProc")
public class CatebagProc implements CatebagProcInter {
    @Autowired  // DI, Spring framework이 자동 구현한 DAO가 자동 할당됨.
    private CatebagDAOInter catebagDAO;
    
    @Override
    public int read_check(int game_gameno) {
      int cnt = 0;
      cnt = this.catebagDAO.read_check(game_gameno);
      return cnt;
    }

    @Override
    public int delete_check(int game_gameno) {
      int cnt = 0;
      cnt = this.catebagDAO.delete_check(game_gameno);
      return cnt;
    }
       
    @Override
    public int checklist_contentsno(HashMap<String, Object> hashMap) {
      int cnt = 0;
      cnt = this.catebagDAO.checklist_contentsno(hashMap);
      return cnt;
    }
    
    @Override
    public int create(CatebagVO catebagVO) {
      int cnt = 0;
      cnt = this.catebagDAO.create(catebagVO);
      return cnt;
    }
    
    @Override
    public int create2(PayVO payVO) {
      int cnt = 0;
      cnt = this.catebagDAO.create2(payVO);
      return cnt;
    }

    @Override
    public List<CatebagVO> list_all() {
      List<CatebagVO> list = this.catebagDAO.list_all();
      return list;
    }

    @Override
    public int delete(int catebag_catebagno) {
      int cnt = 0;
      cnt = this.catebagDAO.delete(catebag_catebagno);
      return cnt;
    }
    
    @Override
    public int delete2(int catebag_catebagno) {
      int cnt = 0;
      cnt = this.catebagDAO.delete(catebag_catebagno);
      return cnt;
    }

    @Override
    public CatebagVO read(int catebag_catebagno) {
      CatebagVO catebagVO = null;
      catebagVO = this.catebagDAO.read(catebag_catebagno);
      return catebagVO;
    }

    @Override
    public int update_cnt_up(int catebag_catebagno) {
      int cnt = 0; 
      cnt = this.catebagDAO.update_cnt_up(catebag_catebagno);
      return cnt;
    }

    @Override
    public int update_cnt_down(int catebag_catebagno) {
      int cnt = 0;
      cnt = this.catebagDAO.update_cnt_down(catebag_catebagno);
      return cnt;
    }
    
    @Override
    public int update_cnt(int catebag_cnt) {
      int cnt = 0;
      cnt = this.catebagDAO.update_cnt(catebag_cnt);
      return cnt;
    }
    
    @Override
    public List<Game_Catebag_VO> game_catebag_consumer_no_list(int consumer_no) {
      List<Game_Catebag_VO> list = this.catebagDAO.game_catebag_consumer_no_list(consumer_no);

      return list;
    }
    
    
    
    @Override
    public int search_count(HashMap<String, Object> hashMap) {
    int count = catebagDAO.search_count(hashMap);
    return count;
    
    }
    
    @Override
    public List<Game_Catebag_VO> catebag_by_consumer_no_paging(HashMap<String, Object> map) {
      /* 
      페이지에서 출력할 시작 레코드 번호 계산 기준값, nowPage는 1부터 시작
      1 페이지: nowPage = 1, (1 - 1) * 10 --> 0 
      2 페이지: nowPage = 2, (2 - 1) * 10 --> 10
      3 페이지: nowPage = 3, (3 - 1) * 10 --> 20
      */
      int beginOfPage = ((Integer)map.get("nowPage") - 1) * Catebag.RECORD_PER_PAGE;
     
      // 시작 rownum, 
      // 1 페이지= 0 + 1 , 2 페이지 = 10 + 1 , 3 페이지 = 20 + 1 
      int startNum = beginOfPage + 1; 
      //  종료 rownum,
      //1 페이지: 0 + 10, 2 페이지: 0 + 20,  3 페이지: 0+ 30
      int endNum = beginOfPage + Catebag.RECORD_PER_PAGE;   
      /*
      1 페이지: WHERE r >= 1 AND r <= 10
      2 페이지: WHERE r >= 11 AND r <= 20
      3 페이지: WHERE r >= 21 AND r <= 30
      */
      map.put("startNum", startNum);
      map.put("endNum", endNum);
     
      List<Game_Catebag_VO> list = this.catebagDAO.catebag_by_consumer_no_paging(map);
      System.out.println("전페이지 리스트"+list);
      
   // --------------------------------------------------------------
      // 내용중에 100자가 넘어가면 앞부분 100자만 추출
      // --------------------------------------------------------------
      String game_writing = "";
      for (Game_Catebag_VO game_Catebag_VO: list) {
        game_writing = game_Catebag_VO.getGame_writing();
        if (game_writing.length() >= 100) {
          game_writing = Tool.textLength(game_writing, 100);
          game_Catebag_VO.setGame_writing(game_writing);
        }
      }
      // --------------------------------------------------------------    
      
      return list;
    }
    
    /** 
     * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
     * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
     *
     * @param listFile 목록 파일명 
     * @param consumer_no 회원번호 
     * @param nowPage     현재 페이지
     * @return 페이징 생성 문자열
     */ 
    @Override
    public String pagingBox(String listFile, int search_count, int nowPage){ 
      int totalPage = (int)(Math.ceil((double)search_count/Catebag.RECORD_PER_PAGE)); // 전체 페이지  
      int totalGrp = (int)(Math.ceil((double)totalPage/Catebag.PAGE_PER_BLOCK));// 전체 그룹 
      int nowGrp = (int)(Math.ceil((double)nowPage/Catebag.PAGE_PER_BLOCK));    // 현재 그룹 
      int startPage = ((nowGrp - 1) * Catebag.PAGE_PER_BLOCK) + 1; // 특정 그룹의 페이지 목록 시작  
      int endPage = (nowGrp * Catebag.PAGE_PER_BLOCK);             // 특정 그룹의 페이지 목록 종료   
       
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
//      str.append("현재 페이지: " + nowPage + " / " + totalPage + "  "); 
   
      // 이전 10개 페이지로 이동
      // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
      // 현재 2그룹일 경우: (2 - 1) * 10 = 1그룹의  마지막 페이지 10
      // 현재 3그룹일 경우: (3 - 1) * 10 = 2그룹의 마지막 페이지 20
      int _nowPage = (nowGrp-1) * Catebag.PAGE_PER_BLOCK;  
      if (nowGrp >= 2){ 
        str.append("<span class='span_box_1'><A href='"+listFile+"?nowPage="+_nowPage+"'>이전</A></span>"); 
      } 
   
      // 중앙의 페이지 목록
      for(int i=startPage; i<=endPage; i++){ 
        if (i > totalPage){ //마지막 페이지를 넘어갔다면 페이지 출력 종료
          break; 
        } 
    
        if (nowPage == i){ //페이지가 현재 페이지오 ㅏ같다면 CSS 강조(차별을 둔다.)
          str.append("<span class='span_box_2'>"+i+"</span>"); // 현재 페이지, 강조 
        }else{
          // 현재 페이지가 아닌 페이지는 이동이 가능하도록 링크를 설정
          str.append("<span class='span_box_1'><A href='"+listFile+"?nowPage="+i+"'>"+i+"</A></span>");   
        } 
      } 
   
      // 10개 다음 페이지로 이동
      // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
      // 현재 1그룹일 경우: (1 * 10) + 1 = 2그룹의 시작페이지 11
      // 현재 2그룹일 경우: (2 * 10) + 1 = 3그룹의 시작페이지 21
      _nowPage = (nowGrp * Catebag.PAGE_PER_BLOCK)+1;  
      if (nowGrp < totalGrp){ 
        str.append("<span class='span_box_1'><A href='"+listFile+"?nowPage="+_nowPage+"'>다음</A></span>"); 
      } 
      str.append("</DIV>"); 
       
      return str.toString(); 
    }

    @Override
    public Catebag_Pay_VO catebag_pay_read(int catebag_catebagno) {
      Catebag_Pay_VO catebag_Pay_VO = null;
      catebag_Pay_VO = this.catebagDAO.catebag_pay_read(catebag_catebagno);
      return catebag_Pay_VO;
    }
     
}
