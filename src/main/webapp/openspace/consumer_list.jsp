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
<script>
$(document).ready(function(){
  var size = ${search_count}
  var search = '${search}';   
  if(search =='title' || search=='name_contents'){
    for (cnt = 1; cnt <= size; cnt++) {
      var html = document.querySelector('.QWER'+cnt).innerHTML;
      document.querySelector('.QWER'+cnt).innerHTML =
          html.replace(/(${word})/g, '<span style="background-color: #ffff00; color: #FF0000;">$1</span>')
    }
  }
});
</script>

<style type="text/css">
.table-hover > tbody > tr:hover {
  background-color: #1E4561;
}

    .side:hover{  /* A 태그에 마우스가 올라간 상태 */

      color: #c7d5e0;
      background-color: #4581A5;
    }
  
    .side:active{  /* A 태그를 클릭한 상태 */

      color: #c7d5e0;
      background-color: #4581A5;
    }



</style>

</head>

<body>

<!-- 메인 게임 사진 -->

<jsp:include page="/menu/top3.jsp" flush='false' />
 <DIV style='width: 100%; margin: 0px auto;  '>
 
<!-- 테이블 크기 지정 --> 
<table style='width: 100%; margin: 0px auto;'>
<tr>
<!-- 사이드 메뉴 -->
<td style='width: 15%; height: 100px;'>
    <div class="" style="padding-top:10px; padding-left: 0px; ">
      <table class="table" style="border: none; width: 100%;"  >
        <thead>
          <tr>
            <th style="border: none; font-size: 20px;">내정보</th>
          </tr>
        </thead>
      <tbody >
        <tr>
         <td class='side' style="padding: 2px; padding-top: 8px; " ><a style='color:#E6E7E7;' href="/team5/openspace_reply/consumer_reply.do">내가 쓴 댓글</A></td>
        </tr>
        <tr>
          <td class='side' style="font-weight:bold; border: none; padding: 2px; background-color: #4581A5;"><a href="/team5/openspace/consumer_list.do">내가 쓴 공지사항</A></td>
        </tr>
      </tbody>
    </table>
  </div>
</td>
<!-- 사이드 종료 -->
<!-- 본문 -->
<td  rowspan="2" style='width:85%; border-left: solid 1px #999999;'>
<div class="" style=" "> <!-- col-md-10 있던곳 -->
<div style="margin-left: 25px;">
  
  <div style="margin-bottom: 10px; padding-top: 15px;">
    <span style="font-size: 30px; font-weight:bold"> &nbsp;내가 쓴 공지사항</span>
  </div>
  <div style=" border: solid 1px #bbbbbb;" > <!-- 15개 -->
  <table class="table table-hover" style='margin-bottom: 0px;'>
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
  
  
  
    <thead style="background-color: #111923;">
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


   <c:forEach var="openspaceVO"  items="${list }" varStatus="info"> <!-- request 객체에 접근 -->
    <c:set var="openspace_no" value="${openspaceVO.openspace_no}" />
    <c:set var="title" value="${openspaceVO.openspace_title}" />
    <c:set var="content" value="${openspaceVO.openspace_content}" />
    <c:set var="division" value="${openspaceVO.openspace_division}" />
    <c:set var="cnt" value="${openspaceVO.openspace_cnt}" />
    <c:set var="seqno" value="${openspaceVO.openspace_seqno}" />
    <c:set var="visible" value="${openspaceVO.openspace_visible}" />
    <c:set var="rdate" value="${openspaceVO.openspace_rdate}" />
    <c:set var="redate" value="${openspaceVO.openspace_redate}" />
    <c:set var="consumer_nickname" value="${openspaceVO.consumer_nickname}" />
   
      <tr>
      
        <td style="text-align: center;">${seqno }</td>
        <td style="text-align: center;">${division }</td>
        
        <c:if test="${title.length()>21 }">
          <td class='${openspace_no } ' style="text-align: left;">
            <a class='QWER${info.count }' href="./read.do?openspace_no=${openspace_no}&search=${search }&word=${word}&nowPage=${nowPage}">${title.substring(0,21) }...</a>
          </td>
                          
        </c:if>
        <c:if test="${title.length()<=21 }">
          <td class='${openspace_no } ' style="text-align: left;">
            <a class='QWER${info.count }' href="./read.do?openspace_no=${openspace_no}&search=${search }&word=${word}&nowPage=${nowPage}">${title }</a>
          </td>                
        </c:if>
        <td style="text-align: center;">${consumer_nickname }</td>
        <td style="text-align: center;">${cnt}</td>
        <td style="text-align: center;">
        
         <c:choose>
          <c:when test="${visible == 'Y'}">
            <A href="./update_visible.do?openspace_no=${openspace_no }&openspace_visible=${visible }">Y</A>
          </c:when>
          <c:otherwise>
            <A href="./update_visible.do?openspace_no=${openspace_no }&openspace_visible=${visible }">N</A>
          </c:otherwise>
        </c:choose>
        
       </td>
        
        <td style="text-align: center;" >${rdate.substring(0,10) }</td>
        <td style="text-align: center;"><A href="./update.do?openspace_no=${openspace_no }&search=${param.search }&word=${param.word }&nowPage=${param.nowPage}">수정</A>      
        /
        <A href="./delete.do?openspace_no=${openspace_no }&search=${param.search }&word=${param.word }&nowPage=${param.nowPage}">삭제</A></td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
  
      <c:choose>
        <c:when test="${search_count ==0 }">
        <div style = "margin: 0px auto; text-align: center; margin-bottom: 20px;">
          <span style= "font-size: 20px;">쓴 글이 없어용</span><br>
          <A href='./list.do'>전체 목록</A>
        </div>
        </c:when>
     </c:choose> 
  </div> 
  <div style="margin: 0px auto; text-align: center;">
  <DIV class='bottom_menu'>${paging }</DIV>

  </div>




 </div> 
  
    </div>

</td>
</tr>
<!-- 본문 종료 -->

<!--  여백을 위한 tr -->
<tr>
<td>&nbsp;</td>
</tr>
<!-- tr 종료 -->
</table>
<!-- 테이블 종료 -->

</DIV>

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