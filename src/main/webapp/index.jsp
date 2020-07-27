<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>언젠간 만들겠지</title>
<link rel="shortcut icon" type="image/x-icon" href="/team5/css/images/이미지 6.ico">
<link href="./css/style.css" rel='Stylesheet' type='text/css'>
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script> 
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function() {
  var frm = $('#frm_img_create');
  frm.ajaxForm(
  abcdef); // 응답처리 함수 등록, Form plugin Ajax 지원 기능 등록
/*    */
 
});

function abcdef(rdata) {
  var frm = $('#frm_img_create');
  $('#file1', frm).val('');
  $('#index_img_url', frm).val('');
  $('#index_img_close').trigger("click");
  alert("등록되었습니다.");
  index_img_all();
}

function send(){
  var frm = $('#frm_img_create');
  $('#frm_img_create').submit();  // 서브밋
}



$(function() {
  $('#btn_index_img').on('click', index_img_update);


    index_img_all();

});
function index_delete(no) {
  $('#btn_index_img_delete').on('click', index_img_delete(no));
  
}


function abc(a) {
  $('#btn_index_img').on('click', index_img_update(a));
}
function ab() {
  alert("호출됨!!!");
}

function index_imgupdate(type, no, fupname, fname, url, division, rdate) {
 
  var fupname1 = "\""+fupname + "\"";
  var fname1 = "\""+fname + "\"";
  var url1 = "\""+url + "\"";
  var division1 = "\""+division + "\"";
  var rdate1 = "\""+rdate + "\"";
  

  if(division=="이벤트"){
    var selected= "selected='selected'";
  }else{
    var selected ="";
  } 
  if(type=="전체"){
    var type1 = "all";
  }else if(type =="메인"){
    var type1 = "main";
  } else if(type == "이벤트"){
    var type1 = "event"
  }
  
  var type2 = "\""+type1 + "\"";
  var type3 = "\""+type + "\"";

 
var tag ="  <input type='hidden' name='index_img_no' id='index_img_no' value='"+no+"'>";
  tag += "<td style='text-align: center; '><img src='/team5/storage/"+fupname+"' style='width: 120px; height: 80px;'></td>";
  //tag = "<td style='text-align: center; '><img src='/team5/storage/"+fupname+"' style='width: 120px; height: 80px;'></td>";
  tag += "<td style='text-align: center; vertical-align: middle;'>"+fname+"</td>";
  // tag += "<td style='text-align: center; vertical-align: middle;'><a href='"+url+"'>"+url+"</a></td>";
  tag +="<td style='text-align: center;'><input style='width: 100%; margin-top: 27px;' type='text' name='index_img_url' id='index_img_url' value='"+url+"'></td>"
  // tag += "<td style='text-align: center; vertical-align: middle;'>"+division+"</td>";
  tag += "<td style='text-align: center; vertical-align: middle;'>";
  tag += "<select name='index_img_division' style='height: 26px;'>";
  tag += "<option value='메인'>&nbsp;&nbsp;메인</option>";
  tag += "<option "+selected+" value='이벤트'>&nbsp;&nbsp;이벤트</option>";
  tag += "</select></td>";
  tag +="<td style='text-align: center; vertical-align: middle;' >"+rdate+"</td>";
  //tag +="<td style='text-align: center; vertical-align: middle;'>저장 / <a>취소</a></td>";
  tag +="<td style='text-align: center; vertical-align: middle;'> <button onclick='abc("+type3+")' id='btn_index_img' type='button' class='btn btn-link'>저장</button> / ";
  tag +="<a id='rty"+no+"' href='javascript:index_imgupdateno("+type3+","+no+","+fupname1+","+fname1+","+url1+","+division1+","+rdate1+")'> 취소</a></td>";


  // no,fupname1,fname1,url1,division1,rdate1
  $('#tr'+type1+no).html(tag); // 문자열을 태그로 적용
  $('#tr'+type1+no).show();    //패널 출력
  
}


