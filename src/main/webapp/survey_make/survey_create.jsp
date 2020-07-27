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
function writecheck(){ 

  var form = document.make_form; 

  if(form.survey_question.value.length==0) 

  { 

          alert("질문 내용을 입력해 주세요."); 

          form.survey_question.focus(); 

          return false; 

  } 

  if(form.survey_answer1.value.length==0) 

  { 

          alert("답변1 내용을 입력해 주세요."); 

          form.survey_answer1.focus(); 

          return false; 

  } 

  if(form.survey_answer2.value.length==0) 

  { 

          alert("답변2 내용을 입력해 주세요."); 

          form.survey_answer2.focus(); 

          return false; 

  } 

  form.submit(); 

} 
</script> 
</head> 
 
<body>
<jsp:include page="/menu/top3.jsp" flush='false' />
  <DIV class='title_line'>
    ${survey_cateVO.survey_name }
  </DIV>

  <ASIDE style='float: left;'>
    ${survey_categrpVO.survey_name } > ${survey_cateVO.survey_name } > 신규 등록
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href='./survey_list.do?survey_cateno=${param.survey_cateno }'>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
 
  <div class='menu_line'></div>
  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./survey_create.do' class="form-horizontal">
               
      <!-- FK memberno 지정 -->
      <input type='hidden' name='memberno' id='memberno' value='1'>
      <!-- FK categrpno 지정 -->
      <input type='hidden' name='survey_cateno' id='survey_cateno' value='${param.survey_cateno }'>
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="col-md-12" name='survey_question' value='' placeholder="제목" required="required" style='width: 80%;'>
        </div>
      </div>   
      <div class="form-group">   
        <div class="col-md-12">
          <p> 1.<input type="text" name="survey_answer1" maxlength="100" size="60"></p> 

          <p> 2.<input type="text" name="survey_answer2" maxlength="100" size="60"></p> 

          <p> 3.<input type="text" name="survey_answer3" maxlength="100" size="60"></p> 

        </div>
      </div>
       <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="col-md-12" name='survey_word'  value='' placeholder="검색어" style='width: 90%;'>
        </div>
      </div>

      <div class="form-group">   
        <div class="col-md-12">
          <input type='password' class="col-md-12" name='survey_passwd'  value='' placeholder="패스워드" style='width: 20%;'>
        </div>
      </div>
      <table>
				<tr>

                    <td width="100" height="27" align="center" bgcolor="white"> 

                        <p>설문기간</p> 

                    </td> 

                    <td width="50" height="20" bgcolor="white"> 

                        <p> <select name="survey_period" size="1"> 

                            <option value="1" selected>1일</option> 

                            <option value="2">2일</option> 



                            <option value="9">9일</option> 

                            <option value="10">10일</option> 

                            <option value="15">15일</option> 

                            <option value="20">20일</option> 

                            <option value="25">25일</option> 

                            <option value="30">30일</option> 

                            <option value="60">60일</option> 

                            <option value="90">90일</option> 

                            <option value="120">120일</option> 

                            <option value="150">150일</option> 

                            <option value="180">180일</option> 

                            <option value="240">240일</option> 

                            <option value="300">300일</option> 

                            <option value="365">365일</option> 

                            </select></p> 

          </td><td width="100" height="20" align="center" bgcolor="purple"> 

                        <p>중복선택 가능</p> 

                    </td> 

                    <td width="161" height="27" bgcolor="white"> 

                        <p> 아니오 <input type="radio" name="survey_type" value="n" checked>    

                예<input type="radio" name="survey_type" value="y"></p> 

                    </td>   

                   <!--  <td width="126" align="center" bgcolor="silver" height="36"> 

                        <p> </p> </td> 

                   <td width="471" colspan="3" bgcolor="white" height="36">  

                        <p> <input type="submit" value="등록하기" style="font-family:굴림; font-size:10pt;" onclick="return writecheck();"> 

                            <input type="reset" name="reset" value="취 소" style="font-family:굴림; font-size:10pt;"></p> </td> -->
</table>

      <!-- <div class="form-group">   
        <div class="col-md-12">
          <input type='password' class="form-control" name='survey_passwd'  value='' placeholder="패스워드" style='width: 20%;'>
        </div>
      </div> -->
      
      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn ">등록</button>
        <button type="button" 
                    onclick="location.href='./survey_list.do?survey_cateno=${param.survey_cateno}'" 
                    class="btn ">취소[목록]</button>
      </DIV>
       
    </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>

