package dev.mvc.survey_categrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class Survey_categrpCont {
  @Autowired
  @Qualifier("dev.mvc.survey_categrp.Survey_categrpProc")
  private Survey_categrpProcInter survey_categrpProc;
  
  
  public Survey_categrpCont() {
    System.out.println("--> Survey_categrpCont created.");
}
// http://localhost:9090/team5/survey_categrp/survey_create.do
/**
 * ��� ��
 * @return
 */
@RequestMapping(value="/survey_categrp/survey_create.do", method=RequestMethod.GET )
public ModelAndView create() {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/survey_categrp/survey_create"); // webapp/cate/create.jsp
  
  return mav;
}

// http://localhost:9090/team5/survey_categrp/create.do
/**
 * ��� ó��
 * @param surveyVO
 * @return
 */
@RequestMapping(value="/survey_categrp/survey_create.do", method=RequestMethod.POST )
public ModelAndView create(Survey_categrpVO survey_categrpVO) {

  ModelAndView mav = new ModelAndView();  
  int cnt = this.survey_categrpProc.create(survey_categrpVO); // ��� ó��
  mav.addObject("cnt", cnt); // request�� ����, request.setAttribute("cnt", cnt)
  
  mav.setViewName("/survey_categrp/survey_create_msg"); // webapp/categrp/create_msg.jsp

  return mav; // forward
}
// http://localhost:9090/team5/survey_categrp/list.do
/**
 * ��ü ���
 * @return
 *
 */
@RequestMapping(value="/survey_categrp/survey_list.do", method=RequestMethod.GET )
public ModelAndView list() {
  ModelAndView mav = new ModelAndView();
  
  List<Survey_categrpVO> list = this.survey_categrpProc.list_seqno_asc();
  mav.addObject("list", list); // request.setAttribute("list", list);

  mav.setViewName("/survey_categrp/survey_list"); // webapp/cate/list.jsp
  return mav;
}
// http://localhost:9090/team5/survey_categrp/read_update.do
/**
 * ��ȸ + ������
 * @param survey_categrpno ��ȸ�� ī�װ� ��ȣ
 * @return
 */
@RequestMapping(value="/survey_categrp/survey_read_update.do", method=RequestMethod.GET )
public ModelAndView read_update(int survey_categrpno) {

  
  ModelAndView mav = new ModelAndView();
  
  Survey_categrpVO survey_categrpVO = this.survey_categrpProc.read(survey_categrpno);
  mav.addObject("survey_categrpVO", survey_categrpVO);  // request ��ü�� ����
  
  List<Survey_categrpVO> list = this.survey_categrpProc.list_categrpno_asc();
  mav.addObject("list", list);  // request ��ü�� ����

  mav.setViewName("/survey_categrp/survey_read_update"); 
  return mav; // forward
}

// http://localhost:9090/team5/survey_categrp/update.do
/**
 * ���� ó��
 * @param survey_categrpVO
 * @return
 */
@RequestMapping(value="/survey_categrp/survey_update.do", method=RequestMethod.POST )
public ModelAndView update(Survey_categrpVO survey_categrpVO) {

  
  ModelAndView mav = new ModelAndView();
  
  int cnt = this.survey_categrpProc.update(survey_categrpVO);
  mav.addObject("cnt", cnt); // request�� ����
  
  mav.setViewName("/survey_categrp/survey_update_msg"); 
  
  return mav;
}

// http://localhost:9090/team5/survey_categrp/read_delete.do
/**
 * ��ȸ + ������
 * @param survey_categrpno ��ȸ�� ī�װ� ��ȣ
 * @return
 */
@RequestMapping(value="/survey_categrp/survey_read_delete.do", method=RequestMethod.GET )
public ModelAndView read_delete(int survey_categrpno) {
  ModelAndView mav = new ModelAndView();
  
  Survey_categrpVO survey_categrpVO = this.survey_categrpProc.read(survey_categrpno); // ������ �ڷ� �б�
  mav.addObject("survey_categrpVO", survey_categrpVO);  // request ��ü�� ����
  
  List<Survey_categrpVO> list = this.survey_categrpProc.list_categrpno_asc(); // ���
  mav.addObject("list", list);  // request ��ü�� ����

  mav.setViewName("/survey_categrp/survey_read_delete"); 
  return mav;
}

// http://localhost:9090/team5/survey_categrp/delete.do
/**
 * ����
 * @param categrpno ��ȸ�� ī�װ� ��ȣ
 * @return
 */
@RequestMapping(value="/survey_categrp/survey_delete.do", method=RequestMethod.POST )
public ModelAndView delete(int survey_categrpno) {
  ModelAndView mav = new ModelAndView();
  
  Survey_categrpVO survey_categrpVO = this.survey_categrpProc.read(survey_categrpno); // ���� ����
  mav.addObject("survey_categrpVO", survey_categrpVO);  // request ��ü�� ����
  
  int cnt = this.survey_categrpProc.delete(survey_categrpno); // ���� ó��
  mav.addObject("cnt", cnt);  // request ��ü�� ����
  
  mav.setViewName("/survey_categrp/survey_delete_msg"); // webapp/categrp/delete_msg.jsp

  
  return mav;
}
// http://localhost:9090/team5/survey_categrp/survey_update_seqno_up.do?survey_categrpno=1
// http://localhost:9090/team5/survey_categrp/survey_update_seqno_up.do?survey_categrpno=1000
/**
 * �켱���� ���� up 10 �� 1
 * @param survey_categrpno ��ȸ�� ī�װ� ��ȣ
 * @return
 */
@RequestMapping(value="/survey_categrp/survey_update_seqno_up.do", 
                            method=RequestMethod.GET )
public ModelAndView update_seqno_up(int survey_categrpno) {
  ModelAndView mav = new ModelAndView();
  
  Survey_categrpVO survey_categrpVO = this.survey_categrpProc.read(survey_categrpno); // ī�װ� �׷� ����
  mav.addObject("survey_categrpVO", survey_categrpVO);  // request ��ü�� ����
  
  int cnt = this.survey_categrpProc.update_seqno_up(survey_categrpno);  // �켱 ���� ���� ó��
  mav.addObject("cnt", cnt);  // request ��ü�� ����

  mav.setViewName("/survey_categrp/survey_update_seqno_up_msg"); // update_seqno_up_msg.jsp
  return mav;
}  

// http://localhost:9090/team5/survey_categrp/survey_update_seqno_down.do?categrpno=1
// http://localhost:9090/team5/survey_categrp/survey_update_seqno_down.do?categrpno=1000
/**
 * �켱���� ���� up 10 �� 1
 * @param survey_categrpno ��ȸ�� ī�װ� ��ȣ
 * @return
 */
@RequestMapping(value="/survey_categrp/survey_update_seqno_down.do", 
                            method=RequestMethod.GET )
public ModelAndView update_seqno_down(int survey_categrpno) {
  ModelAndView mav = new ModelAndView();
  
  Survey_categrpVO survey_categrpVO = this.survey_categrpProc.read(survey_categrpno); // ī�װ� �׷� ����
  mav.addObject("survey_categrpVO", survey_categrpVO);  // request ��ü�� ����
  
  int cnt = this.survey_categrpProc.update_seqno_down(survey_categrpno);
  mav.addObject("cnt", cnt);  // request ��ü�� ����

  mav.setViewName("/survey_categrp/survey_update_seqno_down_msg"); // update_seqno_down_msg.jsp

  return mav;
}  


}