function index_imgupdateno(type, no, fupname, fname, url, division, rdate) {
  var fupname1 = "\""+fupname + "\"";
  var fname1 = "\""+fname + "\"";
  var url1 = "\""+url + "\"";
  var division1 = "\""+division + "\"";
  var rdate1 = "\""+rdate + "\"";
  
  
  if(type=="전체"){
    var type1 = "all";
  }else if(type =="메인"){
    var type1 = "main";
  } else if(type == "이벤트"){
    var type1 = "event"
  }
  
  var type2 = "\""+type + "\"";
  
  
  var tag = "<td style='text-align: center; '><img src='/team5/storage/"+fupname+"' style='width: 120px; height: 80px;'></td>";
  tag += "<td style='text-align: center; vertical-align: middle;'>"+fname+"</td>";
  tag += "<td style='text-align: center; vertical-align: middle;'><a target='_blank' href='"+url+"'>"+url+"</a></td>";
  //tag +="<td style='text-align: center;'><input type='text' name='index_img_url' id='index_img_url' value='"+url+"'></td>"
  tag += "<td style='text-align: center; vertical-align: middle;'>"+division+"</td>";
  tag +="<td style='text-align: center; vertical-align: middle;' >"+rdate+"</td>";
  tag +="<td style='text-align: center; vertical-align: middle;'>";
  tag += "<a href='javascript:index_imgupdate("+type2+","+no+","+fupname1+","+fname1+","+url1+","+division1+","+rdate1+")'>수정</a> /"; 
  tag += "<button onclick='index_delete("+no+")' id='btn_index_img_delete' type='button' class='btn btn-link'>삭제</button>";
  
  $('#tr'+type1+no).html(tag); // 문자열을 태그로 적용
  $('#tr'+type1+no).show();    //패널 출력
  
}




function index_img_update(type) {
  var frm_all = $('#frm_all');
  var params = frm_all.serialize();
  var no = $('#index_img_no',frm_all).val();


  $.ajax({
    url: "./index/update.do", // action 대상 주소
    type: "post",           // get, post
    cache: false,          // 브러우저의 캐시영역 사용안함.
    async: true,           // true: 비동기
    dataType: "json",   // 응답 형식: json, xml, html...
    data: params,        // 서버로 전달하는 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      // alert(rdata);
      var msg = "";
      
      alert("수정되었습니다.");
      index_img_all();
    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      var msg = 'ERROR request.status: '+request.status + '/ ' + error;
      console.log(msg); //Chrome에 출력
    }
  });
  
}




