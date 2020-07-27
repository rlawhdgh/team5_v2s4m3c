package dev.mvc.result;

import java.util.List;

public interface ResultProcInter {
  
  public int create(ResultVO resultVO);
  
  
  public List<ResultVO> list();
  
 
  public ResultVO read(int resultno);


}
