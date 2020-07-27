package dev.mvc.login;

import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class LoginCont {
  @Autowired
  @Qualifier("dev.mvc.login.LoginProc")
  private LoginProcInter loginProc;
  
//http://localhost:9090/team5/login/create.do
 /**
  * 로그인 이력 기록
  * @param consumer_no
  * @return
  */
 @RequestMapping(value="/login/create.do", method=RequestMethod.GET )
 public ModelAndView create(HashMap hashmap) {
   ModelAndView mav = new ModelAndView();

   this.loginProc.create(hashmap);
   
   return mav; // forward
 }
 
//http://localhost:9090/team5/login/list.do?consumer_no=1
/**
 * 로그인 이력 조회
 * @param consumer_no
 * @return
 */
@ResponseBody
@RequestMapping(value="/login/list.do", method=RequestMethod.POST )
public String list(int consumer_no) {
  ModelAndView mav = new ModelAndView();
  List<LoginVO> list = this.loginProc.read(consumer_no);
  JSONObject json = new JSONObject();
  json.put("list", list);
  
  return json.toString(); 
}

}
