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
function vote (makeno) {
  
  var params = 'makeno=' + makeno;
  alert(params);
  $.ajax({
    url: '/team5/save/survey_create2.do',
    type: 'post',  // post
    cache: false, // 응답 결과 임시 저장 취소
    async: true,  // true: 비동기 통신
    dataType: 'json', // 응답 형식: json, html, xml...
    data: params,      // 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
       alert(rdata);
      var msg = "";
      
      if (rdata.cnt == 1) { // 패스워드 일치
        var sw = confirm(" 투표가 등록되었습니다. ")
        if( sw == true) {
          location.href="http://localhost:9090/team5/result/list.do";
        } else {
          location.reload();
        }
      }
    },
    error: function(request, status, error) { // callback 함수
      var msg = 'ERROR request.status: '+request.status + '/ ' + error;
      console.log(msg);
    }
  });
  
}

  
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
    <A href='./pollList.do?survey_cateno=${survey_cateno }'>목록</A>
    <span class='menu_divide' > | </span>
    <A href='./survey_update.do?survey_cateno=${survey_cateno }&makeno=${saveVO.makeno}'>수정</A>
    
    <span class='menu_divide' > | </span> 
    <A href='./survey_delete.do?survey_cateno=${survey_cateno }&makeno=${saveVO.makeno}'>삭제</A>
    
  </ASIDE> 
  
  <div class='menu_line'></div>

      <input type="hidden" name="makeno" value="${makeno}">
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span>${saveVO.question}</span>
          <%--   (<span>${survey_contentsVO.recom}</span>) --%>
            <span>${saveVO.wdate.substring(0, 16)}</span>
          </li>
         
          <li class="li_none">
           <DIV style='text-decoration: none;'>
          <DIV><input type="radio" name=item1 value="item1" > ${saveVO.item1 }</DIV>
          <DIV><input type="radio" name=item2 value="item2" > ${saveVO.item2 }</DIV>
          <DIV><input type="radio" name=item3 value="item3" > ${saveVO.item3 }</DIV>
</DIV>
          </li>
           <li class="li_none">
            <DIV style='text-decoration: none;'>
              검색어(키워드): ${saveVO.word }
                     
            </DIV>
          </li>
          
        </ul>
      </fieldset>
     <FORM name='frm' id='frm' class='form-horizontal'>
     <input type="hidden" name="makeno" id="makeno" value="${param.makeno }">
      <div style="background-color: #ff000; text-align: right;">
      
        <button type="button" onclick="vote(${param.makeno} )" >투표
        </button>
</DIV>


</FORM>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
 

