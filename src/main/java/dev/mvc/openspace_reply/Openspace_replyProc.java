package dev.mvc.openspace_reply;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.openspace.Contents;
import dev.mvc.openspace.OpenspaceVO;



@Component("dev.mvc.openspace_reply.Openspace_replyProc")
public class Openspace_replyProc implements Openspace_replyProcInter{
  @Autowired
  private Openspace_replyDAOInter openspace_replyDAO;

  @Override
  public int create(Openspace_replyVO openspace_replyVO) {
    int cnt = this.openspace_replyDAO.create(openspace_replyVO);
    return cnt;
  }
 
  @Override  
  public List<Openspace_replyVO> reply_list_paging(HashMap<String, Object> map) {
    int recprd_per_page =5;
    //nowPage 는 1부터 시작
     int beginOfPage = ((Integer)map.get("replyPage") - 1) * recprd_per_page; // 한페이지당 2건
     int startNum = 1; 
     int endNum = beginOfPage + recprd_per_page; // 한페이지당 2건  
     
     map.put("startNum", startNum);
     map.put("endNum", endNum);
    List<Openspace_replyVO> list = openspace_replyDAO.reply_list_paging(map);   
    return list;
  }

  @Override
  public List<Openspace_replyVO> list(int openspace_no) {
    List<Openspace_replyVO>list = this.openspace_replyDAO.list(openspace_no);
    return list;
  }

  @Override
  public int update(Openspace_replyVO openspace_replyVO) {
    int cnt = this.openspace_replyDAO.update(openspace_replyVO);
    return cnt;
  }

  @Override
  public int delete(int openspace_reply_no) {
    int cnt = this.openspace_replyDAO.delete(openspace_reply_no);
    return cnt;
  }

  @Override
  public int delete_all(int openspace_no) {
    int cnt = this.openspace_replyDAO.delete_all(openspace_no);
    return cnt;
  }

  @Override
  public List<Openspace_replyVO> consumer_list(int consumer_no) {
    List<Openspace_replyVO>list = this.openspace_replyDAO.consumer_list(consumer_no);
    return list;
  }


}
