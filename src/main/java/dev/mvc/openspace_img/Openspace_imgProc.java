package dev.mvc.openspace_img;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.openspace_img.Openspace_imgProc")
public class Openspace_imgProc implements Openspace_imgProcInter {
  @Autowired
  private Openspace_imgDAOInter Openspace_imgDAO;

  @Override
  public int create(Openspace_imgVO openspace_imgVO) {
    int cnt = this.Openspace_imgDAO.create(openspace_imgVO);
    return cnt;
  }

  @Override
  public List<Openspace_imgVO> list_by_openspace(int openspace_no) {
    List<Openspace_imgVO> list = this.Openspace_imgDAO.list_by_openspace(openspace_no);
    return list;
  }

  @Override
  public int delete(int openspace_img_no) {
    int cnt = this.Openspace_imgDAO.delete(openspace_img_no);    
    return cnt;
  }
  
  @Override
  public int delete_all(int openspace_no) {
    int cnt = this.Openspace_imgDAO.delete_all(openspace_no);
    return cnt;
  }

  @Override
  public Openspace_imgVO read(int openspace_img_no) {
    Openspace_imgVO openspace_imgVO = this.Openspace_imgDAO.read(openspace_img_no);
    return openspace_imgVO;
  }

}
