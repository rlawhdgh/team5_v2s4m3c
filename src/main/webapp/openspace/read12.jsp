<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>언젠간 만들겠지</title>
<link href="/team5/css/style.css" rel='Stylesheet' type='text/css'>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
  function delete_file(openspace_no) {
    var sw = confirm("모든 파일을삭제 하시겠습니까?");
    if (sw == true) {
      alert("파일이 정상적으로 삭제되었습니다.")
      location.href="../openspace_img/delete_all.do?openspace_no=" + openspace_no;
    } else {
      alert('파일 삭제를 취소합니다.');
    }
  }
  
  function noconsumer() {
    
    alert("로그인 후 사용해주세요.")
    document.getElementById('id01').style.display='block';
    
  }
  



</script>

<script type="text/javascript">
//분할 출력
function myFunction(no, remainder) {
// no : 버튼 번호
// remainder: 전체/5 ->나머지
  if(remainder >=5){ // 5개씩 출력
    var moreText1 = document.getElementById("more"+(no*5+1)); 
    var moreText2 = document.getElementById("more"+(no*5+2)); 
    var moreText3 = document.getElementById("more"+(no*5+3)); 
    var moreText4 = document.getElementById("more"+(no*5+4)); 
    var moreText5 = document.getElementById("more"+(no*5+5)); 
    moreText1.style.display = "block";
    moreText2.style.display = "block";
    moreText3.style.display = "block";
    moreText4.style.display = "block";
    moreText5.style.display = "block";
  } else if(remainder ==4){ // 남은 출력이 4개일경우
      var moreText1 = document.getElementById("more"+(no*5+1)); 
      var moreText2 = document.getElementById("more"+(no*5+2)); 
      var moreText3 = document.getElementById("more"+(no*5+3)); 
      var moreText4 = document.getElementById("more"+(no*5+4)); 
      moreText1.style.display = "block";
      moreText2.style.display = "block";
      moreText3.style.display = "block";
      moreText4.style.display = "block";
  } else if(remainder ==3){// 남은 출력이 3개일경우
      var moreText1 = document.getElementById("more"+(no*5+1)); 
      var moreText2 = document.getElementById("more"+(no*5+2)); 
      var moreText3 = document.getElementById("more"+(no*5+3)); 
      moreText1.style.display = "block";
      moreText2.style.display = "block";
      moreText3.style.display = "block";
  } else if(remainder==2){// 남은 출력이 2개일경우
      var moreText1 = document.getElementById("more"+(no*5+1)); 
      var moreText2 = document.getElementById("more"+(no*5+2)); 
      moreText1.style.display = "block";
      moreText2.style.display = "block";
  } else if(remainder==1){// 남은 출력이 1개일경우
      var moreText1 = document.getElementById("more"+(no*5+1)); 
      moreText1.style.display = "block";
  }
  var nextno= no+1    
  var myBtn = document.getElementById("myBtn"+no+".0");  //클릭시 버튼 숨기기
  var myBtnnext = document.getElementById("myBtn"+nextno+".0"); //클릭시 다음버튼 출력
  
  myBtn.style.display = "none";

  if(remainder != 5){ // 5개 모두 출력되지 않을때만 버튼 출력
    myBtnnext.style.display = "block";
  }
}




$(document).ready(function(){
  var html = document.querySelector('.AA').innerHTML;
  document.querySelector('.AA').innerHTML =
      html.replace(/(\<iframe)/g, '<iframe style="position: absolute; width:100%; height:100%;"')   
});

// 이미지 클릭시 원본파일 출력
function panel_img(file) {
  var tag = "";

  tag += "<A href=\"javascript: $('#attachfile_panel').hide();\">";
  tag += "  <IMG src='../openspace_img/storage/" + file
      + "' style='width: 100%; height:440px;'>";
  tag += "</A>";


  $('#attachfile_panel').html(tag); // 문자열을 태그로 적용
  $('#attachfile_panel').show();    //패널 출력
}

