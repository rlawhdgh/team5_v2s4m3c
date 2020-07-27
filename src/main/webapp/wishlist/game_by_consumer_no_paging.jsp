<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>위시리스트</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <script type="text/javascript"> 
 /* $(function() { // 자동 실행
	    // id가 'btn_send'인 태그를 찾아 'click' 이벤트 처리자(핸들러)로 send 함수를 등록
	  
	    $('#89').on('click', send);  	    
	    // document.getElementById('btn_send').addEventListener('click', send); 동일 
	  });

 function send() { 
     var param = $("#frm").serialize(); 
     //var param = $("#frm").click();
     alert(param);
     return; 
	 
	   $.ajax({ 
	    url: '/team5/catebag/create2.do',
	    type: 'post', 
	    cache: false,
	    async: true, 
	    dataType: 'json',
	    data:  param,  
	   
	    });
	  }
	  */
 
 
 function delete_file(wishlist_wishlistno, nowPage) {
   var sw = confirm("파일을 삭제 하시겠습니까?");
   if (sw == true) {
     location.href="./delete.do?wishlist_wishlistno="+wishlist_wishlistno+"&nowPage="+nowPage;
     alert('파일 삭제 되었습니다.');
   } else {
     alert('파일 삭제를 취소합니다.');
   }
  }
  
 function delete_consumer_file(wishlist_wishlistno, nowPage) {
    var sw = confirm("파일을 전체 삭제 하시겠습니까?");
    if (sw == true) {
      location.href="./delete_consumer.do?wishlist_wishlistno="+wishlist_wishlistno+"&nowPage="+nowPage;
    } else {
      alert('파일 삭제를 취소합니다.');
    }
   }
  
  
 /* function btn_send(catebag_catebagno, nowPage) {
    var sw = confirm("장바구니 추가 하시겠습니까?");
    if (sw == true) {
      location.href="/team5/pay/create.do?catebag_catebagno="+catebag_catebagno+"&nowPage="+nowPage;
    } else {
      alert('장바구니 추가를 취소합니다.');
    }
   }   */


   function order_one(wishlist_wishlistno) {
	    
	    var params='wishlist_wishlistno=' + wishlist_wishlistno; 
	   // alert(params);
	    //return;  
	    $.ajax({
	        url: "/team5/catebag/create2.do", // action 대상 주소
	        type: "post",          // get, post
	        cache: false,          // 브러우저의 캐시영역 사용안함.
	        async: true,           // true: 비동기
	        dataType: "json",   // 응답 형식: json, xml, html...
	        data: params,        // 서버로 전달하는 데이터
	         success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
	          // alert(rdata);
	          var msg = "";
	          //alert('rdata.cnt: ' + rdata.cnt);
	          //return;
             if(rdata.cnt == 1) {
            	 var sw = confirm('쇼핑카트의 상품을 등록했습니다.\n쇼핑카드로 가시겠습니까?');     
            	 if(sw == true) {
            		 //쇼핑카트로 이동하는 법
            		 location.href="http://localhost:9090/team5/catebag/catebag_by_consumer_no.do"
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
 
<style type="text/css">

.table .table {
    background-color: #1b2838;
}

 
</style> 
</head>
<body>
 <jsp:include page="/menu/top3.jsp" flush='false' />  
  <table style="width: 1300px; border: solid 1px #000000; 
  border-collapse: collapse;">
  
  <TR>
    <td style='height: 100px; border: solid 1px #000000; width: 190px;'>
    <fieldset class='categrp_cate_left' >
    <table style="width : 150px; border: solid 1px #000000; 
      border-collapse: collapse; position: absolute; top: 250px; left: 190px;" class='categrp_cate__left'> 
     <tr>
       <th style="padding : 2px; padding-top: 8px; ">
       <a href = "http://localhost:9090/team5/catebag/catebag_by_consumer_no.do">
              장바구니
       </a>
       </th>
     </tr>    
     <tr>
       <th style="padding : 2px; padding-top: 8px; ">
       <a href = "http://localhost:9090/team5/wishlist/game_by_consumer_no.do">   
             위시리스트
       </a>
       </th>
     </tr>
     <tr>
       <th style="padding : 2px; padding-top: 8px; ">
       <a href ="http://localhost:9090/team5/pay/pay_by_consumer_no.do">
              결재내역
       </a>
       </th>
     </tr>    
    </table>
    </fieldset> 
    </td>
    
    <td rowspan = "2;" style='height: 500px; border: solid 1px #000000;'>
     <ASIDE style='float: center;'>
      <h2>위시리스트</h2>              
      <a href="javascript:delete_consumer_file(${wishlist_wishlistno}, ${sessionScope.consumer_no }, ${nowPage } )">
            <button type="button" class="selectDelete_btn" style = "text-align: left">전체 삭제</button>
      </a>     
    
     </ASIDE>
     <ASIDE style='float: right;'>
      <span class='top_menu_sep'>&nbsp;</span>
      <A href="javascript:location.reload();">새로고침</A>
      <%-- <span class='top_menu_sep'>&nbsp;</span> 
      <A href="./create.do?cateno=${cateVO.cateno } ">등록</A> --%>
     </ASIDE> 
  
     
      <table class="table table-borderless table-dark" style='width: 100%; margin-bottom: 150px'>
       <colgroup>          
        <col style="width: 10%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 25%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
       </colgroup>
       <%-- table 컬럼 --%>
       <thead>
        <tr>                
         
          <th style='text-align: center;'>상품번호</th>
          <th style='text-align: center;'>상품명</th>
          <th style='text-align: center;'>상품내용</th> 
          <th style='text-align: center;'>개발사</th>           
          <th style='text-align: center;'>가격</th>     
          <th style='text-align: center;'>할인가격</th>     
          <th style='text-align: center;'>저장일</th>
          <th style='text-align: center;'>비고</th>
        </tr>    
       </thead>
       <%-- table 내용 --%>
        <tbody>
         <c:forEach var="game_Wishlist_VO" items="${list }">
          <c:set var="game_gameno" value="${game_Wishlist_VO.game_gameno }" />
          <c:set var="game_title" value="${game_Wishlist_VO.game_title }" />
          <c:set var="game_writing" value="${game_Wishlist_VO.game_writing }" />                   
          <c:set var="game_release" value="${game_Wishlist_VO.game_release }" />
          <c:set var="game_developer" value="${game_Wishlist_VO.game_developer }" />
          <c:set var="game_price" value="${game_Wishlist_VO.game_price }" />
          <c:set var="game_sale" value="${game_Wishlist_VO.game_sale }" />
          <c:set var="game_image" value="${game_Wishlist_VO.game_image }" />         
          <c:set var="wishlist_wishlistno" value="${game_Wishlist_VO.wishlist_wishlistno }" />
          <c:set var="wishlist_date" value="${game_Wishlist_VO.wishlist_date }" />
          <c:set var="wishlist_seqno" value="${game_Wishlist_VO.wishlist_seqno }"/>                       
        <tr>             
            <td style='text-align: center; vertical-align: middle;'>${game_gameno}</td>
            <td style='text-align: center; vertical-align: middle;'>${game_title}</td>
            <td style='text-align: center; vertical-align: middle;'>${game_writing}</td>
            <td style='text-align: center; vertical-align: middle;'>${game_developer}</td>
            <td style='text-align: center; vertical-align: middle;'>${game_price}</td>          
            <td style='text-align: center; vertical-align: middle;'>${game_sale}</td>          
            <td style='text-align: center; vertical-align: middle;'>${wishlist_date.substring(0, 10)} </td>
            <td style='text-align: center; vertical-align: middle;'>
            <%-- <a href="./delete.do?attachfileno=${attachfileVO.attachfileno}"><img src="./images/delete.png" title="삭제"  border='0' /></a> --%>
              
             <FORM name='frm' id='frm' class="form-horizontal">              
              <input type="hidden" name="wishlist_wishlistno" id="wishlist_wishlistno" value="${wishlist_wishlistno}">            
              <input type="hidden" name="consumer_no" id="sessionScope.consumer_no" value="${sessionScope.consumer_no}">       
                                 
              <button type="button" onclick="order_one(${wishlist_wishlistno})">    
              <span class="glyphicon glyphicon-shopping-cart"></span>                          
              </button>            
             </FORM> 
            
             <a href="javascript:delete_file(${wishlist_wishlistno}, ${nowPage } )"><img src="./images/delete.png" title="삭제"  border='0' /></a>   
            </td>             
           </tr>
         </c:forEach>     
        </tbody>  
        <tfoot>
         <tr>
          <td colspan = "8">
           <table class='table table-borderless' style= 'width: 100%; margin-bottom: 150px;  background-color: #ff000;'>
            <colgroup>          
             <col style="width: 5%;"></col>
             <col style="width: 10%;"></col>
             <col style="width: 12%;"></col>
             <col style="width: 28%;"></col>
             <col style="width: 15%;"></col>
             <col style="width: 10%;"></col>
             <col style="width: 10%;"></col>
             <col style="width: 10%;"></col>
            </colgroup>
            <%-- table 컬럼 --%>        
           </table>
           <DIV class='bottom_menu'>${paging }</DIV>                
          </td>
         </tr> 
        </tfoot>                     
      </table>      
     </td>  
    <td style='border: solid 1px #000000;'></td>
  </TR>
  </table>
 <jsp:include page="/menu/bottom.jsp" flush='false' />
</body> 
</html>


 