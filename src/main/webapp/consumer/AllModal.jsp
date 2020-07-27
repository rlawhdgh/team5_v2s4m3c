<%@ page contentType="text/html; charset=UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<script type="text/javascript">

$(function() { // 자동 실행
    if(${param.create_cnt != null && param.sender_cnt != null}){
      $('#modal_panel_consumer').modal();   
    }
    if(${param.Keyerror_cnt != null}){
    	$('#modal_panel_Keyerror_cnt').modal();   
    }
    if(${param.Manerror_cnt != null}){
        $('#modal_panel_Manerror_cnt').modal();   
      }
    if(${param.Conerror_cnt != null}){
        $('#modal_panel_Conerror_cnt').modal();   
      }
    if(${param.Admin_cnt != null}){
        $('#modal_panel_Admin_cnt').modal();   
      }
    if(${param.Noconsumer_cnt != null}){
      $('#modal_panel_Noconsumer_cnt').modal();   
    }
    });
    
  function Gotohome(){
	  location.href = "../index.jsp";
  }
  function Gotolist(){
	    location.href = "../consumer/list.do";
	  }
  
</script>

</head>
<body>
<!-- 메인 게임 사진 -->
 <div class="row"> 
<jsp:include page="/menu/top3.jsp" flush='false' />
<!-- -----------모달 모음 종료------------------------ -->

  <!-- Modal  시작 -->
  <div class="modal fade" id="modal_panel_consumer" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" onclick="Gotohome();" data-dismiss="modal">×</button>
          <h4 class="modal-title">알림</h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <c:choose>
            <c:when test="${param.cnt == 1}">
              <div>회원 정보를 수정했습니다.</div>
            </c:when>
            <c:otherwise>
              <div>처리에 실패했습니다. 다시 시도해주세요.</div>
            </c:otherwise>
          </c:choose>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" onclick="Gotohome();" data-dismiss="modal">확인</button>
          
        </div>
      </div>
    </div>
  </div> <!-- Modal   종료 -->
  
    <!-- Modal  시작 -->
  <div class="modal fade" id="modal_panel_Keyerror_cnt" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" onclick="Gotohome();" data-dismiss="modal">×</button>
          <h4 class="modal-title">알림</h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <c:choose>
            <c:when test="${param.Keyerror_cnt == 1}">
              <div>인증되지 않은 회원입니다.</div>
            </c:when>
            <c:otherwise>
              <div>로그인 성공</div>
            </c:otherwise>
          </c:choose>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" onclick="Gotohome();" data-dismiss="modal">확인</button>
          
        </div>
      </div>
    </div>
  </div> <!-- Modal   종료 -->
  
      <!-- Modal  시작 -->
  <div class="modal fade" id="modal_panel_Manerror_cnt" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" onclick="Gotohome();" data-dismiss="modal">×</button>
          <h4 class="modal-title">알림</h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <c:choose>
            <c:when test="${param.Manerror_cnt == 1}">
              <div>관리자 로그인 실패</div>
            </c:when>
            <c:otherwise>
              <div>로그인 성공</div>
            </c:otherwise>
          </c:choose>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" onclick="Gotohome();" data-dismiss="modal">확인</button>
          
        </div>
      </div>
    </div>
  </div> <!-- Modal   종료 -->
  
        <!-- Modal  시작 -->
  <div class="modal fade" id="modal_panel_Conerror_cnt" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" onclick="Gotohome();" data-dismiss="modal">×</button>
          <h4 class="modal-title">알림</h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <c:choose>
            <c:when test="${param.Conerror_cnt == 1}">
              <div>로그인 실패</div>
            </c:when>
            <c:otherwise>
              <div>로그인 성공</div>
            </c:otherwise>
          </c:choose>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" onclick="Gotohome();" data-dismiss="modal">확인</button>
          
        </div>
      </div>
    </div>
  </div> <!-- Modal   종료 -->
  
          <!-- Modal  시작 -->
  <div class="modal fade" id="modal_panel_Admin_cnt" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" onclick="Gotolist();" data-dismiss="modal">×</button>
          <h4 class="modal-title">알림</h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <c:choose>
            <c:when test="${param.Admin_cnt == 1}">
              <div>관리자 권한을 부여했습니다.</div>
            </c:when>
            <c:otherwise>
              <div>이미 관리자인 회원입니다.</div>
            </c:otherwise>
          </c:choose>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" onclick="Gotolist();" data-dismiss="modal">확인</button>
          
        </div>
      </div>
    </div>
  </div> <!-- Modal   종료 -->
  
  
  

            <!-- Modal  시작 -->
  <div class="modal fade" id="modal_panel_Noconsumer_cnt" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" onclick="Gotohome();" data-dismiss="modal">×</button>
          <h4 class="modal-title">알림</h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <c:choose>
            <c:when test="${param.Noconsumer_cnt == 1}">
              <div>존재하지 않는 회원입니다. 다시 시도해 주세요.</div>
            </c:when>
            <c:otherwise>
              <div>존재하는 회원 입니다.</div>
            </c:otherwise>
          </c:choose>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" onclick="Gotohome();" data-dismiss="modal">확인</button>
          
        </div>
      </div>
    </div>
  </div> <!-- Modal   종료 -->
  

<!-- -----------모달 모음 종료------------------------ -->

  <DIV style='width: 100%; margin: 30px auto;'>
<!-- 아무것도 없음 -->

 </DIV>
  </div>


 
<jsp:include page="/menu/bottom.jsp" flush='false' />
 
</body>
</html>