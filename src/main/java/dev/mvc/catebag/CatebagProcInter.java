package dev.mvc.catebag;

import java.util.HashMap;
import java.util.List;

import dev.mvc.pay.PayVO;

public interface CatebagProcInter {
  
  
  /**
   * 중복 체크
   * <select id="read_check" resultType="int" parameterType="int">
   * @param game_gameno
   * @return
   */
  public int read_check(int game_gameno);
  
  /**
   * 중복이 있을 시 장바구니 삭제
   * <delete id="delete_check" parameterType="int">
   * @param game_gameno
   * @return
   */
  public int delete_check(int game_gameno);
  
  /**
   * 상품 중복 체크 
   * <select id="checklist_contentsno" resultType="int" parameterType="int">
   * @param game_gameno
   * @return 0: 중복 아님, 1: 중복
   */
  public int checklist_contentsno(HashMap<String, Object> hashMap);
  
  
  /**
   * <insert id="create" parameterType="CatebagVO">
   * @param catebagVO
   * @return
   */
  public int create(CatebagVO catebagVO);
  
  /**
   * 
   * <insert id="create" parameterType="PayVO">
   * @param payVO
   * @return
   */
  public int create2(PayVO payVO);
  
  
  /**
   * <select id="list_all" resultType="CatebagVO">
   * 리스트
   * @return
   */
  public List<CatebagVO> list_all();
  
  /**
   * <delete id="delete" parameterType="int">
   * @param catebag_catebagno
   * @return
   */
  public int delete(int catebag_catebagno);
  
  /**
   * <delete id="delete" parameterType="int">
   * @param catebag_catebagno
   * @return
   */
  public int delete2(int catebag_catebagno);
  
  
  
  
  /**
   * <select id="read" resultType="CatebagVO" parameterType="int">
   * @param catebag_catebagno
   * @return
   */
  public CatebagVO read(int catebag_catebagno);
  
  /**
   * 수량 상향
   * <xmp>
   *  <update id="update_cnt_up" parameterType="int">
   * </xmp>
   * @param categrpno
   * @return 처리된 레코드 갯수
   */
  public int update_cnt_up(int catebag_catebagno);
 
  /**
   * 수량 하향
   * <xmp>
   * <update id="update_cnt_down" parameterType="int">
   * </xmp>
   * @param catebag_catebagno
   * @return 처리된 레코드 갯수
   */
  public int update_cnt_down(int catebag_catebagno); 
  
  /**
   *  <update id="update_cnt" parameterType="CatebagVO">
   * @param catebagVO
   * @return
   */
  public int update_cnt(int catebag_cnt);
  
  
  /**회원 별 위시리스트
   * <select id="list_catebag_consumer_no_list" parameterType="int" resultMap="List_Catebag_VO_Map">
   * @param consumer_no
   * @return
   */
  public List<Game_Catebag_VO> game_catebag_consumer_no_list(int consumer_no);
  
  /**
   * <select id="catebag_pay_read" parameterType="int" resultType="Catebag_Pay_VO">
   * @param catebag_catebagno
   * @return
   */
  public Catebag_Pay_VO catebag_pay_read(int catebag_catebagno);
  
  
  
  /**
   * 페이지 카운터
   * <select id="search_count" resultType="int" parameterType="HashMap">
   * 
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * 회원별 장바구니 + 페이징
   * <select id="catebag_by_consumer_no_paging" resultType="List_Catebag_Consumer_VO" parameterType="HashMap">
   * @return
   */
  public List<Game_Catebag_VO> catebag_by_consumer_no_paging(HashMap<String, Object> map);
   
  /**
   * 페이지 목록 문자열 생성, Box 형태
   * @param listFile 목록 파일명 
   * @param consumer_no 회원번호
   * @param nowPage 현재 페이지, nowPage는 1부터 시작
   * @return
   */
  public String pagingBox(String listFile, int search_count, int nowPage);
}
