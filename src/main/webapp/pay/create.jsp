<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>주문하기</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
       
<script type="text/javascript">

   $(function() { // 자동 실행
      // id가 'btn_send'인 태그를 찾아 'click' 이벤트 처리자(핸들러)로 send 함수를 등록
      $('#order_pay').on('click', send);  
       //document.getElementById('pay_kind').addEventListener('click', send); 동일 
    });

  function send() {
	 var sw = confirm('결제 하시겠습니까?');
	 if(sw == true) {
		 
    var params = $("#frm").serialize();
     //var params = 'catebag_catebagno=' +catebag_catebagno;
     // alert(params);
     //return;  
     
     $.ajax({ 
     url: '/team5/pay/create.do',
     type: 'post', 
     cache: false,
     async: true, 
     dataType: 'json',
     data:  params,
     success: function(rdata) {
       //alert(rdata)
       var msg ="";
       //alert('rdata.order_cnt:' +rdata.order_cnt) //rdata.cnt가 undefind가 나오는 이유는 catabag_catebagno 가 없다.
       //return;
       if(rdata.order_cnt == rdata.order_cnt ) {
        	 var sw = confirm('결제 내역으로 이동합니다.');
        	  if(sw == true) {
              location.href="http://localhost:9090/team5/pay/pay_by_consumer_no.do" 
            } else {
        		  location.href="http://localhost:9090/team5/index"
        		}        	         
        //location.href="http://172.16.12.87:9090/team5/catebag/catebag_by_consumer_no.do"
       }
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
     error: function(request, status, error) { // callback 함수
     var msg = 'ERROR request.status: '+request.status + '/ ' + error;
     console.log(msg); // Chrome에 출력
     }     
   });
  }
 }
  



function delete_cate(catebag_catebagno, nowPage) {
	   var sw = confirm("파일을 삭제 하시겠습니까?");
	   if (sw == true) {
	     location.href="./delete.do?catebag_catebagno="+catebag_catebagno+"&nowPage="+nowPage;
	   } else {
	     alert('파일 삭제를 취소합니다.');
	   }
	  }
 
function delete_consumer_file(pay_payno, nowPage) {
   var sw = confirm("파일을 전체 삭제 하시겠습니까?");
   if (sw == true) {
     location.href="./delete_consumer.do?pay_payno="+pay_payno+"&nowPage="+nowPage;
   } else {
     alert('파일 삭제를 취소합니다.');
   }
  }    
  
  function name() {
	
	  
	  
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
    <td rowspan = "2" style='height: 500px; border: solid 1px #000000;'>
      <ASIDE style='float: center;'>
      <h2>상품정보</h2>     
     </ASIDE>
     <ASIDE style='float: right;'>
      <span class='top_menu_sep'>&nbsp;</span>
      <A href="javascript:location.reload();">새로고침</A>
      <%-- <span class='top_menu_sep'>&nbsp;</span> 
      <A href="./create.do?cateno=${cateVO.cateno } ">등록</A> --%>
     </ASIDE> 
     <FORM name='frm' id='frm' class="form-horizontal">
       
       <button type="button" id="order_pay">구매 하기</button>         
      <table class="table table-borderless table-dark" style='width: 100%; margin-bottom: 150px'>
       <colgroup>         
       
        <col style="width: 10%;"></col>
        <col style="width: 12%;"></col>
        <col style="width: 28%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
       </colgroup>
       <%-- table 컬럼 --%>
       <thead>
        <tr>
         <th style='text-align: center;'>이미지</th>
         <th style='text-align: center;'>상품명</th>
         <th style='text-align: center;'>개발사</th> 
         <th style='text-align: center;'>수량</th>           
         <th style='text-align: center;'>최종 가격</th>     
         <th style='text-align: center;'>합계</th>
         <th style='text-align: center;'>비고</th>
        </tr>
      
      </thead>
      <%-- table 내용 --%>
      
      
      <tbody>
        <c:forEach var="catebag_Pay_VO" items="${list }">
          <c:set var="game_gameno" value="${catebag_Pay_VO.game_gameno }" />
          <c:set var="game_title" value="${catebag_Pay_VO.game_title }" />
          <c:set var="game_writing" value="${catebag_Pay_VO.game_writing }" />                   
          <c:set var="game_release" value="${catebag_Pay_VO.game_release }" />
          <c:set var="game_developer" value="${catebag_Pay_VO.game_developer }" />
          <c:set var="game_price" value="${catebag_Pay_VO.game_price }" />
          <c:set var="game_sale" value="${catebag_Pay_VO.game_sale }" />
          <c:set var="game_image" value="${catebag_Pay_VO.game_image }" />          
          <!--catebag내용  -->
          <c:set var="catebag_catebagno" value="${catebag_Pay_VO.catebag_catebagno }" />
          <c:set var="catebag_date" value="${catebag_Pay_VO.catebag_date }" />
          <c:set var="catebag_seqno" value="${catebag_Pay_VO.catebag_seqno }" />
          <c:set var="catebag_cnt" value="${catebag_Pay_VO.catebag_cnt }" />
          <c:set var="sum" value="${catebag_cnt * game_price}"></c:set>
          <c:set var="catebag_sum" value="${sum}"></c:set>                                        
          <c:set var="checkOne" value="${catebag_catebagno }"></c:set>        
          <c:set var="point_save" value="${tot*0.01 }"></c:set>        
                                                 
        <tr>                                
         <td style= 'vertical-align: middle; text-align: center;'>
              <c:choose>
                <c:when test="${game_image.endsWith('jpg') || game_image.endsWith('png') || game_image.endsWith('gif') || game_image.endsWith('bmp')}">
                  <IMG src="../game/storage/images/${game_image }" style="width: 99.5%; height: 81px; margin: 0.8px;"> 
                </c:when>
                <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                  ${game_image}
                </c:otherwise>
              </c:choose>
            </td>
         <td style='text-align: center; vertical-align: middle;'>${game_title}</td>
         <td style='text-align: center; vertical-align: middle;'>${game_developer}</td>
         <td style='text-align: center; vertical-align: middle;'>
          <%-- <A href="./update_cnt_up.do?catebag_catebagno=${catebag_catebagno }"><span class="glyphicon glyphicon-arrow-up"></span></A> --%>          
          <input type='number' name='catebag_cnt' value='${catebag_cnt}' readonly style='width: 30%; text-align: center'>
          <input type="hidden" name='checkOne' value='${checkOne}'>
          <%-- <A href="./update_cnt_down.do?catebag_catebagno=${catebag_catebagno }"><span class="glyphicon glyphicon-arrow-down"></span></A>  --%>             
         </td>
         <td style='text-align: center; vertical-align: middle;'>${game_price}</td>          
         <td style='text-align: center; vertical-align: middle;'>${catebag_sum}</td>          
         <td style='text-align: center; vertical-align: middle;'>
          <%-- <a href="./delete.do?attachfileno=${attachfileVO.attachfileno}"><img src="./images/delete.png" title="삭제"  border='0' /></a> --%>
                           
         </td>                 
        </tr>
         </c:forEach>         
        </tbody>  
        <tfoot>
         <tr>
          <td colspan = "7">
           <table class='table table-borderless' style= 'width: 100%; margin-bottom: 150px;  background-color: #ff000;'>
            <colgroup>                          
                <col style="width: 15%;"></col>
                <col style="width: 20%;"></col>
                <col style="width: 20%;"></col>
                <col style="width: 15%;"></col>
                <col style="width: 10%;"></col>
                <col style="width: 10%;"></col>
                <col style="width: 10%;"></col>
            </colgroup>
            <%-- table 컬럼 --%>
            <thead>
             <tr>
              <th style='text-align: center;'>결제 방법</th>
              <th style='text-align: center;'>
               <select name='pay_kind' id='pay_kind' class="form-control" style='width: 100%; background-color: #111923; color: #c7d5e0 '>
                <option value='카드 결제'>카드 결제</option>
                <option value='모바일 결제'>모바일 결제</option>          
                <option value='계좌 이체'>계좌 이체</option>         
               </select>                                      
              </th>
              <th style='text-align: center;'></th>              
              <th style='text-align: center;'></th>
              <th style='text-align: center;'></th>
              <th style='text-align: center;'></th>
              <th style='text-align: center;'></th>          
             </tr>   
             <tr>
              <th style='text-align: center;'></th>
              <th style='text-align: center;'></th>
              <th style='text-align: center;'></th>
              <th style='text-align: center;'></th>
              <th style='text-align: center;'>결재 금액</th>
              <th colspan = "2;" style='text-align: center;'>${tot } </th>                       
             </tr>   
             <tr>
              <td colspan = "8">                                        
              </td>
             </tr>                            
            </thead>            
           </table>
        
           <DIV class='bottom_menu' >${paging }</DIV>                
          </td>
         </tr> 
        </tfoot>                     
      </table> 
      </FORM>       
      </td>
    </TR>   
    <TR>
      <td style='border: solid 1px #000000;'></td>      
    </TR>       
  </table>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>   
 