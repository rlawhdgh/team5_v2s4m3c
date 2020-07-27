package dev.mvc.statistics;

public interface StatisticsDAOInter {
  /**
   * 코드에 해당하는 최상위 레코드 1건 선택 
   * @param statistics_code
   * @return
   */
  public StatisticsVO read_top_statistics_code(String statistics_code);
  
  
  /**
   * 회원 나이별 cnt 업데이트
   * <update id="age_update" parameterType="String">
   * @param age_data
   * @return
   */
  public int age_update(String age_data);
  
  /**
   * 선호 게임별 cnt 업데이트
   *  <update id="game_tend_update" parameterType="String">
   * @param game_tend_data
   * @return
   */
  public int game_tend_update(String game_tend_data);
}