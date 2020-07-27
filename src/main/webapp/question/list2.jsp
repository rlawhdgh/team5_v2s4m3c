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

<script type="text/javascript">
  function delete_file(question_no) {
    var sw = confirm("삭제 하시겠습니까?");
    if (sw == true) {
      alert("파일이 정상적으로 삭제되었습니다.")
      location.href="./delete.do?question_no=" + question_no;
    } else {
      alert('파일 삭제를 취소합니다.');
    }
  }
</script>


    
</head>
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
    <button class="pull-right" style="margin-top: 13px;" onclick="location.href='./create.do'">등록</button>
  </ul>

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
          <a class="pull-right" href="javascript:delete_file(${question_no })">삭제</a>
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
