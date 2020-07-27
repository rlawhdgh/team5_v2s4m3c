<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title> </title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
</script> 
</head> 
<body>
<jsp:include page="/menu/top3.jsp" flush='false' />
    <FORM name='frm_create' id='frm_create' method='POST' 
                action='./create.do'>
<DIV class='menu_line' style='clear: both;'></DIV>
</form>
  <div style='width: 100%;'>
    <table class="table table-borderless table-dark" style='width: 100%;'>
      <colgroup>
        <col style="width: 10%;"></col>
        <col style="width: 35%;"></col>
        <col style="width: 35%;"></col>
        <col style="width: 20%;"></col>


      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr> 
        <th style='text-align: center;'>결과번호</th>
          <th style='text-align: center;'>질문</th>
          <th style='text-align: center;'>질문번호</th>
          <th style='text-align: center;'>투표수</th>

        </tr>
      
      </thead>
     <tbody>
        <c:forEach var="resultVO" items="${list }">
          <c:set var="resultno" value="${resultVO.resultno }" />
          
          <tr> 
           <td style='text-align: center;'>${resultVO.resultno}</td>
                       <td style='text-align: center;'>${saveVO.item1}<br>${saveVO.item2}<br>${saveVO.item3} </td>

            <td style='text-align: center;'>${resultVO.item1no}<br>${resultVO.item2no}<br>${resultVO.item3no}</td>
            <td style='text-align: center;'>${resultVO.count} </td> 
          <!--   <td style='text-align: center;'>${contentsVO.memberno}</td> -->
          
            </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
    
 