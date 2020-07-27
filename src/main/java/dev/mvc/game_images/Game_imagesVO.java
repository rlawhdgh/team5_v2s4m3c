package dev.mvc.game_images;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Game_imagesVO {
  /*
        game_imagesno                  NUMBER(10)         NOT NULL         PRIMARY KEY,
        game_gameno                            NUMBER(10)         NULL ,
        game_fname                             VARCHAR2(100)         NOT NULL,
        game_fupname                      VARCHAR2(100)         NOT NULL,
        game_thumb                         VARCHAR2(100)         NULL ,
        game_fsize                                 NUMBER(10)         DEFAULT 0         NOT NULL,
        game_rdate                           DATE     NOT NULL,
   */
  /** 파일 번호 */
  private int game_imagesno;
  /** 글 번호(FK) */
  private int game_gameno;
  /** 원본 파일명 */
  private String game_fname;
  /** 업로드된 파일명 */
  private String game_fupname;
  /** Thumb 이미지 */
  private String game_thumb;
  /** 파일 크기 */
  private long game_fsize;
  /** 등록일 */
  private String images_rdate;
  
  /** Form의 파일을 MultipartFile로 변환하여 game에 저장  */
  private List<MultipartFile> game_fnamesMF;
  
  // private MultipartFile fnamesMF;  // 하나의 파일 처리
  /** 파일 단위 출력 */
  private String game_flabel;

  public int getGame_imagesno() {
    return game_imagesno;
  }

  public int getGame_gameno() {
    return game_gameno;
  }

  public String getGame_fname() {
    return game_fname;
  }

  public String getGame_fupname() {
    return game_fupname;
  }

  public String getGame_thumb() {
    return game_thumb;
  }

  public long getGame_fsize() {
    return game_fsize;
  }

  public String getImages_rdate() {
    return images_rdate;
  }

  public List<MultipartFile> getGame_fnamesMF() {
    return game_fnamesMF;
  }

  public String getGame_flabel() {
    return game_flabel;
  }

  public void setGame_imagesno(int game_imagesno) {
    this.game_imagesno = game_imagesno;
  }

  public void setGame_gameno(int game_gameno) {
    this.game_gameno = game_gameno;
  }

  public void setGame_fname(String game_fname) {
    this.game_fname = game_fname;
  }

  public void setGame_fupname(String game_fupname) {
    this.game_fupname = game_fupname;
  }

  public void setGame_thumb(String game_thumb) {
    this.game_thumb = game_thumb;
  }

  public void setGame_fsize(long game_fsize) {
    this.game_fsize = game_fsize;
  }

  public void setImages_rdate(String images_rdate) {
    this.images_rdate = images_rdate;
  }

  public void setGame_fnamesMF(List<MultipartFile> game_fnamesMF) {
    this.game_fnamesMF = game_fnamesMF;
  }

  public void setGame_flabel(String game_flabel) {
    this.game_flabel = game_flabel;
  }

  
    
}

