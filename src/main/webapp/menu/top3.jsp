<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "280px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}
window.onload = function() {
  var s = screen.width
  if(s<1600){
  document.getElementById("aa").innerHTML += "html, body {height: 100%;width: 1600px;  background-color: #111923;}"
  }else{
  document.getElementById("aa").innerHTML += "html, body {height: 100%;width: "+s+"px; margin: 0px;  background-color: #111923;}"
  } 
}  

</script>

<style id=aa>
  *{
     font-size: 16px; 
     margin: 0px;  /* top right bottom left */
     padding: 0px;
     color: #c7d5e0;

  }  
      A:link{  /* 방문전 상태 */
      text-decoration: none; /* 밑줄 삭제 */
      color: #c7d5e0;
    }

    A:visited{  /* 방문후 상태 */
      text-decoration: none; /* 밑줄 삭제 */
      color: #c7d5e0;
    }
  
    A:hover{  /* A 태그에 마우스가 올라간 상태 */
      text-decoration: underline; /* 밑줄 출력 */
      color: #E6E7E7;
      font-weight:bold;
    }
  
    A:active{  /* A 태그를 클릭한 상태 */
      text-decoration: underline; /* 밑줄 출력 */
      color: #E6E7E7;
      font-weight:bold;
    }
    A {
      color:#c7d5e0;
      cursor:pointer;
    }
    
    input{
    border:solid 0.5px #767E88;
    background-color:#111923;
    }
    select{
    background-color:#111923;    
    }
    button{
    border:solid 0.5px #767E88;
    background-color:#111923;
    padding:0px 5px;
    }    
    .modal-content{
    background-color: #1b2838;
    }
    h2{
    color: #c7d5e0;
    }
    .close{
    color: #eeeeee;
    }
    
    .back{
  background: url(/team5/css/images/colored_body_top2.png) center top no-repeat #1b2838; 
}




</style>

<style>


/*    로그인 css      */
.abc:hover,
.abc:focus {
  color: #f44336;
  cursor: pointer;
}


/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
}

/* Modal Content/Box */
.modal-content1 {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 40%; /* Could be more or less, depending on screen size */
}

/* Add Zoom Animation */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

/*   로그인 CSS 종료   */


.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;     
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding: 5px 8px 0px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
</head>
<body>

<div id="mySidenav" class="sidenav" >
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
      <div class="input-group" style='background-color: #111;width: 80%;margin-left: 30px;'>
        <input type="text" placeholder="검색" name="search" style='background-color: #111
                    ;border: none; border-bottom: solid 1px #999999; height: 34px;width: 190px;'>
        <div class="input-group-btn" style='background-color: #111;'>
          <button class="" type="submit" style='background-color: #111; border: none;'>
            <i class="glyphicon glyphicon-search" style='border-bottom: solid 1px #999999; height: 33px; width: 40px; padding-top:10px;'></i>
          </button>
        </div>
      </div>
<div style='margin-top: 25px; width: 200px;' >   
  <a href="/team5/index.do">홈</a>
    <!-- 메뉴바 시작 -->
    <div class="" style='background-color: #111; border: none' >
      <div>
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse"style='background-color: #111;padding-bottom: 0px;' >
          내정보
          </a>
      </div>
      <div id="collapse" class="panel-collapse collapse" >
        <div style='margin-left: 15px;'>
          <a style="font-size: 16px; padding-bottom: 0px;" href="http://localhost:9090/team5/pay/pay_by_consumer_no.do">결제내역</a>
          <a style="font-size: 16px; padding-bottom: 0px;" href="http://localhost:9090/team5/catebag/catebag_by_consumer_no.do">장바구니</a>
          <a style="font-size: 16px; padding-bottom: 0px;" href="http://localhost:9090/team5/wishlist/game_by_consumer_no.do">위시리스트</a>
          

        </div>

      </div>
    </div>
<!-- 메뉴바 종료 -->
  <a href="#">설문조사</a>
  
  <!-- 메뉴바 시작 -->
    <div class="" style='background-color: #111; border: none' >
      <div>
          <a data-toggle="collapse" data-parent="#accordion" href="#openspace"style='background-color: #111;padding-bottom: 0px;' >
          고객센터
          </a>
      </div>
      <div id="openspace" class="panel-collapse collapse">
        <div style='margin-left: 15px;'>
          <a style="font-size: 16px; padding-bottom: 0px;" href="/team5/openspace/list.do">공지사항</a>
          <a style="font-size: 16px; padding-bottom: 0px;" href="/team5/question/list.do">자주묻는질문</a>
        </div>

      </div>
    </div>
    
   <div class="" style='background-color: #111; border: none' >
      <div>
          <a data-toggle="collapse" data-parent="#accordion" href="#game"style='background-color: #111;padding-bottom: 0px;' >
                        게임
          </a>
      </div>
      <div id="game" class="panel-collapse collapse">
        <div style='margin-left: 15px;'>
          <c:import url="/game/list_index_left.do" />  
        </div>

      </div>
    </div>
<!-- 메뉴바 종료 -->
  
</div>

</div>


<div style='background-color: #171a21;border-bottom: solid 2px #000000;'>
<!-- <div style='background: linear-gradient( to bottom, #ded8d6 5%, #869ba2 95%)'> -->
<div style='width: 80%; margin: 0px auto;'>
<table style="width: 100%; margin: 0px auto;">
<tr >
<td style='margin-left: 50px; width: 400px;'>
<span style="font-size:30px;cursor:pointer" onclick="openNav()">☰ menu</span>
</td>
<td style='width: 400px; height: 110px;'>
     <a href='/team5/index.do'>
       <img  src="/team5/css/images/logo1.jpg" style='width: 400px; height: 110px; background-color: #ff0000'>
    </a>
