<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Unique Games - 네이버 로그인</title>

<script type="text/javascript">
$(function(){
	$('naver_login').get(0).click();
});



</script>
</head>
<body>
<jsp:include page="/menu/top3.jsp" flush='false' />
<div id="naver_id_login" style="text-align:center"><a href="${url}" id="naver_login">
<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
<br>


<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
