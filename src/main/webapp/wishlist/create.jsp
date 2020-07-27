<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>team5</title>
 
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
 
</head> 
 
<body>
<jsp:include page="/menu/top3.jsp" flush='false' />
 
<DIV class='title_line'>위시리스트 등록</DIV>
 
<FORM name='frm' method='POST' action='./create.do' class="form-horizontal">
  <!-- categrp 테이블로부터 값을 전달받지 못한 경우는 값을 직접 지정하여 개발 -->
  <input type="hidden" name="consumer_no" value="${sessionScope.consumer_no} ">
  
  <div class="form-group">
     <label class="control-label col-md-3">상품번호</label>
     <div class="col-md-9">
       <input type='text' name='game_gameno' value='${game_gameno}' required="required" 
                  autofocus="autofocus" class="form-control" style='width: 50%;'>
     </div>
  </div>
  
   
  <div class="form-group">
     <label class="control-label col-md-3">위시리스트 출력 순서</label>
     <div class="col-md-9">
       <input type='number' name='wishlist_seqno' value='1' required="required" 
                 placeholder="${wishlist_seqno }" min="1" max="1000" step="1" 
                 style='width: 30%;' class="form-control" >
     </div>
  </div>  
  
  

  <div class="content_bottom_menu" style="padding-right: 20%;">
    <button type="submit" class="btn">등록</button>
    <button type="button" onclick="location.href='./list_all.do'" class="btn">목록</button>
  </div>

</FORM>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>   
 