package dev.mvc.login;

import java.util.HashMap;
import java.util.List;

public interface LoginDAOInter {

  
  /**
   * 로그인 이력 기록
   * <insert id="create" parameterType="int">
   * @param consume_no
   * @return
   */
  public int create (HashMap hashmap);
  
  /**
   * 로그인 이력 조회
   * <select id="read" parameterType="int" resultType="LoginVO">
   * @param consumer_no
   * @return
   */
  public List<LoginVO> read (int consumer_no);
}
