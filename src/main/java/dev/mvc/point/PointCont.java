package dev.mvc.point;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.catebag.CatebagProcInter;
import dev.mvc.catebag.CatebagVO;

import dev.mvc.consumer.ConsumerProcInter;
import dev.mvc.game.GameProcInter;
import dev.mvc.pay.PayProcInter;

@Controller
public class PointCont {
  
  @Autowired
  @Qualifier("dev.mvc.consumer.ConsumerProc")
  private ConsumerProcInter consumerProc;
  
  @Autowired
  @Qualifier("dev.mvc.game.GameProc")
  private GameProcInter gameProc;
  
  @Autowired
  @Qualifier("dev.mvc.catebag.CatebagProc")
  private CatebagProcInter catebagProc;
  
  @Autowired
  @Qualifier("dev.mvc.pay.PayProc")
  private PayProcInter payProc;
  
  //-----------------------------------------
  @Autowired
  @Qualifier("dev.mvc.point.PointProc")
  private PointProcInter pointProc;
  
//http://localhost:9090/resort/categrp/create.do
 /**
  * 등록 폼
  * @return
  */
 @RequestMapping(value="/point/create.do", method=RequestMethod.GET )
 public ModelAndView create() {
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/point/create"); // webapp/categrp/create.jsp
   
   return mav; // forward
 }
 
 // http://localhost:9090/resort/categrp/create.do
 /**
  * 등록 처리
  * @param pointVO
  * @return
  */
 @RequestMapping(value="/point/create.do", method=RequestMethod.POST )
 public ModelAndView create(PointVO pointVO) {
   // CategrpVO categrpVO <FORM> 태그의 값으로 자동 생성됨.
   // request.setAttribute("categrpVO", categrpVO); 자동 실행
   
   ModelAndView mav = new ModelAndView();
   
   int cnt = this.pointProc.create(pointVO); // 등록 처리
   mav.addObject("cnt", cnt); // request에 저장, request.setAttribute("cnt", cnt)
   
   mav.setViewName("/point/create_msg"); // webapp/categrp/create_msg.jsp

   return mav; // forward
 }
 
 
  //http://localhost:9090/team5/catebag/list_all.do
  /**
  * 전체 목록
  * 
  * @return
  */
  @RequestMapping(value = "/point/list_all.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();

    List<PointVO> list = this.pointProc.list_all();
    
    //--------------- 합계------------
    int tot =0;
    for(int i=0; i<list.size(); i++) {
      int a =  list.get(i).getPoint_now();
      tot += a;
    }
    
    System.out.println(tot);
    mav.addObject("tot", tot);
    //-----------------------------
    
    
    mav.addObject("list", list); // request.setAttribute("list", list);
    
   
    mav.setViewName("/point/list_all"); // /webapp/wishlist/list_all.jsp
    return mav;
  }
  //http://localhost:9090/resort/categrp/update.do
   /**
    * 수정 처리
    * @param categrpVO
    * @return
    */
   @RequestMapping(value="/point/update.do", method=RequestMethod.POST )
   public ModelAndView update(PointVO pointVO) {
     // CategrpVO categrpVO <FORM> 태그의 값으로 자동 생성됨.
     // request.setAttribute("categrpVO", categrpVO); 자동 실행
   
     ModelAndView mav = new ModelAndView();
     
     int cnt = this.pointProc.update_point(pointVO);
     mav.addObject("cnt", cnt); // request에 저장
   
     mav.setViewName("/point/update_msg"); // webapp/categrp/update_msg.jsp
   
     return mav;
   }
  






 
   
}
 
