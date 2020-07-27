package dev.mvc.point;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.point.PointProc")
public class PointProc implements PointProcInter {
    @Autowired  // DI, Spring framework이 자동 구현한 DAO가 자동 할당됨.
    private PointDAOInter pointDAO;

    @Override
    public int create(PointVO pointVO) {
      int cnt = 0;
      cnt = this.pointDAO.create(pointVO);
      return cnt;
    }

    @Override
    public List<PointVO> list_all() {
      List<PointVO> list = null;
      list = this.pointDAO.list_all();
      return list;
    }

    @Override
    public int update_point(PointVO pointVO) {
      int cnt = 0;
      cnt = this.pointDAO.update_point(pointVO);
      return cnt;
    }

    @Override
    public PointVO read(int consumer_no) {
      PointVO pointVO = null;
      pointVO = this.pointDAO.read(consumer_no);
      return pointVO;
    }
    
    
    
    
    
    
    

}
