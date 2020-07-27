package dev.mvc.statistics;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.expr.Instanceof;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dev.mvc.allconsumer_date.Allconsumer_dateProcInter;
import dev.mvc.allconsumer_date.Allconsumer_dateVO;
import dev.mvc.consumer.ConsumerProcInter;
import dev.mvc.consumer.Consumer_statistics_ageVO;
import dev.mvc.consumer.Consumer_statistics_game_tendVO;

@Controller
public class StatisticsCont {
  @Autowired
  @Qualifier("dev.mvc.statistics.StatisticsProc")
  private StatisticsProcInter statisticsProc;
  
  @Autowired
  @Qualifier("dev.mvc.consumer.ConsumerProc")
  private ConsumerProcInter consumerProc;
  
  @Autowired
  @Qualifier("dev.mvc.allconsumer_date.Allconsumer_dateProc")
  private Allconsumer_dateProcInter allconsumer_dateProc;
  
  // http://localhost:9090/team5/statistics/read_top_statistics_code.do?statistics_code=METER
  /**
   * 코드에 해당하는 최상위 레코드 1건 선택 JSON 출력
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/statistics/read_top_statistics_code.do", method=RequestMethod.GET ,
                              produces = "text/plain;charset=UTF-8" )
  public String read_top_statistics_code(String statistics_code ,HttpSession session) {
 
    if(session.getAttribute("admin") == null) {
      return null;
      }
    List<Consumer_statistics_ageVO> age_list = this.consumerProc.age_cnt();
    String [] age_cnt_array = new String[6];
    //String [] age_group_array = new String[6];
    for(int i =0; i <= age_list.size()-1; i++) {
      age_cnt_array[i] = age_list.get(i).getAge_cnt();       // Statistice 테이블로 보낼 데이터
      //age_group_array[i] = age_list.get(i).getAge_group(); // json으로 보낼 데이터
      //System.out.println(age_cnt_array[i]);
      //System.out.println("size : " +age_list.size());
      //age_list.get(i).getAge_group();
    }
    String age_cnt = "["+age_cnt_array[1]+"," + age_cnt_array[0] + "," + age_cnt_array[2] + "," + age_cnt_array[3] + "," + age_cnt_array[4] +"]";
    this.statisticsProc.age_update(age_cnt); // statistics 테이블의 data에 넣음
    //StatisticsVO statisticsVO = this.statisticsProc.read_top_statistics_code(statistics_code); // 넣은걸 다시 가져옴
    
    //String age_group = age_group_array[0]+"," + age_group_array[1] + "," + age_group_array[2] + "," + age_group_array[3] + "," + age_group_array[4];
    
    JSONObject json = new JSONObject();
    json.put("age_cnt", age_cnt);
    //json.put("age_group", age_group);
    
    return json.toString(); 
  }
  
  // http://localhost:9090/team5/statistics/read_top_statistics_code_2.do?statistics_code=PIE
  /**
   * 코드에 해당하는 최상위 레코드 1건 선택 JSON 출력
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/statistics/read_top_statistics_code_2.do", method=RequestMethod.GET ,
                              produces = "text/plain;charset=UTF-8" )
  public String read_top_statistics_code_2(String statistics_code ,HttpSession session) {
    
    if(session.getAttribute("admin") == null) {
      return null;
      }
    List<Consumer_statistics_game_tendVO> game_tend_list = this.consumerProc.game_tend_cnt();
    int [] c = new int[10];
    String [] g = new String[10];
    for(int i =0; i <= game_tend_list.size()-1; i++) {
      c[i] = game_tend_list.get(i).getGame_tend_cnt();       // Statistice 테이블로 보낼 데이터
      g[i] = game_tend_list.get(i).getGame_tend_group(); // json으로 보낼 데이터
      //json.put("g[i]", c[i]);
      //System.out.println(age_cnt_array[i]);
      //System.out.println("size : " +age_list.size());
      //age_list.get(i).getAge_group();
    }
    //[['Sony',7], ['Samsumg',13.3], ['LG',14.7], ['Vizio',5.2], ['Insignia', 1.2]];
    String game_tend_cnt = "["+"['"+g[0]+"',"+c[0]+"],"+ "['"+g[1]+"',"+c[1]+"],"+ "['"+g[3]+"',"+c[3]+"],"+ "['"+g[4]+"',"+c[4]+"],"+ "['"+g[5]+"',"+c[5]+"],"+ "['"+g[6]+"',"+c[6]+"],"+ "['"+g[7]+"',"+c[7]+"],"+ "['"+g[8]+"',"+c[8]+"],"+ "['"+g[9]+"',"+c[9]+"]"+"]";
    //System.out.println(game_tend_cnt);
    this.statisticsProc.game_tend_update(game_tend_cnt); // statistics 테이블의 data에 넣음
    //StatisticsVO statisticsVO = this.statisticsProc.read_top_statistics_code(statistics_code); // 넣은걸 다시 가져옴
    
    //String age_group = age_group_array[0]+"," + age_group_array[1] + "," + age_group_array[2] + "," + age_group_array[3] + "," + age_group_array[4];
    
    JSONObject json = new JSONObject();
    //json.put("c", c);
    //json.put("game_tend_cnt", game_tend_cnt);
    //json.put("FPS", c[0]);
    //json.put("MMORPG", c[1]);
    json.put("c", c);
    //json.put("age_group", age_group);
    
    return json.toString(); 
  }
  
  // http://localhost:9090/team5/statistics/read_top_statistics_code_3.do?statistics_code=PIE
  /**
   * 코드에 해당하는 최상위 레코드 1건 선택 JSON 출력
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/statistics/read_top_statistics_code_3.do", method=RequestMethod.GET ,
                              produces = "text/plain;charset=UTF-8" )
  public String read_top_statistics_code_3(String statistics_code ,HttpSession session) {
    
    if(session.getAttribute("admin") == null) {
      return null;
      }
    List<Allconsumer_dateVO> list = this.allconsumer_dateProc.date_cnt();
//    int [] c = new int[10];
//    String [] g = new String[10];
//    for(int i =0; i <= list.size()-1; i++) {
//      g[i] = list.get(i).getAllconsumer_date_date();       // Statistice 테이블로 보낼 데이터
//      c[i] = list.get(i).getAllconsumer_date_cnt();         // json으로 보낼 데이터
//      //json.put("g[i]", c[i]);
//      //System.out.println(age_cnt_array[i]);
//      //System.out.println("size : " +age_list.size());
//      //age_list.get(i).getAge_group();
//    }
    //[['Sony',7], ['Samsumg',13.3], ['LG',14.7], ['Vizio',5.2], ['Insignia', 1.2]];
    //String game_tend_cnt = "["+"['"+g[0]+"',"+c[0]+"],"+ "['"+g[1]+"',"+c[1]+"],"+ "['"+g[3]+"',"+c[3]+"],"+ "['"+g[4]+"',"+c[4]+"],"+ "['"+g[5]+"',"+c[5]+"],"+ "['"+g[6]+"',"+c[6]+"],"+ "['"+g[7]+"',"+c[7]+"],"+ "['"+g[8]+"',"+c[8]+"],"+ "['"+g[9]+"',"+c[9]+"]"+"]";
    //System.out.println(game_tend_cnt);
    //this.statisticsProc.game_tend_update(game_tend_cnt); // statistics 테이블의 data에 넣음
    //StatisticsVO statisticsVO = this.statisticsProc.read_top_statistics_code(statistics_code); // 넣은걸 다시 가져옴
    
    //String age_group = age_group_array[0]+"," + age_group_array[1] + "," + age_group_array[2] + "," + age_group_array[3] + "," + age_group_array[4];
    
    JSONObject json = new JSONObject();
    //json.put("c", c);
    //json.put("game_tend_cnt", game_tend_cnt);
    //json.put("FPS", c[0]);
    //json.put("MMORPG", c[1]);
    json.put("list", list);
    //json.put("g", g);
    //json.put("age_group", age_group);
    
    return json.toString(); 
  }
  

    
  
  
}
