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
 
</head>
 
<body>
<jsp:include page="/menu/top3.jsp" flush='false' />

  <DIV class='title_line'>
    ${survey_cateVO.survey_name }
  </DIV>
  <form name='frm' id='frm' method='get' action='./pollList.do'>
    <input type='hidden' name='survey_cateno' value='${survey_cateVO.survey_cateno }'>
  
      <ASIDE style='float: left;'>
      ${survey_cateVO.survey_name }         
      </ASIDE>
      <ASIDE style='float: right;'>
        <A href="./survey_create.do?survey_cateno=${survey_cateVO.survey_cateno }">등록</A>
        <span class='top_menu_sep'>&nbsp;</span>    
        <A href="javascript:location.reload();">새로고침</A>
        
        <button type='button' 
                     onclick="location.href='./survey_list_all.do?survey_categrpno=${survey_cateVO.survey_cateno}&survey_word='">검색 취소</button>  
      </ASIDE> 
      <DIV class='menu_line' style='clear: both;'></DIV>
  </form>
  
  <div style='width: 100%;'>
    <table class="table table-borderless table-dark" style='width: 100%;'>
       <colgroup>
        <col style="width: 15%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 45%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 10%;"></col>

      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>등록일</th>
          <th style='text-align: center;'>카테고리</th>
          <th style='text-align: center;'>제목</th>
          <th style='text-align: center;'>설문기간</th>
          <th style='text-align: center;'>회원</th>
        </tr>
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="saveVO" items="${list }">
          <c:set var="makeno" value="${saveVO.makeno }" />
          
          <tr> 
            <td style='text-align: center;'>${saveVO.wdate.substring(0, 10)}</td>
            <td style='text-align: center;'>${survey_cateVO.survey_name}</td>
            <td>
              <a href="./survey_read.do?makeno=${saveVO.makeno}">${saveVO.question}</a> 
            </td> 
            <td style='text-align: center;'>${saveVO.period}일</td>
            <%-- <td style='text-align: center;'>${survey_contentsVO.memberno}</td> --%>
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <DIV class='bottom_menu'>${paging }</DIV>
    <br><br>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
    
 