</td>
<td style='width: 400px;'>      
    <c:choose>
     <c:when test="${sessionScope.consumer_id == null && sessionScope.naver_id == null}">
     <div>
       <a href="#" onclick="document.getElementById('id01').style.display='block'" style="font-size: 12px;">로그인</a> |
       <a href="/team5/consumer/create.do" style="font-size: 12px;">회원가입</a> |     
       <a href="#" style="font-size: 12px;">고객센터</a>
     </div>
       <br><br><br><br>
     </c:when>
     <c:when test="${sessionScope.consumer_id != null && sessionScope.admin !='Y'}">
     <div>
        <form name="form1"  method="POST" action="/team5/consumer/update_mypage.do" style="width: 200px;">
        <input type="hidden" name ="consumer_no" value="${sessionScope.consumer_no}">
        <button type="submit" class='btn btn-link'><span style="font-size: 12px;">마이페이지</span></button> |
        <button type="button" class='btn btn-link'><span onclick="location.href='/team5/consumer/logout.do'"  style="font-size: 12px;">로그아웃</span></button> 
        </form>
     </div>
       <div style ="margin-top: 20px;"> ${sessionScope.consumer_id } (${sessionScope.consumer_nickname })님 (일반회원)</div>
       <br><br>
     </c:when>
     <c:when test="${sessionScope.consumer_id != null && sessionScope.admin=='Y'}">
     <div>
        <a type="text"  onclick="location.href='/team5/admin/sitemap.jsp'" style="font-size: 12px;" >사이트관리</a> |
        <a type="text"  onclick="location.href='/team5/consumer/logout.do'" style="font-size: 12px;" >로그아웃</a>
     </div>
       <div style ="margin-top: 20px;"> ${sessionScope.consumer_id } (관리자 모드입니다.)</div>
       <br><br>
     </c:when>
     <c:when test="${sessionScope.naver_id != null && sessionScope.consumer_id == null && sessionScope.admin !='Y'}">
	     <div>
	        <a onclick="location.href='http://172.16.12.3:9090/team5/consumer/create.do'"  style="font-size:12px;">유니크게임즈 회원가입</a> |     
          <a onclick="#" style="font-size: 12px;">고객센터</a> | 
          <a type="text" href="#" onclick="location.href='/team5/consumer/logout.do'" style="font-size: 12px;" >로그아웃</a>
	     </div>
       <div style ="margin-top: 20px;"> ${sessionScope.naver_name } (${sessionScope.naver_nickname })님 (네이버회원)</div>
       <br><br>
     </c:when>
     
    </c:choose>

</td>
</tr>
</table>
</div>
 </div> 
  
<!-- 로그인페이지 --> 
  
  <div id="id01" class="modal">
  <form name='frm'  class="modal-content1 animate" method='POST' action='/team5/consumer/login.do' >

<div  style='background-color:#1b2838 '>
  <div style='text-align: right; margin-top: 0px; margin-right: 10px; padding-top: 0px;'>
  <span class='abc' onclick="document.getElementById('id01').style.display='none'"  title="Close Modal" style='font-size: 30px;'>×</span>
  </div>
    <div style=''>
    <div style='width: 70%; margin: 0px auto; padding:10px 0px;'>
      <input id='id' type="text" placeholder="아이디" required="required" autocomplete="off" name="id" style='width: 100%; height: 30px;'  >
    </div>
    <div style='width: 70%; margin: 0px auto; padding:10px 0px;'>
       <input id='passwd' type="password" placeholder="패스워드" required="required" name="passwd" style='width: 100%; height: 30px;' >
    </div>  
 </div>
 </div>
  <div style='background-color:#1b2838;  border-bottom: solid 1px #eeeeee; height: 99px;'>
    <div style='width: 70%; margin: 0px auto; background-color:#111923;'>
      <button onclick="javascript:file_login('id')" type="submit" style='width: 100%;'>로그인</button>      
    </div>
    <div style='padding-top: 10px; width: 70%; margin: 0px auto;'>
      <button type='button' style='width: 100%; ' onclick="loadDefault();">회원 테스트 계정</button>
    </div>  
    <div style='padding-top: 10px; width: 70%; margin: 0px auto;'>
      <button type='button' style='width: 100%; ' onclick="loadDefault1();">관리자 테스트 계정</button>
    </div>
  </div>
    <div style=' text-align: center; margin: 0px 0px; background-color:#1b2838; padding:10px 0px;' >
    <A href='/team5/consumer/findconsumer.jsp'>아이디 찾기</A> <a href='/team5/consumer/findconsumer.jsp'>비밀번호 찾기</a><div><input type="checkbox"  id="adminlogin" name="adminlogin" value="adminlogin">관리자 로그인</div>
    <!-- 네이버 로그인 창으로 이동 -->
		<div id="naver_id_login" style="text-align:center"><a href="./consumer/naverlogin.do">
		<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
    </div>

  </form>
</div>

<!-- 로그인 페이지 종료 -->
  
  
<script>
// Get the modal
function file_login(id) {

}


var modal = document.getElementById('id01');



function loadDefault() {
  $('#id').val('user1');
  $('#passwd').val('1234');
  $('#adminlogin').prop("checked", false);
}
function loadDefault1() {
	  $('#id').val('user1');
	  $('#passwd').val('1234');
	  $('#adminlogin').prop("checked", true);
	}
</script>
<!-- 종료 -->
 <!-- 내용 출력 컬럼 --> 
 <div class='back' style='background-color: #1b2838;' >

   
<DIV class='content' style="width: 80%; margin: 0px auto; ">