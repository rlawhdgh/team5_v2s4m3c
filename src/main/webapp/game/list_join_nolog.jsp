<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>UNIQUE GAMES</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
</script> 

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
          alert('rdata.cnt: ' + rdata.cnt);
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

</script>
 
<style type="text/css">
.table-hover > tbody > tr:hover {
  background-color: #364252;
}
</style> 
 
</head>
 
<body>
<jsp:include page="/menu/top3.jsp" flush='false' />
  
  <div style='width: 100%;'> 
    <DIV class='title_line'>
    ${kindVO.kind_kindname }
    </DIV>

 <c:if test="${sessionScope.consumer_id != null && sessionScope.admin=='Y'}">     
  <ASIDE style='float: left;'>
   <A href="./list_all.do">전체 보기</A> 
  </ASIDE>
  </c:if>
  <ASIDE style='float: right;'>
  <c:if test="${sessionScope.consumer_id != null && sessionScope.admin=='Y'}">
    <A href="./create.do?kind_kindno=${param.kind_kindno }">등록</A> |
  </c:if>
    <A href="javascript:location.reload();">새로고침</A>
    <!--  <span class='menu_divide' >│</span> -->
  </ASIDE> 
  
    <DIV class='menu_line' style='clear: both;'></DIV>
  
    <table class="table table-hover" style='margin-bottom: 0px;'>
      <colgroup>
        <col style="width: 15%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 40%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 20%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
      <thead style="background-color: #111923;">
        <tr>
          <th style='text-align: center;'>등록일</th>
          <th style='text-align: center;'>게임 장르</th>
          <th style='text-align: center;'>게임 이름</th>
          <th style='text-align: center; '>
           <span>원가</span>
           <span>/</span>
           <span>할인가</span>
          </th>
          <th style='text-align: center;'>개발자</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="gameVO" items="${list }">
        <c:set var="game_gameno" value="${gameVO.game_gameno }" />
          <tr> 
            <td style='text-align: center;'>
              <a href="./read1.do?game_gameno=${gameVO.game_gameno}">
              <IMG src='./storage/images/${gameVO.game_image }' style="width: 99.5%; height: 81px; margin: 0.8px;">
              </a>
            </td>
            <td style='text-align: center; vertical-align: middle;'>${kindVO.kind_kindname}</td>
            <td style='text-align: center; vertical-align: middle;'>
              <a href="./read1.do?game_gameno=${game_gameno}">${gameVO.game_title}</a> 
            </td> 
            <td style='text-align: center; vertical-align: middle;'>
            <c:choose>
             <c:when test="${gameVO.game_price > 0 }">
              <span style="text-decoration: line-through;">${gameVO.game_price}</span>
              <span>/</span>
              <span>${gameVO.game_sale}</span>
             </c:when>
             <c:otherwise>
                <span>무료게임</span>
             </c:otherwise>
            </c:choose>
            </td>
            <td style='text-align: center; vertical-align: middle;'>${gameVO.game_developer}</td>
            <td style='text-align: center; vertical-align: middle;'>
              
            </td>
            <c:if test="${sessionScope.consumer_id != null && sessionScope.admin=='Y'}">  
            <td style='text-align: center; vertical-align: middle;'>
            <A href="javascript:delete_file(${gameVO.game_gameno})"><span class="glyphicon glyphicon-trash"></span></A>
            </td>
            </c:if>
          </tr>     
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
    
 