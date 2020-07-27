<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head> 
 
<body>
<jsp:include page="/menu/top3.jsp" flush='false' />
  <DIV class='title_line'>
    <A href="../survey_categrp/survey_list.do">카테고리 그룹</A> > 
    <A href="../survey_cate/survey_list.do">모든 카테고리</A> > 삭제
  </DIV>

  <ASIDE style='float: left;'>
    <A href='../survey_categrp/survey_list.do'>카테고리 그룹</A> > 
    <A href='./survey_list.do?survey_cateno=${survey_cateno }'>${survey_cateVO.survey_name }</A> >
    삭제
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href='./pollList.do?survey_cateno=${param.survey_cateno }'>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
  
  <div class='menu_line'></div>
 
  <FORM name='frm' method='POST' action='./survey_delete.do'>
      <input type='hidden' name='makeno' value='${param.makeno}'>
      <input type="hidden" name="survey_cateno" value='${param.survey_cateno }'>
         
      <div class="form-group">   
        <div class="col-md-12" style='text-align: center; margin: 30px;'>
          삭제 되는글: ${saveVO.question }<br><br>
          삭제하시겠습니까? 삭제하시면 복구 할 수 없습니다.<br><br>

        <div class="form-group">   
        <div class="col-md-12">
          <input type='password' class="form-control" name='passwd'  value='' placeholder="패스워드" style='width: 20%; margin: 10px auto;'>
        </div>
      </div>
          
          <button type = "submit" class="btn btn-info">삭제 진행</button>
          <button type = "button" onclick = "history.back()" class="btn btn-info">취소</button>
        </div>
      </div>   
  </FORM>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
  