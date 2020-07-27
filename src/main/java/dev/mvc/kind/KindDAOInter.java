package dev.mvc.kind;

import java.util.List;

public interface KindDAOInter {
  
  /**
   * 등록
   * <xmp>
   *   <insert id="create" parameterType="KindVO">
   * </xmp>
   * @param kindVO
   * @return
   */
  public int create(KindVO kindVO);
  
  /**
   * 목록
   * <xmp>
   *    <select id="list_asc" resultType="KindVO">
   * <xmp>
   */
  public List<KindVO> list_asc();
  
  /**
   * 조회, 수정폼
   * <xmp>
   *   <select id="read" resultType="KindVO" parameterType="int">
   * </xmp>
   * @param kind_kindno
   * @return
   */
  public KindVO read(int kind_kindno); 
  
  /**
   * 수정 처리
   * <xmp>
   *  <update id="update" parameterType="KindVO">
   * </xmp>
   * @param kindVO
   * @return
   */
  public int update(KindVO kindVO);
  
  /**
   * 삭제 처리
   * <xmp>
   *  <delete id="delete" parameterType="int">
   * </xmp>
   * @param kind_kindno
   * @return
   */
  public int delete(int kind_kindno);
  
  /**
   * 출력 순서 상향
   * <xmp>
   *   <update id="update_up" parameterType="int">
   * </xmp>
   * @param kind_kindno
   * @return
   */
  public int update_up(int kind_kindno);
  
  /**
   * 출력 순서 하향
   * <xmp>
   *   <update id="update_down" parameterType="int">
   * </xmp>
   * @param kind_kindno
   * @return
   */
  public int update_down(int kind_kindno);
  
  /**
   * 글 수 증가
   * <update id="increaseCnt" parameterType="int">
   * @return
   */
  public int increaseCnt(int kind_kindno);    

  /**
   * 글 수 감소
   * <update id="decreaseCnt" parameterType="int">
   * @return
   */
  public int decreaseCnt(int kind_kindno);    
  
}