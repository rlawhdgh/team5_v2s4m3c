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
  function delete_file(openspace_no) {
    var sw = confirm("모든 파일을삭제 하시겠습니까?");
    if (sw == true) {
      alert("파일이 정상적으로 삭제되었습니다.")
      location.href="../openspace_img/delete_all.do?openspace_no=" + openspace_no;
    } else {
      alert('파일 삭제를 취소합니다.');
    }
  }
</script>

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
      + "' style='width: 100%; height:440px;'>";
  tag += "</A>";


  $('#attachfile_panel').html(tag); // 문자열을 태그로 적용
  $('#attachfile_panel').show();    //패널 출력
}


</script>


<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  captionText.innerHTML = dots[slideIndex-1].alt;
}
</script>


<style>
body {
  font-family: Arial;
  margin: 0;
}

* {
  box-sizing: border-box;
}

img {
  vertical-align: middle;
}

/* Position the image container (needed to position the left and right arrows) */
.container {
  position: relative;
}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Add a pointer when hovering over the thumbnail images */
.cursor {
  cursor: pointer;
}

/* Next & previous buttons */
.prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 40%;
  width: auto;
  padding: 16px;
  margin-top: -50px;
  color: white;
  font-weight: bold;
  font-size: 20px;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover,
.next:hover {
  background-color: rgba(0, 0, 0, 0.8);
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* Container for image text */
.caption-container {
  text-align: center;
  background-color: #222;
  padding: 2px 16px;
  color: white;
}

.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Six columns side by side */
.column {
  float: left;
  width: 16.66%;
}

/* Add a transparency effect for thumnbail images */
.demo {
  opacity: 0.6;
}

.active,
.demo:hover {
  opacity: 1;
}
</style>



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
       <!-- <c:if test="${size >0 }">
        <a href="javascript:delete_file(${openspace_no}, )">파일삭제</a>
        /
        </c:if> -->
        <a href ='../openspace_img/create.do?openspace_no=${openspace_no }'> 파일등록</a>
        /
        <a href="./list.do?search=${param.search }&word=${param.word }&nowPage=${param.nowPage}">목록</a>        
        /
        <A href="./update.do?openspace_no=${openspace_no }&search=${param.search }&word=${param.word }&nowPage=${param.nowPage}">수정</A>
        /
        <A href="./delete.do?openspace_no=${openspace_no }&search=${param.search }&word=${param.word }&nowPage=${param.nowPage}">삭제</A>       
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
<c:if test="${size >0}">
<div style='float: left; height: 100px; width: 10%; border-bottom: solid 1px #999999; text-align: center;' >
<div style='margin-top: 38px; font-weight: bold;'>첨부파일</div>
</div>
<div style='height: 100px; overflow:auto; width: 90%; border-bottom: solid 1px #999999;'>
          <table style="width: 100%; ">            
              <c:if test="${size ==0}">
              <td>첨부된 파일이 없습니다.</td>
              </c:if>
                 <c:forEach var="img"  items="${list }"> <!-- request 객체에 접근 -->
                 
                  <c:set var="name" value="${img.openspace_img_fupname}" />    
                  <tr><td>${name }</td></tr>
                  </c:forEach>
          </table>
</div>
</c:if>
<c:if test="${size ==0}">
<div style='float: left;  width: 10%; border-bottom: solid 1px #999999; text-align: center;' >
<div style='font-weight: bold;'>첨부파일</div>
</div>
<div style=' border-bottom: solid 1px #999999; width: 100%;'>
첨부된 파일이 없습니다.
</div>
</c:if>


          
          
  <div class="col-md-12" style=" margin-top: 16px; margin-bottom: 50px;">
    <c:if test="${youtube.length() > 0 }">
      <div style="margin:50px; position: relative; height:0; padding-bottom: 56.25%;" class='AA'>
         ${youtube}
      </div>
    </c:if>  
                
        
<div class="container" style='width: 80%; margin: 0px auto;'>
<c:forEach var="img" items="${list }" varStatus="info">
  <div class="mySlides" style='width: 100%; height: 300px; border: solid;'>
    <div class="numbertext">1 / ${info.count }</div>
    <img src='../openspace_img/storage/${img.openspace_img_fname }' style='height: 300px; width:100%;' >
  </div>
  </c:forEach>
  
  <a class="prev" onclick="plusSlides(-1)">❮</a>
  <a class="next" onclick="plusSlides(1)">❯</a>


</div>
 
       
       
       <c:if test="${size>0 }">
           <div style='margin: 0px auto; width: 91%; border: solid; overflow:auto;'>    
<table>
            <c:forEach var="img" items="${list }" varStatus="info">
              <c:set var="thumb" value="${img.openspace_img_thumb.toLowerCase() }" />
              <c:choose>
                <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                  <td>
                  <A onclick="currentSlide(${info.count })">
                  <IMG  src='../openspace_img/storage/${img.openspace_img_thumb }' style='margin-top: 2px; margin-left: 1.1px;'>
                  </A>
                  </td>
                </c:when>
              </c:choose>
            </c:forEach>            
</table>
          </div>
</c:if>
<!-- 내용 출력 -->
<div style='margin-top: 30px; margin-left:50px; margin-right:50px; '>
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