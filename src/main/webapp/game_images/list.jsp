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
  function delete_file(game_imagesno) {
    var sw = confirm("파일을 삭제 하시겠습니까?");
    if (sw == true) {
      location.href="./delete.do?game_imagesno=" + game_imagesno;
    } else {
      alert('파일 삭제를 취소합니다.');
    }
  }
</script>

<style type="text/css">
.table-hover > tbody > tr:hover {
  background-color: #364252;
}
</style>
 
</head>
 
<body>
<jsp:include page="/menu/top3.jsp" flush='false' />
  <DIV class='title_line'>
    전체 첨부 파일
  </DIV>

  <ASIDE style='float: left;'>
    <A href='./list_all.do'>모든 이미지 파일</A>
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span>
    <A href="../game/read1.do?game_gameno=${param.game_gameno }">목록</A>

  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
  
  <div style='width: 100%;'>
       <table class="table table-hover" style='margin-bottom: 0px;'>
      <colgroup>
        <col style="width: 10%;"></col>
        <col style="width: 5%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 15%;"></col>        
        <col style="width: 15%;"></col>
        <col style="width: 15%;"></col>
        
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>자식NO</th>
          <th style='text-align: center;'>부모NO</th>
          <th style='text-align: center;'>파일</th>
          <th style='text-align: center;'>원본<br>파일명</th>
          <th style='text-align: center;'>저장<br>파일명</th>
          <th style='text-align: center;'>Preview<br>파일명</th>
          <th style='text-align: center;'>등록일</th>
          <th style='text-align: center;'>기타</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="game_imagesVO" items="${list }">
          <c:set var="game_gameno" value="${game_imagesVO.game_gameno }" />
          <c:set var="game_fname" value="${game_imagesVO.game_fname.toLowerCase() }" />
          
          <tr> 
            <td style='vertical-align: middle; text-align: center;'>${game_imagesVO.game_imagesno }</td>
            <td style='vertical-align: middle; text-align: center;'>${game_gameno }</td>
            <td style='vertical-align: middle; text-align: center;'>
              <c:choose>
                <c:when test="${game_fname.endsWith('jpg') || game_fname.endsWith('png') || game_fname.endsWith('gif')}">
                  <IMG src="./storage/${game_imagesVO.game_thumb }"> 
                </c:when>
                <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                  ${game_imagesVO.game_fname}
                </c:otherwise>
              </c:choose>
            </td> 
            <td style='text-align: center; vertical-align: middle;'>${game_imagesVO.game_fname}</td>
            <td style='text-align: center; vertical-align: middle;'>${game_imagesVO.game_fupname}</td>
            <td style='text-align: center; vertical-align: middle;'>${game_imagesVO.game_thumb}</td>
            <td style='text-align: center; vertical-align: middle;'>${game_imagesVO.images_rdate.substring(0, 10)}</td>
            <td style='text-align: center; vertical-align: middle;'>
              <a href="javascript:delete_file(${game_imagesVO.game_imagesno})"><img src="./images/delete.png" title="삭제"  border='0' /></a>
            </td>
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
  