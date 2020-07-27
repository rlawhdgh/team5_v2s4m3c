<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>목록</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <script type="text/javascript">
  function delete_file(pay_payno) {
    var sw = confirm("파일을 삭제 하시겠습니까?");
    if (sw == true) {
      location.href="./delete.do?pay_payno=" + pay_payno;
    } else {
      alert('파일 삭제를 취소합니다.');
    }
  }
</script>
 
 
</head>
 
<body>
<jsp:include page="/menu/top3.jsp" flush='false' /> 
  
  
  <table style="width: 1300px; border: solid 0px #000000; 
    border-collapse: collapse;">

   <tr>
   
   <td style='height: 100px; border: solid 0px #000000; width: 200px;'>
   <fieldset class='categrp_cate_left' >
   <UL class='categrp_cate_list_left' >
   <DIV>장바구니</DIV> <br>
   <DIV>위시리스트</DIV> <br>    
   <DIV>결재내역</DIV> <br>   
  </UL>
  </fieldset>
     </div>
   
   </td> 
   
   
   <td rowspan="2" style='height: 500px; border: solid 0px #000000;'>
   <ASIDE style='float: center;'>
   결제 목록
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="./create.do?">등록</A>
    <span class='top_menu_sep'>&nbsp;</span>
    <A href="javascript:location.reload();">새로고침</A>
    <%-- <span class='top_menu_sep'>&nbsp;</span> 
    <A href="./create.do?cateno=${cateVO.cateno } ">등록</A> --%>
  </ASIDE> 
   
   
   <table class="table table-striped" style='width: 100%;'>
    <colgroup>
        <col style="width: 15%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 30%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>결제 번호</th>
          <th style='text-align: center;'>상품번호</th>
          <th style='text-align: center;'>회원번호</th>     
          <th style='text-align: center;'>저장일</th>
          <th style='text-align: center;'>비고</th>   
        </tr> 
      <thead>
      <tbody>
        <c:forEach var="payVO" items="${list }">
          <c:set var="pay_payno" value="${payVO.pay_payno }" />
          
          <tr> 
            <td style='text-align: center;'>${payVO.pay_payno}</td>
            <td style='text-align: center;'>${payVO.list_contentsno}</td>
            <td style='text-align: center;'>${payVO.consumer_no}</td>
            <td style='text-align: center;'>${payVO.pay_date.substring(0, 10)}</td>
            <td style='text-align: center;'>
            <%-- <a href="./delete.do?attachfileno=${attachfileVO.attachfileno}"><img src="./images/delete.png" title="삭제"  border='0' /></a> --%>  
              <a href="javascript:delete_file(${pay_payno})"><img src="./images/delete.png" title="삭제"  border='0' /></a>
       
            </td> 
          </tr>
        </c:forEach>       
      </tbody>
      
   </table>
  </td>
  </tr>

  <tr>
  <td style='border: solid 0px #000000;'></td>
  </tr>


</table>
   
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
    
 