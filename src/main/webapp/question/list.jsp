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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.nav-tabs > li.active > a,
.nav-tabs > li.active > a:hover,
.nav-tabs > li.active > a:focus {
  color: #eeeeee;
  cursor: default;
  background-color: #111923;
  border: 1px solid #ddd;
}
.nav-tabs > li > a:hover {
  border-color: #eeeeee #eeeeee #ddd;
  background-color: #111923;
}
.nav-tabs > li > a:active {
  border-color: #eeeeee #eeeeee #ddd;
  background-color: #111923;
}
.table-hover > tbody > tr:hover {
  background-color: #364252;
}
.panel-group .panel+.panel {
     margin-top: 0px; 
}

</style>

</head>
<script type="text/javascript">
$(function() {
  $('#btn_create').on('click', update_questiongrp);
  list_questiongrp();
});


function grpnull() {
  alert("그룹을 먼저 생성해줭")
}


function update(no, name, seqno) {
  var aa= name;
  var tags =  "제목: <input autocomplete='off' type='text' style='width: 70%;' name='questiongrp_name' value='"+aa+"'><br><br>";
  tags += "순서: <input autocomplete='off' type='number' style='width: 30%;' name='questiongrp_seqno' value='"+seqno+"'>"
  tags += "<input type='hidden' name='questiongrp_no' id='questiongrp_no' value='"+no+"'>"

  
  var bb = document.getElementById("bb");
  bb.innerHTML=tags;    
}

function del(no, name, seqno) {
  var tags =  "제목: "+name+"<br>";
        tags += "출력 순서: "+seqno;
        tags += "<input type='hidden' name='questiongrp_no' id='questiongrp_no' value='"+no+"'>"

  
  var del = document.getElementById("del");
  del.innerHTML=tags;    
}


function update_questiongrp() {
  var frm_grp = $('#frm_grp');
  var params = frm_grp.serialize();
  var no = $('#questiongrp_no',frm_grp).val();
  alert(no);

  $.ajax({
    url: "../questiongrp/update.do", // action 대상 주소
    type: "post",           // get, post
    cache: false,          // 브러우저의 캐시영역 사용안함.
    async: true,           // true: 비동기
    dataType: "json",   // 응답 형식: json, xml, html...
    data: params,        // 서버로 전달하는 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      // alert(rdata);
      var msg = "";
      
      list_questiongrp();
      $('#update_grp').trigger("click");
      alert("수정되었습니다.");
        
    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      var msg = 'ERROR request.status: '+request.status + '/ ' + error;
      console.log(msg); //Chrome에 출력
    }
  });
  //$("#grp1").load(location.href+' #grp1');
  $("#grp"+no).load(location.href+' #grp'+no);
  $("#question_list").load(location.href+' #question_list');
 // $("#grp_top").load(location.href+' #grp_top');
}



function list_questiongrp() {
  // alert(contentsno);
  var params = '';
  var a = '"';
  var b ="'";



  $.ajax({
    url: "../questiongrp/list.do", // action 대상 주소
    type: "get",           // get, post
    cache: false,          // 브러우저의 캐시영역 사용안함.
    async: true,           // true: 비동기
    dataType: "json",   // 응답 형식: json, xml, html...
    data: params,        // 서버로 전달하는 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      // alert(rdata);
      var msg = '';
      $('#questiongrp_list').html('');
      
      for (i=0; i < rdata.listgrp.length; i++) {
        var row = rdata.listgrp[i];
        
       msg+="<tr>"
       msg+="<td style='text-align: center;'>"+row.questiongrp_seqno+"</td>"
       msg+="<td>"+row.questiongrp_name+"</td>"
       msg+="<td style='text-align: center;'>"
       msg+="<a style='cursor:pointer; ' onclick="+a+"document.getElementById('grpupdate').style.display='block', update("+row.questiongrp_no+", "+b+row.questiongrp_name+b+", "+row.questiongrp_seqno +")"+a+">수정</a>"
       msg+="/";
       msg+="<a style='cursor:pointer; color:#c7d5e0;' onclick="+a+"document.getElementById('grpdelete').style.display='block', del("+row.questiongrp_no+", "+b+row.questiongrp_name+b+", "+row.questiongrp_seqno +")"+a+" >삭제</a>";
       msg+="</td>"
       msg+="</tr>";    
      }
      $('#questiongrp_list').append(msg);

    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      var msg = 'ERROR request.status: '+request.status + '/ ' + error;
      console.log(msg);
    }
  });

}




</script>


<style>




/* Set a style for all buttons */



button:hover {
  opacity:1;
}


