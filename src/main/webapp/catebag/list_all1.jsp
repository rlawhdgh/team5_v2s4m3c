<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>장바구니</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <script type="text/javascript">
  function delete_file(catebag_catebagno) {
    var sw = confirm("파일을 삭제 하시겠습니까?");
    if (sw == true) {
      location.href="./delete.do?catebag_catebagno=" + catebag_catebagno;
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
   장바구니
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
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 10%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
      <thead style="background-color: #111923;">
        <tr>
          <th style='text-align: center;'>장바구니번호</th>
          <th style='text-align: center;'>상품번호</th>
          <th style='text-align: center;'>장바구니 출력 순서</th>
          <th style='text-align: center;'>회원번호</th>     
          <th style='text-align: center;'>수량</th>
          <th style='text-align: center;'>합계</th>
          <th style='text-align: center;'>장바구니 등록일</th>
          <th style='text-align: center;'>비고</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="catebagVO" items="${list }">
        
          <c:set var="catebag_catebagno" value="${catebagVO.catebag_catebagno }" />
       
          
          <tr> 
            <td style='text-align: center;'>${catebagVO.catebag_catebagno}</td>
            <td style='text-align: center;'>${catebagVO.list_contentsno}</td>
            <td style='text-align: center;'>${catebagVO.catebag_seqno}</td>
            <td style='text-align: center;'>${catebagVO.consumer_no}</td>
            
           <td style='text-align: center;'>
             <input type='number' name='catebag_cnt' value='catebagVO.catebag_cnt' style='width: 20%;'> 
             <button type="submit" id='submit'>변경</button>   
           </td>
            <td style='text-align: center;'>${catebagVO.catebag_sum}</td>
            <td style='text-align: center;'>${catebagVO.catebag_date.substring(0, 10)}</td>
            <td style='text-align: center;'>
            <%-- <a href="./delete.do?attachfileno=${attachfileVO.attachfileno}"><img src="./images/delete.png" title="삭제"  border='0' /></a> --%>
              <a href="javascript:delete_file(${catebag_catebagno})"><img src="./images/delete.png" title="삭제"  border='0' /></a>
            
            </td> 
          </tr>
        </c:forEach>       
      </tbody>
    </table>
    <button onclick="">전체삭제</button>
    <br><br>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
    
 