<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>결제</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <script type="text/javascript">
  function delete_file(pay_payno) {
    var sw = confirm("파일을 삭제 하시겠습니까?");
    alert(pay_payno)
    if (sw == true) {
      location.href="./delete.do?pay_payno=" + pay_payno;
    } else {
      alert('파일 삭제를 취소합니다.');
    }
  }
</script>

<style type="text/css">
.table-hover > tbody > tr:hover {
  background-color: #364252;
}

</style>
 
 
</head>
 
<body>
<jsp:include page="/menu/top3.jsp" flush='false' />
  <!-- <DIV class='title_line'>
    위시리스트
  </DIV> -->
  
  <ASIDE style='float: left;'>
   결제
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="./create.do?">등록</A>
    <span class='top_menu_sep'>&nbsp;</span>
    <A href="javascript:location.reload();">새로고침</A>
    <%-- <span class='top_menu_sep'>&nbsp;</span> 
    <A href="./create.do?cateno=${cateVO.cateno } ">등록</A> --%>
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
  
  <div style='width: 100%;'>
    <table class="table table-hover" style='width: 100%;'>
      <colgroup>
        <col style="width: 5%;"></col>
        <col style="width: 8%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 32%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
      <thead style="background-color: #111923;">
        <tr>
          <th style='text-align: center;'><input type="checkbox" name="" value="" checked></th>
          <th style='text-align: center;'>이미지</th>
          <th style='text-align: center;'>상품명</th>
          <th style='text-align: center;'>개발사</th> 
          <th style='text-align: center;'>수량</th>           
          <th style='text-align: center;'>가격</th>     
          <th style='text-align: center;'>합계</th>
          <th style='text-align: center;'>비고</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="list_Pay_VO" items="${list }">
          <c:set var="list_contentsno" value="${list_Pay_VO.list_contentsno }" />
          <c:set var="list_title" value="${list_Pay_VO.list_title }" />
          <c:set var="list_writing" value="${list_Pay_VO.list_writing }" />                   
          <c:set var="list_release" value="${list_Pay_VO.list_release }" />
          <c:set var="list_developer" value="${list_Pay_VO.list_developer }" />
          <c:set var="list_price" value="${list_Pay_VO.list_price }" />
          <c:set var="list_images" value="${list_Pay_VO.list_images }" />
          
          <c:set var="pay_payno" value="${list_Pay_VO.pay_payno }" />
          <c:set var="pay_kind" value="${list_Pay_VO.pay_kind }" />
          <c:set var="pay_total" value="${list_Pay_VO.pay_total }" />
          <c:set var="pay_date" value="${list_Pay_VO.pay_date }" />
          
              
          <tr>             
            
            <td style='text-align: center;'>${list_images}</td>
            <td style='text-align: center;'>${list_title}</td>
            <td style='text-align: center;'>${list_developer}</td>
            <td style='text-align: center;'>${catebag_cnt}</td>
            <td style='text-align: center;'>${list_price}</td>          
            <td style='text-align: center;'>${pay_total}</td>          
            <td style='text-align: center;'>
            <%-- <a href="./delete.do?attachfileno=${attachfileVO.attachfileno}"><img src="./images/delete.png" title="삭제"  border='0' /></a> --%>
              <a href="javascript:delete_file(${pay_payno})"><img src="./images/delete.png" title="삭제"  border='0' /></a>
            </td> 
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
    
 