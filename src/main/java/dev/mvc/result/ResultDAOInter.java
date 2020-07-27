package dev.mvc.result;

import java.util.List;



public interface ResultDAOInter {
  

  public int create(ResultVO resultVO);
  
 
  public List<ResultVO> list();
  
 
  public ResultVO read(int resultno);

}
