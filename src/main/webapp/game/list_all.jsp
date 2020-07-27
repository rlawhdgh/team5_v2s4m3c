<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
<style type="text/css">
.table-hover > tbody > tr:hover {
  background-color: #364252;
}
</style> 
 
</head>
 
<body>
<jsp:include page="/menu/top3.jsp" flush='false' />

  
  <ASIDE style='float: left;'>
    <A href="../kind/list.do">게임 그룹</A> 
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
  <div style='width: 100%;'>
    <table class="table table-hover" style='margin-bottom: 0px;'>
      <colgroup>
        <col style="width: 15%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 40%;"></col>
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
          <tr> 
            <td style='text-align: center;'>
              <IMG src='./storage/images/${gameVO.game_image }' style="width: 99.5%; height: 81px; margin: 0.8px;">
            </td>
            <td style='text-align: center; vertical-align: middle;'>${gameVO.kind_kindname}</td>
            <td style='text-align: center; vertical-align: middle;'>
              <a href="./read1.do?game_gameno=${gameVO.game_gameno}">${gameVO.game_title}</a> 
            </td> 
            <td style='text-align: center; vertical-align: middle;'>
              <span style="text-decoration: line-through;">${gameVO.game_price}</span>
              <span>/</span>
              <span>${gameVO.game_sale}</span>
            </td>
            <td style='text-align: center; vertical-align: middle;'>${gameVO.game_developer}</td>
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
    
 