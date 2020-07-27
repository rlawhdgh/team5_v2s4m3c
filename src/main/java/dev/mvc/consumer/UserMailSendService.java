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
  
  // 이메일 난수 만드는 메서드
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

  // 난수를 이용한 키 생성
  private boolean lowerCheck;
  private int size;

  public String getKey(boolean lowerCheck, int size) {
    this.lowerCheck = lowerCheck;
    this.size = size;
    return init();
  }

  // 회원가입 발송 이메일(인증키 발송)
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
        +"<h2>안녕하세요 Unique Games 입니다!</h2><br>" 
        + "<h3>" + consumer_id + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
        + "<a style='font-weight:bold; color: #E6E7E7; text-decoration: underline;' href='http://localhost:9090" + request.getContextPath() + "/user/key_alter?consumer_id="+ consumer_id +"&user_key="+key+"'>인증하기</a></p>"
        + "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)"
        + "</div>";
    try {
      mail.setSubject("[본인인증] Unique Games의 인증메일입니다", "utf-8");
      mail.setText(htmlStr, "utf-8", "html");
      mail.addRecipient(RecipientType.TO, new InternetAddress(consumer_email));
      mailSender.send(mail);
    } catch (MessagingException e) {
      e.printStackTrace();
    }
    

    
  }
  
//인증 확인 메서드 (Y 값으로 바꿔주는 메서드)
 public int alter_userKey_service(String user_id, String key) {
   
   int resultCnt = 0;
   
   //userDao = sqlSession.getMapper(UserDaoInterface.class);
   resultCnt = this.consumerDAO.alter_userKey(user_id, key);
   
   return resultCnt;
 }
 
 
 
 // 아이디 발송 이메일
 public int mailSendid(String consumer_id , String consumer_name,  String consumer_email, HttpServletRequest request) {
   

//   System.out.println(consumer_id);
//   System.out.println(consumer_email);
//   System.out.println(key);
   //consumerDAO = sqlSession.getMapper(ConsumerDAOInter.class);

   MimeMessage mail = mailSender.createMimeMessage();
   String htmlStr = " <div style='background-color: #1b2838; color: #c7d5e0; font-size: 16px;'  > " 
       +"<h2>안녕하세요 Unique Games 입니다!</h2><br>" 
       + "<h3>" + consumer_name + "님</h3>" + "등록된 아이디는" + consumer_id + "입니다.<br>" 
       + "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)"
       + "</div>";
   try {
     mail.setSubject("[본인인증] Unique Games의 인증메일입니다", "utf-8");
     mail.setText(htmlStr, "utf-8", "html");
     mail.addRecipient(RecipientType.TO, new InternetAddress(consumer_email));
     mailSender.send(mail);
     return 1;
   } catch (MessagingException e) {
     e.printStackTrace();
     return 0;
   }
 }
 
 // 패스워드 찾기시 패스워드 변경 링크 발송 이메일
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
       +"<h2>안녕하세요 Unique Games 입니다!</h2><br>" 
       + "<h3>" + consumer_id + "님</h3>"                                         
       + "<h3>임시비밀번호 : " + key + "입니다.<br>"
       + "로그인후 반드시 비밀번호 변경을 해주세요."
       + "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)"
       + "</div>";
   try {
     mail.setSubject("[본인인증] Unique Games의 인증메일입니다", "utf-8");
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

