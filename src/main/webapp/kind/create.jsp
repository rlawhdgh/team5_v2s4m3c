<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
  $(function(){
 
  });
</script>
 
 <style type="text/css">
.table-hover > tbody > tr:hover {
  background-color: #364252;
}
</style>
 
</head> 
 
<body>
<jsp:include page="/menu/top3.jsp" flush='false' />
 
<DIV class=''>게임 카테고리 등록</DIV>

  <ASIDE style='float: right;'>
    <A href='./list.do?kind_kindno'>목록</A>
  </ASIDE> 
 
<FORM name='frm' method='POST' action='./create.do' class="form-horizontal">
  <input type='hidden' name='consumer_no' id='consumer_no' value='${sessionScope.consumer_no }'>
  <div class="form-group">
     <label class="control-label col-md-3">게임 장르</label>
     <div class="col-md-9">
       <input type='text' name='kind_kindname' value='' required="required" 
                  autofocus="autofocus"style='width: 50%;'>
     </div>
  </div>
  <div class="form-group">
     <label class="control-label col-md-3">출력 순서</label>
     <div class="col-md-9">
       <input type='number' name='kind_kindseqno' value='1' required="required" 
                 placeholder="${kind_kindseqno }" min="1" max="1000" step="1" 
                 style='width: 30%;'>
  <div style="padding-right: 20%;">
    <div class='pull-right '>
    <button type="submit" class="btn">등록</button>
    <button type="button" onclick="location.href='./list.do'" class="btn">목록</button>
    </div>
  </div>
     </div>
  </div>  


</FORM>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>   
 