function replyupdate(no, content, pk) {
  var aa = "\""+content + "\"";
  var tag = "";
  tag += "<input type='hidden' name='openspace_reply_no' id='openspace_reply_no' value='"+pk+"'> "
  tag += "<textarea name='openspace_reply_content' id='openspace_reply_content'  style='background-color:#111923; width: 100%; height: 200px;' rows='10' cols='30'>"+content+"</textarea>";
  tag += "<div class='pull-right' style='margin-right: 20px;'>";
  tag += "<button style='padding: 7px;' type='submit'>등록</button> <button style='padding: 7px;' type='button' onclick='javascript:noreplyupdate("+no+","+aa+")'>취소</button> </div>";
  
  $('#reply_panel'+no).html(tag); // 문자열을 태그로 적용
  $('#reply_panel'+no).show();    //패널 출력
  
}

function noreplyupdate(no, content) {
  var tag = "";
  tag += content;

  $('#reply_panel'+no).html(tag); // 문자열을 태그로 적용
  $('#reply_panel'+no).show();    //패널 출력
  
}


</script>

<style type="text/css">
.reply_ul > li {
    width: 100%;
    padding: 30px 27px 40px 27px;
    border-bottom: 1px solid #e3e3e3;
    list-style: none;
}


</style>

</head>
<body>

  <c:set var="openspace_no" value="${openspaceVO.openspace_no}" />
  <c:set var="title" value="${openspaceVO.openspace_title}" />
  <c:set var="content" value="${openspaceVO.openspace_content}" />
  <c:set var="division" value="${openspaceVO.openspace_division}" />
  <c:set var="cnt" value="${openspaceVO.openspace_cnt}" />
  <c:set var="seqno" value="${openspaceVO.openspace_seqno}" />
  <c:set var="visible" value="${openspaceVO.openspace_visible}" />
  <c:set var="youtube" value="${openspaceVO.openspace_youtube}" />
  <c:set var="rdate" value="${openspaceVO.openspace_rdate}" />
  <c:set var="redate" value="${openspaceVO.openspace_redate}" />
  <c:set var="consumer_nickname" value="${openspaceVO.consumer_nickname}" />

    <jsp:include page="/menu/top3.jsp" flush='false' />
    <DIV style='width: 100%; margin: 0px auto; '>
    
<table style='width: 100%'>
<tr>
<td style='width: 15%; height: 100px;'>
<jsp:include page="./side.jsp" flush="false" />
</td>

<td rowspan="2" style='width: 85%; border-left: solid 1px #999999; border-top: solid 1px #999999;'>
        
        <c:if test="${sessionScope.consumer_id != null && sessionScope.admin=='Y'}">
        <div style="text-align: right; border-bottom: solid 1px #999999">
       <!-- <c:if test="${size >0 }">
        <a href="javascript:delete_file(${openspace_no}, )">파일삭제</a>
        /
        </c:if> -->
        <a href ='../openspace_img/create.do?openspace_no=${openspace_no }'> 파일등록</a>
        /
        <a href="./list.do?search=${param.search }&word=${param.word }&nowPage=${param.nowPage}">목록</a>        
        /
        <A href="./update.do?openspace_no=${openspace_no }&search=${param.search }&word=${param.word }&nowPage=${param.nowPage}">수정</A>
        /
        <A href="./delete.do?openspace_no=${openspace_no }&search=${param.search }&word=${param.word }&nowPage=${param.nowPage}">삭제</A>       
        </div>
        </c:if>
        
        <div>
          <table style="width: 100%; border-bottom: solid 1px #bbbbbb; margin-bottom: 4px;">
            <colgroup>
              <col style='width: 10%;' />
              <col style='width: 75%;' />
              <col style='width: 15%;' />
            </colgroup>
            <tr>
              <td style="text-align: center; font-size: 21px; font-weight: bold;">제목</td>
              <td style="font-size: 21px; font-weight: bold;">《${division}》 ${title}</td>
              <td style="text-align: right; padding-top: 7px;">조회수: 
                ${cnt+1 }&nbsp;&nbsp;</td>
            </tr>
          </table>
        </div>
        <div>
          <table
            style="width: 100%; border-bottom: solid 1px #999999; margin: 4px 0px;">
            <colgroup>
              <col style='width: 10%;' />
              <col style='width: 45%;' />
              <col style='width: 22%;' />
              <col style='width: 23%;' />
            </colgroup>
            <tr>
              <td style="text-align: center; font-weight: bold;">작성자</td>
              <td>${consumer_nickname}</td>
              <td style="text-align: right;">등록일: ${rdate }</td>
              <td style="text-align: right;">수정일: ${redate }&nbsp;&nbsp;</td>
            </tr>
          </table>
        </div>
