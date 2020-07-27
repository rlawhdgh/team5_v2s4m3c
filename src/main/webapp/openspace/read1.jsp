<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>언젠간 만들겠지</title>
<link href="/team5/css/style.css" rel='Stylesheet' type='text/css'>
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
</head>
<body>
 <div class="row"> 
<jsp:include page="/menu/top3.jsp" flush='false' />
  <DIV style='width: 100%; margin: px auto;'>

<jsp:include page="./side.jsp" flush="false"/>


<div class="col-md-10" style="border: solid 2px #999999; height: 500px;">
<div style="text-align: right;">
수정/삭제
</div>

  <div style="font-size: 30px;">
    <div class="col-md-1" style="font-size: 25px; border: solid 2px #999999; text-align: center;" >
    제목
    </div>
    <div class="col-md-9" style="font-size: 25px; border: solid 2px #999999;">
    제목 내용 공지사항 1번
    </div>
    <div class="col-md-2" style="font-size: 25px; border: solid 2px #999999;">
    <span style="font-size: 16px;">조회수: 0</span>
    </div>
  </div>
  
  <div>
    <div class="col-md-1" style="border: solid 2px #999999; text-align: center;">
    작성자
    </div>
    <div class="col-md-3" style="border: solid 2px #999999;">
      작성자 이름: 왕눈이
    </div>
    <div class="col-md-2">
    </div>
    <div class="col-md-3" style="border: solid 2px #999999;">
    등록일: 2020-05-13
    </div>
    <div class="col-md-3" style="border: solid 2px #999999;">
    수정일: 2020-05-20
    </div>
  </div>
  
  <div class="col-md-2" style="border: solid 2px #999999;">
  첨부파일
  </div>
  <div class="col-md-10" style="border: solid 2px #999999;">
   첨부파일 내용
  </div>
  
  <div class="col-md-12" style="height: 300px; border: solid 2px #999999;" >
  글 내용
  </div>
</div>



 </DIV>
  </div>
  <DIV style='margin: 0px auto; width: 90%;'>
    <DIV style='float: left; width: 50%;'>
     </DIV>
     <DIV style='float: left; width: 50%;'>
    </DIV>  
  </DIV>
 
  <DIV style='width: 94.8%; margin: 0px auto;'>
  </DIV>  
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
 
</body>
</html>