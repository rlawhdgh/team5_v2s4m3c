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

<style type="text/css">
.table-hover > tbody > tr:hover {
  background-color: #364252;
}
</style>

 <script type="text/javascript">

</script>
</head> 
 
<body>

<jsp:include page="/menu/top3.jsp" />

  <!-- Modal 회원 삭제 요청 시작 -->
  <div class="modal fade" id="modal_panel_grade" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">회원 삭제</h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <p>
            <form name='frm_grade' id='frm_grade' action='./delete.do'
                      method='POST'>                  
              <input type='hidden' name='grade_no' id='grade_no' value='${grade_no }'>
              권한 정보를 삭제하시겠습니까?<br>
            </form>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
          <button type="button" id="btn_delete_grade" class="btn btn-default" data-dismiss="modal" >삭제</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal 회원 삭제 요청  종료 -->

  
<TABLE class='table table-hover '>
  <colgroup>
    <col style="width: 20%;"/>
    <col style='width: 30%;'/>    
    <col style='width: 20%;'/>
  </colgroup>
 
  <thead style="background-color: #111923;">  
  <TR>
    <TH class="th_bs">로그인번호(의미없음)</TH>
    <TH class="th_bs">로그인이력</TH>
    <TH class="th_bs">회원번호</TH>
    <TH class="th_bs">수정 / 삭제</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="LoginVO" items="${list }">  <!-- request 객체에 접근 -->
    <c:set var="login_no" value="${LoginVO.login_no}" />
    <TR>
      <TD class="td_bs">${login_no }</TD>
      <TD class="td_bs">${LoginVO.login_time}</TD>
      <TD class="td_bs">${LoginVO.consumer_no}</TD>
      <TD class="td_bs">
        <A href="./update.do?grade_no=${grade_no }"><span class="glyphicon glyphicon-pencil"></span></A> /
        <A href='javascript:consumer_delete_modal(${grade_no }) '><span class="glyphicon glyphicon-trash"></span></A>
      </TD>             
    </TR>
  </c:forEach>
  </tbody>
 
</TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />



</body>
 
</html> 
 
 