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

<script type="text/javascript">
$(function() { // 자동 실행
	$('#modal_panel_consumer').modal();  
  });
</script>

</head> 
<body>
<jsp:include page="/menu/top3.jsp" flush='false' />

  <!-- Modal  시작 -->
  <div class="modal fade" id="modal_panel_consumer" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">알림</h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <c:choose>
            <c:when test="${param.create_cnt == 0}">
              <div>회원가입에 실패했습니다. 다시 시도해주세요.</div>
            </c:when>
            <c:when test="${param.create_cnt ==1 && param.sender_cnt == 0}">
              <div>메일전송에 실패했습니다. 다시 시도해주세요.</div>
            </c:when>
            <c:when test="${param.create_cnt ==1 && param.sender_cnt == 1}">
              <div>메일을 전송했습니다. 메일을 확인해주세요.</div>
            </c:when>
            <c:otherwise>
              <div>처리에 실패했습니다. 다시 시도해주세요.</div>
            </c:otherwise>
          </c:choose>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
          
        </div>
      </div>
    </div>
  </div> <!-- Modal   종료 -->



<DIV class='title_line'></DIV>

<DIV class='message'>
  <fieldset class='fieldset_basic' >
    <UL >
      <c:choose>
        <c:when test="${cnt == 1}">
          <LI class='li_none' style="list-style: none;">
            <span class="span_success">[${id }]님 이메일인증을 보냈습니다. </span><br>
            <span class="span_success">등록하신 이메일을 확인해 주세요. </span>
          </LI>
        </c:when>
        <c:otherwise>
          <LI class='li_none_left' style="list-style: none;">
            <span class="span_fail">[${id }]님 회원가입을 실패했습니다.</span>
          </LI>
          <LI class='li_none_left' style="list-style: none;">
            <span class="span_fail">다시 시도해주세요.</span>
          </LI>
        </c:otherwise>
      </c:choose>
      <LI class='li_none' style="list-style: none;">
        <br>
        <button type='button' onclick="location.href='./list.do'">목록</button>
      </LI>
    </UL>
  </fieldset>

</DIV>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>

