package dev.mvc.game_images;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.game_images.Game_imagesProc")
public class Game_imagesProc implements Game_imagesProcInter{
  @Autowired
  private Game_imagesDAOInter game_imagesDAO;
  
  @Override
  public int create(Game_imagesVO game_imagesVO) {
    int cnt = 0;
    cnt = this.game_imagesDAO.create(game_imagesVO);
    return cnt;
  }

  @Override
  public List<Game_imagesVO> list() {
    List<Game_imagesVO> list = null;
    list = this.game_imagesDAO.list();
    return list;
  }

  @Override
  public Game_imagesVO read(int game_imagesno) {
    Game_imagesVO game_imagesVO = null;
    game_imagesVO = this.game_imagesDAO.read(game_imagesno);
    return game_imagesVO;
  }

  @Override
  public int delete(int game_imagesno) {
    int cnt = 0;
    cnt = this.game_imagesDAO.delete(game_imagesno);
    return cnt;
  }

  @Override
  public int delete_all(int game_gameno) {
    int cnt = 0;
    cnt = this.game_imagesDAO.delete_all(game_gameno);
    return cnt;
  }
  
  @Override
  public List<Game_imagesVO> by_game_gameno(int game_gameno) {
    List<Game_imagesVO> list = this.game_imagesDAO.by_game_gameno(game_gameno);
    return list;
  }


}
