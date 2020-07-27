package dev.mvc.kind;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.kind.KindProc")
public class KindProc implements KindProcInter{
  @Autowired
  private KindDAOInter kindDAOInter;
  
  @Override
  public int create(KindVO kindVO) {
    int cnt = this.kindDAOInter.create(kindVO);
    return cnt;
  }

  @Override
  public List<KindVO> list_asc() {
    List<KindVO> list = this.kindDAOInter.list_asc();
    return list;
  }

  @Override
  public KindVO read(int kind_kindno) {
    KindVO kindVO = this.kindDAOInter.read(kind_kindno);
    return kindVO;
  }

  @Override
  public int update(KindVO kindVO) {
    int cnt = this.kindDAOInter.update(kindVO);
    return cnt;
  }

  @Override
  public int delete(int kind_kindno) {
    int cnt = this.kindDAOInter.delete(kind_kindno);
    return cnt;
  }

  @Override
  public int update_up(int kind_kindno) {
    int cnt = this.kindDAOInter.update_up(kind_kindno);
    return cnt;
  }

  @Override
  public int update_down(int kind_kindno) {
    int cnt = this.kindDAOInter.update_down(kind_kindno);
    return cnt;
  }

  @Override
  public int increaseCnt(int kind_kindno) {
    int cnt = 0;
    cnt = this.kindDAOInter.increaseCnt(kind_kindno);
    return cnt;
  }

  @Override
  public int decreaseCnt(int kind_kindno) {
    int cnt = 0;
    cnt = this.kindDAOInter.decreaseCnt(kind_kindno);
    return cnt;
  }

}