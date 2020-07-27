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
    System.out.println("KindCont ȣ���");
  }
  
  // http://localhost:9090/team5/kind/create.do
  /**
   * ��� ��
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
   * ��� ó��
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
   * ��ü ���
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
   * ��ȸ + ������
   * @param 
   * @return
   */
  @RequestMapping(value="/kind/read_update.do", method=RequestMethod.GET )
  public ModelAndView read_update(int kind_kindno,HttpSession session) { 
    ModelAndView mav = new ModelAndView();
    
    if(session.getAttribute("admin") != null) {
    KindVO kindVO = this.kindProcInter.read(kind_kindno);
    mav.addObject("kindVO", kindVO);  // request ��ü�� ����
    
    List<KindVO> list = this.kindProcInter.list_asc();
    mav.addObject("list", list);  // request ��ü�� ����
    
      mav.setViewName("/kind/read_update");       
    } else {
      mav.setViewName("/kind/x");       
    }
    return mav; // forward
  }
  
  /**
   * ���� ó��
   * @param 
   * @return
   */
  @RequestMapping(value="/kind/update.do", method=RequestMethod.POST )
  public ModelAndView update(KindVO kindVO, HttpSession session) {  
    ModelAndView mav = new ModelAndView();
    
    if(session.getAttribute("admin") != null) {
    int cnt = this.kindProcInter.update(kindVO);
    mav.addObject("cnt", cnt); // request�� ����
    
    mav.setViewName("/kind/update_msg"); 
    } else {
      mav.setViewName("/kind/x");    
    }
    return mav;
  }
  
/*  *//**
   * ��ȸ + ������
   * @param
   * @return
   *//*
  @RequestMapping(value="/kind/read_delete.do", method=RequestMethod.GET )
  public ModelAndView read_delete(int kind_kindno) {
    ModelAndView mav = new ModelAndView();
    
    KindVO kindVO = this.kindProcInter.read(kind_kindno);
    mav.addObject("kindVO", kindVO);  // request ��ü�� ����
    
    List<KindVO> list = this.kindProcInter.list_asc();
    mav.addObject("list", list);  // request ��ü�� ����
    
    mav.setViewName("/kind/read_delete"); 
    return mav;
  }*/
  
  /**
   * ���� ó��
   * @param
   * @return
   */
  @RequestMapping(value="/kind/delete.do", method=RequestMethod.GET )
  public ModelAndView delete(int kind_kindno, HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if(session.getAttribute("admin") != null) {
    KindVO kindVO = this.kindProcInter.read(kind_kindno);
    mav.addObject("kindVO", kindVO);  // request ��ü�� ����
    
    int cnt = this.kindProcInter.delete(kind_kindno);
    mav.addObject("cnt", cnt);  // request ��ü�� ����
    
    mav.setViewName("redirect:/kind/list.do"); 
    } else {
      mav.setViewName("/kind/x");
    }
    return mav;
  }
  
  /**
   * �켱���� ���� up 10 �� 1
   * @param 
   * @return
   */
  @RequestMapping(value="/kind/update_seqno_up.do", 
                              method=RequestMethod.GET )
  public ModelAndView update_up(int kind_kindno) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.kindProcInter.update_up(kind_kindno);
    mav.addObject("cnt", cnt);  // request ��ü�� ����

    mav.setViewName("redirect:/kind/list.do"); 
    
    return mav;
  }  
  
  /**
   * �켱���� ���� down 1 �� 10
   * @param 
   * @return
   */
  @RequestMapping(value="/kind/update_seqno_down.do", 
                              method=RequestMethod.GET )
  public ModelAndView update_down(int kind_kindno) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.kindProcInter.update_down(kind_kindno);
    mav.addObject("cnt", cnt);  // request ��ü�� ����

    mav.setViewName("redirect:/kind/list.do"); 

    return mav;
  }  
  
}