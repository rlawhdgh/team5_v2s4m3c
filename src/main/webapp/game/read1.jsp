<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>UNIQUE GAMES</title>
<link href="./css/style.css" rel='Stylesheet' type='text/css'>

 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 파일 삭제 -->
<script type="text/javascript">
 function delete_file(game_gameno) {
    var sw = confirm("파일을 삭제 하시겠습니까?");
    if (sw == true) {
      location.href="./delete.do?game_gameno=" + game_gameno;
    } else {
      alert('파일 삭제를 취소합니다.');
    }
  }
 
 function list_noconsumer(){
	 alert("로그인후 사용해주세요")
	 document.getElementById('id01').style.display='block';
 }
</script>

<!-- 스크롤  -->
<script type="text/javascript">
function scroll_follow( id )
{
  $(window).scroll(function( )  //스크롤이 움직일때마다 이벤트 발생
  { 
      var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
      $( id ).stop().animate({top:position/10+"px"}, 1); //해당 오브젝트 위치값 재설정
   });
}
 scroll_follow( "#scroll" );
//스크롤이 생기도록 <br> 을 여러게 넣은 부분..
$(document).ready(function(){ for( var i=0; i<1; i++ ) {$('#brr').html($('#brr').html() +"<br>" + i);} });
</script>


<!-- 이미지  -->
<script type="text/javascript">
window.onload = function(){
  var html = document.querySelector('.AA').innerHTML;
  document.querySelector('.AA').innerHTML =
      html.replace(/(\<iframe)/g, '<iframe style="position: absolute; width:100%; height:100%;"') 

}

// 이미지 클릭시 원본파일 출력
function panel_img(file) {
  var tag = "";

  tag += "<A href=\"javascript: $('#attachfile_panel').hide();\">";
  tag += "  <IMG src='../game_images/storage/" + file + "' style='width: 100%; height:340px;'>";
  tag += "</A>";


  $('#attachfile_panel').html(tag); // 문자열을 태그로 적용
  $('#attachfile_panel').show();    //패널 출력
}
</script>


<!-- 유튜브 -->
<script type="text/javascript">
$(window).resize(function(){resizeYoutube();});
$(function(){resizeYoutube();});
function resizeYoutube(){ $("iframe").each(function()
        { if( /^https?:\/\/www.youtube.com\/embed\//g.test
         ($(this).attr("src")) ){ $(this).css("width","100%"); $(this).css("height",Math.ceil( parseInt($(this).css("width")) * 480 / 854 )
                 + "px");} }); }
</script>

<!-- 장바구니 -->
<script type="text/javascript">
function order_catebag(game_gameno) {
    
    var params='game_gameno=' + game_gameno; 
    //alert(params);
    //return;  
    $.ajax({
        url: "/team5/catebag/create.do", // action 대상 주소
        type: "post",          // get, post
        cache: false,          // 브러우저의 캐시영역 사용안함.
        async: true,           // true: 비동기
        dataType: "json",   // 응답 형식: json, xml, html...
        data: params,        // 서버로 전달하는 데이터
         success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
          alert(rdata);
          var msg = "";
          //alert('rdata.cnt: ' + rdata.cnt);
          //return;
           if(rdata.cnt == 1) {
             var sw = confirm('쇼핑카트의 상품을 등록했습니다.\n쇼핑카트로 가시겠습니까?');     
             if(sw == true) {
               //쇼핑카트로 이동하는 법
               location.href="../catebag/catebag_by_consumer_no.do"
             }  else {
               location.reload();
             }
          }   
           if(rdata.cnt == 0) { 
             var sw = confirm('쇼핑카트의 상품을 등록했습니다.\n쇼핑카트로 가시겠습니까?');     
             if(sw == true) {
               //쇼핑카트로 이동하는 법
               location.href="../catebag/catebag_by_consumer_no.do"
             }  else {
               location.reload();
             }   
           }
        },
         // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          var msg = 'ERROR request.status: '+request.status + '/ ' + error;
          console.log(msg); // Chrome에 출력
        }  
    });
   
   
 }


