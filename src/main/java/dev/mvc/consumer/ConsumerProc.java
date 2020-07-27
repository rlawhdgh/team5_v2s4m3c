package dev.mvc.consumer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;




@Component("dev.mvc.consumer.ConsumerProc")
public class ConsumerProc implements ConsumerProcInter{
  @Autowired
  private ConsumerDAOInter consumerDAO;

  @Override
  public int checkName(String consumer_name) {
    int cnt = this.consumerDAO.checkName(consumer_name);
    return cnt;
  }
  
  @Override
  public int matchNameEmail(HashMap hashmap) {
    int cnt = this.consumerDAO.matchNameEmail(hashmap);
    return cnt;
  }
  
  @Override
  public int matchIdEmail(HashMap hashmap) {
    int cnt = this.consumerDAO.matchIdEmail(hashmap);
    return cnt;
  }
  
  @Override
  public int checkID(String consumer_id) {
   int cnt = 0;
   cnt = this.consumerDAO.checkID(consumer_id);
   return cnt;
  }
  
  @Override
  public int checkEmail(String consumer_email) {
   int cnt = 0;
   cnt = this.consumerDAO.checkEmail(consumer_email);
   return cnt;
  }
  
  @Override
  public int create(ConsumerVO consumerVO) {
    int cnt = this.consumerDAO.create(consumerVO);
    return cnt;
  }

  @Override
  public List<ConsumerVO> list() {
    List<ConsumerVO> list = this.consumerDAO.list();
    return list;
  }
  
  @Override
  public List<Consumer_grade_nameVO> list_grade_name() {
    List<Consumer_grade_nameVO> list = this.consumerDAO.list_grade_name();
    return list;
  }
  
  @Override
  public List<Consumer_statistics_ageVO> age_cnt() {
    List<Consumer_statistics_ageVO> age_list = this.consumerDAO.age_cnt();
    return age_list;
  }
  
  @Override
  public List<Consumer_statistics_game_tendVO> game_tend_cnt() {
    List<Consumer_statistics_game_tendVO> game_tend_list = this.consumerDAO.game_tend_cnt();
    return game_tend_list;
  }

  @Override
  public ConsumerVO read(int consumer_no) {
    ConsumerVO consumerVO = this.consumerDAO.read(consumer_no);
    return consumerVO;
  }
  
  @Override
  public int update_profile(HashMap hashmap) {
    int cnt = this.consumerDAO.update_profile(hashmap);
    return cnt;
  }
  
  @Override
  public int update_contact(HashMap hashmap) {
    int cnt = this.consumerDAO.update_contact(hashmap);
    return cnt;
  }

  @Override
  public int update_paynum(HashMap hashmap) {
    int cnt = this.consumerDAO.update_paynum(hashmap);
    return cnt;
  }
  
  @Override
  public int update_passwd(HashMap hashmap) {
    int cnt = this.consumerDAO.update_passwd(hashmap);
    return cnt;
  }
  
  @Override
  public int delete(HashMap hashmap) {
    int cnt = this.consumerDAO.delete(hashmap);
    return cnt;
  }

  @Override
  public int alter_userKey(String consumer_id, String key) {
    this.consumerDAO.alter_userKey(consumer_id, key);
    return 0;
  }

  @Override
  public int login(Map map) {
    int cnt = this.consumerDAO.login(map);
    return cnt;
  }

  @Override
  public ConsumerVO readById(String id) {
    ConsumerVO consumerVO = this.consumerDAO.readById(id);
    return consumerVO;
  }
  
  public boolean isMember(HttpSession session){
    boolean sw = false;
    
    String consumer_id = (String)session.getAttribute("consumer_id");
    
    if (consumer_id != null){ // �α��� �ߴٸ�
      sw = true;
    }
    return sw;
  }

