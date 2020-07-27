package dev.mvc.allconsumer_date;

import java.util.List;

import org.apache.ibatis.javassist.expr.Instanceof;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dev.mvc.consumer.ConsumerProcInter;
import dev.mvc.consumer.Consumer_statistics_ageVO;
import dev.mvc.consumer.Consumer_statistics_game_tendVO;
import dev.mvc.statistics.StatisticsProcInter;

@Controller
public class Allconsumer_dateCont {
  
  @Autowired
  @Qualifier("dev.mvc.allconsumer_date.Allconsumer_dateProc")
  private Allconsumer_dateProcInter allconsumer_dateProc;
  

  

  

    
  
  
}
