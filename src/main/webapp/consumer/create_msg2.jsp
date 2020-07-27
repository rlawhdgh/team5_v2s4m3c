<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Unique Games</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head> 
<body>
<jsp:include page="/menu/top3.jsp" flush='false' />

<DIV class='title_line'></DIV>

<DIV class='message'>

<c:choose>
  <c:when test="${sendmail_cnt == 1}">
       <div style="text-align: center; height: 500px;  padding: 50px; " >
      <div style="margin: 50px; border: solid 1px; height: 70px; margin: 10px auto;">
            <h2>회원가입을 완료했습니다.</h2>
      </div>
      <DIV style ="width: 80%; margin: 0px auto; padding: 30px 0px; ">
  <DIV style = " margin: 0px auto; width: 50%;">
    <DIV style = "min-height: 185px; margin: 16px 8px 0;
    padding: 20px 29px 30px;
    text-align: left;;
    -webkit-border-radius: 2px;
    border-radius: 2px;">
      <DIV style = "position: relative;">
        <h3>회원정보</h3>
      </DIV>
      <DIV style = "min-height: 131px; padding-top: 9px;">
          <div><span style="font-weight: bold;">이름 :</span> <span>${consumerVO.consumer_name }</span></div><br>
          <div><span style="font-weight: bold;">ID :</span> <span>${consumerVO.consumer_id }</span></div><br>
          <div><span style="font-weight: bold;">별명 :</span> <span>${consumerVO.consumer_nickname }</span></div><br>
          <div><span style="font-weight: bold;">전화번호 :</span> <span>${consumerVO.consumer_phone_num }</span></div>
      </DIV>     
    </DIV>
    </div>
    </DIV>
    </div>
  </c:when>
  <c:otherwise>
          <div style="text-align: center; height: 500px;  padding: 50px; " >
      <div style="margin: 50px; border: solid 1px; height: 70px; margin: 10px auto;">
            <h2>회원가입에 실패했습니다. 다시 시도해주세요.</h2>
      </div>
      <DIV style ="width: 80%; margin: 0px auto; padding: 30px 0px; ">
  <DIV style = " margin: 0px auto; width: 50%;">
    <DIV style = "min-height: 185px; margin: 16px 8px 0;
    padding: 20px 29px 30px;
    text-align: left;;
    -webkit-border-radius: 2px;
    border-radius: 2px;">

   
    </DIV>
    </div>
    </DIV>
    </div>
  </c:otherwise>
</c:choose>
 


</DIV>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>

