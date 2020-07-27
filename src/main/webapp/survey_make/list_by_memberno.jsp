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
    내가 작성한 글 목록
  </DIV>
  
  <ASIDE style='float: left;'>
    내가 작성한 전체 글 목록입니다.
  </ASIDE>
  <ASIDE style='float: right;'>
<%--     <A href="./create.do?cateno=${cateVO.cateno }">등록</A>
    <span class='top_menu_sep'>&nbsp;</span>   --%>  
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
  
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 20%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 50%;"></col>
        <col style="width: 20%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>등록일</th>
          <th style='text-align: center;'>카테고리</th>
          <th style='text-align: center;'>제목</th>
          <th style='text-align: center;'>회원</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="survey_cate_Contents_VO" items="${list }">
          <c:set var="survey_cateno" value="${survey_cate_Contents_VO.survey_cateno }" />
          <c:set var="survey_name" value="${survey_cate_Contents_VO.survey_name }" />
          <c:set var="survey_cate_rdate" value="${survey_cate_Contents_VO.survey_cate_rdate }" />          
                    
          <c:set var="survey_contentsno" value="${survey_cate_Contents_VO.survey_contentsno }" />
          <c:set var="survey_title" value="${survey_cate_Contents_VO.survey_title }" />
          <c:set var="survey_rdate" value="${survey_cate_Contents_VO.survey_rdate }" />
          
          <c:set var="memberno" value="${memberVO.memberno }" />
          <c:set var="mname" value="${memberVO.mname }" />
          
          <tr> 
            <td style='text-align: center;'>${survey_rdate.substring(0, 10)}</td>
            <td style='text-align: center;'>${survey_name}</td>
            <td>
              <a href="./survey_read.do?survey_contentsno=${survey_contentsno}">${survey_title}</a> 
            </td> 
            <td style='text-align: center;'>${mname}</td>
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
    
 