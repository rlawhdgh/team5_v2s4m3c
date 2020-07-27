package dev.mvc.game;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.game.GameProc")
public class GameProc implements GameProcInter {
  @Autowired
  private GameDAOInter gameDAO;

  @Override
  public int create(GameVO gameVO) {
    int cnt = 0;
    cnt = this.gameDAO.create(gameVO);
    return cnt;
  }

  @Override
  public List<GameVO> list_all() {
    List<GameVO> game = this.gameDAO.list_all();
    return game;
  }

  @Override
  public List<GameVO> list_join(int kind_kindno) {
    List<GameVO> game_join = this.gameDAO.list_join(kind_kindno);
    return game_join;
  }
  
  @Override
  public List<GameVO> list_rdate() {
    List<GameVO> game_rdate = this.gameDAO.list_rdate();
    return game_rdate;
  }
  
  @Override
  public List<GameVO> list_sale() {
    List<GameVO> game_sale = this.gameDAO.list_sale();
    return game_sale;
  }

  @Override
  public List<GameVO> list_free() {
    List<GameVO> game_free = this.gameDAO.list_free();
    return game_free;
  }
 
  @Override
  public GameVO read(int game_gameno) {
    GameVO gameVO = this.gameDAO.read(game_gameno);

    return gameVO;
  }

  @Override
  public int game_image(HashMap<Object, Object> hashMap) {
    int cnt = 0;
    cnt = this.gameDAO.game_image(hashMap);
    return cnt;
  }

  @Override
  public int game_youtube(HashMap<Object, Object> hashMap) {
    int cnt = 0;
    cnt = this.gameDAO.game_youtube(hashMap);
    return cnt;
  }
  
  @Override
  public GameVO update(int game_gameno) {
    GameVO gameVO = this.gameDAO.read(game_gameno);
    return gameVO;
  }
  
  @Override
  public int update(GameVO gameVO) {
    int cnt = 0;
    cnt = this.gameDAO.update(gameVO);
    return cnt;
  }

  @Override
  public int delete(int game_gameno) {
    int cnt = 0;
    cnt = this.gameDAO.delete(game_gameno);
    return cnt;
  }

  @Override
  public List<Kind_Game_join> game_join_by_kindno(int kind_kindno) {
    List<Kind_Game_join> list = this.gameDAO.game_join_by_kindno(kind_kindno);
    return list;
  }
  
  
}
