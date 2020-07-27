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

<style type="text/css">
.table-hover > tbody > tr:hover {
  background-color: #364252;
}
</style>

</head> 
 
<body>
<jsp:include page="/menu/top3.jsp" flush='false' />

  <!-- Modal 알림창 시작 -->
  <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>  <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal 알림창 종료 -->
  

  <ASIDE style='float: left;'>
    관련 이미지 등록
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href='javascript: history.back()'>취소</A>
    <span class='menu_divide' >│</span> 
       <A href='./list_join.do?kind_kindno=${param.kind_kindno }'>목록</A>
  </ASIDE> 
 
  <div class='menu_line'></div>
  <DIV style='width: 100%;'>
    <FORM name='frm' id='frm' method='POST' action='./list_image_create.do' 
                enctype="multipart/form-data" class="form-horizontal">
      <!-- FK categrpno 지정 -->
      <input type='hidden' name='game_gameno' id='game_gameno' value='${param.game_gameno }'>
      <input type='hidden' name='kind_kindno' id='kind_kindno' value='${param.kind_kindno }'>
      
      <div class="form-group">   
        <div class="col-md-12">
          <%-- 실제 컬럼명: mp3, Spring File 객체 대응: mp3MF --%>
          <input type='file' class="form-control" name='game_imageMF' id='game_imageMF' 
                    value='' placeholder="파일 선택" multiple="multiple">
        </div>
      </div>

      <DIV class='pull-right'>
        <button type="submit" class="">등록</button>
        <button type="button" 
                   onclick="location.href='./list_join.do?kind_kindno=${param.kind_kindno}'" 
                    class="">취소[목록]</button>
      </DIV>
       
    </FORM>
  </DIV>
  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>

