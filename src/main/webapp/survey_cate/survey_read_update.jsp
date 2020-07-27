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
 
  <DIV class='title_line'>
    <A href="../survey_categrp/survey_list.do">설문 카테고리 그룹</A> > 
    <A href="./survey_list.do">모든 설문 카테고리</A> >
    ${survey_cateVO.survey_name } 조회(수정) 
  </DIV>
 
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #FF000; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' 
                action='./survey_update.do'>
      <input type='hidden' name='survey_cateno' id='survey_cateno' value='${survey_cateVO.survey_cateno }'>

      <label>그룹 번호</label>
      <input type='number' name='survey_categrpno' value='${survey_cateVO.survey_categrpno }' required="required" 
                min="1" max="99999" step="1" style='width: 5%;'>
                        
      <label>카테고리 이름</label>
      <input type='text' name='survey_name' value='${survey_cateVO.survey_name }' required="required" style='width: 25%;'>
 

      <label>등록 글수</label>
      <input type='number' name='survey_cnt' value='${survey_cateVO.survey_cnt }' required="required" 
                min='0' step='1' style='width: 5%;'>
                       
      <button type="submit" id='submit'>저장</button>
      <button type="button" onclick="location.href='./survey_list.do'">수정 취소</button>
    </FORM>
  </DIV>
 
  
<TABLE class="table table-borderless table-dark">
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
  <c:forEach var="survey_cateVO" items="${list }">
    <c:set var="survey_cateno" value="${survey_cateVO.survey_cateno}" />
    <TR>
      <TD class="td_bs_left"><A href="./survey_read_update.do?survey_cateno=${survey_cateno }">${survey_cateVO.survey_name }</A></TD>
      <TD class="td_bs">${survey_cateVO.survey_rdate.substring(0, 10) }</TD>
      <TD class="td_bs">
        <A href="./survey_read_update.do?survey_cateno=${survey_cateno }"><span class="glyphicon glyphicon-pencil"></span></A>
        <A href="./survey_read_delete.do?survey_cateno=${survey_cateno }"><span class="glyphicon glyphicon-trash"></span></A>
        <A href="./survey_update_seqno_up.do?survey_cateno=${survey_cateno }"><span class="glyphicon glyphicon-arrow-up"></span></A>
        <A href="./survey_update_seqno_down.do?survey_cateno=${survey_cateno }"><span class="glyphicon glyphicon-arrow-down"></span></span></A>         
      </TD>         
    </TR>
  </c:forEach>
  </tbody>
 
</TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 