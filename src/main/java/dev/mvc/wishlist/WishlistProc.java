package dev.mvc.wishlist;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;


@Component("dev.mvc.wishlist.WishlistProc")
public class WishlistProc implements WishlistProcInter {
    @Autowired  // DI, Spring framework�� �ڵ� ������ DAO�� �ڵ� �Ҵ��.
    private WishlistDAOInter wishlistDAO;
    
    
    @Override
    public int read_check(int game_gameno) {
      int cnt = 0;
      cnt = this.wishlistDAO.read_check(game_gameno);
      return cnt;
    }

    @Override
    public int delete_check(int game_gameno) {
      int cnt = 0;
      cnt = this.wishlistDAO.delete_check(game_gameno);
      return cnt;
    }
        
    @Override
    public int create(WishlistVO wishlistVO) {
      int cnt = 0;
      cnt = this.wishlistDAO.create(wishlistVO);
      return cnt;
    }
    
    
    @Override
    public List<WishlistVO> list_all() {
      List<WishlistVO> list = this.wishlistDAO.list_all();
      return list;
    }

    @Override
    public WishlistVO read(int wishlist_wishlistno) {
      WishlistVO wishlistVO = null; 
      wishlistVO = this.wishlistDAO.read(wishlist_wishlistno);
      return wishlistVO;
    }
    
    @Override
    public int delete(int wishlist_wishlistno) {
      int cnt = 0; 
      cnt = this.wishlistDAO.delete(wishlist_wishlistno);
      return cnt;
    }
    
    @Override
    public int delete2(int wishlist_wishlistno) {
      int cnt = 0; 
      cnt = this.wishlistDAO.delete2(wishlist_wishlistno);
      return cnt;
    }
    
    @Override
    public int delete_consumer(int consumer_no) {
      int cnt = 0;
      cnt = this.wishlistDAO.delete_consumer(consumer_no);
      return cnt;
    }

    @Override
    public List<Game_Wishlist_VO> game_wishlist_consumer_no_list(int consumer_no) {
      List<Game_Wishlist_VO> list = this.wishlistDAO.game_wishlist_consumer_no_list(consumer_no);
      return list;
    }
    
    @Override
    public int search_count(HashMap<String, Object> hashMap) {
    int count = wishlistDAO.search_count(hashMap);
    return count;
    
    }
    @Override
    public List<Game_Wishlist_VO> game_by_consumer_no_paging(HashMap<String, Object> map) {
      /* 
      ���������� ����� ���� ���ڵ� ��ȣ ��� ���ذ�, nowPage�� 1���� ����
      1 ������: nowPage = 1, (1 - 1) * 10 --> 0 
      2 ������: nowPage = 2, (2 - 1) * 10 --> 10
      3 ������: nowPage = 3, (3 - 1) * 10 --> 20
      */
      int beginOfPage = ((Integer)map.get("nowPage") - 1) * Wishlist.RECORD_PER_PAGE;
     
      // ���� rownum, 
      // 1 ������= 0 + 1 , 2 ������ = 10 + 1 , 3 ������ = 20 + 1 
      int startNum = beginOfPage + 1; 
      //  ���� rownum,
      //1 ������: 0 + 10, 2 ������: 0 + 20,  3 ������: 0+ 30
      int endNum = beginOfPage + Wishlist.RECORD_PER_PAGE;   
      /*
      1 ������: WHERE r >= 1 AND r <= 10
      2 ������: WHERE r >= 11 AND r <= 20
      3 ������: WHERE r >= 21 AND r <= 30
      */
      map.put("startNum", startNum);
      map.put("endNum", endNum);
     
      List<Game_Wishlist_VO> list = this.wishlistDAO.game_by_consumer_no_paging(map);
      
   // --------------------------------------------------------------
      // �����߿� 100�ڰ� �Ѿ�� �պκ� 100�ڸ� ����
      // --------------------------------------------------------------
      String game_writing = "";
      for (Game_Wishlist_VO game_Wishlist_VO: list) {
        game_writing = game_Wishlist_VO.getGame_writing();
        if (game_writing.length() >= 100) {
          game_writing = Tool.textLength(game_writing, 100);
          game_Wishlist_VO.setGame_writing(game_writing);
        }
      }
      // --------------------------------------------------------------    
      
      return list;
    }
    
