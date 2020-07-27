package dev.mvc.allconsumer_date;

import java.util.List;

public interface Allconsumer_dateProcInter {
  
  /**
   * 날짜별 회원 수
   * <select id="date_cnt" resultType="Allconsumer_dateVO">
   * @return
   */
  public List<Allconsumer_dateVO> date_cnt();
}