function order_wishlist(game_gameno) {
  
  var params='game_gameno=' + game_gameno; 
  //alert(params);
  //return;  
  $.ajax({
      url: "/team5/wishlist/create.do", // action 대상 주소
      type: "post",          // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터
       success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        alert(rdata);
        var msg = "";
        //alert('rdata.cnt: ' + rdata.cnt);
        //return;
         if(rdata.cnt == 1) {
           var sw = confirm('위시리스트의 상품을 등록했습니다.\n위시리스트로 가시겠습니까?');     
           if(sw == true) {
             //쇼핑카트로 이동하는 법
             location.href="../wishlist/game_by_consumer_no.do"
           }  else {
             location.reload();
           }
        }   
         if(rdata.cnt == 0) { 
           var sw = confirm('위시리스트의 상품을 등록했습니다.\n위시리스트로 가시겠습니까?');     
           if(sw == true) {
             //쇼핑카트로 이동하는 법
             location.href="../wishlist/game_by_consumer_no.do"
           }  else {
             location.reload();
           }   
         }
      },
       // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR request.status: '+request.status + '/ ' + error;
        console.log(msg); // Chrome에 출력
      }  
  });
 
 
}
</script>
    
</head>

<body>
<c:set var="kind_kindno" value="${kindVO.kind_kindno}" />
<c:set var="game_gameno" value="${gameVO.game_gameno }" />

<!-- 메인 게임 사진 -->
 <div class="row"> 
<jsp:include page="/menu/top3.jsp" flush='false' />

  <!-- Modal 알림창 시작 -->
  <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>  <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal 알림창 종료 -->
 
  <!-- 메인 메뉴 -->
  <DIV class='col-md-12' style="position:relative;">
  <div class='' style='width: 75%; float: left; '>
  <div style='margin: 0px auto; width: 85%;'>
     <c:if test="${gameVO.game_youtube.trim().length() > 0 }">
           ${gameVO.game_youtube}
     </c:if>          
  </div>
  
 <div style='margin-top: 10px; margin-bottom: 10px;'>
  
  <div id="attachfile_panel" style="margin:0px auto; width: 85%;">
   <a href="javascript: $('#attachfile_panel').hide();">
    <img src='../game_images/storage/${one }' style="width: 100%; height:340px;">
   </a>
  </div>
  <div style="margin:0px auto; width: 85%; overflow:auto;">
  <table style="height: 100px; width: 100%; overflow: auto;">
    <tbody>
     <tr>
        <c:forEach var="game_imagesVO" items="${images_list }">
      <td>
         <c:set var="game_thumb" value="${game_imagesVO.game_thumb.toLowerCase() }" />
              
         <c:choose>
             <c:when test="${game_thumb.endsWith('jpg') || game_thumb.endsWith('png') || game_thumb.endsWith('gif')}">
              <A href="javascript:panel_img('${game_imagesVO.game_fname }')"><IMG src='../game_images/storage/${game_thumb }' 
                                             style='width:120px; height:80px; margin-top: 2px; margin-left: 1.1px;'></A>
             </c:when>
          </c:choose>
      </td>
        </c:forEach>
     </tr>
    </tbody>
  </table>
  </div>
  
  </div>
  
  <div style='margin: 0px auto; width: 85%;'>
    <ul class="nav nav-tabs">
      <li class="active"><a data-toggle="tab" href="#home">게임정보</a></li>
      <li><a data-toggle="tab" href="#menu1">게임특징</a></li>
      <li><a data-toggle="tab" href="#menu2">시스템요구사항</a></li>
    </ul>

    <div class="tab-content">  
     <div id="home" class="tab-pane fade in active">
      <p>${gameVO.game_writing }</p>
     </div>
     <div id="menu1" class="tab-pane fade">
      <p>${gameVO.game_character }</p>
     </div>
     <div id="menu2" class="tab-pane fade">
      <p>${gameVO.game_require }</p>
     </div>
    </div>
    
  </div>  
   
   
   
   
   
