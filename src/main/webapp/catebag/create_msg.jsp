<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Team5</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head> 
<body>
<jsp:include page="/menu/top3.jsp" flush='false' />

<DIV class='title_line'>알림</DIV>

<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${cnt == 1}">
          <LI class='li_none'>
            <span class="span_success">장바구니의 등록이 완료되었습니다.</span>
          </LI>
        </c:when>
        <c:otherwise>
          <LI class='li_none_left'>
            <span class="span_fail">장바구니의 등록이 실패되었습니다.</span>
          </LI>
          <LI class='li_none_left'>
            <span class="span_fail">다시 시도해주세요.</span>
          </LI>
        </c:otherwise>
      </c:choose>
      <LI class='li_none'>
        <br>
        <button type='button' onclick="location.href='./catebag_by_consumer_no.do?consumer_no=${param.consumer_no}'">장바구니 이동</button>
        <button type='button' onclick="history.back();">위시리스트 이동</button>
      </LI>
    </UL>
  </fieldset>

</DIV>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
