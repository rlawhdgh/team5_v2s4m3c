package dev.mvc.openspace_img;

import java.util.List;

import dev.mvc.openspace.OpenspaceVO;
import dev.mvc.question.QuestionVO;

public interface Openspace_imgDAOInter {
  
  /**
   * ���� ���  
   * @param openspace_imgVO
   * @return
   */
  public int create(Openspace_imgVO openspace_imgVO);
  
  /**
   * �������׺� �̹��� ����Ʈ
   * @param openspace_no
   * @return
   */
  public List<Openspace_imgVO> list_by_openspace(int openspace_no);
  
  /**
   * ��ȸ
   * @param contentsno
   * @return
   */
  public Openspace_imgVO read(int openspace_img_no);
  
  /**
   * ���� ó��
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param openspace_no
   * @return ó���� ���ڵ� ����
   */
  public int delete(int openspace_img_no);
  
  /**
   * ���� ó��
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param openspace_no
   * @return ó���� ���ڵ� ����
   */
  public int delete_all(int openspace_no);
  


}
