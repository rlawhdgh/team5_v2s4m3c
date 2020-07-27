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
 
  <DIV class='title_line'>카테고리 그룹 > ${survey_categrpVO.survey_name } 삭제 </DIV>
 
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #FF000; width: 100%; text-align: center;'>
    <div class="msg_warning">카테고리 그룹을 삭제하면 복구 할 수 없습니다.</div>
    <FORM name='frm_create' id='frm_create' method='POST' 
                action='./survey_delete.do'>
      <input type='hidden' name='survey_categrpno' id='survey_categrpno' value='${survey_categrpVO.survey_categrpno }'>
        
      <label>그룹 이름</label>: ${survey_categrpVO.survey_name } &nbsp;                           
      <label>순서</label>: ${survey_categrpVO.survey_seqno } &nbsp;     
<%--       <label>형식</label>: ${survey_categrpVO.survey_visible } &nbsp;  --%>

                      
      <button type="submit" id='submit'>삭제</button>
      <button type="button" onclick="location.href='./survey_list.do'">삭제 취소</button>
    </FORM>
  </DIV>
 
  
<TABLE class='table table-borderless table-dark'>
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
  <c:forEach var="Survey_categrpVO" items="${list }">
    <c:set var="survey_categrpno" value="${Survey_categrpVO.survey_categrpno}" />
    <TR>
      <TD class="td_bs">${Survey_categrpVO.survey_seqno }</TD>
      <TD class="td_bs_left"><A href="./survey_read_update.do?survey_categrpno=${survey_categrpno }">${Survey_categrpVO.survey_name }</A></TD>
      <TD class="td_bs">${Survey_categrpVO.survey_rdate.substring(0, 10) }</TD>
      <TD class="td_bs">
        <A href="./survey_read_update.do?survey_categrpno=${survey_categrpno }"><span class="glyphicon glyphicon-pencil"></span></A>
        <A href="./survey_read_delete.do?survey_categrpno=${survey_categrpno }"><span class="glyphicon glyphicon-trash"></span></A>
        <A href="./survey_update_seqno_up.do?survey_categrpno=${survey_categrpno }"><span class="glyphicon glyphicon-arrow-up"></span></A>
        <A href="./survey_update_seqno_down.do?survey_categrpno=${survey_categrpno }"><span class="glyphicon glyphicon-arrow-down"></span></A>         
      </TD>         
    </TR>
  </c:forEach>
  </tbody>
 
</TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 