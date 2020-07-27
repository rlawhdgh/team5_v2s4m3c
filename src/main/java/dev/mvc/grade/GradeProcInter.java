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
   * ���� ���
   * <select id="list" resultType="GradeVO">
   * @return
   */
  public List<GradeVO> list();
  
  /**
   * ���� ��ȸ
   * <select id="read" parameterType="int">
   * @param grade_no
   * @return
   */
  public GradeVO read(int grade_no);
  
  /**
   * ���� ����
   * <update id="update" parameterType="GradeVO">
   * @param gradeVO
   * @return
   */
  public int update(GradeVO gradeVO);
  
  /**
   * ���� ����
   * <delete id="delete" parameterType="int">
   * @param grade_no
   * @return
   */
  public int delete(int grade_no);
  
  
}
