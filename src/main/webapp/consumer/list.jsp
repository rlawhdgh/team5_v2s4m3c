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
 
 function consumer_delete_modal(consumer_no) {
    $('#consumer_no').val(consumer_no);  
    $('#modal_panel_consumer').modal();              // 다이얼로그 출력
  }
 
$(function() { // 자동 실행
    $('#btn_delete_consumer').on('click', consumer_delete_send); 
  });

 function consumer_delete_send () {
	    // alert('삭제 진행');
	    // return;
	    
	    var frm = $('#frm_consumer');  // Youtube 삭제 폼
	    var consumer_no = $('#consumer_no', frm).val();
	    var consumer_id = $('#consumer_id', frm).val();
	    //alert('consumer_no: ' +consumer_no);
	    var params = 'consumer_no=' + consumer_no + '&consumer_id=' + consumer_id;
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
	    setInterval(function(){
	     location.reload();
	    	
	    }, 300);
	  }
  
</script>

<style type="text/css">
.table-hover > tbody > tr:hover {
  background-color: #1E4561;
}


.btn-link{
  padding: 0px;
  font-size: 16px;
  color: #c7d5e0;
}
.btn-link:hover{  /* A 태그에 마우스가 올라간 상태 */
      text-decoration: underline; /* 밑줄 출력 */
      color: #E6E7E7;
      font-weight:bold;
    }
</style>

</head> 
 
<body>

<jsp:include page="/menu/top3.jsp" />

  <!-- Modal 회원 삭제 요청 시작 -->
  <div class="modal fade" id="modal_panel_consumer" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">회원 삭제</h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <p>
            <form name='frm_consumer' id='frm_consumer' action='./delete.do'
                      method='GET'>                  
              <input type='hidden' name='consumer_no' id='consumer_no' value='${consumer_no }'>
              삭제된 회원 관련 정보는 복구 할 수 없습니다.<br>
              회원 아이디를 입력해주세요.
              <input type="text" class="enter-id placeholder" autocomplete="off" placeholder="아이디" name="consumer_id" id="consumer_id"/>
            </form>
            </p>  <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
          <button type="button" id="btn_delete_consumer" class="btn btn-default" data-dismiss="modal" >삭제</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal 회원 삭제 요청  종료 -->

<div style='height: 40px;'>
</div>
<TABLE class='table table-hover '>
  <colgroup>
    <col style="width: 10%;"/>
    <col style='width: 20%;'/>
    <col style='width: 20%;'/>
    <col style='width: 20%;'/>
    <col style='width: 10%;'/>    
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
  </colgroup>
 
  <thead style="background-color: #111923;">
  <TR>
    <TH class="th_bs">회원번호</TH>
    <TH class="th_bs">이름</TH>
    <TH class="th_bs">아이디</TH>
    <TH class="th_bs">연락처</TH>
    <TH class="th_bs">회원권한</TH>
    <TH class="th_bs">수정/삭제</TH>
    <TH class="th_bs">관리자등록</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="Consumer_grade_nameVO" items="${list }">  <!-- request 객체에 접근 -->
    <c:set var="consumer_no" value="${Consumer_grade_nameVO.consumer_no}" />
    <TR>
      <TD class="td_bs">${consumer_no }</TD>
      <TD class="td_bs">${Consumer_grade_nameVO.consumer_name}</TD>
      <TD class="td_bs">${Consumer_grade_nameVO.consumer_id }</TD>
      <TD class="td_bs">${Consumer_grade_nameVO.consumer_phone_num}</TD>
      <TD class="td_bs">${Consumer_grade_nameVO.grade_name}</TD>
      <TD class="td_bs">
        <form name="form1"  method="POST" action="./update_mypage.do" style="width: 20px; float: left;">
        <input type="hidden" name ="consumer_no" value="${consumer_no }">
        <button type="submit" class='btn btn-link'><span class="glyphicon glyphicon-pencil"></span></button>
        </form> / 
        <A href='javascript:consumer_delete_modal(${consumer_no }) '><span class="glyphicon glyphicon-trash"></span></A>
      </TD>
      <TD class="td_bs">
        <form name="form2"  method="POST" action="../admin/create.do" style="width: 20px; margin: 0px auto;">
        <input type="hidden" name ="consumer_no" value="${consumer_no}">
        <button type="submit" class='btn btn-link'><span class="glyphicon glyphicon-arrow-up"></span></button>
        </form>
      </TD>             
    </TR>
  </c:forEach>
  </tbody>
 
</TABLE>
 <div><form name='frm' id='frm' method='get' action='./list.do'>
  아이디 검색 : <input type="text" name="word" >
 <button type="submit" class="" style="margin-left: 10px;">검색</button>
 </form></div>
 <DIV class='bottom_menu'>${paging }</DIV>
 <Br><Br>
 

<jsp:include page="/menu/bottom.jsp" />



</body>
 
</html> 
 
 