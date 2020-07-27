<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>

<script type="text/javascript">
  $(function() {
    CKEDITOR.replace('question');  // <TEXTAREA>태그 id 값
  });
</script> 
 
</head> 
 
<body>
<jsp:include page="/menu/top3.jsp" flush='false' />
  <DIV class='title_line'>
    <A href="../survey_categrp/survey_list.do">카테고리 그룹</A> > 
    <A href="../survey_cate/survey_list.do">모든 카테고리</A> > 글 등록
  </DIV>

  <ASIDE style='float: left;'>
    <A href=''>카테고리 그룹</A> > 
    <A href=''>카테고리</A> > 수정
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href=''>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
 
  <div class='menu_line'></div>
  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./survey_update.do' class="form-horizontal">
      <!-- FK memberno 지정 -->
      <input type='hidden' name='memberno' id='memberno' value='1'>
      <!-- FK categrpno 지정 -->
      <input type='hidden' name='survey_cateno' id='survey_cateno' value='${param.survey_cateno }'>
      
      <input type='hidden' name='survey_makeno' id='survey_makeno' value='${survey_makeVO.survey_makeno }'>
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="col-md-12" name='survey_question' value='${survey_makeVO.survey_question }' 
                    placeholder="제목" required="required" style='width: 80%;' autofocus="autofocus">
        </div>
      </div>   
      <div class="form-group">   
        <div class="col-md-12">
         <input type='hidden' name='survey_answer' id='survey_answer' value='${survey_makeVO.survey_answer }'>
   <%
            for (int i = 1; i <= 4; i++) {
              out.println("<td>" + (i * 2 - 1)
                  + ": <input survey_answer='survey_answer'></td>");
              out.println("<td>" + (i * 2)
                  + ": <input survey_answer='survey_answer'></td>");
              out.println("</tr>");
              if (i == 9) {
                out.println("");
              } else {
                out.println("<tr>");
              }
            }//for end
          %>
          </div>
          </div>
     <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="col-md-12" name='survey_word'  value='${survey_contentsVO.survey_word }' placeholder="검색어" style='width: 90%;'>
        </div>
      </div>
      <div class="form-group">   
        <div class="col-md-12">
          <input type='password' class="col-md-12" name='survey_passwd'  value='' placeholder="패스워드" style='width: 20%;'>
        </div>
      </div>
      
      <div style="background-color: #ff000; text-align: right;">
        <button type="submit" class="btn">수정</button>
        <button type="button" 
                    onclick="location.href='./survey_list_all.do?survey_categrpno=${param.survey_categrpno}'" 
                    class="btn">취소[목록]</button>
      </DIV>
       
    </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>

