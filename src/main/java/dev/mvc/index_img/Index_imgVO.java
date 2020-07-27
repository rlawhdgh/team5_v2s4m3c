package dev.mvc.index_img;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Index_imgVO {
  
/*
    index_img_no                      NUMBER(8)    NOT NULL    PRIMARY KEY,
    index_img_fname                   VARCHAR2(100)    NOT NULL,
    index_img_fupname                 VARCHAR2(100)    NOT NULL,
    index_img_fsize                   NUMBER(10)     NOT NULL,
    index_img_url                     VARCHAR2(500)    NOT NULL,
    index_img_division                VARCHAR2(100)    NOT NULL,
    index_img_rdate                   DATE     NOT NULL
 */
  
private int index_img_no;
private String index_img_fname;
private String index_img_fupname;
private long index_img_fsize;
private String index_img_url;
private String index_img_division;
private String index_img_rdate;

/** Form의 파일을 MultipartFile로 변환하여 List에 저장  */
private List<MultipartFile> fnamesMF;

// private MultipartFile fnamesMF;  // 하나의 파일 처리
/** 파일 단위 출력 */
private String flabel;



public int getIndex_img_no() {
  return index_img_no;
}

public void setIndex_img_no(int index_img_no) {
  this.index_img_no = index_img_no;
}

public String getIndex_img_fname() {
  return index_img_fname;
}

public void setIndex_img_fname(String index_img_fname) {
  this.index_img_fname = index_img_fname;
}

public String getIndex_img_fupname() {
  return index_img_fupname;
}

public void setIndex_img_fupname(String index_img_fupname) {
  this.index_img_fupname = index_img_fupname;
}




public long getIndex_img_fsize() {
  return index_img_fsize;
}

public void setIndex_img_fsize(long index_img_fsize) {
  this.index_img_fsize = index_img_fsize;
}

public String getIndex_img_url() {
  return index_img_url;
}

public void setIndex_img_url(String index_img_url) {
  this.index_img_url = index_img_url;
}

public String getIndex_img_division() {
  return index_img_division;
}

public void setIndex_img_division(String index_img_division) {
  this.index_img_division = index_img_division;
}

public String getIndex_img_rdate() {
  return index_img_rdate;
}

public void setIndex_img_rdate(String index_img_rdate) {
  this.index_img_rdate = index_img_rdate;
}

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








}
