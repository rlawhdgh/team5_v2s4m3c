<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>자주묻는질문</title>


<link href="/team5/css/style.css" rel='Stylesheet' type='text/css'>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Set a style for all buttons */

button:hover {
  opacity:1;
}

/* Float cancel and delete buttons and add an equal width */
.cancelbtn, .deletebtn {
  float: left;
  width: 50%;
}


/* Add padding and center-align text to the container */
.container {
  padding: 16px;
  text-align: center;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: 1;
  padding-top: 150px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* Style the horizontal ruler */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}
 
/* The Modal Close Button (x) */
.close {
  position: absolute;
  right: 10px;
  top: 0px;
  font-size: 40px;
  font-weight: bold;
  color: #555555;
}

.close:hover,
.close:focus {
  color: #f44336;
  cursor: pointer;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

/* Change styles for cancel button and delete button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .deletebtn {
     width: 100%;
  }
}
</style>
<body>





 

 <div class="row"> 
<jsp:include page="/menu/top3.jsp" flush='false' />
  <DIV style='width: 100%; margin: 0px auto;'>

  <!-- 사이드 매뉴 -->
  <jsp:include page="./side.jsp" flush="false"/>

<div class="col-md-10" style="border-left: solid 1px #bbbbbb;">
  <div style="font-size: 30px; font-weight:bold; margin-left: 40px; margin-bottom: 10px;">
  자주묻는질문
  </div>
  <ul class="nav nav-tabs" style="width: 95%; margin: 0px auto;">
    <li class="active"><a data-toggle="tab" href="#home">전체</a></li>
    <li><a data-toggle="tab" href="#menu1">웹사이트 및 계정</a></li>
    <li><a data-toggle="tab" href="#menu2">결제가격 및 프로모션</a></li>
      <c:forEach var="questiongrpVO"  items="${listgrp }">
      <c:set var="questiongrp_no" value="${questiongrpVO.questiongrp_no}" />
      <c:set var="questiongrp_name" value="${questiongrpVO.questiongrp_name}" />
      <c:set var="questiongrp_seqno" value="${questiongrpVO.questiongrp_seqno}" />
        <li><a data-toggle="tab" href="#menu${questiongrp_no}">${questiongrp_name }</a></li>
      
      </c:forEach>
    
    <li> <a href="#" onclick="document.getElementById('grp').style.display='block'">추가+</a></li>
    <button class="pull-right" style="margin-top: 13px;" onclick="location.href='./create.do'">등록</button>
  </ul>
  
 <div id="grp" class="modal" style='width: 50%; margin: 0px auto;'>
  <form class="modal-content" name='frm' method="post" action="../questiongrp/create.do" >
  
  <div>
  <span onclick="document.getElementById('grp').style.display='none'" class="close" title="Close Modal">×</span>
  </div>
    <div class="" style='margin: 10px;'>
    <input type='hidden' name='admin_no' id='admin_no' value='1'>
      제목: <input type='text' style="width: 70%;" name='questiongrp_name'><br>
      순서: <input type='text' style="width: 70%;" name='questiongrp_seqno'>
    
      <div class="clearfix" style='margin: 5px auto;'>
         <button class='btn' type="submit" id="btn_send">등록</button>
     
      </div>

    </div>
  </form>
</div>
  
  
  
  
  

<div class="tab-content">
  <div id="home" class="tab-pane fade in active">
  <div style="height: 400px; ">
  
  <div class="panel-group" id="accordion" style="width: 95%; margin: 0px auto;">
  <c:forEach var="questionVO"  items="${list }">
    <c:set var="question_no" value="${questionVO.question_no}" />
    <c:set var="question_title" value="${questionVO.question_title}" />
    <c:set var="question_content" value="${questionVO.question_content}" />
    <c:set var="question_division" value="${questionVO.question_division}" />
    <c:set var="question_seqno" value="${questionVO.question_seqno}" />
    <c:set var="question_url" value="${questionVO.question_url}" />
    <c:set var="question_date" value="${questionVO.question_date}" />

 
    
    <div class=" panel panel-default" >
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse${question_no }">
          <span style="color: #f0ad4e;">Q. [${question_division }]</span> 
            ${question_title }
          </a>
          <a class="pull-right" href="#" onclick="document.getElementById('id0${question_no }').style.display='block'">삭제</a>
<%--           <a href="javascript:delete_file(${attachfileVO.attachfileno})"><img src="./images/delete.png" title="삭제"  border='0' /></a> --%>
           <span class="pull-right">&nbsp;/&nbsp; </span>
          <a class="pull-right" href="./update.do?question_no=${question_no }">수정</a>
        </h4>
      </div>
      <div id="collapse${question_no }" class="panel-collapse collapse">
        <div class="panel-body">
         ${question_content}
        </div>
        <div style='margin-left: 18px; font-size: 15px; margin-bottom: 10px; '>
          Url: ${question_url } <span class="pull-right">등록일 :${question_date.substring(0,10) }&nbsp;&nbsp;&nbsp;</span>
        </div>
        
        

      </div>
    </div>
    
    
    
  <div id="id0${question_no }" class="modal" style='width: 50%; margin: 0px auto;'>
  <form class="modal-content" action="/action_page.php" style='margin: 0px auto;'>
  <div>
  <span onclick="document.getElementById('id0${question_no }').style.display='none'" class="close" title="Close Modal">×</span>
  </div>
    <div class="" style='margin: 10px;'>
      <h2>파일을 정말 삭제하시겠습니까?</h2>
      <p>삭제된 파일은 복원할수 없습니다.</p>
    
      <div class="clearfix" style='margin: 5px auto;'>
        <button type="button" onclick="location.href='./delete.do?question_no=${question_no }'" class="btn btn-danger">삭제</button>
        <button type="button" onclick="document.getElementById('id0${question_no }').style.display='none'" class="btn pull-right">닫기</button>
      </div>
    </div>
  </form>
</div>

 
  </c:forEach>    
  </div>
  </div>
</div>
  
  <div id="menu1" class="tab-pane fade">
    <div style="height: 400px; ">
      <div class="panel-group" id="accordion1" style="width: 95%; margin: 0px auto;">
      <c:forEach var="questionVO"  items="${division_list1 }">
        <c:set var="question_no" value="${questionVO.question_no}" />
        <c:set var="question_title" value="${questionVO.question_title}" />
        <c:set var="question_content" value="${questionVO.question_content}" />
        <c:set var="question_division" value="${questionVO.question_division}" />
        <c:set var="question_seqno" value="${questionVO.question_seqno}" />
        <c:set var="question_url" value="${questionVO.question_url}" />
        <c:set var="question_date" value="${questionVO.question_date}" />
      
      
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion1" href="#web${question_no }">
          <span style="color: #f0ad4e;">Q. [${question_division }]</span>
            ${question_title }
          </a>
          <a class="pull-right" href="#">삭제</a>
          <span class="pull-right">&nbsp;/&nbsp; </span>
          <a class="pull-right" href="#">수정</a>
        </h4>
      </div>
      <div id="web${question_no }" class="panel-collapse collapse">
        <div class="panel-body">${question_content }</div>
         <div style='margin-left: 18px; font-size: 15px; margin-bottom: 10px;'>
        Url: ${question_url } <span class="pull-right">등록일 :  ${question_date.substring(0,10) }&nbsp;&nbsp;&nbsp;</span>
        </div>
      </div>
    </div>
      
      </c:forEach>
      </div>
      </div>
  </div>


  <div id="menu2" class="tab-pane fade">
    <div style="height: 400px; ">   
    <div class="panel-group" id="accordion2" style="width: 95%; margin: 0px auto;">
    <c:forEach var="questionVO"  items="${division_list2 }">
      <c:set var="question_no" value="${questionVO.question_no}" />
      <c:set var="question_title" value="${questionVO.question_title}" />
      <c:set var="question_content" value="${questionVO.question_content}" />
      <c:set var="question_division" value="${questionVO.question_division}" />
      <c:set var="question_seqno" value="${questionVO.question_seqno}" />
      <c:set var="question_url" value="${questionVO.question_url}" />
      <c:set var="question_date" value="${questionVO.question_date}" />
     
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion1" href="#cache${question_no }">
          <span style="color: #f0ad4e;">Q. [${question_division }]</span>
          ${question_title }
          </a>
         <a class="pull-right" href="#">삭제</a>
        <span class="pull-right">&nbsp;/&nbsp; </span>
        <a class="pull-right" href="#">수정</a>
        </h4>
      </div>
      <div id="cache${question_no }" class="panel-collapse collapse">
        <div class="panel-body">${question_content }</div>
         <div style='margin-left: 18px; font-size: 15px; margin-bottom: 10px;'>
            Url: ${question_url } <span class="pull-right">등록일 :${question_date.substring(0,10) }&nbsp;&nbsp;&nbsp;</span>
        </div>
      </div>
    </div>
    
    </c:forEach>
    </div>    
    </div>

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
