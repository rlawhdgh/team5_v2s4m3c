<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>언젠간 만들겠지</title>
<link href="/team5/css/style.css" rel='Stylesheet' type='text/css'>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">


window.onload = function(){
  var html = document.querySelector('.AA').innerHTML;
  document.querySelector('.AA').innerHTML =
      html.replace(/(\<iframe)/g, '<iframe style="position: absolute; width:100%; height:100%;"') 

}

// 이미지 클릭시 원본파일 출력
function panel_img(file) {
  var tag = "";

  tag += "<A href=\"javascript: $('#attachfile_panel').hide();\">";
  tag += "  <IMG src='../openspace_img/storage/" + file
      + "' style='width: 100%; height:400px;'>";
  tag += "</A>";


  $('#attachfile_panel').html(tag); // 문자열을 태그로 적용
  $('#attachfile_panel').show();    //패널 출력
}


</script>

</head>
<body>

  <c:set var="openspace_no" value="${openspaceVO.openspace_no}" />
  <c:set var="title" value="${openspaceVO.openspace_title}" />
  <c:set var="content" value="${openspaceVO.openspace_content}" />
  <c:set var="division" value="${openspaceVO.openspace_division}" />
  <c:set var="cnt" value="${openspaceVO.openspace_cnt}" />
  <c:set var="seqno" value="${openspaceVO.openspace_seqno}" />
  <c:set var="visible" value="${openspaceVO.openspace_visible}" />
  <c:set var="youtube" value="${openspaceVO.openspace_youtube}" />
  <c:set var="rdate" value="${openspaceVO.openspace_rdate}" />
  <c:set var="redate" value="${openspaceVO.openspace_redate}" />

  <div class="row">
    <jsp:include page="/menu/top3.jsp" flush='false' />
    <DIV style='width: 100%; margin: 0px auto; '>
      <jsp:include page="./side.jsp" flush="false" />
      <div class="col-md-10"
        style="border-left: solid 1px #bbbbbb;">
        <div style="text-align: right;">
        <a href ='../openspace_img/delete_all.do?openspace_no=${openspace_no }&openspace_img_no=${openspace_no_img }'> 파일삭제x</a>
        /
        <a href ='../openspace_img/create.do?openspace_no=${openspace_no }'> 파일등록</a>
        /
        <a href="./list.do?search=${param.search }&word=${param.word }&nowPage=${param.nowPage}">목록</a>        
        /
        <A href="./update.do?openspace_no=${openspace_no }">수정</A>
        /
        <A href="./delete.do?openspace_no=${openspace_no }">삭제</A>
        </div>
        <div>
          <table
            style="width: 100%; border-bottom: solid 1px #bbbbbb; margin-bottom: 4px; border-top: solid 2px #000088;">
            <colgroup>
              <col style='width: 10%;' />
              <col style='width: 75%;' />
              <col style='width: 15%;' />
            </colgroup>
            <tr>
              <td style="text-align: center; font-size: 21px; font-weight: bold;">제목</td>
              <td style="font-size: 21px; font-weight: bold;">《${division}》 ${title}</td>
              <td style="text-align: right; padding-top: 7px;">조회수: 
                ${cnt+1 }&nbsp;&nbsp;</td>
            </tr>
          </table>
        </div>
        <div>
          <table
            style="width: 100%; border-bottom: solid 1px #999999; margin: 4px 0px;">
            <colgroup>
              <col style='width: 10%;' />
              <col style='width: 45%;' />
              <col style='width: 22%;' />
              <col style='width: 23%;' />
            </colgroup>
            <tr>
              <td style="text-align: center; font-weight: bold;">작성자</td>
              <td>회원테이블 없음</td>
              <td style="text-align: right;">등록일: ${rdate }</td>
              <td style="text-align: right;">수정일: ${redate }&nbsp;&nbsp;</td>
            </tr>
          </table>
        </div>
        <div>
        <div style="width:100%;  border-bottom: solid 1px #999999;">
          <table style="width: 100%; height: 50px;">
             <colgroup>
              <col style='width: 10%;' />
              <col style='width: 90%;' />
            </colgroup>
              <td style="font-weight: bold; text-align: center;" rowspan="${size+1 }">첨부파일</td>              
              <c:if test="${size ==0}">
              <td>첨부된 파일이 없습니다.</td>
              </c:if>
                 <c:forEach var="img"  items="${list }"> <!-- request 객체에 접근 -->
                 
                  <c:set var="name" value="${img.openspace_img_fupname}" />    
                  <tr><td>${name }</td></tr>
                  </c:forEach>
          </table>
       </div>
