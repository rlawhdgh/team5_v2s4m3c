package dev.mvc.admin;

public class AdminVO {

  private int admin_no = 0;
  private String admin_id = null;
  private String admin_passwd = null;
  private int consumer_no = 0;
  
  
  public int getConsumer_no() {
    return consumer_no;
  }
  public void setConsumer_no(int consumer_no) {
    this.consumer_no = consumer_no;
  }
  public int getAdmin_no() {
    return admin_no;
  }
  public void setAdmin_no(int admin_no) {
    this.admin_no = admin_no;
  }
  public String getAdmin_id() {
    return admin_id;
  }
  public void setAdmin_id(String admin_id) {
    this.admin_id = admin_id;
  }
  public String getAdmin_passwd() {
    return admin_passwd;
  }
  public void setAdmin_passwd(String admin_passwd) {
    this.admin_passwd = admin_passwd;
  }
  
  
  
  
}
