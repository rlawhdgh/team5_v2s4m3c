package dev.mvc.game_images;

import java.util.List;

public interface Game_imagesProcInter {
  /**
   * ���� ���  
   * @param list_imagesVO
   * @return
   */
  public int create(Game_imagesVO game_imagesVO);
  
  /**
   * ��ü �̹��� ���
   * @return
   */
  public List<Game_imagesVO> list(); 
  
  /**
   * ��ȸ
   * @param game_imagesno
   * @return
   */
  public Game_imagesVO read(int game_imagesno);
  
  /**
   * ����
   * @param game_imagesno
   * @return
   */
  public int delete(int game_imagesno);
 
  /**
   * ����
   * @param game_gameno
   * @return
   */
  public int delete_all(int game_gameno);
  
  /**
   * game_gameno�� ���� ���� ���
   * @param game_gameno
   * @return
   */
  public List<Game_imagesVO> by_game_gameno(int game_gameno);
  
}