<c:if test="${size >0}">
<div style='float: left; height: 100px; width: 10%; border-bottom: solid 1px #999999; text-align: center;' >
<div style='margin-top: 38px; font-weight: bold;'>첨부파일</div>
</div>
<div style='height: 100px; overflow:auto; width: 90%; border-bottom: solid 1px #999999;'>
          <table style="width: 100%; ">            
              <c:if test="${size ==0}">
              <td>첨부된 파일이 없습니다.</td>
              </c:if>
                 <c:forEach var="img"  items="${list }"> <!-- request 객체에 접근 -->
                 
                  <c:set var="name" value="${img.openspace_img_fupname}" />    
                  <tr><td>${name }</td></tr>
                  </c:forEach>
          </table>
</div>
</c:if>
<c:if test="${size ==0}">
<div style='float: left;  width: 10%; border-bottom: solid 1px #999999; text-align: center;' >
<div style='font-weight: bold;'>첨부파일</div>
</div>
<div style=' border-bottom: solid 1px #999999; width: 100%;'>
첨부된 파일이 없습니다.
</div>
</c:if>


          
          
  <div class="" style=" margin-top: 16px; margin-bottom: 50px; ">
    <c:if test="${youtube.length() > 0 }">
      <div style="margin:50px; position: relative; height:0; padding-bottom: 56.25%; " class='AA'>
         ${youtube}
      </div>
    </c:if>  
                
            <!-- 원본 이미지 출력 -->      
       <DIV id='attachfile_panel' style="width: 91%;  margin: 0px auto;" >
            <c:forEach var="img" items="${list }" varStatus="info">
              <c:set var="thumb" value="${img.openspace_img_thumb.toLowerCase() }" />

              <c:choose>
                <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                <c:if test="${info.count == 1 }">
                  <IMG src='../openspace_img/storage/${img.openspace_img_fname }' style='width: 100%; height:440px;'>
                </c:if>
                </c:when>
              </c:choose>
            </c:forEach> 
            

       
       
       </DIV > 
       <c:if test="${size>0 }">
           <div style='margin: 0px auto; width: 91%; border: solid; overflow:auto;'>    
<table>
            <c:forEach var="img" items="${list }" varStatus="info">
              <c:set var="thumb" value="${img.openspace_img_thumb.toLowerCase() }" />
              <c:choose>
                <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                  <td>
                  <A href="javascript:panel_img('${img.openspace_img_fname }')">
                  <IMG src='../openspace_img/storage/${img.openspace_img_thumb }' style='margin-top: 2px; margin-left: 1.1px;'>
                  </A>
                  </td>
                </c:when>
              </c:choose>
            </c:forEach>            
</table>
          </div>
</c:if>
<!-- 내용 출력 -->
<div style='margin-top: 30px; margin-left:50px; margin-right:50px; '>
    ${content }
