package dev.mvc.openspace_img;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Openspace_imgVO {

  /*
   * CREATE TABLE openspace_img(
    openspace_img_no                    NUMBER(8)    NOT NULL    PRIMARY KEY,
    openspace_no                      NUMBER(10)     NULL ,
    openspace_img_fname                 VARCHAR2(100)    NOT NULL,
    openspace_img_fupname               VARCHAR2(100)    NOT NULL,
    openspace_img_thumb                 VARCHAR2(100)    NOT NULL,
    openspace_img_fsize                 NUMBER(10)     NOT NULL,
    openspace_img_rdate                 DATE     NOT NULL,
  FOREIGN KEY (openspace_no) REFERENCES openspace (openspace_no)
);
   */
  /** 이미지 번호 */
  private int openspace_img_no;
  /** 글 번호(FK) */
  private int openspace_no;
  /** 원본 파일명 */
  private String openspace_img_fname;
  /** 업로드된 파일명 */
  private String openspace_img_fupname;
  /** Thumb 이미지 */
  private String openspace_img_thumb;
  /** 파일 크기 */
  private long openspace_img_fsize;
  /** 등록일 */
  private String openspace_img_rdate;
  
  
  /** Form의 파일을 MultipartFile로 변환하여 List에 저장  */
  private List<MultipartFile> fnamesMF;
  
  // private MultipartFile fnamesMF;  // 하나의 파일 처리
  /** 파일 단위 출력 */
  private String flabel; 
 
  
  
  
  public List<MultipartFile> getFnamesMF() {
    return fnamesMF;
  }
  public void setFnamesMF(List<MultipartFile> fnamesMF) {
    this.fnamesMF = fnamesMF;
  }
  public String getFlabel() {
    return flabel;
  }
  public void setFlabel(String flabel) {
    this.flabel = flabel;
  }
  public int getOpenspace_img_no() {
    return openspace_img_no;
  }
  public void setOpenspace_img_no(int openspace_img_no) {
    this.openspace_img_no = openspace_img_no;
  }
  public int getOpenspace_no() {
    return openspace_no;
  }
  public void setOpenspace_no(int openspace_no) {
    this.openspace_no = openspace_no;
  }
  public String getOpenspace_img_fname() {
    return openspace_img_fname;
  }
  public void setOpenspace_img_fname(String openspace_img_fname) {
    this.openspace_img_fname = openspace_img_fname;
  }
  public String getOpenspace_img_fupname() {
    return openspace_img_fupname;
  }
  public void setOpenspace_img_fupname(String openspace_img_fupname) {
    this.openspace_img_fupname = openspace_img_fupname;
  }
  public String getOpenspace_img_thumb() {
    return openspace_img_thumb;
  }
  public void setOpenspace_img_thumb(String openspace_img_thumb) {
    this.openspace_img_thumb = openspace_img_thumb;
  }
  public long getOpenspace_img_fsize() {
    return openspace_img_fsize;
  }
  public void setOpenspace_img_fsize(long openspace_img_fsize) {
    this.openspace_img_fsize = openspace_img_fsize;
  }
  public String getOpenspace_img_rdate() {
    return openspace_img_rdate;
  }
  public void setOpenspace_img_rdate(String openspace_img_rdate) {
    this.openspace_img_rdate = openspace_img_rdate;
  }

  
  
  
}
