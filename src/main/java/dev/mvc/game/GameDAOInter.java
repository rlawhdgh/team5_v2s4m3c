package dev.mvc.game;

import java.util.HashMap;
import java.util.List;

public interface GameDAOInter {
  /**
   * ��� ó��
   * @param listVO
   * @return
   */
  public int create(GameVO gameVO);
  
  /**
   * ��ü ��� 
   * @return
   */
  public List<GameVO> list_all();
  
  /**
   * join ���
   * @return
   */
  public List<GameVO> list_join(int kind_kindno);
  
  /**
   * �ֽ� ���Ӽ�
   * @return
   */
  public List<GameVO> list_rdate();
  
  /**
   * ���� ��
   * @return
   */
  public List<GameVO> list_sale();
  
  /**
   * ���� ���Ӽ�
   * @return
   */
  public List<GameVO> list_free();
  
  /**
   * ��ȸ
   * @param list_listno
   * @return
   */
  public GameVO read(int game_gameno);
  
  /**
   * <xmp>
   *   MP3 ���, ����, ����
       <update id="mp3" parameterType="HashMap">
   * </xmp> 
   * @param hashMap
   * @return
   */
  public int game_image(HashMap<Object, Object> hashMap);
  
  /**
   * <xmp>
   *   Youtube ���, ����, ����
       <update id="list_youtube" parameterType="HashMap">
   * </xmp> 
   * @param hashMap
   * @return
   */
  public int game_youtube(HashMap<Object, Object> hashMap);
  
  /** ���� ��
   * 
   * @param GameVO
   */
  public GameVO update(int game_gameno);
  
  /**
   * ���� ó��
   * <xmp>
   *   <update id="update" parameterType="ListVO"> 
   * </xmp>
   * @param GameVO
   * @return ó���� ���ڵ� ����
   */
  public int update(GameVO gameVO);
  
  /**
   * ���� ó��
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param list_listno
   * @return ó���� ���ڵ� ����
   */
  public int delete(int game_gameno);
  
  /**
   * @param kind_kindno
   * @return
   */
  public List<Kind_Game_join> game_join_by_kindno(int kind_kindno);
  
  
}
