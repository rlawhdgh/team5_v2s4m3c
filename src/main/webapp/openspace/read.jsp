<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>언젠간 만들겠지</title>
<meta name="viewport" content="width=device-width">
<link href="/team5/css/style.css" rel='Stylesheet' type='text/css'>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  <!-- Fotorama -->
  <link href="fotorama.css" rel="stylesheet">
  <script src="fotorama.js"></script>
  
<script type="text/javascript">
//댓글 글자수 출력 함수
$(function(){
    $('textarea.content').keyup(function(){
        bytesHandler(this);
    });
  });

  function getTextLength(str) {
    var len = 0;
  
    for (var i = 0; i < str.length; i++) {
    len++;
    }
    if(len>200){
      alert("200자 이내로 작성해 주세요")
      document.getElementById("openspace_reply_content").value=document.getElementById("openspace_reply_content").value.substring(0, 200);
      len=200;
    }
    return len;
    }  
    function bytesHandler(obj){  
    var text = $(obj).val();
    
    $('span.bytes').text(getTextLength(text));
  }

    
  //이미지 파일 전부 삭제
  function delete_file(openspace_no) {
    var sw = confirm("모든 파일을삭제 하시겠습니까?");
    if (sw == true) {
      alert("파일이 정상적으로 삭제되었습니다.")
      location.href="../openspace_img/delete_all.do?openspace_no=" + openspace_no;
    } else {
      alert('파일 삭제를 취소합니다.');
    }
  }
    
  //댓글 로그인
  function noconsumer() {    
    alert("로그인 후 사용해주세요.")
    document.getElementById('id01').style.display='block';    
  }
  $(function() { //자동 실행
    $('#btn_send').on('click',reply_create); 
    list_page();
  });
  
  function aa(aa,b,c) {
    var cc = $('#openspace_reply_update'+c).val();
    $('click',reply_update(aa,c,cc)); 
  }

  
  
  function reply_create() {
    
    // return;
    
    var frm = $('#frm_reply');  
    //var openspace_no = $('#openspace_no',frm).val();
    //var consumer_no = $('#consumer_no',frm).val(); 
    //var openspace_reply_content = $('#openspace_reply_content',frm).val();   
    
    var replyPage= parseInt($("#reply_ul").attr("data-replyPage"));
    if ($('#openspace_reply_content',frm).val().length == 0) {
      alert("댓글을 입력해 주세요");
    return;  // 실행 종료
    }

    var params = frm.serialize();
    //var params ='openspace_no='+openspace_no+'&openspace_reply_content='+openspace_reply_content+'&consumer_no='+consumer_no;
    var msg = '';
  
    $.ajax({
      url: '/team5/openspace_reply/create1.do',
      type: 'post',  // post
      cache: false, // 응답 결과 임시 저장 취소
      async: true,  // true: 비동기 통신
      dataType: 'json', // 응답 형식: json, html, xml...
      data: params,      // 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        var msg = "";      
      
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
        msg += '<strong>error</strong><br>'+error + '<hr>';
        console.log(msg);
      }
    });
    alert("댓글 등록됨");
    $("#reply_ul").attr("data-replyPage", replyPage-1);
    list_page();
    // $("#reply_ul").load(location.href+' #reply_ul');    
    $("#reply_size").load(location.href+' #reply_size');
    $('#bytes').load(location.href+' #bytes');
    document.getElementById("openspace_reply_content").value='';

    //location.reload();
  }
  
  
  function reply_update(cc,aa,bb) {
   
    var replyPage= parseInt($("#reply_ul").attr("data-replyPage"));
    var frm = $('#frm');  // Youtube 삭제 폼   
    var openspace_reply_no = aa; 
    var openspace_reply_content = bb;
    if (openspace_reply_content.length == 0) {
      alert("댓글을 입력해 주세요");
      return;  // 실행 종료
    }
    if (openspace_reply_content.length > 200) {
      alert("200자 이내로 해주세요");
      document.getElementById("openspace_reply_update1").value=openspace_reply_content.substring(0,200);
      return;  // 실행 종료
    }
    
    
    var params ='openspace_reply_content='+openspace_reply_content+'&openspace_reply_no='+openspace_reply_no;
    var msg = '';
  
    $.ajax({
      url: '/team5/openspace_reply/update1.do',
      type: 'post',  // post
      cache: false, // 응답 결과 임시 저장 취소
      async: true,  // true: 비동기 통신
      dataType: 'json', // 응답 형식: json, html, xml...
      data: params,      // 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        
        var msg = "";        
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
        msg += '<strong>error</strong><br>'+error + '<hr>';
        console.log(msg);
      }
    });
    alert("댓글 수정됨");
    $("#reply_ul").attr("data-replyPage", replyPage-1);
    list_page();
    //$("#reply_ul").load(location.href+' #reply_ul');
    //$("#reply_panel"+cc).load(location.href+' #reply_panel'+cc);
    //$("#reply_size").load(location.href+' #reply_size');
    //document.getElementById("qaz").click()
    document.getElementById("openspace_reply_content").value='';

    //location.reload();
  }
  
  function list_page(){
    var replyPage= parseInt($("#reply_ul").attr("data-replyPage"));
    var params='openspace_no='+${openspaceVO.openspace_no}+"&replyPage="+replyPage;
    var a = '"';
    var b ="'";
    $.ajax({
      url: '/team5/openspace_reply/list_page.do',
      type: 'get',  // post
      cache: false, // 응답 결과 임시 저장 취소
      async: true,  // true: 비동기 통신
      dataType: 'json', // 응답 형식: json, html, xml...
      data: params,      // 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        $("#reply_ul").attr("data-replyPage", replyPage+1);
        // $("#reply_list").attr("data-replyPage", data.replyPage+1);
         $('#reply_ul').html('');
           var content="";
           if(rdata.list.length==0){
             content +="<div style='width: 100%; text-align:center; margin:15px auto;'><span style='font-size: 30px;  '>댓글이 없어용</span></div>";
           }else{
             for (i=0; i < rdata.list.length; i++) {
               var row = rdata.list[i];              
               content += "<li>";          
               content += "<div>";
               content += "<p><span>"+row.consumer_nickname+"</span> <span style='margin-left: 30px; '>"+row.openspace_reply_date.substring(0,10)+"</span>" 
                if(row.consumer_no=='${sessionScope.consumer_no}' ||  '${sessionScope.admin}'=='Y' ){
                   content += "<span class='pull-right'>"          
                   content +="<a href='javascript:replyupdate("+i+", "+a+""+row.openspace_reply_content+""+a+", "+row.openspace_reply_no+")'>수정</a>"             
                   content +=" / "
                  // content +="<a href ='/team5/openspace_reply/delete.do?openspace_reply_no="+row.openspace_reply_no+"&search=${param.search }&word=${param.word}&nowPage=${param.nowPage}&openspace_no=${param.openspace_no}' >삭제</a>" ;          
                   content +="<a href ='javascript:reply_delete("+row.openspace_reply_no+")' >삭제</a>" ;          
                   content += "</span></p>";
                }
               content += "<form name='frm' id='frm'>"    
               content += "<div id ='reply_panel"+i+"' style='width: 100%; margin: 0px auto;'>"           
               content += row.openspace_reply_content+"<br>"  
               content += "</div>";
               content += "</form>";
               content += "</div>";
               content += "</li>";   
               
             }      
           }
         $('#reply_ul').append(content);
         if(rdata.list_all<rdata.tot){
           var myBtn = document.getElementById("addBtn");
           myBtn.style.display = "none";
           }else{
             var myBtn = document.getElementById("addBtn");
             myBtn.style.display = "block";                          
           }  
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
        msg += '<strong>error</strong><br>'+error + '<hr>';
        console.log(msg);
      }
    });
    $("#addBtn").on("click", list_page);    
    }
  
  
  function reply_delete(openspace_reply_no) {
    var replyPage= parseInt($("#reply_ul").attr("data-replyPage"));
    //alert(openspace_reply_no+"호출됨");
    var params = "openspace_reply_no="+openspace_reply_no;
    $.ajax({
      url: "/team5/openspace_reply/delete1.do", // action 대상 주소
      type: "post",           // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        // alert(rdata);
        var msg = "";
        alert("삭제되었습니다.");
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR request.status: '+request.status + '/ ' + error;
        console.log(msg);
      }
    });
    $("#reply_size").load(location.href+' #reply_size');
    $("#reply_ul").attr("data-replyPage", replyPage-1);
    list_page();
  }




