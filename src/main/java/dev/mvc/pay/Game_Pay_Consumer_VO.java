package dev.mvc.pay;

import java.util.List;

import dev.mvc.consumer.ConsumerVO;

public class Game_Pay_Consumer_VO {
  /** 회원정보*/
  private ConsumerVO consumerVO;
  
  /** List + pay */
  private List<Game_Pay_VO> game_pay_consumer_no_list;

  public ConsumerVO getConsumerVO() {
    return consumerVO;
  }

  public void setConsumerVO(ConsumerVO consumerVO) {
    this.consumerVO = consumerVO;
  }

  public List<Game_Pay_VO> getGame_pay_consumer_no_list() {
    return game_pay_consumer_no_list;
  }

  public void setGame_pay_consumer_no_list(List<Game_Pay_VO> game_pay_consumer_no_list) {
    this.game_pay_consumer_no_list = game_pay_consumer_no_list;
  } 
  
}