    /** 
     * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
     * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
     *
     * @param listFile ��� ���ϸ� 
     * @param consumer_no ȸ����ȣ 
     * @param nowPage     ���� ������
     * @return ����¡ ���� ���ڿ�
     */ 
    @Override
    public String pagingBox(String listFile, int search_count, int nowPage){ 
      int totalPage = (int)(Math.ceil((double)search_count/Wishlist.RECORD_PER_PAGE)); // ��ü ������  
      int totalGrp = (int)(Math.ceil((double)totalPage/Wishlist.PAGE_PER_BLOCK));// ��ü �׷� 
      int nowGrp = (int)(Math.ceil((double)nowPage/Wishlist.PAGE_PER_BLOCK));    // ���� �׷� 
      int startPage = ((nowGrp - 1) * Wishlist.PAGE_PER_BLOCK) + 1; // Ư�� �׷��� ������ ��� ����  
      int endPage = (nowGrp * Wishlist.PAGE_PER_BLOCK);             // Ư�� �׷��� ������ ��� ����   
       
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
      str.append("    padding:1px 6px 1px 6px; /*��, ������, �Ʒ�, ����*/"); 
      str.append("    margin:1px 2px 1px 2px; /*��, ������, �Ʒ�, ����*/"); 
      str.append("  }"); 
      str.append("  .span_box_2{"); 
      str.append("    text-align: center;");    
      str.append("    background-color: #668db4;"); 
      str.append("    color: #FFFFFF;"); 
      str.append("    font-size: 1em;"); 
      str.append("    border: 1px;"); 
      str.append("    border-style: solid;"); 
      str.append("    border-color: #cccccc;"); 
      str.append("    padding:1px 6px 1px 6px; /*��, ������, �Ʒ�, ����*/"); 
      str.append("    margin:1px 2px 1px 2px; /*��, ������, �Ʒ�, ����*/"); 
      str.append("  }"); 
      str.append("</style>"); 
      str.append("<DIV id='paging'>"); 
//      str.append("���� ������: " + nowPage + " / " + totalPage + "  "); 
   
      // ���� 10�� �������� �̵�
      // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
      // ���� 2�׷��� ���: (2 - 1) * 10 = 1�׷���  ������ ������ 10
      // ���� 3�׷��� ���: (3 - 1) * 10 = 2�׷��� ������ ������ 20
      int _nowPage = (nowGrp-1) * Wishlist.PAGE_PER_BLOCK;  
      if (nowGrp >= 2){ 
        str.append("<span class='span_box_1'><A href='"+listFile+"?nowPage="+_nowPage+"'>����</A></span>"); 
      } 
   
      // �߾��� ������ ���
      for(int i=startPage; i<=endPage; i++){ 
        if (i > totalPage){ //������ �������� �Ѿ�ٸ� ������ ��� ����
          break; 
        } 
    
        if (nowPage == i){ //�������� ���� �������� �����ٸ� CSS ����(������ �д�.)
          str.append("<span class='span_box_2'>"+i+"</span>"); // ���� ������, ���� 
        }else{
          // ���� �������� �ƴ� �������� �̵��� �����ϵ��� ��ũ�� ����
          str.append("<span class='span_box_1'><A href='"+listFile+"?nowPage="+i+"'>"+i+"</A></span>");   
        } 
      } 
   
      // 10�� ���� �������� �̵�
      // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
      // ���� 1�׷��� ���: (1 * 10) + 1 = 2�׷��� ���������� 11
      // ���� 2�׷��� ���: (2 * 10) + 1 = 3�׷��� ���������� 21
      _nowPage = (nowGrp * Wishlist.PAGE_PER_BLOCK)+1;  
      if (nowGrp < totalGrp){ 
        str.append("<span class='span_box_1'><A href='"+listFile+"?nowPage="+_nowPage+"'>����</A></span>"); 
      } 
      str.append("</DIV>"); 
       
      return str.toString(); 
    }
    
  }  