function index_img_all() {
  // alert(contentsno);
  var params = '';
  var a = '"';
  var b ="'";

$.ajax({
  url: "/team5/index/img_list.do", // action 대상 주소
  type: "get",           // get, post
  cache: false,          // 브러우저의 캐시영역 사용안함.
  async: true,           // true: 비동기
  dataType: "json",   // 응답 형식: json, xml, html...
  data: params,        // 서버로 전달하는 데이터
  success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
    // alert(rdata);
    var msg = '';
    var msg1 = '';
    var msg2 = '';
    
    $('#index_img_all').html('');
    $('#index_main_img').html('');
    $('#index_event_img').html('');
    
    for (i=0; i < rdata.list.length; i++) {
      var row = rdata.list[i];
      
     msg+="<tr id ='trall"+row.index_img_no+"'>"
     msg+="<td style='text-align: center; '><img src='/team5/storage/"+row.index_img_fupname+"' style='width: 120px; height: 80px;'></td>"
     msg+="<td style='text-align: center; vertical-align: middle'>"+row.index_img_fname +"</td>   "
     msg+="<td style='text-align: center; vertical-align: middle;'><a target='_blank' href='"+row.index_img_url+"'>"+row.index_img_url+"</a></td>"
     msg+="<td style='text-align: center; vertical-align: middle;'>"+row.index_img_division+"</td>"
     msg+="<td style='text-align: center; vertical-align: middle;' >"+row.index_img_rdate.substring(0,10) +"</td>";
     msg+="<td style='text-align: center; vertical-align: middle;'>";
     msg+= "<a href='javascript:index_imgupdate("+a+"전체"+a+","+row.index_img_no +","+a+""+row.index_img_fupname+""+a+","+a+""+row.index_img_fname +""+a+","+a+""+row.index_img_url +""+a+","+a+""+row.index_img_division+""+a+","+a+""+row.index_img_rdate.substring(0,10) +""+a+" )'>수정</A>" ;     
     msg+=  "/";
     msg +="<button onclick='index_delete("+row.index_img_no+")' id='btn_index_img_delete' type='button' class='btn btn-link'>삭제</button></td>"    
     msg+="</td>";
     msg+="</tr>";    
    }
    for (i=0; i < rdata.list_main.length; i++) {
      var row = rdata.list_main[i];
      
     msg1+="<tr id ='trmain"+row.index_img_no+"'>"
     msg1+="<td style='text-align: center; '><img src='/team5/storage/"+row.index_img_fupname+"' style='width: 120px; height: 80px;'></td>"
     msg1+="<td style='text-align: center; vertical-align: middle'>"+row.index_img_fname +"</td>   "
     msg1+="<td style='text-align: center; vertical-align: middle;'><a target='_blank' href='"+row.index_img_url+"'>"+row.index_img_url+"</a></td>"
     msg1+="<td style='text-align: center; vertical-align: middle;'>"+row.index_img_division+"</td>"
     msg1+="<td style='text-align: center; vertical-align: middle;' >"+row.index_img_rdate.substring(0,10) +"</td>";
     msg1+="<td style='text-align: center; vertical-align: middle;'>"
     msg1+= "<a href='javascript:index_imgupdate("+a+"메인"+a+","+row.index_img_no +","+a+""+row.index_img_fupname+""+a+","+a+""+row.index_img_fname +""+a+","+a+""+row.index_img_url +""+a+","+a+""+row.index_img_division+""+a+","+a+""+row.index_img_rdate.substring(0,10) +""+a+" )'>수정</A>" ;     
     msg1+=  "/";
     msg1+="<button onclick='index_delete("+row.index_img_no+")' id='btn_index_img_delete' type='button' class='btn btn-link'>삭제</button></td>"    
     msg1+="</td>";
     msg1+="</tr>";    
    }

    for (i=0; i < rdata.list_event.length; i++) {
      var row = rdata.list_event[i];
      
     msg2+="<tr id ='trevent"+row.index_img_no+"'>"
     msg2+="<td style='text-align: center; '><img src='/team5/storage/"+row.index_img_fupname+"' style='width: 120px; height: 80px;'></td>"
     msg2+="<td style='text-align: center; vertical-align: middle'>"+row.index_img_fname +"</td>   "
     msg2+="<td style='text-align: center; vertical-align: middle;'><a target='_blank' href='"+row.index_img_url+"'>"+row.index_img_url+"</a></td>"
     msg2+="<td style='text-align: center; vertical-align: middle;'>"+row.index_img_division+"</td>"
     msg2+="<td style='text-align: center; vertical-align: middle;' >"+row.index_img_rdate.substring(0,10) +"</td>";
     msg2+="<td style='text-align: center; vertical-align: middle;'>"
     msg2+= "<a href='javascript:index_imgupdate("+a+"이벤트"+a+","+row.index_img_no +","+a+""+row.index_img_fupname+""+a+","+a+""+row.index_img_fname +""+a+","+a+""+row.index_img_url +""+a+","+a+""+row.index_img_division+""+a+","+a+""+row.index_img_rdate.substring(0,10) +""+a+" )'>수정</A>" ;     
     msg2+=  "/";
     msg2+="<button onclick='index_delete("+row.index_img_no+")' id='btn_index_img_delete' type='button' class='btn btn-link'>삭제</button></td>"    
     msg2+="</td>";
     msg2+="</tr>";   
    }
    
    
    $('#index_img_all').append(msg);
    $('#index_main_img').append(msg1);
    $('#index_event_img').append(msg2);

  },
  // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
  error: function(request, status, error) { // callback 함수
    var msg = 'ERROR request.status: '+request.status + '/ ' + error;
    console.log(msg);
  }
});

}


function index_img_delete(no) {
  var params = 'index_img_no='+no;

  $.ajax({
    url: "./index/delete1.do", // action 대상 주소
    type: "get",           // get, post
    cache: false,          // 브러우저의 캐시영역 사용안함.
    async: true,           // true: 비동기
    dataType: "json",   // 응답 형식: json, xml, html...
    data: params,        // 서버로 전달하는 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      // alert(rdata);
      var msg = "";
      
    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      var msg = 'ERROR request.status: '+request.status + '/ ' + error;
      console.log(msg); //Chrome에 출력
    }
  });
  alert("삭제되었습니다.");
  index_img_all();
}

</script>



<%
String windowOpen = "open";
// 파업창
Cookie[] cookies = request.getCookies();
Cookie cookie = null;

if (cookies != null) {
  for (int index=0; index < cookies.length; index++) {
    cookie = cookies[index];  // 쿠키 목록에서 쿠키 추출
    if (cookie.getName().equals("windowOpen")) { // 이름 비교
      windowOpen = cookie.getValue();  // 쿠키 값
    }
  }
}
%>

<script type="text/javascript">
$(document).ready(function(){
  if ('<%=windowOpen %>' == 'open') {
    openNotice();  
  }  
  
});



