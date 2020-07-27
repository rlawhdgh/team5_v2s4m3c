<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    CKEDITOR.replace('game_writing');
    CKEDITOR.replace('game_character'); 
    CKEDITOR.replace('game_require'); 
  });
</script> 

<style type="text/css">
.table-hover > tbody > tr:hover {
  background-color: #364252;
}
</style>
</head> 
 
<body>
<jsp:include page="/menu/top3.jsp" flush='false' />

  <ASIDE style='float: right;'>
    <A href='./game_join.do?kind_kindno=${param.kind_kindno }'>목록</A>
  </ASIDE> 
 
  <div class='menu_line'></div>
  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./create.do' class="form-horizontal">
              
      <!-- FK categrpno 지정 -->
      <input type='hidden' name='kind_kindno' id='kind_kindno' value=${param.kind_kindno }>
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="" name='game_title' value='' placeholder="제목" required="required" style='width: 80%;'>
        </div>
      </div>   
      
      <div class="form-group">   
        <div class="col-md-12">
          <textarea class="" name='game_writing' id='game_writing' rows='6' placeholder="게임 정보"></textarea>
        </div>
      </div>
    
      <div class="form-group">   
        <div class="col-md-12">
          <textarea class="" name='game_character' id='game_character' rows='6' placeholder="게임 특징"></textarea>
        </div>
      </div>
      
      <div class="form-group">   
        <div class="col-md-12">
          <textarea class="" name='game_require' id='game_require' rows='6' placeholder="시스템 요구사항"></textarea>
        </div>
      </div>
                 
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="" name='game_brief' value='' placeholder="간략한 정보" style='width: 50%;'>
        </div>
      </div> 
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="" name='game_price'  value='' placeholder="가격" style='width: 30%;'>
        </div>
      </div>
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="" name='game_sale'  value='' placeholder="할인가" style='width: 30%;'>
        </div>
      </div>
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="" name='game_release'  value='' placeholder="출시일" style='width: 30%;'>
        </div>
      </div>

      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="" name='game_developer'  value='' placeholder="개발사" style='width: 30%;'>
          
		      <DIV class='pull-right'>
		        <button type="submit" class="">등록</button>
		        <button type="button" 
		                    onclick="location.href='./list.do?kind_kindno=${param.kind_kindno}'" 
		                    class="">취소[목록]</button>
		     </DIV>
        </div>
      </div>
     
       
    </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>

