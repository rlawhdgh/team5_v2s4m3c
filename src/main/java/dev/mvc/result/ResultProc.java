package dev.mvc.result;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.result.ResultProc")
public class ResultProc implements ResultProcInter {
  @Autowired
  private ResultDAOInter resultDAO;
  
  @Override
  public int create(ResultVO resultVO) {
    int cnt = this.resultDAO.create(resultVO);
    return cnt;
  }

  @Override
  public List<ResultVO> list() {
    List<ResultVO> list = null;
    list = this.resultDAO.list();
    return list;
  }
  @Override
  public ResultVO read(int resultno) {
    ResultVO resultVO = null;
    resultVO = this.resultDAO.read(resultno);
    
    return resultVO;
  }
}
