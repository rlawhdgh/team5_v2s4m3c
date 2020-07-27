<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>공지사항 수정</title>
<link href="/team5/css/style.css" rel='Stylesheet' type='text/css'>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>

<script type="text/javascript">
function delete_file(openspace_img_no, openspace_no, search, word, nowPage) {
  if(word==""){
    var word="";
  }
  if(search==true){
    var search ="title";
  }
  var sw = confirm("첨부파일을 삭제 하시겠습니까?");
  if (sw == true) {
    alert("파일이 정상적으로 삭제되었습니다.")
    location.href="../openspace_img/delete.do?openspace_img_no=" + openspace_img_no+"&openspace_no="+openspace_no+"&search="+search+"&word="+word+"&nowPage="+nowPage;
  } else {
    alert('파일 삭제를 취소합니다.');
  }
}



  $(function () {
    CKEDITOR.replace('openspace_content');  // <TEXTAREA>태그 id 값
  });
</script>

<script>
window.onload = function() {
  document.getElementById('btn_send').onclick=send1;  
  document.getElementById('frm').onsubmit=send1
}
function send1() {
  if(frm.openspace_title.value.trim().length <=1){
    alert('제목을 입력해 주세요')
    frm.openspace_title.focus();
    return false//실행 중지
  }

  frm.submit();  
}
</script>

</head>
<body>
  <div class="row">
    <jsp:include page="/menu/top3.jsp" flush='false' />
    <DIV style='width: 100%; margin: 0px auto;'>
     <!-- 사이드 매뉴  -->
    <jsp:include page="./side.jsp" flush="false" />
      <div class="col-md-10" style="border-left: solid 1px #bbbbbb;">
        <div style="font-size: 30px; font-weight: bold; margin-left: 40px; margin-bottom: 10px;">
          공지사항 수정 &nbsp;</div>
        <form name='frm' method="post" action="./update.do">
          <input type='hidden' name='admin_no' id='admin_no' value='1'>
          <input type='hidden' name='openspace_no' id='openspace_no' value='${openspaceVO.openspace_no }'>
          <input type='hidden' name='word' id='word' value='${param.word }'>
          <input type='hidden' name='search' id='search' value='${param.search }'>
          <input type='hidden' name='nowPage' id='nowPage' value='${param.nowPage }'>
          <div style=" width: 95%; margin: 0px auto;">
            <div style="width: 98%; margin: 20px auto; border: solid 1px #999999;">
              <div style="margin-left: 35px; margin-top: 25px;">
                <div style="margin-left: 30px;">
                  <br>
                  <div>
                    <span style="font-weight: bold;">제목 &nbsp;</span> <input
                      type='text' style="width: 70%;"
                      name='openspace_title' value="${openspaceVO.openspace_title }">
                  </div>
                  <br>
                  <div>
                    <span style="font-weight: bold;">순서 &nbsp;</span> 
                    <input type="number" style="width: 20%;" name='openspace_seqno' value="${openspaceVO.openspace_seqno }">
                  </div>                  
                  <br>
                  <div>
                    <span style="font-weight: bold;">구분 &nbsp;</span> <select
                      name='openspace_division'
                      style="height: 26px; width: 20%;">
                      <option value='공지' ${openspaceVO.openspace_division == '공지' ? "selected='selected'" : "" }>&nbsp;&nbsp;공지</option>
                      <option value='업데이트' ${openspaceVO.openspace_division == '업데이트' ? "selected='selected'" : "" }>&nbsp;&nbsp;업데이트</option>
                    </select>
                  </div>
                  <br>
                  <div>
                    <span style="font-weight: bold;">출력 &nbsp;</span> <select
                      name='openspace_visible'
                      style="height: 26px; width: 6%;">
                      <option value='Y' ${openspaceVO.openspace_visible == 'Y' ? "selected='selected'" : "" }>&nbsp;&nbsp;Y</option>
                      <option value='N' ${openspaceVO.openspace_visible == 'N' ? "selected='selected'" : "" }>&nbsp;&nbsp;N</option>
                    
                    </select>
                  </div>
                  <br>
                  <div style='width: 80%; margin-left: 43px;'>
                    <textarea rows="10" name='openspace_content' id='openspace_content' style="width: 70%; height: 200px; margin-left: 13px;">${openspaceVO.openspace_content }</textarea>
                  </div>
                  
                                     <div style='margin-top: 20px;' >
                   <span style="font-weight: bold;">Youtube &nbsp;</span> 
                   <input type='text' style="width: 70%;" name='openspace_youtube' value='${youtube }'>
                       <button style='margin: 0px; padding: 0px;' type="button" class="btn btn-default" data-toggle="collapse" data-target="#demo">이용 방법</button>
                      
                      <div class="container" style='width: 80%; margin: 0px; margin-left: 63px;'>
                      
  <div id="demo" class="collapse" style='width: 90%; border: solid 1px #999999; '>
    복사된 소스코드를 붙여주세요.<br>
    예시 코드: &lt;iframe width="894" height="559" src="https://www.youtube.com/embed/PfNVjq96_O8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>&lt;/iframe&gt;

    <img style='width: 100%' src="./images/025.jpg">

  </div>
</div>
                      
                      
                  </div>
                  
                  
                  
                  
                  
                  <br>
<c:if test="${size>0 }">                  
                 <span style='margin-left: 43px;'> 이미지를 클릭하면 <span style='font-weight: bold; color: #ff0000;'>삭제</span>됩니다.</span>
             <div style='border: solid; width: 80%; margin-left: 43px;'>
             <c:forEach var="img" items="${list }"  varStatus="info">
              <c:set var="thumb" value="${img.openspace_img_thumb.toLowerCase() }" />


              <c:choose>
                <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
<a href="javascript:delete_file(${img.openspace_img_no }, ${img.openspace_no }, ${param.search != '' }, ${param.word != '' }, ${param.nowPage })">
                  <IMG style='margin: 3px;' src='../openspace_img/storage/${img.openspace_img_thumb }' style='margin-top: 2px;'>
</a>
                </c:when>
              </c:choose>
            </c:forEach>
                
                </div>
  </c:if>              
                
                
                
                </div>
                <br>
                
           
                <div style="margin: 10px auto; text-align: center; margin-bottom: 30px;">
                  <button type="submit" id='btn_send'>수정</button>
                  <button type="button" onclick="location.href='./read.do?openspace_no=${openspaceVO.openspace_no}&search=${param.search }&word=${param.word }&nowPage=${param.nowPage }'">취소</button>
                  <!-- &search=title&word=&nowPage=4 -->
                </div>
              </div>
            </div>
          </div>
        </form>
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