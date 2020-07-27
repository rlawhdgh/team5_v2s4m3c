<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Unique Games - 권한 수정</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
 
  
</script>
</head> 
 
<body>
<jsp:include page="/menu/top3.jsp" />
 <DIV class='title_line' id="title">마이페이지</DIV>
 <DIV style ="width: 80%; margin: 0px auto; ">

      <DIV style = "position: relative;">
        <h3>관리자정보</h3>
      </DIV>
      <div>
      <FORM name='frm_update' id='frm_update' method='POST' 
                action='./update.do'>
        <input type = "hidden" name='admin_no' id='admin_no' value='${adminVO.admin_no }'><br>
        <label>관리자 번호</label>: ${adminVO.admin_no }&nbsp;<br>
        <label>관리자 이름</label>: &nbsp; 
        <input name='admin_id' id='admin_id' value='${adminVO.admin_id }'><br>
        <label>관리자 패스워드</label>: &nbsp; 
        <input type = "password" name='admin_passwd' id='admin_passwd' value='${adminVO.admin_passwd }'>
       
        <DIV style = "position: relative; min-height: 20px;">
          <button type ="submit" class="btn btn-default pull-right">수정</button>
        </DIV>
      </FORM>
      </div>


 </DIV>
  


  
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 