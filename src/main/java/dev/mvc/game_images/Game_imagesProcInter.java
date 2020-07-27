package dev.mvc.game_images;

import java.util.List;

public interface Game_imagesProcInter {
  /**
   * 파일 등록  
   * @param list_imagesVO
   * @return
   */
  public int create(Game_imagesVO game_imagesVO);
  
  /**
   * 전체 이미지 목록
   * @return
   */
  public List<Game_imagesVO> list(); 
  
  /**
   * 조회
   * @param game_imagesno
   * @return
   */
  public Game_imagesVO read(int game_imagesno);
  
  /**
   * 삭제
   * @param game_imagesno
   * @return
   */
  public int delete(int game_imagesno);
 
  /**
   * 삭제
   * @param game_gameno
   * @return
   */
  public int delete_all(int game_gameno);
  
  /**
   * game_gameno에 따른 파일 목록
   * @param game_gameno
   * @return
   */
  public List<Game_imagesVO> by_game_gameno(int game_gameno);
  
}
