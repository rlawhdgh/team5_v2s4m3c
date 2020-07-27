package dev.mvc.openspace_reply;

import java.util.HashMap;
import java.util.List;

public interface Openspace_replyProcInter {
  
  /**
   * 등록
   * <xmp>
   * <insert id="create"parameterType="Openspace_replyVO">
   * </xmp>
   * @param Openspace_replyVO
   * @return 등록된 레코드 갯수
   */
  public int create(Openspace_replyVO openspace_replyVO);
  
  /**
   * 댓글 페이징 리스트
   * @param map
   * @return
   */
  public List<Openspace_replyVO> reply_list_paging(HashMap<String, Object> map);
  
  /**
   * 리스트
   * @param openspace_no
   * @return
   */
  public List<Openspace_replyVO> list(int openspace_no);
  

  /**
   * 수정
   * @param Openspace_replyVO
   * @return
   */
  public int update(Openspace_replyVO openspace_replyVO);
  
  /**
   * 삭제 처리
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param question_no
   * @return 처리된 레코드 갯수
   */
  public int delete(int openspace_reply_no);
  
  /**
   * 전체 삭제 처리
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param openspace_no
   * @return 처리된 레코드 갯수
   */
  public int delete_all(int openspace_no);
  
  
  /**
   * 회원 목록별 리스트
   * @param openspace_no
   * @return
   */
  public List<Openspace_replyVO> consumer_list(int consumer_no);

}