  @Override
  public String readByEmail(String consumer_email) {
    String id  = this.consumerDAO.readByEmail(consumer_email);
    return id;
  }

  
  /** 
   * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
   * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
   *
   * @param listFile ��� ���ϸ� 
   * @param search_count �˻�(��ü) ���ڵ�� 
   * @param nowPage     ���� ������
   * @param word �˻���
   * @return ����¡ ���� ���ڿ�
   */ 
  @Override
  public String pagingBox(String listFile, int search_count, int nowPage, String word){ 
    int totalPage = (int)(Math.ceil((double)search_count/Consumer_Static_page.RECORD_PER_PAGE)); // ��ü ������  
    int totalGrp = (int)(Math.ceil((double)totalPage/Consumer_Static_page.PAGE_PER_BLOCK));// ��ü �׷� 
    int nowGrp = (int)(Math.ceil((double)nowPage/Consumer_Static_page.PAGE_PER_BLOCK));    // ���� �׷� 
    int startPage = ((nowGrp - 1) * Consumer_Static_page.PAGE_PER_BLOCK) + 1; // Ư�� �׷��� ������ ��� ����  
    int endPage = (nowGrp * Consumer_Static_page.PAGE_PER_BLOCK);             // Ư�� �׷��� ������ ��� ����   
     
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
//    str.append("���� ������: " + nowPage + " / " + totalPage + "  "); 
 
    // ���� 10�� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page)
    // nowGrp: 2 (11 ~ 20 page)
    // nowGrp: 3 (21 ~ 30 page) 
    // ���� 2�׷��� ���: (2 - 1) * 10 = 1�׷��� ������ ������ 10
    // ���� 3�׷��� ���: (3 - 1) * 10 = 2�׷��� ������ ������ 20
    int _nowPage = (nowGrp-1) * Consumer_Static_page.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&word="+word+"&nowPage="+_nowPage+"'>����</A></span>"); 
    } 
 
    // �߾��� ������ ���
    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){ // ������ �������� �Ѿ�ٸ� ���� ��� ����
        break; 
      } 
  
      if (nowPage == i){ // �������� ������������ ���ٸ� CSS ����(������ ��)
        str.append("<span class='span_box_2'>"+i+"</span>"); // ���� ������, ���� 
      }else{
        // ���� �������� �ƴ� �������� �̵��� �����ϵ��� ��ũ�� ����
        str.append("<span class='span_box_1'><A href='"+listFile+"?word="+word+"&nowPage="+i+"'>"+i+"</A></span>");   
      } 
    } 
 
    // 10�� ���� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 1�׷��� ���: (1 * 10) + 1 = 2�׷��� ���������� 11
    // ���� 2�׷��� ���: (2 * 10) + 1 = 3�׷��� ���������� 21
    _nowPage = (nowGrp * Consumer_Static_page.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&word="+word+"&nowPage="+_nowPage+"'>����</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }
 
  @Override
  public List<ConsumerVO> list_by_search_paging(HashMap<String, Object> map) {
    /* 
    ���������� ����� ���� ���ڵ� ��ȣ ��� ���ذ�, nowPage�� 1���� ����
    1 ������: nowPage = 1, (1 - 1) * 10 --> 0 
    2 ������: nowPage = 2, (2 - 1) * 10 --> 10
    3 ������: nowPage = 3, (3 - 1) * 10 --> 20
    */
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * Consumer_Static_page.RECORD_PER_PAGE;
   
    // ���� rownum
    // 1 ������ = 0 + 1, 2 ������ = 10 + 1, 3 ������ = 20 + 1 
    int startNum = beginOfPage + 1; 
    //  ���� rownum
    // 1 ������ = 0 + 10, 2 ������ = 0 + 20, 3 ������ = 0 + 30
    int endNum = beginOfPage + Consumer_Static_page.RECORD_PER_PAGE;   
    /*
    1 ������: WHERE r >= 1 AND r <= 10
    2 ������: WHERE r >= 11 AND r <= 20
    3 ������: WHERE r >= 21 AND r <= 30
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
   
    List<ConsumerVO> list = this.consumerDAO.list_by_search_paging(map);
    
    return list;
  }

  @Override
  public int search_count(HashMap<String, Object> hashMap) {
    int count = consumerDAO.search_count(hashMap);
    return count;
  }

  @Override
  public int update_grade_no(int consumer_no) {
    int cnt = this.consumerDAO.update_grade_no(consumer_no);
    return cnt;
  }

  @Override
  public int update_grade_no_down(int consumer_no) {
    int cnt = this.consumerDAO.update_grade_no_down(consumer_no);
    return cnt;
  }






  







}
