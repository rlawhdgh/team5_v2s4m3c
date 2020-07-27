<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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
$(document).ready(function() {
  document.getElementById('btn_send').onclick=send1;  
  document.getElementById('frm2').onsubmit=send1
  
});
function send1() {

  if(frm2.question_title.value.trim().length == 0){
    alert('제목을 입력해 주세요')
   
    frm2.question_title.focus();
    return false//실행 중지
  }
  if(frm2.question_title.value.trim().length > 50){
    alert('제목은 50자 이내로 해주세요')
    frm2.question_title.focus();
    return false//실행 중지
  }

  if(CKEDITOR.instances.question_content.getData().length==0){
    alert('내용을 입력해 주세요')
    CKEDITOR.instances.question_content.focus();
    return false
  }
    
  frm2.submit();  
}


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
<table style='width: 1250px;'>
<tr>
<td style='width: 170px; height: 100px;'>
<jsp:include page="./side.jsp" flush="false" />
</td>

<td rowspan="2" style='width: 900px; border-left: solid 1px #999999;'>
  <div class="" style="border-left: solid 1px #bbbbbb;">
    <div style="font-size: 30px; font-weight:bold; margin-left: 40px; margin-bottom: 10px;">
    자주묻는질문 등록 &nbsp;
    </div>
      <div style=" height: 1050px; width: 95%;margin: 0px auto;">
      
      <div style="width: 98%; margin: 20px auto; border: solid 1px #999999;">
      
    <form name='frm' id='frm2' method="post" action="./create.do">    
           
      <div style="margin-left: 75px; margin-top: 25px;">
      

      <div style="margin-left: 30px;">
      
      <div>      
      <span style="font-weight:bold;">제목 &nbsp;</span>
      <input name='question_title' id='question_title' style="width: 70%">
      </div>
      <br>
      
      <div>
      <span style="font-weight:bold;">구분 &nbsp;</span>         
      <select name='questiongrp_no' style="height: 26px; width: 20%;">
      <c:forEach var="questiongrpVO"  items="${listgrp }">
        <c:set var="questiongrp_no" value="${questiongrpVO.questiongrp_no}" />
        <c:set var="questiongrp_name" value="${questiongrpVO.questiongrp_name}" />
        <c:set var="questiongrp_seqno" value="${questiongrpVO.questiongrp_seqno}" />
      <option value='${questiongrp_no }'>&nbsp;&nbsp;${questiongrp_name } </option>
      
      </c:forEach>      
      </select>
      </div>     
      
      <br>
    
        <div style='width: 80%; margin-left: 43px;'>
          <textarea rows="10" id='question_content' name='question_content'></textarea>
        </div>
        <br>
        
       <div>      
      <span style="font-weight:bold;">Url &nbsp;&nbsp;</span>
      <input name='question_url' style="width: 80%">
      </div>
        
        
        
        
</div>
      

    <br>
    <div style="margin: 10px auto; text-align: center; margin-bottom: 30px;">
      <button type="button" id="btn_send">등록</button>
      <button type="button" onclick="location.href='./list.do'">취소</button>
    </div>
    
    </div>
    </form>
    
    </div>
    
    </div>
    
  </div>
  </td>
  </tr>
  <!-- 사이드 메뉴 상단고정을 위한 -->
 <tr>
<td>&nbsp;</td>
</tr>
  </table>



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