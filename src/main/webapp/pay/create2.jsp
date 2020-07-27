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
 
<DIV class='title_line'>결제 등록</DIV>
 
<FORM name='frm' method='POST' action='./create.do' class="form-horizontal">
  <!-- categrp 테이블로부터 값을 전달받지 못한 경우는 값을 직접 지정하여 개발 -->
  <div class="form-group">
     <label class="control-label col-md-3">회원번호</label>
     <div class="col-md-9">
       <input type='text' name='consumer_no' value='${consumer_no}' required="required" 
                  autofocus="autofocus" class="form-control" style='width: 50%;'>
     </div>
     </div>
  
  <div class="form-group">
     <label class="control-label col-md-3">상품번호</label>
     <div class="col-md-9">
       <input type='text' name='list_contentsno' value='${list_contentsno}' required="required" 
                  autofocus="autofocus" class="form-control" style='width: 50%;'>
     </div>
     </div>
     
     
     
     <!-- <div class="form-group">
     <label class="control-label col-md-3">결제 종류</label>
     <div class="col-md-9">
        <select name='pay_kind' class="form-control" style='width: 20%;'>
          <option value='카드 결제'>카드 결제</option>
          <option value='모바일 결제'>모바일 결제</option>          
          <option value='계좌 이체'>계좌 이체</option>         
        </select>
     </div>   
     </div> -->
  
   
  <div class="content_bottom_menu" style="padding-right: 20%;">
    <button type="submit" class="btn">등록</button>
    <button type="button" onclick="location.href='./list_all.do'" class="btn">목록</button>
  </div>

</FORM>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>   
 