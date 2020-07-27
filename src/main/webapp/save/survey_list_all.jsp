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
 
</head>
 
<body>
<jsp:include page="/menu/top3.jsp" flush='false' />

  <DIV class='title_line'>
    <A href="../survey_cate/survey_list.do">카테고리 그룹</A> > 
  </DIV>
  
  <ASIDE style='float: left;'>
    전체 보기 
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="./pollInsert.do?survey_cateno=${param.survey_cateno }">등록</A>
    <A href="javascript:location.reload();">새로고침</A>
    <!--  <span class='menu_divide' >│</span> -->
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
  
  <div style='width: 100%;'>
    <table class="table table-borderless table-dark" style='width: 100%;'>
      <colgroup>
        <col style="width: 20%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 55%;"></col>
        <col style="width: 10%;"></col>

      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>등록일</th>
          <th style='text-align: center;'>카테고리</th>
          <th style='text-align: center;'>제목</th>
          <th style='text-align: center;'>회원</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="survey_makeVO" items="${list }">
          <c:set var="survey_makeno" value="${saveVO.survey_makeno }" />
          
          <tr> 
            <td style='text-align: center;'>${saveVO.wdate.substring(0, 10)}</td>
            <td style='text-align: center;'>${saveVO.survey_cateno}</td>
            <td>
              <a href="./survey_read.do?survey_makeno=${survey_makeno}">${saveVO.question}</a> 
            </td> 
          <!--   <td style='text-align: center;'>${contentsVO.memberno}</td> -->
          
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>