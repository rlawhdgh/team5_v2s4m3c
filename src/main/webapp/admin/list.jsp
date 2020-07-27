<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Unique Games</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <script type="text/javascript">
 
 function admin_delete_modal(admin_no) {
    $('#admin_no').val(admin_no);  
    $('#modal_panel_admin').modal();              // 다이얼로그 출력
  }
 
$(function() { // 자동 실행
    $('#btn_delete_admin').on('click', admin_delete_send); 
  });

 function admin_delete_send () {
	    // alert('삭제 진행');
	    // return;
	    
	    var frm = $('#frm_admin');  
	    var admin_no = $('#admin_no', frm).val();
	    //alert('consumer_no: ' +consumer_no);
	    var params = 'consumer_no=' + admin_no;
	    //alert('param: ' +params);
	    
	    var msg = '';
	  
	    $.ajax({
	      url: './delete.do',
	      type: 'get',  // post
	      cache: false, // 응답 결과 임시 저장 취소
	      async: true,  // true: 비동기 통신
	      dataType: 'json', // 응답 형식: json, html, xml...
	      data: params,      // 데이터
	      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
	        // alert(rdata);
	        var msg = "";
	        frm.submit();
        },
	      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
	      error: function(request, status, error) { // callback 함수
	        var msg = 'ERROR<br><br>';
	        msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
	        msg += '<strong>error</strong><br>'+error + '<hr>';
	        console.log(msg);
	      }
	    });
	    location.reload();
	  }
  
</script>

<style type="text/css">
.table-hover > tbody > tr:hover {
  background-color: #1E4561;
}
</style>

</head> 
 
<body>

<jsp:include page="/menu/top3.jsp" />

  <!-- Modal 회원 삭제 요청 시작 -->
  <div class="modal fade" id="modal_panel_admin" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">회원 삭제</h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <p>
            <form name='frm_admin' id='frm_admin' action='./delete.do'
                      method='POST'>                  
              <input type='hidden' name='admin_no' id='admin_no' value='${admin_no }'>
              관리자 정보를 삭제하시겠습니까?<br>
            </form>
            </p>  <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
          <button type="button" id="btn_delete_admin" class="btn btn-default" data-dismiss="modal" >삭제</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal 회원 삭제 요청  종료 -->

 <div style='height: 30px;'>
 </div> 
<TABLE  class='table table-hover' style="">
  <colgroup>
    <col style="width: 15%;"/>
    <col style='width: 30%;'/>    
    <col style='width: 30%;'/>
    <col style='width: 15%;'/>
    <col style='width: 10%;'/>
  </colgroup>
 
  <thead style="background-color: #111923;">  
  <TR>
    <TH class="th_bs">관리자번호</TH>
    <TH class="th_bs">관리자아이디</TH>
    <TH class="th_bs">관리자연락처</TH>
    <TH class="th_bs">회원 번호</TH>
    <TH class="th_bs">수정/권한삭제</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="Admin_listVO" items="${list }">  <!-- request 객체에 접근 -->
    <TR>
      <TD class="td_bs">${Admin_listVO.admin_no }</TD>
      <TD class="td_bs">${Admin_listVO.consumer_id}</TD>
      <TD class="td_bs">${Admin_listVO.consumer_phone_num}</TD>
      <TD class="td_bs">${Admin_listVO.consumer_no}</TD>
      <TD class="td_bs">
        <form name="form1"  method="POST" action="/team5/consumer/update_mypage.do" style="width: 20px; float: left;">
        <input type="hidden" name ="consumer_no" value="${Admin_listVO.consumer_no }">
        <button type="submit" class='btn btn-link' style="padding: 0px;"><span class="glyphicon glyphicon-pencil"></span></button>
        </form> /
        <A href='javascript:admin_delete_modal(${Admin_listVO.consumer_no}) '><span class="glyphicon glyphicon-trash"></span></A>
      </TD>             
    </TR>
  </c:forEach>
  </tbody>
 
</TABLE>
  <div style='height: 30px;'>
 </div> 
 
<jsp:include page="/menu/bottom.jsp" />



</body>
 
</html> 
 
 