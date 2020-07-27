package dev.mvc.game;

import java.util.HashMap;
import java.util.List;

public interface GameDAOInter {
  /**
   * 등록 처리
   * @param listVO
   * @return
   */
  public int create(GameVO gameVO);
  
  /**
   * 전체 목록 
   * @return
   */
  public List<GameVO> list_all();
  
  /**
   * join 목록
   * @return
   */
  public List<GameVO> list_join(int kind_kindno);
  
  /**
   * 최신 게임순
   * @return
   */
  public List<GameVO> list_rdate();
  
  /**
   * 할인 순
   * @return
   */
  public List<GameVO> list_sale();
  
  /**
   * 무료 게임순
   * @return
   */
  public List<GameVO> list_free();
  
  /**
   * 조회
   * @param list_listno
   * @return
   */
  public GameVO read(int game_gameno);
  
  /**
   * <xmp>
   *   MP3 등록, 수정, 삭제
       <update id="mp3" parameterType="HashMap">
   * </xmp> 
   * @param hashMap
   * @return
   */
  public int game_image(HashMap<Object, Object> hashMap);
  
  /**
   * <xmp>
   *   Youtube 등록, 수정, 삭제
       <update id="list_youtube" parameterType="HashMap">
   * </xmp> 
   * @param hashMap
   * @return
   */
  public int game_youtube(HashMap<Object, Object> hashMap);
  
  /** 수정 폼
   * 
   * @param GameVO
   */
  public GameVO update(int game_gameno);
  
  /**
   * 수정 처리
   * <xmp>
   *   <update id="update" parameterType="ListVO"> 
   * </xmp>
   * @param GameVO
   * @return 처리된 레코드 갯수
   */
  public int update(GameVO gameVO);
  
  /**
   * 삭제 처리
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param list_listno
   * @return 처리된 레코드 갯수
   */
  public int delete(int game_gameno);
  
  /**
   * @param kind_kindno
   * @return
   */
  public List<Kind_Game_join> game_join_by_kindno(int kind_kindno);
  
  
}
