package dev.mvc.pay;

import java.util.HashMap;
import java.util.List;

import dev.mvc.catebag.Catebag_Pay_VO;



public interface PayProcInter {
  
  /**
   * 등록하기
   * <insert id="create" parameterType="PayVO">
   * @param payVO
   * @return
   */
  public int create(PayVO payVO);
   
  /**
   * <select id="list_all" resultType="PayVO">
   * 리스트
   * @return
   */
  public List<PayVO> list_all();
  
  /**
   * 삭제 하기
   * <delete id="delete" parameterType="int">
   * @param int pay_payno
   * @return
   */
  public int delete(int pay_payno);
  
  /**
   * <delete id="delete_catebag" parameterType="int">
   * @param catebag_catebagno
   * @return
   */
  public int delete_catebag(int catebag_catebagno);
  
  /**
   * <select id="read" resultType="PayVO" parameterType="int">
   * @param pay_payno
   * @return
   */
  public PayVO read(int pay_payno);
  
  /**회원 별 결제
   * <select id="list_pay_consumer_no_list" parameterType="int" resultMap="List_Pay_VO_Map">
   * @param consumer_no
   * @return
   */
  public List<Game_Pay_VO> game_pay_consumer_no_list(int consumer_no);
  
  
  /**
   * 페이지 숫자 세기
   * <select id="search_count" resultType="int" parameterType="HashMap">
   * 
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * 회원 결제 내역 페이징
   * <select id="pay_by_consumer_no_paging" resultType="List_Pay_Consumer_VO" parameterType="HashMap">
   * @return
   */
  public List<Game_Pay_VO> pay_by_consumer_no_paging(HashMap<String, Object> map);
   
  /**
   * 페이지 목록 문자열 생성, Box 형태
   * @param listFile 목록 파일명 
   * @param consumer_no 회원번호
   * @param nowPage 현재 페이지, nowPage는 1부터 시작
   * @return
   */
  public String pagingBox(String listFile, int search_count, int nowPage);
  
}
