<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>UNIQUE GAMES</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
 function delete_file(kind_kindno) {
    var sw = confirm("파일을 삭제 하시겠습니까?");
    if (sw == true) {
      location.href="./delete.do?kind_kindno=" + kind_kindno;
    } else {
      alert('파일 삭제를 취소합니다.');
    }
  }
</script>
<style type="text/css">
.table-hover > tbody > tr:hover {
  background-color: #364252;
}
</style>
 
</head> 

<body>
<jsp:include page="/menu/top3.jsp" />
 
  <DIV class='title_line' style="margin: 0px; padding: 10px 0px;">게임장르 그룹
   <ASIDE style='float: right;'>
    <A href="./create.do">등록</A> 
   </ASIDE> 
  </DIV>
 
 
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' 
                action='./create.do'>
      <input type='hidden' name='consumer_no' id='consumer_no' value='${sessionScope.consumer_no }'>
        
      <label>게임 장르</label>
      <input type='text' name='kind_kindname' value='' required="required" style='width: 25%;'>
 
      <label>순서</label>
      <input type='number' name='kind_kindseqno' value='1' required="required" 
                min='1' max='1000' step='1' style='width: 5%;'>
                    
      <button type="submit" id='submit'>등록</button>
      <button type="button" onclick="cancel();">취소</button>
    </FORM>
  </DIV>
 
<div style="padding: 5px 0px;">
<table class="table table-hover" style='margin-bottom: 0px;'>
  <colgroup>
    <col style="width: 10%;"/>
    <col style='width: 50%;'/>
    <col style='width: 20%;'/>
    <col style='width: 20%;'/>
  </colgroup>
 
<thead style="background-color: #111923;">
  <TR>
    <TH class="th_bs">순서</TH>
    <TH class="th_bs">게임 장르</TH>
    <TH class="th_bs">등록일</TH>
    <TH class="th_bs">기타</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="kindVO" items="${list }">  <!-- request 객체에 접근 -->
    <c:set var="kind_kindno" value="${kindVO.kind_kindno}" />
    <c:set var="kind_kindname" value="${kindVO.kind_kindname}" />
    <c:set var="kind_kindseqno" value="${kindVO.kind_kindseqno}" />
    <c:set var="kind_kindrdate" value="${kindVO.kind_kindrdate}" />
    <TR>
      <TD class="td_bs">${kind_kindseqno }</TD>
      <TD class="td_bs_left"><A href="../game/list_join.do?kind_kindno=${kind_kindno }">${kind_kindname}</A></TD>
      <TD class="td_bs">${kind_kindrdate.substring(0, 10) }</TD>
      <TD class="td_bs">
        <A href="./read_update.do?kind_kindno=${kind_kindno }"><span class="glyphicon glyphicon-pencil"></span></A>
        <A href="javascript:delete_file(${kind_kindno})"><span class="glyphicon glyphicon-trash"></span></A>
        <A href="./update_seqno_up.do?kind_kindno=${kind_kindno }"><span class="glyphicon glyphicon-arrow-up"></span></A>
        <A href="./update_seqno_down.do?kind_kindno=${kind_kindno }"><span class="glyphicon glyphicon-arrow-down"></span></A>         
      </TD>             
    </TR>
  </c:forEach>
  </tbody>
 
</TABLE>
</div>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 