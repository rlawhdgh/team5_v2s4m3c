package dev.mvc.openspace_reply;

import java.util.HashMap;
import java.util.List;

import dev.mvc.openspace.OpenspaceVO;

public interface Openspace_replyDAOInter {
  
  
  /**
   * ���
   * <xmp>
   * <insert id="create"parameterType="Openspace_replyVO">
   * </xmp>
   * @param Openspace_replyVO
   * @return ��ϵ� ���ڵ� ����
   */
  public int create(Openspace_replyVO openspace_replyVO);
  
  /**
   * ����Ʈ
   * @param openspace_no
   * @return
   */
  public List<Openspace_replyVO> list(int openspace_no);

  /**
   * ��� ����¡
   * @param map
   * @return
   */
  public List<Openspace_replyVO> reply_list_paging(HashMap<String, Object> map);
  
  /**
   * ����
   * @param Openspace_replyVO
   * @return
   */
  public int update(Openspace_replyVO openspace_replyVO);
  
  /**
   * ���� ó��
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param openspace_reply_no
   * @return ó���� ���ڵ� ����
   */
  public int delete(int openspace_reply_no);
  
  /**
   * ���� ó��
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param openspace_no
   * @return ó���� ���ڵ� ����
   */
  public int delete_all(int openspace_no);
  
  
  /**
   * ȸ�� ��Ϻ� ����Ʈ
   * @param openspace_no
   * @return
   */
  public List<Openspace_replyVO> consumer_list(int consumer_no);

}
