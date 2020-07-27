<%@ page contentType="text/html; charset=UTF-8" %>
 
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
 
 <style type="text/css">
.table-hover > tbody > tr:hover {
  background-color: #364252;
}
</style>
 
</head> 
 
<body>
<jsp:include page="/menu/top3.jsp" flush='false' />

  <DIV class='title_line'>
    첨부 파일
  </DIV>

  <ASIDE style='float: left;'>
    신규 등록
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href='../game/read1.do?game_gameno=${param.game_gameno}'>목록</A>
  </ASIDE> 
 
  <div class='menu_line'></div>
  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./create.do' 
                enctype="multipart/form-data" class="form-horizontal">
               
      <!-- FK cateno 지정 -->
      <input type='hidden' name='kind_kindno' id='kind_kindno' value='${param.kind_kindno }'>
      <input type='hidden' name='game_gameno' id='game_gameno' value='${param.game_gameno }'>
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='file' class="form-control" name='game_fnamesMF'  
                     value='' placeholder="파일 선택" multiple="multiple">
        </div>
      </div>

      <DIV class='pull-right'>
        <button type="submit" class="">파일 등록</button>
        <button type="button" 
                    onclick="location.href='../game/read1.do?game_gameno=${param.game_gameno}'" 
                    class="">취소[목록]</button>
     </DIV>
       
    </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>


