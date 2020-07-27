package dev.mvc.grade;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.grade.GradeProc")
public class GradeProc implements GradeProcInter{
  @Autowired
  private GradeDAOInter GradeDAO;

  @Override
  public int create(GradeVO gradeVO) {
    int cnt = this.GradeDAO.create(gradeVO);
    return cnt;
  }
  
  @Override
  public List<GradeVO> list() {
    List<GradeVO> list = this.GradeDAO.list();
    return list;
  }

  @Override
  public GradeVO read(int grade_no) {
    GradeVO gradeVO = this.GradeDAO.read(grade_no);
    return gradeVO;
  }

  @Override
  public int update(GradeVO gradeVO) {
    int cnt = this.GradeDAO.update(gradeVO);
    return cnt;
  }

  @Override
  public int delete(int grade_no) {
    int cnt = this.GradeDAO.delete(grade_no);
    return cnt;
  }

}
