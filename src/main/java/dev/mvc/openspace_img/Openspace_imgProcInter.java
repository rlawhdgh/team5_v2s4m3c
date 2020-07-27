package dev.mvc.openspace_img;

import java.util.List;

public interface Openspace_imgProcInter {

  /**
   * 파일 등록  
   * @param openspace_imgVO
   * @return
   */
  public int create(Openspace_imgVO openspace_imgVO);
  
  /**
   * 공지사항별 이미지 리스트
   * @param openspace_no
   * @return
   */
  public List<Openspace_imgVO> list_by_openspace(int openspace_no);
  
  /**
   * 조회
   * @param contentsno
   * @return
   */
  public Openspace_imgVO read(int openspace_img_no);
  
  /**
   * 삭제 처리
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param openspace_no
   * @return 처리된 레코드 갯수
   */
  public int delete(int openspace_img_no);
  
  /**
   * 삭제 처리
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param openspace_no
   * @return 처리된 레코드 갯수
   */
  public int delete_all(int openspace_no);
  

}
