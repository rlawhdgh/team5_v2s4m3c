package dev.mvc.statistics;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.statistics.StatisticsProc")
public class StatisticsProc implements StatisticsProcInter {
  @Autowired
  private StatisticsDAOInter statisticsDAO;
  
  @Override
  public StatisticsVO read_top_statistics_code(String statistics_code) {
    StatisticsVO statisticsVO = statisticsDAO.read_top_statistics_code(statistics_code);
    return statisticsVO;
  }

  @Override
  public int age_update(String age_data) {
    int cnt = this.statisticsDAO.age_update(age_data);
    return cnt;
  }

  @Override
  public int game_tend_update(String game_tend_data) {
    int cnt = this.statisticsDAO.game_tend_update(game_tend_data);
    return cnt;
  }
  

}
