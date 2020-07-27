package dev.mvc.catebag;

import java.util.List;

import dev.mvc.consumer.ConsumerVO;

public class Game_Catebag_Consumer_VO {
  /** 회원정보*/
  private ConsumerVO consumerVO;
  
  /** List + catebag */
  private List<Game_Catebag_VO> game_catebag_consumer_no_list;

  public ConsumerVO getConsumerVO() {
    return consumerVO;
  }

  public void setConsumerVO(ConsumerVO consumerVO) {
    this.consumerVO = consumerVO;
  }

  public List<Game_Catebag_VO> getGame_catebag_consumer_no_list() {
    return game_catebag_consumer_no_list;
  }

  public void setGame_catebag_consumer_no_list(List<Game_Catebag_VO> game_catebag_consumer_no_list) {
    this.game_catebag_consumer_no_list = game_catebag_consumer_no_list;
  } 
  
}
