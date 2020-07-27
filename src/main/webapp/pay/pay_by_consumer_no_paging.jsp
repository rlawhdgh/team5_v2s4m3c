<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>결제 내역</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <script type="text/javascript">  
 function delete_pay(pay_payno, nowPage) {
   var sw = confirm("파일을 삭제 하시겠습니까?");
   if (sw == true) {
     location.href="./delete.do?pay_payno="+pay_payno+"&nowPage="+nowPage;
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
      <h2>결제 내역</h2>
    
      <p style="text-align: left; color: red;" >※ 구매내역입니다.</p>    
      <p style="text-align: left; color: red;" >※ 그동안 구매했던 상품을 확인 할 수 있습니다.</p>  
                 
     </ASIDE>
     <ASIDE style='float: right;'>  
      <span class='top_menu_sep'>&nbsp;</span>
      <A href="javascript:location.reload();">새로고침</A>
      <%-- <span class='top_menu_sep'>&nbsp;</span> 
      <A href="./create.do?cateno=${cateVO.cateno } ">등록</A> --%>
     </ASIDE> 
      <table class="table table-borderless table-dark" style='width: 100%; margin-bottom: 150px'>
       <colgroup>     
        <col style="width: 8%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 17%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 10%;"></col>
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
          <th style='text-align: center;'>구매가격</th>     
          <th style='text-align: center;'>합계</th>
          <th style='text-align: center;'>결제 방법</th>
          <th style='text-align: center;'>결제 날짜</th>
        </tr>    
       </thead>
       <%-- table 내용 --%>
        <tbody>
         <c:forEach var="game_Pay_VO" items="${list }">
          <c:set var="game_gameno" value="${game_Pay_VO.game_gameno }" />
          <c:set var="game_title" value="${game_Pay_VO.game_title }" />
          <c:set var="game_writing" value="${game_Pay_VO.game_writing }" />                   
          <c:set var="game_release" value="${game_Pay_VO.game_release }" />
          <c:set var="game_developer" value="${game_Pay_VO.game_developer }" />
          <c:set var="game_price" value="${game_Pay_VO.game_price }" />
          <c:set var="game_image" value="${game_Pay_VO.game_image }" />
          <c:set var="game_sale" value="${game_Pay_VO.game_sale }" />
          
          <c:set var="pay_payno" value="${game_Pay_VO.pay_payno }" />
          <c:set var="pay_cnt" value="${game_Pay_VO.pay_cnt }" />
          <c:set var="pay_date" value="${game_Pay_VO.pay_date }" />
          <c:set var="pay_kind" value="${game_Pay_VO.pay_kind }" />
          <c:set var="sum" value="${pay_cnt * game_price}"></c:set>
          <c:set var="pay_sum" value="${sum}"></c:set>                      
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
            <td style='text-align: center; vertical-align: middle;'>${pay_cnt }</td>
            <td style='text-align: center; vertical-align: middle;'>${game_sale}</td>    
            <td style='text-align: center; vertical-align: middle;'>${pay_sum}</td>            
            <td style='text-align: center; vertical-align: middle;'>${pay_kind}</td> 
            <td style='text-align: center; vertical-align: middle;'>${pay_date.substring(0, 10)} </td> 
           
         </tr>
         </c:forEach>     
        </tbody>  
        <tfoot>
         <tr>
          <td colspan = "8">
           <table class='table table-borderless' style= 'width: 100%; margin-bottom: 150px;  background-color: #ff000;'>
            <colgroup>                          
                <col style="width: 15%;"></col>
                <col style="width: 20%;"></col>
                <col style="width: 10%;"></col>
                <col style="width: 15%;"></col>
                <col style="width: 20%;"></col>
                <col style="width: 10%;"></col>
                <col style="width: 10%;"></col>
            </colgroup>
            <%-- table 컬럼 --%>
            <thead>
             <tr>           
             </tr>   
             <tr>
              <th style='text-align: center;'></th>
              <th style='text-align: center;'></th>
              <th style='text-align: center;'></th>
              <th style='text-align: center;'></th>
              <th style='text-align: center;'>총 결제 내역</th>
              <th colspan = "2;" style='text-align: center;'>${tot } </th>                       
             </tr>   
             <tr>
              
             </tr>                            
            </thead>            
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


 