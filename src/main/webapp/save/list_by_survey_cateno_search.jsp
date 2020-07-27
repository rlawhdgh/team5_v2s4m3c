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
  <form name='frm' id='frm' method='get' action='./PollList.do'>
    <input type='hidden' name='survey_cateno' value='${survey_cateVO.survey_cateno }'>
  
      <ASIDE style='float: left;'>
        ${survey_categrpVO.survey_name } > ${survey_cateVO.survey_name } 
         <c:choose>
          <c:when test="${param.survey_word !='' }">
          >'${param.survey_word }' ${search_count } 건 검색됨
          </c:when>
          <c:otherwise>
         > ${search_count } 건 등록됨
          </c:otherwise>
        </c:choose>
      </ASIDE>
      <ASIDE style='float: right;'>
        <A href="./survey_create.do?survey_cateno=${survey_cateVO.survey_cateno }">등록</A>
        <span class='top_menu_sep'>&nbsp;</span>    
        <A href="javascript:location.reload();">새로고침</A>
        
         <c:choose>
        <c:when test="${param.word != '' }"> 검색하는 경우
          <input type='text' name='word' id='word' value='${param.word }' 
                     style='width: 35%;'>
        </c:when>
        <c:otherwise> 검색하지 않는 경우
          <input type='text' name='word' id='word' value='' style='width: 35%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./survey_list.do?survey_categrpno=${survey_cateVO.survey_cateno}&survey_word='">검색 취소</button>  
      </c:if> 
      </ASIDE> 
      <DIV class='menu_line' style='clear: both;'></DIV>
  </form>
  
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
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
            <td style='text-align: center;'>${saveVO.survey_cateno}</td>
            <td>
              <a href="./survey_read.do?survey_makeno=${makeno}">${saveVO.question}</a> 
            </td> 
            <td style='text-align: center;'>${SaveVO.period}일</td>
            <%-- <td style='text-align: center;'>${survey_contentsVO.memberno}</td> --%>
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
    
 