package dev.mvc.kind;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.admin.AdminProcInter;
import dev.mvc.consumer.ConsumerProcInter;

@Controller
public class KindCont{
  @Autowired
  @Qualifier("dev.mvc.consumer.ConsumerProc")
  private ConsumerProcInter consumerProc;
  
  @Autowired
  @Qualifier("dev.mvc.admin.AdminProc")
  private AdminProcInter adminProc;
  
  @Autowired
  @Qualifier("dev.mvc.kind.KindProc")
  private KindProcInter kindProcInter;
  
  public KindCont() {
    System.out.println("KindCont 호출됨");
  }
  
  // http://localhost:9090/team5/kind/create.do
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/kind/create.do" ,method=RequestMethod.GET )
  public ModelAndView create(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if(session.getAttribute("admin") != null) {
      mav.setViewName("/kind/create");       
    } else {
      mav.setViewName("/kind/x");
    }
    
    return mav; 
  }
  
  // http://localhost:9090/team5/kind/create.do
  /**
   * 등록 처리
   * @param 
   * @return
   */
  @RequestMapping(value="/kind/create.do", method=RequestMethod.POST )
  public ModelAndView create(KindVO kindVO, HttpSession session) {  
    ModelAndView mav = new ModelAndView();
    
    if(session.getAttribute("admin") != null) {
      int cnt = this.kindProcInter.create(kindVO); 
      mav.addObject("cnt", cnt);
      
      // mav.setViewName("/kind/create_msg"); 
      mav.setViewName("redirect:/kind/list.do");
    } else {
      mav.setViewName("/kind/x");
    }
    
    return mav;
  }
  
  /**
   * 전체 목록
   * @return
   */
  @RequestMapping(value="/kind/list.do", method=RequestMethod.GET )
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if(session.getAttribute("admin") != null) {
   
    List<KindVO> list = this.kindProcInter.list_asc();
    mav.addObject("list", list); // request.setAttribute("list", list);

      mav.setViewName("/kind/list");
    } else {
      mav.setViewName("/kind/x");
    }
     
    
    return mav;
  }
  
  /**
   * 조회 + 수정폼
   * @param 
   * @return
   */
  @RequestMapping(value="/kind/read_update.do", method=RequestMethod.GET )
  public ModelAndView read_update(int kind_kindno,HttpSession session) { 
    ModelAndView mav = new ModelAndView();
    
    if(session.getAttribute("admin") != null) {
    KindVO kindVO = this.kindProcInter.read(kind_kindno);
    mav.addObject("kindVO", kindVO);  // request 객체에 저장
    
    List<KindVO> list = this.kindProcInter.list_asc();
    mav.addObject("list", list);  // request 객체에 저장
    
      mav.setViewName("/kind/read_update");       
    } else {
      mav.setViewName("/kind/x");       
    }
    return mav; // forward
  }
  
  /**
   * 수정 처리
   * @param 
   * @return
   */
  @RequestMapping(value="/kind/update.do", method=RequestMethod.POST )
  public ModelAndView update(KindVO kindVO, HttpSession session) {  
    ModelAndView mav = new ModelAndView();
    
    if(session.getAttribute("admin") != null) {
    int cnt = this.kindProcInter.update(kindVO);
    mav.addObject("cnt", cnt); // request에 저장
    
    mav.setViewName("/kind/update_msg"); 
    } else {
      mav.setViewName("/kind/x");    
    }
    return mav;
  }
  
/*  *//**
   * 조회 + 삭제폼
   * @param
   * @return
   *//*
  @RequestMapping(value="/kind/read_delete.do", method=RequestMethod.GET )
  public ModelAndView read_delete(int kind_kindno) {
    ModelAndView mav = new ModelAndView();
    
    KindVO kindVO = this.kindProcInter.read(kind_kindno);
    mav.addObject("kindVO", kindVO);  // request 객체에 저장
    
    List<KindVO> list = this.kindProcInter.list_asc();
    mav.addObject("list", list);  // request 객체에 저장
    
    mav.setViewName("/kind/read_delete"); 
    return mav;
  }*/
  
  /**
   * 삭제 처리
   * @param
   * @return
   */
  @RequestMapping(value="/kind/delete.do", method=RequestMethod.GET )
  public ModelAndView delete(int kind_kindno, HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if(session.getAttribute("admin") != null) {
    KindVO kindVO = this.kindProcInter.read(kind_kindno);
    mav.addObject("kindVO", kindVO);  // request 객체에 저장
    
    int cnt = this.kindProcInter.delete(kind_kindno);
    mav.addObject("cnt", cnt);  // request 객체에 저장
    
    mav.setViewName("redirect:/kind/list.do"); 
    } else {
      mav.setViewName("/kind/x");
    }
    return mav;
  }
  
  /**
   * 우선순위 상향 up 10 ▷ 1
   * @param 
   * @return
   */
  @RequestMapping(value="/kind/update_seqno_up.do", 
                              method=RequestMethod.GET )
  public ModelAndView update_up(int kind_kindno) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.kindProcInter.update_up(kind_kindno);
    mav.addObject("cnt", cnt);  // request 객체에 저장

    mav.setViewName("redirect:/kind/list.do"); 
    
    return mav;
  }  
  
  /**
   * 우선순위 하향 down 1 ▷ 10
   * @param 
   * @return
   */
  @RequestMapping(value="/kind/update_seqno_down.do", 
                              method=RequestMethod.GET )
  public ModelAndView update_down(int kind_kindno) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.kindProcInter.update_down(kind_kindno);
    mav.addObject("cnt", cnt);  // request 객체에 저장

    mav.setViewName("redirect:/kind/list.do"); 

    return mav;
  }  
  
}