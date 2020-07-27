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

<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>

<script type="text/javascript">
  $(function () {
    CKEDITOR.replace('question_content');  // <TEXTAREA>태그 id 값
  });
</script>
    
</head>
<body>
<!-- 메인 게임 사진 -->
 <div class="row"> 
<jsp:include page="/menu/top3.jsp" flush='false' />
  <DIV style='width: 100%; margin: 0px auto;'>
  
  <!-- 사이드 매뉴 -->
  <jsp:include page="./side.jsp" flush="false"/>
  
  <div class="col-md-10" style="border-left: solid 1px #bbbbbb;">
    <div style="font-size: 30px; font-weight:bold; margin-left: 40px; margin-bottom: 10px;">
    자주묻는질문 등록 &nbsp;
    </div>
      <div style=" height: 1050px; width: 95%;margin: 0px auto;">
      
      <div style="width: 98%; margin: 20px auto; border: solid 1px #999999;">
      
    <form name='frm' method="post" action="./create.do">    
      <input type='hidden' name='questiongrp_no' id='questiongrp_no' value='1'>
           
      <div style="margin-left: 75px; margin-top: 25px;">
      

      <div style="margin-left: 30px;">
      
      <div>      
      <span style="font-weight:bold;">제목 &nbsp;</span>
      <input name='question_title' style="width: 70%">
      </div>
      <br>
      
      <div>
      <span style="font-weight:bold;">구분 &nbsp;</span>         
      <select name='question_division' style="height: 26px; width: 20%;">
        <option value='결제가격 및 프로모션'>&nbsp;&nbsp;결제가격 및 프로모션</option>
        <option value='웹사이트 및 계정'>&nbsp;&nbsp;웹사이트 및 계정</option>
      </select>
      </div>     
      
      <br>
    
        <div style='width: 80%; margin-left: 43px;'>
          <textarea rows="10" id='question_content' name='question_content'></textarea>
        </div>
        <br>
        
       <div>      
      <span style="font-weight:bold;">Url &nbsp;&nbsp;</span>
      <input name='question_url' style="width: 70%">
      </div>
        
        
        
        
</div>
      

    <br>
    <div style="margin: 10px auto; text-align: center; margin-bottom: 30px;">
      <button type="submit" id="btn_send">등록</button>
      <button type="button" onclick="location.href='./list.do'">취소</button>
    </div>
    
    </div>
    </form>
    
    </div>
    
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