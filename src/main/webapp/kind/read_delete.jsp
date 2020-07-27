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
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top3.jsp" />
 
  <DIV class='title_line'>게임 장르 삭제 > 삭제</DIV>
 
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <div class="msg_warning">카테고리 그룹을 삭제하면 복구 할 수 없습니다.</div>
    <FORM name='frm_create' id='frm_create' method='POST' 
                action='./delete.do'>
      <input type='hidden' name='kind_kindno' id='kind_kindno' value='${kindVO.kind_kindno }'>
        
      <label>그룹 이름</label>: ${kindVO.kind_kindname } &nbsp;
      <label>순서</label>: ${kindVO.kind_kindseqno } &nbsp; 
      
      <button type="submit" id='submit'>삭제</button>
      <button type="button" onclick="location.href='./list.do'">삭제 취소</button>
    </FORM>
  </DIV>
 
  
<TABLE class='table table-striped'>
  <colgroup>
    <col style="width: 10%;"/>
    <col style='width: 50%;'/>
    <col style='width: 20%;'/>   
    <col style='width: 20%;'/>
  </colgroup>
 
  <thead>  
  <TR>
    <TH class="th_bs">순서</TH>
    <TH class="th_bs">대분류명</TH>
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
      <TD class="td_bs_left"><A href="./read_update.do?kind_kindno=${kind_kindno }">${kind_kindname }</A></TD>
      <TD class="td_bs">${kind_kindrdate.substring(0, 10) }</TD>
      <TD class="td_bs">
        <A href="./read_update.do?kind_kindno=${kind_kindno }"><span class="glyphicon glyphicon-pencil"></span></A>
        <A href="./read_delete.do?kind_kindno=${kind_kindno }"><span class="glyphicon glyphicon-trash"></span></A>
        <A href="./update_seqno_up.do?kind_kindno=${kind_kindno }"><span class="glyphicon glyphicon-arrow-up"></span></A>
        <A href="./update_seqno_down.do?kind_kindno=${kind_kindno }"><span class="glyphicon glyphicon-arrow-down"></span></A>        
      </TD>         
    </TR>
  </c:forEach>
  </tbody>
 
</TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 