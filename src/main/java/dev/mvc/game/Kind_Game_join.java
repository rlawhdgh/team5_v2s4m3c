package dev.mvc.game;

import org.springframework.web.multipart.MultipartFile;

public class Kind_Game_join {

  // -------------------------------------------------------------------
  // Kind table
  // -------------------------------------------------------------------
  /** 부모 테이블 */
  /** 게임 종류 번호*/
  private int kind_kindno;
  /** 게임 장르이름*/
  private String kind_kindname;
 
  // -------------------------------------------------------------------
  // Cate table
  // -------------------------------------------------------------------  
  
  /** 자식 테이블 */
  /** 컨텐츠 번호 */
  private int game_gameno; 
  /** 제목 */
  private String game_title;
  /** 유튜브 */
  private String game_youtube;
  /** 이미지 */
  private String game_image;
  /** 이미지 Spring */
  private MultipartFile game_imageMF;
  /** 게임 정보 */
  private String game_writing;
  /** 게임 특징 */
  private String game_character;
  /** 시스템 요구사항 */
  private String game_require;
  /** 간략한 정보 */
  private String game_brief;
  /** 가격 */
  private int game_price;
  /** 세일가 */
  private int game_sale;
  /** 출시일 */
  private String game_release;
  /** 개발사 */
  private String game_developer;
  /** 인터넷 주소 */
  private String game_web;
  /** 등록일 */
  private String game_rdate;
  /** 등록된 글 수 */
  private int cnt;
  public int getKind_kindno() {
    return kind_kindno;
  }
  public String getKind_kindname() {
    return kind_kindname;
  }
  public int getGame_gameno() {
    return game_gameno;
  }
  public String getGame_title() {
    return game_title;
  }
  public String getGame_youtube() {
    return game_youtube;
  }
  public String getGame_image() {
    return game_image;
  }
  public MultipartFile getGame_imageMF() {
    return game_imageMF;
  }
  public String getGame_writing() {
    return game_writing;
  }
  public String getGame_character() {
    return game_character;
  }
  public String getGame_require() {
    return game_require;
  }
  public String getGame_brief() {
    return game_brief;
  }
  public int getGame_price() {
    return game_price;
  }
  public int getGame_sale() {
    return game_sale;
  }
  public String getGame_release() {
    return game_release;
  }
  public String getGame_developer() {
    return game_developer;
  }
  public String getGame_web() {
    return game_web;
  }
  public String getGame_rdate() {
    return game_rdate;
  }
  public int getCnt() {
    return cnt;
  }
  public void setKind_kindno(int kind_kindno) {
    this.kind_kindno = kind_kindno;
  }
  public void setKind_kindname(String kind_kindname) {
    this.kind_kindname = kind_kindname;
  }
  public void setGame_gameno(int game_gameno) {
    this.game_gameno = game_gameno;
  }
  public void setGame_title(String game_title) {
    this.game_title = game_title;
  }
  public void setGame_youtube(String game_youtube) {
    this.game_youtube = game_youtube;
  }
  public void setGame_image(String game_image) {
    this.game_image = game_image;
  }
  public void setGame_imageMF(MultipartFile game_imageMF) {
    this.game_imageMF = game_imageMF;
  }
  public void setGame_writing(String game_writing) {
    this.game_writing = game_writing;
  }
  public void setGame_character(String game_character) {
    this.game_character = game_character;
  }
  public void setGame_require(String game_require) {
    this.game_require = game_require;
  }
  public void setGame_brief(String game_brief) {
    this.game_brief = game_brief;
  }
  public void setGame_price(int game_price) {
    this.game_price = game_price;
  }
  public void setGame_sale(int game_sale) {
    this.game_sale = game_sale;
  }
  public void setGame_release(String game_release) {
    this.game_release = game_release;
  }
  public void setGame_developer(String game_developer) {
    this.game_developer = game_developer;
  }
  public void setGame_web(String game_web) {
    this.game_web = game_web;
  }
  public void setGame_rdate(String game_rdate) {
    this.game_rdate = game_rdate;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  
  
  
}