function openNotice(){
var url = '/team5/menu/notice.jsp';
var win = window.open(url, '공지 사항', 'width=380px, height=400px');

var x = (screen.width - 380) / 10;
var y = (screen.height - 400) / 6;

win.moveTo(x, y); // 화면 이동
}


</script>


<style type="text/css">
.table-hover > tbody > tr:hover {
  background-color: #364252;
}
.back{
  background: url(/team5/css/images/colored_body_top2.png) center top no-repeat #1b2838; 
}
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
.btn-link{
  padding: 0px;
  font-size: 16px;
  color: #c7d5e0;
}
.btn-link:hover{  /* A 태그에 마우스가 올라간 상태 */
      text-decoration: underline; /* 밑줄 출력 */
      color: #E6E7E7;
      font-weight:bold;
    }





</style>



    
</head>
<body>
<!-- 메인 게임 사진 -->

<jsp:include page="/menu/top3.jsp" flush='false' />
  <div style='text-align: right; margin-right: 20px; width: 100%; margin: 0px auto; padding-top: 10px;'>
  <c:if test="${sessionScope.consumer_id != null && sessionScope.admin=='Y'}">
   <a style='text-align: right; font-weight:bold; ' onclick="document.getElementById('index_img').style.display='block'">메인 이미지 관리</a>
  </c:if>
  </div>

<div id="index_img" class="modal">

  <!-- 목록 -->
<c:if test="${sessionScope.consumer_id != null && sessionScope.admin=='Y'}">  
  <div class="modal-content" style='width: 90%; margin: 0px auto; background-color: #1b2838'>
    <a style='font-size: 30px; margin-right: 10px;' class="close" onclick="document.getElementById('index_img').style.display='none'; javascript:aa(1);">&times;</a>
    <p style='text-align: center; font-weight:bold; font-size: 27px; margin-top: 20px;'>메인 이미지 관리</p>
    <div style='text-align: right; margin-right: 20px;'>
    <button class='' style='' onclick="document.getElementById('index_img_create').style.display='block'">등록</button>
    </div>
     <%-- <jsp:include page="./index/list.jsp" flush='false' /> --%>
     <ul class="nav nav-tabs" style='padding-left: 20px;'>
    <li class="active"><a data-toggle="tab" href="#img0">전체</a></li>
    <li><a data-toggle="tab" href="#img1">메인</a></li>
    <li><a data-toggle="tab" href="#img2">이벤트</a></li>
  </ul>

 <div class="tab-content">
<div id='img0' style='overflow:auto; height: 500px;' class="tab-pane fade in active">
<form name='frm_all' id='frm_all'>
  <table class="table table-hover" style='margin-bottom: 0px;  '>
    <colgroup>
      <col style='width: 20%;'/>
      <col style='width: 10%;'/>
      <col style='width: 40%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>

    </colgroup>
    

     <thead style="background-color: #111923;">
      <tr >
        <th style="text-align: center;">이미지</th>
        <th style="text-align: center;">파일명</th>
        <th style="text-align: center;">url</th>
        <th style="text-align: center;">구분</th>
        <th style="text-align: center;">등록일</th>
        <th style="text-align: center;">기타</th>
    
      </tr>
    </thead>
     <tbody id = 'index_img_all'>

    </tbody>
  </table>
  </form>
  </div>
  
  
  
  
  <div id='img1' style='overflow:auto; height: 500px;' class="tab-pane fade">
  <table class="table table-hover" style='margin-bottom: 0px; '>
    <colgroup>
      <col style='width: 20%;'/>
      <col style='width: 10%;'/>
      <col style='width: 40%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>

    </colgroup>
    

     <thead style="background-color: #111923;">
      <tr >
        <th style="text-align: center;">이미지</th>
        <th style="text-align: center;">파일명</th>
        <th style="text-align: center;">url</th>
        <th style="text-align: center;">구분</th>
        <th style="text-align: center;">등록일</th>
        <th style="text-align: center;">기타</th>
    
      </tr>
    </thead>
     <tbody id='index_main_img'>

    </tbody>
  </table>
  </div>
  
  
  <div id='img2' style='overflow:auto; height: 500px;' class="tab-pane fade">
  <table class="table table-hover" style='margin-bottom: 0px; '>
    <colgroup>
      <col style='width: 20%;'/>
      <col style='width: 10%;'/>
      <col style='width: 40%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>

    </colgroup>
    

     <thead style="background-color: #111923;">
      <tr >
        <th style="text-align: center;">이미지</th>
        <th style="text-align: center;">파일명</th>
        <th style="text-align: center;">url</th>
        <th style="text-align: center;">구분</th>
        <th style="text-align: center;">등록일</th>
        <th style="text-align: center;">기타</th>
    
      </tr>
    </thead>
     <tbody id='index_event_img'>
     
    </tbody>
  </table>
  
  </div>
  </div>


  </div>
  </c:if>
  
  
