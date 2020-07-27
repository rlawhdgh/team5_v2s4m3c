<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>자주묻는질문 등록</title>
<link href="/team5/css/style.css" rel='Stylesheet' type='text/css'>
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>




</head>
<body>
 <div id="grpupdate" class="modal" style='width: 50%; margin: 0px auto;'>
  <form class="modal-content" name='frm' method="post" action="../questiongrp/create.do"  style='margin-top: 80px;'>
  
  <div>
  <span onclick="document.getElementById('grpupdate').style.display='none'" class="close" title="Close Modal">×</span>
  </div>
    <div class="" style='margin: 10px;'>
    <input type='hidden' name='admin_no' id='admin_no' value='1'>
      제목: <input type='text' style="width: 70%;" name='questiongrp_name' ><br>
      순서: <input type='text' style="width: 70%;" name='questiongrp_seqno'>
    
      <div class="clearfix" style='margin: 5px auto;'>
         <button class='btn' type="submit" id="btn_send">등록</button>
     
      </div>

    </div>
  </form>
</div>

</body>
</html>