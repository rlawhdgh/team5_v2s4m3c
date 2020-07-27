<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>언젠간 만들겠지</title>
<link href="./css/style.css" rel='Stylesheet' type='text/css'>
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
</head>
<body>
<!-- 메인 게임 사진 -->
 <div class="row"> 
<jsp:include page="/menu/top3.jsp" flush='false' />
  <DIV style='width: 100%; margin: 0px auto; padding: 40px 0px;;'>

  <FORM name='frm' method='POST' action='./delete.do'>
    <input type='hidden' name='openspace_no' value='${param.openspace_no}'>
    <input type="hidden" name="consumer_no" value="${param.consumer_no }">
    <input type='hidden' name='word' id='word' value='${param.word }'>
    <input type='hidden' name='search' id='search' value='${param.search }'>
    <input type='hidden' name='nowPage' id='nowPage' value='${param.nowPage }'>
    <div class="well well-lg" style="border: solid 2px #ff0000; width: 70%; margin: 0px auto; padding: 0px;">
      <div style="margin: 0px auto; background-color: #111923;padding: 20px;">
      
      
      

삭제 되는글 제목: ${openspaceVO.openspace_title }<br>
첨부된 파일: <span style='color: #FF0000; font-weight: bold;'>${size }</span>건 <br>
파일명:
     <c:choose>
      <c:when test="${size == 0 }">
첨부된 파일이 없습니다    
      </c:when>
      <c:otherwise>
             <c:forEach var="img" items="${list }" varStatus="info">
              <c:set var="thumb" value="${img.openspace_img_thumb.toLowerCase() }" />
                  ${img.openspace_img_fupname }<c:if test="${info.count < size }">,</c:if>
                              </c:forEach>   
      </c:otherwise>
    </c:choose>

            <br>
            삭제되는 댓글 수: ${reply_size}건

<div style='text-align: center; font-size: 22px; margin-top: 14px;font-weight: bold;'>삭제된 파일은 복원할수 없습니다.<br>
정말 삭제 할끄얌?</div>

    <div style="margin: 0px auto; text-align: center; padding-top: 15px;">
     
      <button type = "submit" class="btn btn-default">삭제 진행</button>
      <button type = "button" onclick = "history.back()" class="btn btn-default">취소</button>
    </div>
      </div>
    </div>
</FORM>

 </DIV>
  </div>
  <DIV style='margin: 0px auto; width: 90%;'>
    <DIV style='float: left; width: 50%;'>
     </DIV>
     <DIV style='float: left; width: 50%;'>
    </DIV>  
  </DIV>
 
  <DIV style='width: 94.8%; margin: 0px auto;'>
  </DIV>  
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
 
</body>
</html>