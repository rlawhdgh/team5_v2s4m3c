package dev.mvc.login;

import java.util.HashMap;
import java.util.List;

public interface LoginDAOInter {

  
  /**
   * �α��� �̷� ���
   * <insert id="create" parameterType="int">
   * @param consume_no
   * @return
   */
  public int create (HashMap hashmap);
  
  /**
   * �α��� �̷� ��ȸ
   * <select id="read" parameterType="int" resultType="LoginVO">
   * @param consumer_no
   * @return
   */
  public List<LoginVO> read (int consumer_no);
}
