<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Unique Games</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
 
</head> 
 
<body>
<jsp:include page="/menu/top3.jsp" flush='false' />
 
<DIV class='title_line'></DIV>
 
<FORM name='frm' method='POST' action='./create.do' class="form-horizontal">
  <div class="form-group" style="padding-top: 50px;">
     <label class="control-label col-md-3">관리자이름</label>
     <div class="col-md-9">
       <input type="text" name='admin_id' value='' required="required" 
                  autofocus="autofocus" class="form-control" style='width: 50%;'>
     </div>
  </div>
  <div class="form-group">
     <label class="control-label col-md-3">관리자비밀번호</label>
     <div class="col-md-9">
       <input type="password" name='admin_passwd' value='' required="required" 
                  autofocus="autofocus" class="form-control" style='width: 50%;'>
     </div>
  </div>   

  <div class="content_bottom_menu" style="text-align: center; margin-left: 150px;">
    <button type="submit" class="btn btn-default">등록</button>
    <button type="button" onclick="location.href='./list.do'" class="btn btn-default">목록</button>
  </div>
  <br><br>

</FORM>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>   
 