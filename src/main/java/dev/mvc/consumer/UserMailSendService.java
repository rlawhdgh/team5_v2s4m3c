package dev.mvc.consumer;

import java.util.HashMap;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class UserMailSendService {

  @Autowired
  private JavaMailSender mailSender;
  @Autowired
  private SqlSessionTemplate sqlSession;
  @Autowired
  private ConsumerDAOInter consumerDAO;
  
  // �̸��� ���� ����� �޼���
  private String init() {
    Random ran = new Random();
    StringBuffer sb = new StringBuffer();
    int num = 0;

    do {
      num = ran.nextInt(75) + 48;
      if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
        sb.append((char) num);
      } else {
        continue;
      }

    } while (sb.length() < size);
    if (lowerCheck) {
      return sb.toString().toLowerCase();
    }
    return sb.toString();
  }

  // ������ �̿��� Ű ����
  private boolean lowerCheck;
  private int size;

  public String getKey(boolean lowerCheck, int size) {
    this.lowerCheck = lowerCheck;
    this.size = size;
    return init();
  }

  // ȸ������ �߼� �̸���(����Ű �߼�)
  public void mailSendWithUserKey(String consumer_email, String consumer_id, HttpServletRequest request) {
    
    String key = getKey(false, 20);
//    System.out.println(consumer_id);
//    System.out.println(consumer_email);
//    System.out.println(key);
    //consumerDAO = sqlSession.getMapper(ConsumerDAOInter.class);
    HashMap hashmap = new HashMap();
    hashmap.put("consumer_id", consumer_id);
    hashmap.put("key", key);
    
    
    this.consumerDAO.GetKey(hashmap); 
    MimeMessage mail = mailSender.createMimeMessage();
    String htmlStr = " <div style='background-color: #1b2838; color: #c7d5e0; font-size: 16px;'  > " 
        +"<h2>�ȳ��ϼ��� Unique Games �Դϴ�!</h2><br>" 
        + "<h3>" + consumer_id + "��</h3>" + "<p>�����ϱ� ��ư�� �����ø� �α����� �Ͻ� �� �ֽ��ϴ� : " 
        + "<a style='font-weight:bold; color: #E6E7E7; text-decoration: underline;' href='http://localhost:9090" + request.getContextPath() + "/user/key_alter?consumer_id="+ consumer_id +"&user_key="+key+"'>�����ϱ�</a></p>"
        + "(Ȥ�� �߸� ���޵� �����̶�� �� �̸����� �����ϼŵ� �˴ϴ�)"
        + "</div>";
    try {
      mail.setSubject("[��������] Unique Games�� ���������Դϴ�", "utf-8");
      mail.setText(htmlStr, "utf-8", "html");
      mail.addRecipient(RecipientType.TO, new InternetAddress(consumer_email));
      mailSender.send(mail);
    } catch (MessagingException e) {
      e.printStackTrace();
    }
    

    
  }
  
//���� Ȯ�� �޼��� (Y ������ �ٲ��ִ� �޼���)
 public int alter_userKey_service(String user_id, String key) {
   
   int resultCnt = 0;
   
   //userDao = sqlSession.getMapper(UserDaoInterface.class);
   resultCnt = this.consumerDAO.alter_userKey(user_id, key);
   
   return resultCnt;
 }
 
 
 
 // ���̵� �߼� �̸���
 public int mailSendid(String consumer_id , String consumer_name,  String consumer_email, HttpServletRequest request) {
   

//   System.out.println(consumer_id);
//   System.out.println(consumer_email);
//   System.out.println(key);
   //consumerDAO = sqlSession.getMapper(ConsumerDAOInter.class);

   MimeMessage mail = mailSender.createMimeMessage();
   String htmlStr = " <div style='background-color: #1b2838; color: #c7d5e0; font-size: 16px;'  > " 
       +"<h2>�ȳ��ϼ��� Unique Games �Դϴ�!</h2><br>" 
       + "<h3>" + consumer_name + "��</h3>" + "��ϵ� ���̵��" + consumer_id + "�Դϴ�.<br>" 
       + "(Ȥ�� �߸� ���޵� �����̶�� �� �̸����� �����ϼŵ� �˴ϴ�)"
       + "</div>";
   try {
     mail.setSubject("[��������] Unique Games�� ���������Դϴ�", "utf-8");
     mail.setText(htmlStr, "utf-8", "html");
     mail.addRecipient(RecipientType.TO, new InternetAddress(consumer_email));
     mailSender.send(mail);
     return 1;
   } catch (MessagingException e) {
     e.printStackTrace();
     return 0;
   }
 }
 
 // �н����� ã��� �н����� ���� ��ũ �߼� �̸���
 public int mailSendpasswd(String consumer_id , String consumer_email, int consumer_no, HttpServletRequest request) {
   

//   System.out.println(consumer_id);
//   System.out.println(consumer_email);
//   System.out.println(key);
   //consumerDAO = sqlSession.getMapper(ConsumerDAOInter.class);

   String key = getKey(false, 10);
   
   HashMap hashmap = new HashMap();
   hashmap.put("consumer_no", consumer_no);
   hashmap.put("consumer_passwd", key);
   
   MimeMessage mail = mailSender.createMimeMessage();
   String htmlStr = " <div style='background-color: #1b2838; color: #c7d5e0; font-size: 16px;'  > " 
       +"<h2>�ȳ��ϼ��� Unique Games �Դϴ�!</h2><br>" 
       + "<h3>" + consumer_id + "��</h3>"                                         
       + "<h3>�ӽú�й�ȣ : " + key + "�Դϴ�.<br>"
       + "�α����� �ݵ�� ��й�ȣ ������ ���ּ���."
       + "(Ȥ�� �߸� ���޵� �����̶�� �� �̸����� �����ϼŵ� �˴ϴ�)"
       + "</div>";
   try {
     mail.setSubject("[��������] Unique Games�� ���������Դϴ�", "utf-8");
     mail.setText(htmlStr, "utf-8", "html");
     mail.addRecipient(RecipientType.TO, new InternetAddress(consumer_email));
     mailSender.send(mail);
     this.consumerDAO.update_passwd(hashmap);
     return 1;
   } catch (MessagingException e) {
     e.printStackTrace();
     return 0;
   }
 }
 


 
 
}

