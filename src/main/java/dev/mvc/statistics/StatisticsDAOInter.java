package dev.mvc.statistics;

public interface StatisticsDAOInter {
  /**
   * �ڵ忡 �ش��ϴ� �ֻ��� ���ڵ� 1�� ���� 
   * @param statistics_code
   * @return
   */
  public StatisticsVO read_top_statistics_code(String statistics_code);
  
  
  /**
   * ȸ�� ���̺� cnt ������Ʈ
   * <update id="age_update" parameterType="String">
   * @param age_data
   * @return
   */
  public int age_update(String age_data);
  
  /**
   * ��ȣ ���Ӻ� cnt ������Ʈ
   *  <update id="game_tend_update" parameterType="String">
   * @param game_tend_data
   * @return
   */
  public int game_tend_update(String game_tend_data);
}