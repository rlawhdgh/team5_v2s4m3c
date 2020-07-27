package dev.mvc.grade;

import java.util.List;

public interface GradeProcInter {

  /**
   * <insert id="create" parameterType="HashMap">
   * @param hashMap
   * @return
   */
  public int create(GradeVO gradeVO);
  
  /**
   * 권한 목록
   * <select id="list" resultType="GradeVO">
   * @return
   */
  public List<GradeVO> list();
  
  /**
   * 권한 조회
   * <select id="read" parameterType="int">
   * @param grade_no
   * @return
   */
  public GradeVO read(int grade_no);
  
  /**
   * 권한 수정
   * <update id="update" parameterType="GradeVO">
   * @param gradeVO
   * @return
   */
  public int update(GradeVO gradeVO);
  
  /**
   * 권한 삭제
   * <delete id="delete" parameterType="int">
   * @param grade_no
   * @return
   */
  public int delete(int grade_no);
  
  
}
