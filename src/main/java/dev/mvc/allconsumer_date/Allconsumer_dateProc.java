package dev.mvc.allconsumer_date;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.allconsumer_date.Allconsumer_dateProc")
public class Allconsumer_dateProc implements Allconsumer_dateProcInter {
  @Autowired
  private Allconsumer_dateDAOInter allconsumer_dateDAO;

  @Override
  public List<Allconsumer_dateVO> date_cnt() {
    List<Allconsumer_dateVO> list = this.allconsumer_dateDAO.date_cnt();
    return list;
  }
  
  
  

}