</div>
<div id="index_img_create" class="modal" style='margin: 0px auto;' >
  <!-- 등록 폼 -->
  <div class="modal-content" style='width: 80%; margin: 0px auto; margin-top: 100px; background-color: #1b2838'>
      <FORM name='frm_img_create' id='frm_img_create' method="post" action="./index/create1.do"
                enctype="multipart/form-data" class="form-horizontal">
    <span class="close" id='index_img_close' onclick="document.getElementById('index_img_create').style.display='none'" style='font-size: 40px; margin-right:15px; '>&times;</span>
    <h2 style='padding-top: 20px;'>&nbsp;메인 이미지 등록</h2>
    <hr>
             이미지 등록 
             <input type='file' id='file1' class='form-control' name='fnamesMF'  
                     value='' placeholder='파일 선택' style='width: 60%; background-color: #111923; color:#c7d5e0;'>
    Url:&nbsp;<input autocomplete="off" id='index_img_url' type="text" placeholder="주소 입력" name="index_img_url" style='width: 80%; height: 30px;'  >
                  <div>
                    <span style="font-weight: bold;">구분: &nbsp;</span> 
                    <select
                      name='index_img_division'
                      style='height: 26px; width: 20%;'>
                      <option value='메인'>&nbsp;&nbsp;메인</option>
                      <option value='이벤트'>&nbsp;&nbsp;이벤트</option>
                    </select>
                    </div>
    <div style='text-align: center; margin: 10px 0px;'>
    <button type='button' class='btn' onclick="send();">사진 등록</button>                 
    </div>
    </FORM>
    
  </div>
</div>  
  
  <!-- 메인 이미지 + 이벤트 이미지 -->
   <c:import url="/index/list_img.do" />  
 
  


  <!-- 화면 상단 1 끝 -->
  
  <!-- 화면 상단 2 -->
  <!-- 공지사항 -->
  <table style="width: 100%; margin: 0px auto;">
<tr >
<td style=' width: 25%; padding: 0px; height: 300px;'>

  <div  style="margin-top: 20px; padding: 0px;  width: 90%;">
   <table class="table table-hover" style='' >
      <thead>
      <tr>
        <th><span style="font-size: 22px;">&nbsp;&nbsp;공지사항</span>
        <A href="/team5/openspace/list.do">
        <span style="font-size: 13px; color: #0000EE; margin-top: 13px;" class="pull-right">+더보기
        </span>
        </A>
        </th>
      </tr>
    </thead>
    <tbody>
      <!-- 공지사항 목록 나열 import -->
         <c:import url="/openspace/list_index_left.do" />  
 
    </tbody>
  </table>
  
</div>

</td>
 <td rowspan="2" style='width: 75%;'>
 
 <!-- 상품 -->
 
<div >
  <ul class="nav nav-tabs" style='margin-top: 45px; '>
    <li class="active"><a data-toggle="tab" href="#home">최신 게임</a></li>
    <li><a data-toggle="tab" href="#menu1">할인순</a></li>
    <li><a data-toggle="tab" href="#menu2">무료 게임</a></li>
  </ul>
</div>
  <div class="tab-content">
    <div id="home" class="tab-pane fade in active " style='padding-left: 0px; height: 650px;' >
      <div style='padding: 10px 0px;'>
       <c:import url="./game/list_rdate.do" />
<%--  <jsp:include page="./list.jsp" flush='false' />   --%>   
      </div>
    </div>

    <div id="menu1" class="tab-pane fade " style='padding-left: 0px; height: 650px;'>
    <div style='padding: 10px 0px;'>    
      <c:import url="./game/list_sale.do" />  
   <%--   <jsp:include page="./list.jsp" flush='false' />  --%>
    </div>
    </div>
    <div id="menu2" class="tab-pane fade" style='padding-left: 0px; height: 650px;'>
    <div style='padding: 10px 0px;'>
     <c:import url="./game/list_free.do" /> 
 <%--    <jsp:include page="./list.jsp" flush='false' /> --%>
   </div>
   </div>

  </div>
  
  
  </td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
</table>


  
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