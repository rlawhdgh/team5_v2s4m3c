package dev.mvc.allconsumer_date;

import java.util.List;

public interface Allconsumer_dateProcInter {
  
  /**
   * ��¥�� ȸ�� ��
   * <select id="date_cnt" resultType="Allconsumer_dateVO">
   * @return
   */
  public List<Allconsumer_dateVO> date_cnt();
}