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
  public String pagingBox(String listFile, int search_count, int nowPage){ 
    //����¡ �˰���
    int totalPage = (int)(Math.ceil((double)search_count/Contents1.RECORD_PER_PAGE)); // ��ü ������  
    int totalGrp = (int)(Math.ceil((double)totalPage/Contents1.PAGE_PER_BLOCK));// ��ü �׷� 
    int nowGrp = (int)(Math.ceil((double)nowPage/Contents1.PAGE_PER_BLOCK));    // ���� �׷� 
    int startPage = ((nowGrp - 1) * Contents1.PAGE_PER_BLOCK) + 1; // Ư�� �׷��� ������ ��� ����  
    int endPage = (nowGrp * Contents1.PAGE_PER_BLOCK);             // Ư�� �׷��� ������ ��� ����   
     
    StringBuffer str = new StringBuffer(); 
     //��ư css
    str.append("<style type='text/css'>"); 
    // #�� ���̵�� .�� Ŭ������
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
//    str.append("���� ������: " + nowPage + " / " + totalPage + "  "); 
 
    // ���� 10�� �������� �̵� ���� �׷��� ������������
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 2�׷��� ���: (2 - 1) * 10 = 1�׷��� ������ ������10
    // ���� 3�׷��� ���: (3 - 1) * 10 = 2�׷��� ������ ������20
    int _nowPage = (nowGrp-1) * Contents1.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&nowPage="+_nowPage+"'>����</A></span>"); 
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
        str.append("<span class='span_box_1'><A href='"+listFile+"?&nowPage="+i+"'>"+i+"</A></span>");   
      } 
    } 
 
    // 10�� ���� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 1�׷��� ���: (1 * 10) + 1 = 2�׷��� ����������11
    // ���� 2�׷��� ���: (2 * 10) + 1 = 3�׷��� ����������21
    _nowPage = (nowGrp * Contents1.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&nowPage="+_nowPage+"'>����</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }
 
 
  @Override  
  public List<Index_imgVO> list_by_paging(HashMap<String, Object> map) {
    /* 
    ���������� ����� ���� ���ڵ� ��ȣ ��� ���ذ�, nowPage�� 1���� ����
    1 ������: nowPage = 1, (1 - 1) * 10 --> 0 
    2 ������: nowPage = 2, (2 - 1) * 10 --> 10
    3 ������: nowPage = 3, (3 - 1) * 10 --> 20
    */
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * Contents1.RECORD_PER_PAGE;
   
    // ���� rownum, 1 ������: 1 / 2 ������: 11 / 3 ������: 21 
    int startNum = beginOfPage + 1; 
    //  ���� rownum, 1 ������: 10 / 2 ������: 20 / 3 ������: 30
    int endNum = beginOfPage + Contents1.RECORD_PER_PAGE;   
    /*
    1 ������: WHERE r >= 1 AND r <= 10
    2 ������: WHERE r >= 11 AND r <= 20
    3 ������: WHERE r >= 21 AND r <= 30
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
