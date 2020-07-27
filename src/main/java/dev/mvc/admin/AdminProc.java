package dev.mvc.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component("dev.mvc.admin.AdminProc")
public class AdminProc implements AdminProcInter{
  @Autowired
  private AdminDAOInter adminDAO;

  @Override
  public int create(AdminVO adminVO) {
    int cnt = this.adminDAO.create(adminVO);
    return cnt;
  }

  @Override
  public List<Admin_listVO> list() {
    List<Admin_listVO> list = this.adminDAO.list();
    return list;
  }

  @Override
  public AdminVO read(int admin_no) {
    AdminVO adminVO = this.adminDAO.read(admin_no);
    return adminVO;
  }

  @Override
  public int update(AdminVO adminVO) {
    int cnt = this.adminDAO.update(adminVO);
    return cnt;
  }

  @Override
  public int delete(int consumer_no) {
    int cnt = this.adminDAO.delete(consumer_no);
    return cnt;
  }



  @Override
  public int login(Map map) {
    int cnt = this.adminDAO.login(map);
    return cnt;
  }

  @Override
  public AdminVO readById(int consumer_no) {
    AdminVO adminVO = this.adminDAO.readById(consumer_no);
    return adminVO;
  }

  @Override
  public int admin_cnt(int consumer_no) {
    int cnt = this.adminDAO.admin_cnt(consumer_no);
    return cnt;
  }

  @Override
  public int delete_by_consumer_no(int consumer_no) {
    int cnt = this.adminDAO.delete_by_consumer_no(consumer_no);
    return cnt;
  }

  





}
