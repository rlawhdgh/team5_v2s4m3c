  <%@ page contentType="text/html; charset=UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>언젠간 만들겠지</title>
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>

  $(document).ready(function(){

function commentList(){
var openspace_no = ${openspace_no};
    $.ajax({
        url : '/openspace_reply/list.do',
        type : 'get',
        data : openspace_no,
        success : function(data){
            var a =''; 
            $.each(data, function(key, value){ 
                a += "ads";

            });
            
            $(".commentList").html(a);
        }
    });
}
});
</script>

 
    
    
</head>
<body>
<!-- 메인 게임 사진 -->
 <div class="row"> 
<jsp:include page="/menu/top3.jsp" flush='false' />
  <DIV style='width: 100%; margin: 30px auto;'>



         <div>
          <ul class='reply_ul' id='reply_ul'>
          <c:forEach var="reply"  items="${reply }" varStatus="info">
            <c:set var="openspace_reply_no" value="${reply.openspace_reply_no}" />
            <c:set var="openspace_no" value="${reply.openspace_no}" />
            <c:set var="consumer_no" value="${reply.consumer_no}" />
            <c:set var="openspace_reply_content" value="${reply.openspace_reply_content}" />
            <c:set var="openspace_reply_date" value="${reply.openspace_reply_date}" />
            <c:set var="consumer_nickname" value="${reply.consumer_nickname}" />   
            
            
        <c:if test="${info.count<=5 }">  
          <li>          
          <div>
          <p><span>${consumer_nickname}</span> <span style='margin-left: 30px; '>${openspace_reply_date.substring(0,10) }</span> 
         <c:if test="${consumer_no==sessionScope.consumer_no}">
          <span class='pull-right'>
          <a href='javascript:replyupdate(${info.count }, "${openspace_reply_content }", ${openspace_reply_no })'>수정</a>
          /
          <a href ='/team5/openspace_reply/delete.do?openspace_reply_no=${openspace_reply_no }&search=${param.search }&word=${param.word}&nowPage=${param.nowPage}&openspace_no=${param.openspace_no}' >삭제</a>
          </span>
          </c:if>
          </p>
          
          
        <form name='frm' method="post" action="/team5/openspace_reply/update.do">    
          <input type='hidden' name='word' id='word' value='${param.word }'>
          <input type='hidden' name='search' id='search' value='${param.search }'>
          <input type='hidden' name='nowPage' id='nowPage' value='${param.nowPage }'>   
            
          <input type='hidden' name='openspace_no' id='openspace_no' value='${openspace_no }'>
          <input type='hidden' name='consumer_no' id='consumer_no' value='${sessionScope.consumer_no}'> 

          <div id ='reply_panel${info.count}' style="width: 100%; margin: 0px auto;">
          
<!--               <textarea style='background-color:#111923; width: 100%; height: 200px;' rows="10" cols="30"></textarea>
              <div class='pull-right' style="margin-right: 20px; margin-bottom: 15px;">
              <button style='padding: 7px;' type="submit">등록</button> <button style='padding: 7px;' type="button" onclick='javascript:noreplyupdate(content)'>취소</button> 
              </div>   -->
              
              ${openspace_reply_content }
          </div>
          </form>
          </div> 
          </li>   
        </c:if>
        <c:if test="${info.count != reply_size}">
        <c:if test="${info.count==5}">
        
        <c:set var="remainder" value="${reply_size - info.count }" />
        <button style='width: 100%; height: 40px; font-size: 30px;' onclick="myFunction(1.0, ${remainder})" id="myBtn1.0">더보기 ▼</button>
        
        </c:if>
        </c:if>
         <c:if test="${info.count >5 }">  
          <li id='more${info.count }' style='display: none'>          
          <div>
          <p><span>${consumer_nickname}</span> <span style='margin-left: 30px; '>${openspace_reply_date.substring(0,10) }</span> 
         <c:if test="${consumer_no==sessionScope.consumer_no}">
          <span class='pull-right'>
          <a href='javascript:replyupdate(${info.count }, "${openspace_reply_content }", ${openspace_reply_no })'>수정</a>
          /
          <a href ='/team5/openspace_reply/delete.do?openspace_reply_no=${openspace_reply_no }&search=${param.search }&word=${param.word}&nowPage=${param.nowPage}&openspace_no=${param.openspace_no}' >삭제</a>
          </span>
          </c:if>
          </p>

        <form name='frm' method="post" action="/team5/openspace_reply/update.do">    
          <input type='hidden' name='word' id='word' value='${param.word }'>
          <input type='hidden' name='search' id='search' value='${param.search }'>
          <input type='hidden' name='nowPage' id='nowPage' value='${param.nowPage }'>         
          <input type='hidden' name='openspace_no' id='openspace_no' value='${openspace_no }'>
          <input type='hidden' name='consumer_no' id='consumer_no' value='${sessionScope.consumer_no}'> 


          <div id ='reply_panel${info.count}' style="width: 100%; margin: 0px auto;">
          
<!--               <textarea style='background-color:#111923; width: 100%; height: 200px;' rows="10" cols="30"></textarea>
              <div class='pull-right' style="margin-right: 20px; margin-bottom: 15px;">
              <button style='padding: 7px;' type="submit">등록</button> <button style='padding: 7px;' type="button" onclick='javascript:noreplyupdate(content)'>취소</button> 
              </div>   -->
              
              ${openspace_reply_content }
          </div>
          </form>
          </div>          
          </li>
          

 <c:set var="remainder" value="${reply_size - info.count }" />   
        <c:if test="${info.count%5==0}">    
        <button style=' display: none; width: 100%; height: 40px; font-size: 30px;' onclick="myFunction(${info.count/5}, ${remainder })" id="myBtn${info.count/5}">더보기 ▼</button>
        </c:if>        
           </c:if>               
          </c:forEach>             
          </ul>
          <div style='height: 20px; border-bottom:1px solid #e3e3e3; text-align: center; '>
          
          </div>




 </DIV>
  </div>
  <DIV style='margin: 0px auto; width: 90%;'>
    <DIV style='float: left; width: 50%;'>
     </DIV>
     <DIV style='float: left; width: 50%;'>
    </DIV>  
  </DIV>
 
  <DIV style='width: 94.8%; margin: 0px auto;'>
  </DIV>  
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
 
</body>
</html>
