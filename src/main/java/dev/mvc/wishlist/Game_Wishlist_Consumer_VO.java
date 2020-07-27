package dev.mvc.wishlist;

import java.util.List;

import dev.mvc.consumer.ConsumerVO;

public class Game_Wishlist_Consumer_VO {
  /** 회원정보*/
  private ConsumerVO consumerVO;
  
  /** List + wishlist */
  private List<Game_Wishlist_VO> game_wishlist_consumer_no_list;

  public ConsumerVO getConsumerVO() {
    return consumerVO;
  }

  public void setConsumerVO(ConsumerVO consumerVO) {
    this.consumerVO = consumerVO;
  }

  public List<Game_Wishlist_VO> getGame_wishlist_consumer_no_list() {
    return game_wishlist_consumer_no_list;
  }

  public void setGame_wishlist_consumer_no_list(List<Game_Wishlist_VO> game_wishlist_consumer_no_list) {
    this.game_wishlist_consumer_no_list = game_wishlist_consumer_no_list;
  } 
}
