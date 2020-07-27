package dev.mvc.login;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.login.LoginProc")
public class LoginProc implements LoginProcInter{
  @Autowired
  private LoginDAOInter LoginDAO;

  @Override
  public int create(HashMap hashmap) {
    int cnt = this.LoginDAO.create(hashmap);
    return cnt;
  }

  @Override
  public List<LoginVO> read(int consumer_no) {
    List<LoginVO> list = this.LoginDAO.read(consumer_no);
    return list;
  }
  

}
