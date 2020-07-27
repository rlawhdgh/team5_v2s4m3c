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
 <DIV style ="width: 80%; margin: 0px auto; padding: 30px 0px 50px 0px;">

      <DIV style = "position: relative;">
        <h3>권한정보</h3>
      </DIV>
      <div>
      <FORM name='frm_update' id='frm_update' method='POST' 
                action='./update.do'>
        <input type = "hidden" name='grade_no' id='grade_no' value='${gradeVO.grade_no }'><br>
        <label>권한 번호</label>: ${gradeVO.grade_no }&nbsp;<br>
        <label>권한 이름</label>: &nbsp; 
        <input name='grade_name' id='grade_name' value='${gradeVO.grade_name }'>
       
        <DIV style = "position: relative; min-height: 20px;">
          <button type ="submit" class="btn btn-default pull-right">수정</button>
        </DIV>
      </FORM>
      </div>


 </DIV>
  


  
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 