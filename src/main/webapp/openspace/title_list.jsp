<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>공지사항</title>
<link href="/team5/css/style.css" rel='Stylesheet' type='text/css'>
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>
<!-- 메인 게임 사진 -->
 <div class="row"> 
<jsp:include page="/menu/top3.jsp" flush='false' />

  <DIV style='width: 100%; margin: 0px auto; '>

<jsp:include page="./side.jsp" flush="false" />


  <div class="col-md-10" style="border-left: solid 1px #bbbbbb; ">
<div style="margin-left: 25px;">
  
  <div style="margin-bottom: 10px;">
    <span style="font-size: 30px; font-weight:bold"> &nbsp;공지사항</span>
    
          <c:choose>
        <c:when test="${word != '' }"> <!-- 검색을 하는 경우 -->  
    <c:if test="${search == 'title' }">
    제목검색: ${word} 검색된 글 수${size } 건
    </c:if>
        <c:if test="${search == 'contents' }">
    내용검색: ${word} 검색된 글 수${size } 건
    </c:if>
        <c:if test="${search == 'name_contents' }">
    제목+내용검색: ${word} 검색된 글 수${size } 건
    </c:if>
        </c:when>
        <c:otherwise> <!-- 검색하지 않는 경우 -->
        </c:otherwise>
        </c:choose>
    
    
    <button class="pull-right" style="margin-top: 14px; margin-right: 5px;" onclick="location.href='./create.do'" >등록</button>
    </div>
  <div style="height: 720px; border: solid 1px #bbbbbb;" > <!-- 15개 -->
  <table class="table table-hover">
    <colgroup>
      <col style='width: 8%;'/>
      <col style='width: 10%;'/>
      <col style='width: 35%;'/>
      <col style='width: 10%;'/>
      <col style='width: 7%;'/>    
      <col style='width: 5%;'/>    
      <col style='width: 15%;'/>
      <col style='width: 10%;'/>
    </colgroup>
  
  
  
    <thead style="background-color: rgba(250, 250, 250, 0.9);">
      <tr >
        <th style="text-align: center;">번호</th>
        <th style="text-align: center;">구분</th>
        <th style="text-align: center;">제목</th>
        <th style="text-align: center;">작성자</th>
        <th style="text-align: center;">조회수</th>
        <th style="text-align: center;">출력</th>
        <th style="text-align: center;">등록일</th>
        <th style="text-align: center;">기타</th>
    
      </tr>
    </thead>
    
    
    <tbody>


   <c:forEach var="openspaceVO"  items="${list }"> <!-- request 객체에 접근 -->
    <c:set var="openspace_no" value="${openspaceVO.openspace_no}" />
    <c:set var="title" value="${openspaceVO.openspace_title}" />
    <c:set var="content" value="${openspaceVO.openspace_content}" />
    <c:set var="division" value="${openspaceVO.openspace_division}" />
    <c:set var="cnt" value="${openspaceVO.openspace_cnt}" />
    <c:set var="seqno" value="${openspaceVO.openspace_seqno}" />
    <c:set var="visible" value="${openspaceVO.openspace_visible}" />
    <c:set var="rdate" value="${openspaceVO.openspace_rdate}" />
    <c:set var="redate" value="${openspaceVO.openspace_redate}" />

      <tr>
      
        <td style="text-align: center;">${seqno }</td>
        <td style="text-align: center;">${division }</td>
        
        <td style="text-align: left;">
         <a href="./read.do?openspace_no=${openspace_no}&search=${search }&word=${word}">${title }</a></td>
        <td style="text-align: center;">테이블X</td>
        <td style="text-align: center;">${cnt}</td>
        <td style="text-align: center;">${visible}</td>
        <td style="text-align: center;" >${rdate.substring(0,10) }</td>
        <td style="text-align: center;"><A href="./update.do?openspace_no=${openspace_no }">수정</A>
        /
        <A href="./delete.do?openspace_no=${openspace_no }">삭제</A></td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
  
      <c:choose>
        <c:when test="${size ==0 }">
        <div style = "margin: 0px auto; text-align: center;">
          <span style= "font-size: 20px;">검색된 글이 없어용</span><br>
          <A href='./list.do'>전체 목록</A>
        </div>
        </c:when>
     </c:choose>
  
  
  </div>
  
  <div style="margin: 0px auto; text-align: center;">
<ul class="pagination pagination-sm">
  <li><a href="#">1</a></li>
  <li><a href="#">2</a></li>
  <li><a href="#">3</a></li>
  <li><a href="#">4</a></li>
  <li><a href="#">5</a></li>
</ul>

  </div>
  
  
<form name='frm' id='frm' action='./search_list.do' method='GET'> 


  <div  class="col-md-5 " style="padding: 0px; text-align: right; right: 3px; margin-bottom: 30px;">
    <select name='search' style="height: 26px;">
      <option value='title' selected="selected">제목</option>
      <option value='contents'>내용</option>
      <option value='name_contents'>재목+내용</option>
    </select>
  </div>
  <div class="col-md-7" style="padding: 0px;">
    <input type='text' name='word' value='' required="required" >
    <button type="submit">검색</button>
  </div>

</form>
    
    
    </div>
    
</div>



</DIV>
</div>
  <DIV style='margin: 0px auto; width: 90%;'>
    <DIV style='float: left; width: 50%;'>
     </DIV>
     <DIV style='float: left; width: 50%;'>
    </DIV>  
  </DIV>
 
  <DIV style='width: 94.8%; margin: 0px auto;'>
  </DIV>  
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
 
</body>
</html>