</div>
   <!-- 사이드메뉴 -->

  <div class='' id="scroll" style='position:-webkit-sticky; position:sticky; top: 0; border: solid 3px; width: 25%; float: left; '>
    <div style='height: 200px; border: solid 1px #999999;'>
     <IMG src='./storage/images/${gameVO.game_image }' style="width: 99.5%; height: 195px; margin: 0.8px;">
    </div>
    <div style='border: solid 1px #999999;border-top:none; '>
       <div style="color: #ffffff; margin:10px; margin-top:0px; border-bottom: solid 1px #999999; padding-bottom: 15px; ">
         ${gameVO.game_brief}
       </div>
    <div style='margin: 15px; margin-bottom: 0px; '>
		<c:choose>
		<c:when test="${gameVO.game_price > 0}">
		     <span style="color: #ffffff; font-size: 1em; font-weight: bold;">
		            원가: 
		     </span>
		     <span style="color: #ffffff; font-family: 'Aguafina Script'; font-size: 20px; margin-left: 10px;text-decoration: line-through;">
		            ${gameVO.game_price }
		     </span>
		     <span style="color: #ffffff; font: 1em; font-weight: bold;">
		            원 
		     </span>   
		  <div style="color: #ff4d4d; border-bottom: solid 1px #999999; padding-bottom: 15px; ">
         <span style="color: #ffffff; font-size: 1em; font-weight: bold;">
                   할인가: 
         </span>
         <span style="font-family: 'Aguafina Script'; font-size: 22px; color: #ff9933; margin-left: 10px;">
            ${gameVO.game_sale }
         </span>
         <span style="color: #ffffff; font: 1em; font-weight: bold;">
                       원 
         </span>  
    </div >
		</c:when>
		<c:otherwise>
		   무료게임
		   <br>
		</c:otherwise>
		
		</c:choose>
    </div> 
    
    <div style="color: #ff4d4d; margin:10px; 
                   border-bottom: solid 1px #999999; height: 100px; ">
       <div style="margin-top: 20px;">
         <span style="color: #ffffff; font-size: 1em; font-weight: bold;">
           출시일
         </span>
         <span style="color: #ffffff; font-size: 15px; font-weight: bold; padding-left: 40px;">
            ${gameVO.game_release }
         </span> 
        </div>
        <div style="margin-top: 5px;">
         <span style="color: #ffffff; font-size: 1em; font-weight: bold;">
           장르
         </span>
         <span style="color: #ffffff; font-size: 15px; font-weight: bold; padding-left: 55px;">
            ${kindVO.kind_kindname }
         </span> 
        </div>
        <div style="margin-top: 5px;">
         <span style="color: #ffffff; font-size: 1em; font-weight: bold;">
           개발사
         </span>
         <span style="color: #ffffff; font-size: 15px; font-weight: bold; padding-left: 40px;">
           ${gameVO.game_developer }
         </span> 
        </div>
    </div >
   <div>
   
   <c:choose>
   
   <c:when test="${sessionScope.consumer_id == null}">
     <button class="btn btn-default btn-warning btn_cart "
               type="button" onclick="javascript:list_noconsumer()"
                style="margin-left: 10px; margin-bottom: 15px; margin-top: 10px;">
          <span class="glyphicon glyphicon-shopping-cart" style="color: #FFFFFF; font-size: 13px; "></span>
          장바구니 담기
     </button>
   </c:when>
   
   <c:otherwise>
   
   <div class="col-md-6">
   <form name='frm' id='frm' class="form-horizontal">
   <input type="hidden" name="catebag_cnt" value="1">
   <input type="hidden" name="game_image" value="${gameVO.game_image }">
   <input type="hidden" name="catebag_sum" value="${gameVO.game_sale } ">
   <input type="hidden" name="catebag_seqno" value="1">
   <input type="hidden" name="game_gameno" value="${gameVO.game_gameno }">
   <input type="hidden" name="consumer_no" value="${sessionScope.consumer_no }">
    <button class="btn btn-default btn-warning btn_cart "
               type="button" onclick="order_catebag(${game_gameno})"
                style="margin-left: 10px; margin-bottom: 15px; margin-top: 10px;">
          <span class="glyphicon glyphicon-shopping-cart" style="color: #FFFFFF; font-size: 13px; "></span>
          장바구니 담기
     </button> 
   </form>
   </div>
   
  <form name='frm' id='frm' class="form-horizontal">
   <input type="hidden" name="catebag_cnt" value="1">
   <input type="hidden" name="game_image" value="${gameVO.game_image }">
   <input type="hidden" name="catebag_sum" value="${gameVO.game_sale } ">
   <input type="hidden" name="catebag_seqno" value="1">
   <input type="hidden" name="game_gameno" value="${gameVO.game_gameno }">
   <input type="hidden" name="consumer_no" value="${sessionScope.consumer_no }">
    <button class="btn btn-default btn-warning btn_cart "
               type="button" onclick="order_wishlist(${game_gameno})"
                style="margin-left: 10px; margin-bottom: 15px; margin-top: 10px;">
          <span class="glyphicon glyphicon-heart" style="color: #FFFFFF; font-size: 13px; "></span>
          위시리스트
     </button> 
   </form>
   
   </c:otherwise>
   </c:choose>
           
           
           
           
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
  
  <c:if test="${sessionScope.consumer_id != null && sessionScope.admin=='Y'}">
  <div class='col-md-11'>
  <ASIDE style='float: right;'>
    <A href='./list_join.do?kind_kindno=${gameVO.kind_kindno }' >목록</A>
    <span class='menu_divide' style="color: white;"> | </span>
    <A href='./update.do?kind_kindno=${gameVO.kind_kindno }&game_gameno=${gameVO.game_gameno}'>수정</A>
    <span class='menu_divide' style="color: white;"> | </span> 
    <A href="javascript:delete_file(${gameVO.game_gameno})" >삭제</A>
    <br>
    
    <!-- 이미지  -->
    <c:choose>
      <c:when test="${gameVO.game_image.trim().length() > 0 }">
        <A href='./list_image_delete.do?kind_kindno=${kind_kindno }&game_gameno=${game_gameno}'>이미지 삭제</A>     
      </c:when>
      <c:otherwise>
        <A href='./list_image_create.do?kind_kindno=${kind_kindno }&game_gameno=${game_gameno}'>이미지 등록</A>     
      </c:otherwise>
    </c:choose>
   
    <!-- youtube -->   
    <c:choose>
      <c:when test="${gameVO.game_youtube.trim().length() > 0 }">
        <span class='menu_divide' > | </span> 
        <A href='./list_youtube_delete.do?kind_kindno=${kind_kindno }&game_gameno=${game_gameno}'>Youtube 삭제</A>     
      </c:when>
      <c:otherwise>
        <span class='menu_divide' > | </span> 
        <A href='./list_youtube_create.do?kind_kindno=${kind_kindno }&game_gameno=${game_gameno}'>Youtube 등록</A>    
      </c:otherwise>
    </c:choose>    
    
    <br>
    <A href='../game_images/create.do?game_gameno=${game_gameno }&kind_kindno=${kind_kindno }'>파일 등록</A>   
    <span class='menu_divide' style="color: white;"> | </span>
    <A href='../game_images/list.do?game_gameno=${game_gameno }'>파일 삭제</A>   
    
    
  </ASIDE> 
  </div>
  </c:if>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
 
</body>
</html>