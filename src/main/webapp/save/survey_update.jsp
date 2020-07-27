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
     <A href='./pollList.do?survey_cateno=${survey_cateno }'>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
 
  <div class='menu_line'></div>
  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./survey_update.do' class="form-horizontal">

      <!-- FK categrpno 지정 -->
      <input type='hidden' name='survey_cateno' id='survey_cateno' value='${param.survey_cateno }'>   
       <input type='hidden' name='makeno' id='makeno' value='${saveVO.makeno }'> 
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="col-md-12" name='question' value='${saveVO.question }' 
                    placeholder="제목" required="required" style='width: 80%;' autofocus="autofocus">
        </div>
      </div>
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text'  class="col-md-12" name='item1' value='${saveVO.item1 }'> 
        </div>
      </div>
        
            <div class="form-group">   
        <div class="col-md-12">
         <input type='text'  class="col-md-12" name='item2' value='${saveVO.item2 }'> 
        </div>
      </div>
           <div class="form-group">   
        <div class="col-md-12">
          <input type='text'  class="col-md-12" name='item3' value='${saveVO.item3 }'> 
        </div>
      </div>

     <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="col-md-12" name='word'  value='${saveVO.word }' placeholder="검색어" style='width: 20%;'>
        </div>
      </div>   
           <div class="form-group">   
        <div class="col-md-12">
          <input type='password' class="col-md-12" name='passwd'  value='' placeholder="패스워드" style='width: 20%;'>
        </div>
      </div>   
     <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-info">수정</button>
        <button type="button" 
                    onclick="location.href='./pollList.do?survey_cateno=${param.survey_cateno}'" 
                    class="btn btn-info">취소[목록]</button>
      </DIV>
       
    </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>