</script>

<script type="text/javascript">

$(document).ready(function(){
  var html = document.querySelector('.AA').innerHTML;
  document.querySelector('.AA').innerHTML =
      html.replace(/(\<iframe)/g, '<iframe style="position: absolute; width:100%; height:100%;"')   
});


function replyupdate(no, content, pk) {

 
  var aa = "\""+content + "\"";
  var tag = "";
  tag += "<input type='hidden' name='openspace_reply_no' id='openspace_reply_no' value='"+pk+"'> "
  tag += "<textarea class='content1' name='openspace_reply_update' id='openspace_reply_update"+pk+"'  style='height:150px; background-color:#111923; width: 100%;' rows='10' cols='30'>"+content+"</textarea>";
  tag += "<div class='pull-right' style='margin-right: 20px;'>";
  tag += "<button onclick='javascript:aa("+no+","+aa+","+pk+")' style='padding: 7px;' type='button'>등록</button> <button id='qaz' style='padding: 7px;' type='button' onclick='javascript:noreplyupdate("+no+","+aa+")'>취소</button> </div>";

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


          
          
    <c:if test="${youtube.length() > 0 }">
  <div class="" style=" margin-top: 16px; margin-bottom: 50px; ">
      <div style="margin:50px; position: relative; height:0; padding-bottom: 56.25%; " class='AA'>
         ${youtube}
      </div>
    </div>  
    </c:if>
                
            <!-- 원본 이미지 출력 -->      

       <DIV style='margin: 0px auto; width: 980px;'>
  <!-- Fotorama data-ratio="100%/66%" -->
  <div class="fotorama"
         data-autoplay="5000"
         data-nav="thumbs"
         data-ratio="1000/520"         
         data-thumbwidth="120"
         data-thumbheight="80"
         data-fit="cover">
         
            <c:forEach var="img" items="${list }" varStatus="info">
              <c:set var="thumb" value="${img.openspace_img_thumb.toLowerCase() }" />
              <c:choose>
                <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">

<%--                   <IMG src='../openspace_img/storage/${img.openspace_img_fname }' style='width: 100%; height:440px;'>--%>              
<a href="../openspace_img/storage/${img.openspace_img_fname }" '>
<img src="../openspace_img/storage/${thumb }" ></a>

                </c:when>
              </c:choose>
            </c:forEach> 
            
            </div>
                          
       </DIV > 



<!-- 내용 출력 -->
<div style='margin-top: 30px; margin-left:50px; margin-right:50px; margin-bottom: 30px; '>
    ${content }
</div>


          
                    <!-- 댓글입력 -->
<div >
<div style='padding: 10px 0px 10px 30px; border: solid 1px #e5e5e5; height: 40px; background-color: #131E2C;'>
댓글 쓰기
</div>
          <form name='frm_reply' id='frm_reply'>    
          <input type='hidden' name='openspace_no' id='openspace_no' value='${openspace_no }'>
          <input type='hidden' name='consumer_no' id='consumer_no' value='${sessionScope.consumer_no}'>        
            
          <div style="height: 280px; ">
          <div style='margin: 0px auto; width: 90%; height: 250px; background-color: #131E2C; margin-top:20px;'>
            <c:choose>
              <c:when test="${sessionScope.consumer_id == null}">
                <textarea onclick="javascript:noconsumer()"  name='openspace_reply_content' id='openspace_reply_content' style='height:150px;background-color:#111923; width: 90%; margin-left:60px; margin-top: 20px;' rows="10" cols="30" >로그인 후 사용해 주세요.</textarea>
                <button class='pull-right' style='margin-right: 60px; padding: 5px 15px; font-size: 20px;'  type="button" onclick="javascript:noconsumer()">등록</button>
              </c:when>
                  <c:otherwise>
                    <textarea  class='content' name='openspace_reply_content' id='openspace_reply_content' style='height:150px; background-color:#111923; width: 90%; margin-left:60px; margin-top: 20px;' rows="10" cols="30"></textarea>     
                    <div style='height: 30px; text-align: right; margin-top: 10px;'>
                    (<span class="bytes" id='bytes'>0</span>/200)
                    <button type="button" id='btn_send' class='' style='margin-right: 60px; margin-left:20px; padding: 5px 15px; font-size: 20px;'>등록</button>                              
                    </div>
                  </c:otherwise>
            </c:choose>
          </div>
          </div>
          </form>
 </div>         
          <div style='padding: 10px 0px 10px 30px; border: solid 1px #e5e5e5; height: 40px; background-color: #131E2C;'>
          댓글  <span id='reply_size'>${reply_size }</span>
          </div>
          
          <div>
          <ul class='reply_ul' id='reply_ul' data-replyPage='1'>            
          </ul>
          <button style='display:none; width: 100%; height: 40px; font-size: 30px;' id="addBtn">더보기 ▼</button>
          <div style=' border-bottom:1px solid #e3e3e3; text-align: center; '>
          
          </div>
          
          </div>


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