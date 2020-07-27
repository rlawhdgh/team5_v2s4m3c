package dev.mvc.consumer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ConsumerProcInter {

  
  /**
   * 이름 중복 체크
   * <select id="checkName" resultType="int" parameterType="String">
   * @param consumer_name
   * @return
   */
  public int checkName(String consumer_name);
  
  /**
   * 이름과 이메일 매치 확인( 아이디 찾기에 사용)
   * <select id="matchNameEmail" resultType="int" parameterType="HashMap">
   * @param hashmap
   * @return
   */
  public int matchNameEmail(HashMap hashmap);
  
  /**
   * 아이디과 이메일 매치 확인( 비밀번호 찾기에 사용)
   * <select id="matchIdEmail" resultType="int" parameterType="HashMap">
   * @param hashmap
   * @return
   */
  public int matchIdEmail(HashMap hashmap);
  
  /**
   * 아이디 중복 체크 
   * @param id
   * @return 0: 중복 아님, 1: 중복
   */
  public int checkID(String consumer_id);
  
  /**
   * 이메일 중복 체크
   * <select id="checkEmail" resultType="int" parameterType="String">
   * @param consumer_email
   * @return
   */
  public int checkEmail(String consumer_email);
  
  
  /**
   * <insert id="create" parameterType="ConsumerVO">
   * @param consumerVO
   * @return 등록한 레코드 갯수
   */
  public int create(ConsumerVO consumerVO); 
  
  /**
   * <select id="list" resultType="ConsumerVO">
   * @return
   */
  public List<ConsumerVO> list();
  
  /**
   * 회원 조회
   * <select id="read" parameterType="int" resultType="ConsumerVO">
   * @param consumer_no
   * @return
   */
  public ConsumerVO read(int consumer_no);
  
  /**
   * 회원 등급포함 목록
   * <select id="list_grade_name" resultMap="Consumer_grade_name_Map">  
   * @return
   */
  public List<Consumer_grade_nameVO> list_grade_name();
  
  /**
   * 연령대별 수(통계 그래프에 사용)
   * <select id="age_cnt" resultType="statistics_age_Map">
   * @return
   */
  public List<Consumer_statistics_ageVO> age_cnt();
  
  /**
   * 선호게임별 수(통계 그래프에 사용)
   *   <select id="game_tend_cnt" resultMap="statistics_geme_tend_Map">
   * @return
   */
  public List<Consumer_statistics_game_tendVO> game_tend_cnt();
  
  /**
   * 프로필 수정
   *  <update id="update_profile" parameterType="HashMap">
   * @param consumerVO
   * @return
   */
  public int update_profile(HashMap hashmap);
  
  /**
   * 연락처 수정
   * <update id="update_contact" parameterType="HashMap">
   * @param hashmap
   * @return
   */
  public int update_contact(HashMap hashmap);
  
  /**
   * 계좌번호 수정
   * <update id="update_paynum" parameterType="HashMap">
   * @param hashmap
   * @return
   */
  public int update_paynum(HashMap hashmap);
  
  /**
   * 비밀번호 수정
   * <update id="update_passwd" parameterType="HashMap">
   * @param hashmap
   * @return
   */
  public int update_passwd(HashMap hashmap);
  
  
  /**
   * 회원 삭제
   * <delete id="delete" parameterType="int">
   * @param consumer_no, consumer_id
   * @return
   */
  public int delete (HashMap hashmap);
  

  public int alter_userKey(String consumer_id, String key);
  
  /**
   * 로그인
   * <select id="login" resultType="int" parameterType="Map">
   * @param map
   * @return
   */
  public int login (Map map);
  
  /**
   * 회원정보 조회
   * @param id
   * @return
   */
  public ConsumerVO readById(String consumer_id);
  
  /**
   * 이메일로 아이디 찾기
   * <select id="readByEmail" parameterType="String" resultType="String">
   * @return
   */
  public String readByEmail(String consumer_email);
  
  /**
   * 페이지 목록 문자열 생성, Box 형태
   * @param listFile 목록 파일명 
   * @param categrpno 카테고리번호
   * @param search_count 검색 갯수
   * @param nowPage 현재 페이지, nowPage는 1부터 시작
   * @param word 검색어
   * @return
   */
  public String pagingBox(String listFile, int search_count, int nowPage, String word);
   
  
  /**
   * <xmp>
   * 검색 + 페이징 목록
   * <select id="list_by_search_paging" resultType="ConsumerVO" parameterType="HashMap">
   * </xmp>
   * @param map
   * @return
   */
  public List<ConsumerVO> list_by_search_paging(HashMap<String, Object> map);
  
  /**
   * 카테고리별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * 관리자 등업시 회원등급번호 변경
   * <update id="update_grade_no" parameterType="int">
   * @param consumer_no
   * @return
   */
  public int update_grade_no (int consumer_no);
  
  /**
   * 관리자 권한 해제시 회원등급 0 변경
   * <update id="update_grade_no_down" parameterType="int">
   * @param consumer_no
   * @return
   */
  public int update_grade_no_down (int consumer_no);
  
}