/* Add padding and center-align text to the container */
.container {
  padding: 16px;
  text-align: center;
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



</style>

<body>


 <jsp:include page="/menu/top3.jsp" flush='false' /> 
  <DIV style='margin: 0px auto; '>

  <!-- 사이드 매뉴 -->
  <table style='width: 100%;  '>
<tr>
<td style='width: 15%; height: 100px;'>
<jsp:include page="./side.jsp" flush="false" />
</td>
  
<td  rowspan="2" style='width:85%; border-left: solid 1px #999999;'>
<div  style="" >
  <div style="font-size: 30px; font-weight:bold; margin-left: 40px; margin-bottom: 10px; padding-top: 15px;">
  자주묻는질문 
  
  </div>
  
  <ul id='grp_top' class="nav nav-tabs" style="width: 95%; margin: 0px auto;">

    <c:if test="${a==0 }">
    <li class="active">    
    <a href="#home">전체</a>
    </li>
    </c:if>
        <c:if test="${a!=0 }">
    <li >    
    <a href="./list.do">전체</a>
    </li>
    </c:if>
     <c:forEach var="questiongrpVO"  items="${listgrp }" varStatus="info">
      <c:set var="questiongrp_no" value="${questiongrpVO.questiongrp_no}" />
      <c:set var="questiongrp_name" value="${questiongrpVO.questiongrp_name}" />
      <c:set var="questiongrp_seqno" value="${questiongrpVO.questiongrp_seqno}" />
      
      <c:if test="${questiongrp_no==a }">
        <li class="active">
      <a id='grp${info.count }' href="./list.do?questiongrp_no=${questiongrp_no }">${questiongrp_name }</a>
        </li>      
      
      </c:if>
       <c:if test="${questiongrp_no!=a }">
        <li>
      <a id='grp${questiongrp_no }' href="./list.do?questiongrp_no=${questiongrp_no }">${questiongrp_name }</a>
        </li>
      </c:if>
      </c:forEach>
<c:if test="${sessionScope.consumer_id != null && sessionScope.admin=='Y'}">    
    <li> 
    <a style=' font-weight:bold;' href="#" onclick="document.getElementById('grp').style.display='block'">추가+</a>
    </li>
    <li> 
    <a style=' font-weight:bold;' href="#" onclick="document.getElementById('update').style.display='block'">수정</a>
    </li>

    <c:if test="${grpsize ==0 }">
    <button class="pull-right" style="margin-top: 13px;" onclick="javascript:grpnull()">글 등록</button>
    </c:if>
     <c:if test="${grpsize !=0 }">
    <button class="pull-right" style="margin-top: 13px;" onclick="location.href='./create.do'">글 등록</button>
    </c:if>
 </c:if>   
    
  </ul>
    
 
 
<!-- 그룹 등록 -->  
 <div id="grp" class="modal" style='width: 40%; margin: 0px auto; background-color: rgba(0,0,0,0.0); ' >
  <form class="modal-content" name='frm' method="post" action="../questiongrp/create.do" >
  
  <div>
  <span onclick="document.getElementById('grp').style.display='none'" class="close" title="Close Modal">×</span>
  </div>
    <div class="" style='margin: 10px;'>
    <input type='hidden' name='admin_no' id='admin_no' value='1'>
    <div style='margin: 5px 0px;'>
      <h2>자주묻는 질문 구분 등록</h2>
    </div>
      제목: <input autocomplete='off' type='text' style="width: 60%;" name='questiongrp_name'>  
      <button class='btn' type="submit" id="btn_send" style='margin-left: 20px;'>추가하기</button><br>
      <div class="clearfix" style='margin: 5px auto; text-align: center;'>
     
      </div>

    </div>
  </form>
</div>
<c:if test="${sessionScope.consumer_id != null && sessionScope.admin=='Y'}">
<div id="update" class="modal" style='width: 50%; margin: 0px auto; background-color: rgba(0,0,0,0.0)'>
  <form class="modal-content" name='frm' method="post" action="../questiongrp/create.do" >
  
  <div>
  <span onclick="document.getElementById('update').style.display='none'" class="close" title="Close Modal">×</span>
  </div>
    <div class="" style='margin: 10px;'>
    <div style='margin-left: 5px;'>
    <h2>등록된 구분 리스트</h2>
    </div>
    
    <table class="table table-hover">
      <colgroup>
        <col style='width: 10%;'/>
        <col style='width: 60%;'/>
        <col style='width: 30%;'/>
      </colgroup>
      
      <thead style="background-color: #111923;">
        <tr >
          <th style="text-align: center;">번호</th>
          <th style="text-align: center;">이름</th>
          <th style="text-align: center;">기타</th>
        </tr>
      </thead>
      <tbody id='questiongrp_list'>

      </tbody>
    </table>
      <div class="clearfix" style='margin: 5px auto;'>    
      </div>
    </div>
  </form>
</div>  
</c:if>
  
  
<c:if test="${sessionScope.consumer_id != null && sessionScope.admin=='Y'}">  
 <div id="grpupdate" class="modal" style='width: 50%; margin: 0px auto; background-color: rgba(0,0,0,0.0)'>
  <form class="modal-content" id='frm_grp' name='frm_grp' style='margin-top: 80px;'>
  
  <div>
  <span id='update_grp' onclick="document.getElementById('grpupdate').style.display='none'" class="close" title="Close Modal">×</span>
  </div>
    <div class="" style='margin: 10px;'>
    <input type='hidden' name='admin_no' id='admin_no' value='1'>
     <div>
     <h2>구분 수정</h2>
     </div>
     <div id='bb'></div>   
      <div class="clearfix" style='margin: 5px auto;'>
         <button class='btn pull-right' type="button" id="btn_create">수정</button>     
      </div>
    </div>
  </form>
</div>
</c:if>

<c:if test="${sessionScope.consumer_id != null && sessionScope.admin=='Y'}">
 <div id="grpdelete" class="modal" style='width: 50%; margin: 0px auto; background-color: rgba(0,0,0,0.0)'>
  <form class="modal-content" name='frm' method="post" action="../questiongrp/delete.do"  style='margin-top: 80px;'>  
  <div>
  <span onclick="document.getElementById('grpdelete').style.display='none'" class="close" title="Close Modal">×</span>
  </div>
    <div class="" style='margin: 10px;'>
    <input type='hidden' name='admin_no' id='admin_no' value='1'>
     <div>
     정말 삭제하시겠습니까?<br>
     등록된 글도 전부 삭제됩니다<br>
     삭제된 정보는 복구할수 없습니다.
     </div>
     <div id='del'>     
     </div>    
      <div class="clearfix" style='margin: 5px auto;'>
         <button class='btn btn-danger' type="submit" id="btn_send">삭제</button>     
      </div>
    </div>
  </form>
</div>
 </c:if>   

<div class="tab-content">

  <div id='question_list' style="height: 550px; ">
  
  <div class="panel-group" id="accordion" style="width: 95%; margin: 0px auto;">
  <c:forEach var="questionVO"  items="${list }">
    <c:set var="question_no" value="${questionVO.question_no}" />
    <c:set var="question_title" value="${questionVO.question_title}" />
    <c:set var="question_content" value="${questionVO.question_content}" />
    <c:set var="question_division" value="${questionVO.question_division}" />
    <c:set var="question_seqno" value="${questionVO.question_seqno}" />
    <c:set var="question_url" value="${questionVO.question_url}" />
    <c:set var="question_date" value="${questionVO.question_date}" />
 
    <div class=" panel panel-default" style="background-color: #111923;" >
      <div class="panel-heading" style=" margin:15px; padding: 0px;">
        <h4 class="panel-title" style="background-color: #111923;">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse${question_no }">
          <span id='grpspan${question_no }' style="color: #f0ad4e;">Q. [${questionVO.questiongrp_name }]</span> 
            ${question_title }
          </a>
          <!-- onclick="document.getElementById('id값') 해당되는 모달 열기 -->
          
          <c:if test="${sessionScope.consumer_id != null && sessionScope.admin=='Y'}">
          <a class="pull-right" href="#" onclick="document.getElementById('delete${question_no }').style.display='block'">삭제</a>
<%--           <a href="javascript:delete_file(${attachfileVO.attachfileno})"><img src="./images/delete.png" title="삭제"  border='0' /></a> --%>
           <span class="pull-right">&nbsp;/&nbsp; </span>
          <a class="pull-right" href="./update.do?question_no=${question_no }">수정</a>
          </c:if>
          
        </h4>
      </div>
      <div id="collapse${question_no }" class="panel-collapse collapse" style='background-color: #1b2838'>
        <div class="panel-body">
         ${question_content}
        </div>
        <div style='margin-left: 18px; font-size: 15px; padding-bottom: 10px; '>
          Url: ${question_url } <span class="pull-right">등록일 :${question_date.substring(0,10) }&nbsp;&nbsp;&nbsp;</span>
        </div>

      </div>
    </div>
    
<c:if test="${sessionScope.consumer_id != null && sessionScope.admin=='Y'}">
  <!-- 해당되는 id 값 모달창 열림 -->
  <div id="delete${question_no }" class="modal" style='width: 50%; margin: 0px auto; background-color: rgba(0,0,0,0.0)'>
  <form class="modal-content" action="/action_page.php" style='margin: 0px auto;'>
  <div>
  <!-- 해당되는 id 값 모달창 닫기 -->
  <span onclick="document.getElementById('delete${question_no }').style.display='none'" class="close" title="Close Modal">×</span>
  </div>
    <div class="" style='margin: 10px;'>
      <h2>파일을 정말 삭제하시겠습니까?</h2>
      <p>삭제된 파일은 복원할수 없습니다.</p>   
      <div class="clearfix" style='margin: 5px auto;'>
        <button type="button" onclick="location.href='./delete.do?question_no=${question_no }'" class="btn btn-danger">삭제</button>
        <button type="button" onclick="document.getElementById('delete${question_no }').style.display='none'" class="btn pull-right">닫기</button>
      </div>
    </div>
  </form>
</div>
</c:if>
 
  </c:forEach>    
  </div>
  </div>
</div>
</div>
</td>
</tr>
<tr>
<td>&nbsp;<td>
</tr>

</table>





 </DIV>
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
