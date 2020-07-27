<%@ page contentType="text/html; charset=UTF-8" %>
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
 
  <DIV class='title_line'>
    첨부 파일
  </DIV>
 
<DIV class='message'>
  <fieldset class=''>
    <UL>
      <c:choose>
        <c:when test="${param.upload_count > 0 }">
          <LI class='li_none'>
            <span class='span_success'>파일을 등록했습니다.</span>
          </LI>
          <LI class='li_none'>
            <span class='span_success'>정상 등록된 파일 ${param.upload_count} 건</span>
          </LI>
        </c:when>
        <c:otherwise>
          <LI class='li_none'>
            <span class='span_fail'>파일 등록에 실패했습니다.</span>
          </LI>
        </c:otherwise>
      </c:choose>
      <LI class='li_none'>
        <br>  
        <button type='button' 
                    onclick="location.href='../game/read1.do?game_gameno=${param.game_gameno }'"
                    class="">글 조회</button>      
      </LI>
     </UL>
  </fieldset>
 
</DIV>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>


