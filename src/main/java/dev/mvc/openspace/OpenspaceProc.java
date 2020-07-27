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
   * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
   * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
   *
   * @param listFile ��� ���ϸ� 
   * @param categrpno ī�װ���ȣ 
   * @param search_count �˻�(��ü) ���ڵ�� 
   * @param nowPage     ���� ������
   * @param word �˻���
   * @return ����¡ ���� ���ڿ�
   */ 
  @Override
  public String pagingBox(String listFile, int search_count, int nowPage, String word, String search){ 
    //����¡ �˰���
    int totalPage = (int)(Math.ceil((double)search_count/Contents.RECORD_PER_PAGE)); // ��ü ������  
    int totalGrp = (int)(Math.ceil((double)totalPage/Contents.PAGE_PER_BLOCK));// ��ü �׷� 
    int nowGrp = (int)(Math.ceil((double)nowPage/Contents.PAGE_PER_BLOCK));    // ���� �׷� 
    int startPage = ((nowGrp - 1) * Contents.PAGE_PER_BLOCK) + 1; // Ư�� �׷��� ������ ��� ����  
    int endPage = (nowGrp * Contents.PAGE_PER_BLOCK);             // Ư�� �׷��� ������ ��� ����   
     
    StringBuffer str = new StringBuffer(); 
     //��ư css
    str.append("<style type='text/css'>"); 
    // #�� ���̵�� .�� Ŭ������
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
    str.append("    border-color: #cccccc; "); 
    str.append("    padding:1px 6px 1px 6px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("    margin:1px 2px 1px 2px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("  }"); 
    str.append("</style>"); 
    str.append("<DIV id='paging'>"); 
//    str.append("���� ������: " + nowPage + " / " + totalPage + "  "); 
 
    // ���� 10�� �������� �̵� ���� �׷��� ������������
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 2�׷��� ���: (2 - 1) * 10 = 1�׷��� ������ ������10
    // ���� 3�׷��� ���: (3 - 1) * 10 = 2�׷��� ������ ������20
    int _nowPage = (nowGrp-1) * Contents.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?search="+search+"&word="+word+"&nowPage="+_nowPage+"'>����</A></span>"); 
    } 
 
    //�߾��� ������ ���
    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){  // ������ �������� �Ѿ�ٸ� ������ ��� ����
        break; 
      } 
  
      if (nowPage == i){  //�������� ������������ ���ٸ� css ����(������ ��) �̵��� �ʿ䰡 ����
        str.append("<span class='span_box_2'>"+i+"</span>"); // ���� ������, ���� 
      }else{
        // ���� �������� �ƴ� �������� �̵��� �����ϵ��� ��ũ ����
        str.append("<span class=''><A class='span_box_1' href='"+listFile+"?search="+search+"&word="+word+"&nowPage="+i+"'>"+i+"</A></span>");   
      } 
    } 
 
    // 10�� ���� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 1�׷��� ���: (1 * 10) + 1 = 2�׷��� ����������11
    // ���� 2�׷��� ���: (2 * 10) + 1 = 3�׷��� ����������21
    _nowPage = (nowGrp * Contents.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class=''><A class='span_box_1' href='"+listFile+"?&word="+word+"&nowPage="+_nowPage+"'>����</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }
 
 
  @Override  
  public List<OpenspaceVO> list_by_search_paging(HashMap<String, Object> map) {
    /* 
    ���������� ����� ���� ���ڵ� ��ȣ ��� ���ذ�, nowPage�� 1���� ����
    1 ������: nowPage = 1, (1 - 1) * 10 --> 0 
    2 ������: nowPage = 2, (2 - 1) * 10 --> 10
    3 ������: nowPage = 3, (3 - 1) * 10 --> 20
    */
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * Contents.RECORD_PER_PAGE;
   
    // ���� rownum, 1 ������: 1 / 2 ������: 11 / 3 ������: 21 
    int startNum = beginOfPage + 1; 
    //  ���� rownum, 1 ������: 10 / 2 ������: 20 / 3 ������: 30
    int endNum = beginOfPage + Contents.RECORD_PER_PAGE;   
    /*
    1 ������: WHERE r >= 1 AND r <= 10
    2 ������: WHERE r >= 11 AND r <= 20
    3 ������: WHERE r >= 21 AND r <= 30
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
