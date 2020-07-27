<%@ page contentType="text/html; charset=UTF-8" %>
 
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
          <span style="color: #f0ad4e;">Q. [결제가격 및 프로모션]</span> 
        구매페이지로 넘어가지 않습니다.
          </a>
         <a class="pull-right" href="#">삭제</a>
        <span class="pull-right">&nbsp;/&nbsp; </span>
        <a class="pull-right" href="#">수정</a>
        </h4>
      </div>
      <div id="collapse1" class="panel-collapse collapse">
        <div class="panel-body">
        상품정보 조회 후 바로 구매하기 버튼을 눌러도 구매안내 페이지로 넘어가지 않는 경우 현재 주소창에서 https:// 로 되어 있는 주소를 http:// 로 수정후 새로고침 후 이용해 주시기 바랍니다.
        </div>
        </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
          <span style="color: #f0ad4e;">Q. [웹사이트 및 계정]</span>
          LG U+ 전자결제 프로그램 설치/실행 오류는 어떻게 하나요?
          </a>
         <a class="pull-right" href="#">삭제</a>
        <span class="pull-right">&nbsp;/&nbsp; </span>
        <a class="pull-right" href="#">수정</a>
        </h4>
      </div>
      <div id="collapse2" class="panel-collapse collapse">
        <div class="panel-body">개인 PC환경에 따른 LG U+ 전자결제 프로그램 설치/실행 및 오류 사항에 대한 해결방안은 아래의 결제오류해결센터를 이용해 주시기 바랍니다.</div>
      </div>
    </div>

    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
          <span style="color: #f0ad4e;">Q. [결제가격 및 프로모션]</span> 
          환불 규정이 어떻게 되나요?
          </a>
        <a class="pull-right" href="#">삭제</a>
        <span class="pull-right">&nbsp;/&nbsp; </span>
        <a class="pull-right" href="#">수정</a>
        </h4>
      </div>
      <div id="collapse3" class="panel-collapse collapse">
        <div class="panel-body">다이렉트 게임즈에서 구매한 디지털 코드의 경우 구입 후 7일 이내에 청약철회가 가능합니다.
          특히, 예약판매 상품은 출시일 하루 전(24시간 기준)까지만 환불신청이 가능합니다
          단, 구매한 키를 마이페이지에서 확인(열람)할 경우 환불이 불가능하오니, 구입한 상품을 환불받고 싶다면 키를 확인(열람) 하지 마십시오.
          키를 확인하지 않으신 주문건에 대하여 환불을 희망할 경우 고객지원 양식에 연락가능한 연락처와 환불받을 계좌번호를 추가로 작성 하여 문의해 주시기 바랍니다</div>
      </div>
    </div>
 
    
         </div>
    </div>
</div>
  
  <div id="menu1" class="tab-pane fade">
    <div style="height: 400px; ">
      <div class="panel-group" id="accordion1" style="width: 95%; margin: 0px auto;">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion1" href="#collapse4">
          <span style="color: #f0ad4e;">Q. [웹사이트 및 계정]</span>
          LG U+ 전자결제 프로그램 설치/실행 오류는 어떻게 하나요?
          </a>
         <a class="pull-right" href="#">삭제</a>
        <span class="pull-right">&nbsp;/&nbsp; </span>
        <a class="pull-right" href="#">수정</a>
        </h4>
      </div>
      <div id="collapse4" class="panel-collapse collapse">
        <div class="panel-body">개인 PC환경에 따른 LG U+ 전자결제 프로그램 설치/실행 및 오류 사항에 대한 해결방안은 아래의 결제오류해결센터를 이용해 주시기 바랍니다.</div>
      </div>
    </div>
    </div>
    
    
    </div>
  </div>


  <div id="menu2" class="tab-pane fade">
    <div style="height: 400px; ">
    
    <div class="panel-group" id="accordion2" style="width: 95%; margin: 0px auto;">

    <div class="panel panel-default" >
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion2" href="#collapse6">
          <span style="color: #f0ad4e;">Q. [결제가격 및 프로모션]</span> 
          구매페이지로 넘어가지 않습니다.
          </a>
        <a class="pull-right" href="#">삭제</a>
        <span class="pull-right">&nbsp;/&nbsp; </span>
        <a class="pull-right" href="#">수정</a>
          
        </h4>
      </div>
      <div id="collapse6" class="panel-collapse collapse">
        <div class="panel-body">상품정보 조회 후 바로 구매하기 버튼을 눌러도 구매안내 페이지로 넘어가지 않는 경우 현재 주소창에서 https:// 로 되어 있는 주소를 http:// 로 수정후 새로고침 후 이용해 주시기 바랍니다.</div>
      </div>
    </div>
    
     <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion2" href="#collapse7">
          <span style="color: #f0ad4e;">Q. [결제가격 및 프로모션]</span> 
          환불 규정이 어떻게 되나요?
          </a>
        <a class="pull-right" href="#">삭제</a>
        <span class="pull-right">&nbsp;/&nbsp; </span>
        <a class="pull-right" href="#">수정</a>
        </h4>
      </div>
      <div id="collapse7" class="panel-collapse collapse">
        <div class="panel-body">다이렉트 게임즈에서 구매한 디지털 코드의 경우 구입 후 7일 이내에 청약철회가 가능합니다.
          특히, 예약판매 상품은 출시일 하루 전(24시간 기준)까지만 환불신청이 가능합니다
          단, 구매한 키를 마이페이지에서 확인(열람)할 경우 환불이 불가능하오니, 구입한 상품을 환불받고 싶다면 키를 확인(열람) 하지 마십시오.
          키를 확인하지 않으신 주문건에 대하여 환불을 희망할 경우 고객지원 양식에 연락가능한 연락처와 환불받을 계좌번호를 추가로 작성 하여 문의해 주시기 바랍니다</div>
      </div>
    </div>

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