</div>

          </div>
          
          <div style='padding: 10px 0px 10px 30px; border: solid 1px #e5e5e5; height: 40px; background-color: #131E2C;'>
          댓글  ${reply_size }
          </div>
          
          <div>
          <ul class='reply_ul'>
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
          
          </div>
          <!-- 댓글입력 -->
          <form name='frm' method="post" action="/team5/openspace_reply/create.do">
          <input type='hidden' name='word' id='word' value='${param.word }'>
          <input type='hidden' name='search' id='search' value='${param.search }'>
          <input type='hidden' name='nowPage' id='nowPage' value='${param.nowPage }'>         
          <input type='hidden' name='openspace_no' id='openspace_no' value='${openspace_no }'>
          <input type='hidden' name='consumer_no' id='consumer_no' value='${sessionScope.consumer_no}'> 


          
                     
          <div style="height: 350px; ">
          <div style='margin: 0px auto; width: 90%; height: 320px; background-color: #131E2C; margin-top:20px;'>
            <c:choose>
              <c:when test="${sessionScope.consumer_id == null}">
                <textarea onclick="javascript:noconsumer()"  name='openspace_reply_content' id='openspace_reply_content' style='background-color:#111923; width: 90%; margin-left:60px; margin-top: 20px;' rows="10" cols="30" >로그인 후 사용해 주세요.</textarea>
                <button class='pull-right' style='margin-right: 60px; padding: 10px 15px; font-size: 20px;'  type="button" onclick="javascript:noconsumer()">등록</button>
              </c:when>
                  <c:otherwise>
                    <textarea  name='openspace_reply_content' id='openspace_reply_content' style='background-color:#111923; width: 90%; margin-left:60px; margin-top: 20px;' rows="10" cols="30"></textarea>     
                    <button class='pull-right' style='margin-right: 60px; padding: 10px 15px; font-size: 20px;'  type="submit">등록</button>               
                  </c:otherwise>
            </c:choose>
          </div>
          </div>
          </form>

            <div  style='padding:10px 10px;'>
      <div style='border-top: solid 1px #999999; border-bottom: solid 1px #999999; padding: 15px 0px;'>
       <c:choose>
        <c:when test="${a.next_no ==0 }">
        <div>
          <span style='font-weight: bold; margin-left: 10px;'><img src="./images/page_up.png" style='margin-bottom: 5px;'>  다음글</span>&nbsp;&nbsp; 다음글이 없습니다.<br>
        </div>
        </c:when>
        <c:otherwise>
        <div style='height:'>
        <span style='font-weight: bold; margin-left: 10px;'><img src="./images/page_up.png" style='margin-bottom: 5px;'>  다음글</span>&nbsp;&nbsp; 
        <a href="./read.do?openspace_no=${a.next_no}">[${a.next_division}] ${a.next_title }</a><br>
        </div>
        </c:otherwise>
      </c:choose>
      <c:choose>
        <c:when test="${a.pre_no ==0 }">
        <div>
          <span style='font-weight: bold; margin-left: 10px;'><img src="./images/page_down.png" style='margin-bottom: 5px;'>  이전글</span>&nbsp;&nbsp; 이전글이 없습니다.<br>
        </div>
        </c:when>
        <c:otherwise>
        <div>
        <span style='font-weight: bold; margin-left: 10px;'><img src="./images/page_down.png" style='margin-bottom: 5px;'>  이전글</span>&nbsp;&nbsp; <a href="./read.do?openspace_no=${a.pre_no}">[${a.pre_division}] ${a.pre_title }</a>
        </div>
        </c:otherwise>
      </c:choose>      
     </div>
     </div>
      
      
      
      
      </td>
      </tr>
      
 <tr>
<td>&nbsp;</td>
</tr>         
      </table>     
      <div >
      </div>
    </DIV>
  
  
  <DIV style='margin: 0px auto; width: 90%;'>
    <DIV style='float: left; width: 50%;'></DIV>
    <DIV style='float: left; width: 50%;'></DIV>
  </DIV>

  <DIV style='width: 94.8%; margin: 0px auto;'></DIV>

  <jsp:include page="/menu/bottom.jsp" flush='false' />

</body>
</html>