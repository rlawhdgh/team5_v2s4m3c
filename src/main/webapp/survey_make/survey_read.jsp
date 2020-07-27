<%@ page contentType="text/html; charset=UTF-8"%>
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
<c:set var="survey_cateno" value="${survey_cateVO.survey_cateno}" />
<c:set var="survey_makeno" value="${survey_makeVO.survey_makeno }" />

<jsp:include page="/menu/top3.jsp" flush='false' />


  
  <DIV class='title_line'>
    ${survey_cateVO.survey_name }
  </DIV>
  
  <ASIDE style='float: left;'>
    ${survey_categrpVO.survey_name } > ${survey_cateVO.survey_name }
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./survey_list_all.do?survey_cateno=${survey_cateno }'>목록</A>
    <span class='menu_divide' > | </span>
    <A href='./survey_update.do?survey_cateno=${survey_cateno }&survey_makeno=${survey_makeno}'>수정</A>
    
    <span class='menu_divide' > | </span> 
    <A href='./survey_delete.do?survey_cateno=${survey_cateno }&survey_makeno=${survey_makeno}'>삭제</A>
    
  </ASIDE> 
  
  <div class='menu_line'></div>

  <FORM name='frm' method="get" action='./survey_update.do'>
      <input type="hidden" name="survey_makeno" value="${survey_makeno}">
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span>${survey_makeVO.survey_question}</span>
          <%--   (<span>${survey_contentsVO.recom}</span>) --%>
            <span>${survey_makeVO.survey_rdate.substring(0, 16)}</span>
          </li>
         
          
          <li class="li_none">
            <DIV>${survey_makeVO.survey_question }</DIV>
          </li>
          <li class="li_none">
          <DIV><input type="checkbox" name=survey_answer value="survey_answer" ></DIV>

          </li>
           <li class="li_none">
            <DIV style='text-decoration: none;'>
              검색어(키워드): ${survey_makeVO.survey_word }
                     
            </DIV>
          </li>
          
        </ul>
      </fieldset>
     
      <div style="background-color: #ff000; text-align: right;">
        <button type="submit" value="투표" onclick="send()"> </button>
</DIV>

  </FORM>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
 