</div>
          
          
  <div class="col-md-12" style=" margin-top: 16px; margin-bottom: 50px;">
    <c:if test="${youtube.length() > 0 }">
      <div style="margin:50px; position: relative; height:0; padding-bottom: 56.25%;" class='AA'>
         ${youtube}
      </div>
    </c:if>  
                
            <!-- 원본 이미지 출력 -->      
       <DIV id='attachfile_panel' style="width: 80%;  margin: 0px auto;" >
            <c:forEach var="img" items="${list }" varStatus="info">
              <c:set var="thumb" value="${img.openspace_img_thumb.toLowerCase() }" />

              <c:choose>
                <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                <c:if test="${info.count == 1 }">
                  <IMG src='../openspace_img/storage/${img.openspace_img_fname }' style='width: 100%; height:400px;'>
                </c:if>
                </c:when>
              </c:choose>
            </c:forEach> 
            

       
       
       </DIV > 
       <c:if test="${size>0 }">
           <div style='margin: 0px auto; width: 80%; border: solid; overflow:auto;'>    
<table>
            <c:forEach var="img" items="${list }" varStatus="info">
              <c:set var="thumb" value="${img.openspace_img_thumb.toLowerCase() }" />
              <c:choose>
                <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                  <td>
                  <A href="javascript:panel_img('${img.openspace_img_fname }')">
                  <IMG src='../openspace_img/storage/${img.openspace_img_thumb }' style='margin-top: 2px; margin-left: 1.1px;'>
                  </A>
                  </td>
                </c:when>
              </c:choose>
            </c:forEach>            
</table>
          </div>
</c:if>
<!-- 내용 출력 -->
<div style='margin-top: 30px; margin-left: 10px; '>
    ${content }
</div>

          </div>
      </div>
      
      <div class='col-md-2'>
      </div>
      <div class='col-md-10' style='padding:10px 10px; border-left: solid 1px #bbbbbb;'>
      <div style='border-top: solid 1px #999999; border-bottom: solid 1px #999999; padding: 15px 0px;'>
       <c:choose>
        <c:when test="${a.next_no ==0 }">
        <div>
          <span style='font-weight: bold; margin-left: 10px;'><img src="./images/page_up.png" style='margin-bottom: 5px;'>  다음글</span>&nbsp;&nbsp; 다음글이 없습니다.<br>
        </div>
        </c:when>
        <c:otherwise>
        <div style='height: 25px;'>
        <span style='font-weight: bold; margin-left: 10px;'><img src="./images/page_up.png" style='margin-bottom: 5px;'>  다음글</span>&nbsp;&nbsp; 
        <a href="./read.do?openspace_no=${a.next_no}">[${a.next_division}] ${a.next_title }</a><br>
        </div>
        </c:otherwise>
      </c:choose>
      <c:choose>
        <c:when test="${a.pre_no ==0 }">
        <div>
          <span style='font-weight: bold; margin-left: 10px;'><img src="./images/page_down.png" style='margin-bottom: 5px;'>  이전글</span>&nbsp;&nbsp; 이전글이 없습니다.<br>
        </div>
        </c:when>
        <c:otherwise>
        <div>
        <span style='font-weight: bold; margin-left: 10px;'><img src="./images/page_down.png" style='margin-bottom: 5px;'>  이전글</span>&nbsp;&nbsp; <a href="./read.do?openspace_no=${a.pre_no}">[${a.pre_division}] ${a.pre_title }</a>
        </div>
        </c:otherwise>
      </c:choose>      
     </div>
     </div>
    </DIV>
  </div>
  <DIV style='margin: 0px auto; width: 90%;'>
    <DIV style='float: left; width: 50%;'></DIV>
    <DIV style='float: left; width: 50%;'></DIV>
  </DIV>

  <DIV style='width: 94.8%; margin: 0px auto;'></DIV>

  <jsp:include page="/menu/bottom.jsp" flush='false' />

</body>
</html>