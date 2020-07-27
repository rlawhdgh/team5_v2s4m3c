<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
$(function() {
  index_img_all();
});

function index_img_all() {
  // alert(contentsno);
  var params = '';
  var a = '"';
  var b ="'";

$.ajax({
  url: "./index/list_img.do", // action 대상 주소
  type: "get",           // get, post
  cache: false,          // 브러우저의 캐시영역 사용안함.
  async: true,           // true: 비동기
  dataType: "json",   // 응답 형식: json, xml, html...
  data: params,        // 서버로 전달하는 데이터
  success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
    // alert(rdata);
    var msg = '';
    $('#index_img_all').html('');
    
    for (i=0; i < rdata.list.length; i++) {
      var row = rdata.list[i];
      
     msg+="<tr>"
     msg+="<td style='text-align: center; '><img src='/team5/storage/"+row.index_img_fupname+"' style='width: 120px; height: 80px;'></td>"
     msg+="<td style='text-align: center; vertical-align: middle'>"+row.index_img_fname +"</td>   "
     msg+="<td style='text-align: center; vertical-align: middle;'><a href='"+row.index_img_url "'>"+row.index_img_url+"</a></td>"
     msg+="<td style='text-align: center; vertical-align: middle;'>"+row.index_img_division+"</td>"
     msg+="<td style='text-align: center; vertical-align: middle;' >"+index_img_rdate +"</td>";
     msg+="<td style='text-align: center; vertical-align: middle;'></td>";
     msg+="</tr>";    
    }
    $('#index_img_all').append(msg);

  },
  // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
  error: function(request, status, error) { // callback 함수
    var msg = 'ERROR request.status: '+request.status + '/ ' + error;
    console.log(msg);
  }
});

}




</script>

  <ul class="nav nav-tabs" style='padding-left: 20px;'>
    <li class="active"><a data-toggle="tab" href="#img0">전체</a></li>
    <li><a data-toggle="tab" href="#img1">메인</a></li>
    <li><a data-toggle="tab" href="#img2">이벤트</a></li>
  </ul>

 <div class="tab-content">
<div id='img0' style='overflow:auto; height: 500px;' class="tab-pane fade in active">
<form name='frm_all' id='frm_all'>
  <table class="table table-hover" style='margin-bottom: 0px;  '>
    <colgroup>
      <col style='width: 20%;'/>
      <col style='width: 10%;'/>
      <col style='width: 40%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>

    </colgroup>
    

     <thead style="background-color: #111923;">
      <tr >
        <th style="text-align: center;">이미지</th>
        <th style="text-align: center;">파일명</th>
        <th style="text-align: center;">url</th>
        <th style="text-align: center;">구분</th>
        <th style="text-align: center;">등록일</th>
        <th style="text-align: center;">기타</th>
    
      </tr>
    </thead>
     <tbody id = 'index_img_all'>

    </tbody>
  </table>
  </form>
  </div>
  
  
  
  
  <div id='img1' style='overflow:auto; height: 500px;' class="tab-pane fade">
  <table class="table table-hover" style='margin-bottom: 0px; '>
    <colgroup>
      <col style='width: 20%;'/>
      <col style='width: 10%;'/>
      <col style='width: 40%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>

    </colgroup>
    

     <thead style="background-color: #111923;">
      <tr >
        <th style="text-align: center;">이미지</th>
        <th style="text-align: center;">파일명</th>
        <th style="text-align: center;">url</th>
        <th style="text-align: center;">구분</th>
        <th style="text-align: center;">등록일</th>
        <th style="text-align: center;">기타</th>
    
      </tr>
    </thead>
     <tbody>


   <c:forEach var="index_imgVO"  items="${list_main }" varStatus="info"> <!-- request 객체에 접근 -->
    <c:set var="index_img_no" value="${index_imgVO.index_img_no}" />
    <c:set var="index_img_fname" value="${index_imgVO.index_img_fname}" />
    <c:set var="index_img_fupname" value="${index_imgVO.index_img_fupname}" />
    <c:set var="index_img_fsize" value="${index_imgVO.index_img_fsize}" />
    <c:set var="index_img_url" value="${index_imgVO.index_img_url}" />
    <c:set var="index_img_division" value="${index_imgVO.index_img_division}" />
    <c:set var="index_img_rdate" value="${index_imgVO.index_img_rdate}" />
   <tr id ='trmain${index_img_no}'>   
        <td style="text-align: center; "><img src='/team5/storage/${index_img_fupname }' style='width: 120px; height: 80px;'></td>
        <td style="text-align: center; vertical-align: middle;">${index_img_fname }</td>   
        <td style="text-align: center; vertical-align: middle;"><a href='${index_img_url }'>${index_img_url}</a></td>
        <td style="text-align: center; vertical-align: middle;">${index_img_division}</td>
        <td style="text-align: center; vertical-align: middle;" >${index_img_rdate.substring(0,10) }</td>
        <td style="text-align: center; vertical-align: middle;">
        <a href='javascript:index_imgupdate("메인",${index_img_no },"${index_img_fupname }","${index_img_fname }","${index_img_url }","${index_img_division}","${index_img_rdate.substring(0,10) }" )'>수정</A>      
        /

        <A href='./index/delete.do?index_img_no=${index_img_no }'>삭제</A></td>

      </tr>
      </c:forEach>
    </tbody>
  </table>
  </div>
  
  
  <div id='img2' style='overflow:auto; height: 500px;' class="tab-pane fade">
  <table class="table table-hover" style='margin-bottom: 0px; '>
    <colgroup>
      <col style='width: 20%;'/>
      <col style='width: 10%;'/>
      <col style='width: 40%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>

    </colgroup>
    

     <thead style="background-color: #111923;">
      <tr >
        <th style="text-align: center;">이미지</th>
        <th style="text-align: center;">파일명</th>
        <th style="text-align: center;">url</th>
        <th style="text-align: center;">구분</th>
        <th style="text-align: center;">등록일</th>
        <th style="text-align: center;">기타</th>
    
      </tr>
    </thead>
     <tbody>


   <c:forEach var="index_imgVO"  items="${list_event }" varStatus="info"> <!-- request 객체에 접근 -->
    <c:set var="index_img_no" value="${index_imgVO.index_img_no}" />
    <c:set var="index_img_fname" value="${index_imgVO.index_img_fname}" />
    <c:set var="index_img_fupname" value="${index_imgVO.index_img_fupname}" />
    <c:set var="index_img_fsize" value="${index_imgVO.index_img_fsize}" />
    <c:set var="index_img_url" value="${index_imgVO.index_img_url}" />
    <c:set var="index_img_division" value="${index_imgVO.index_img_division}" />
    <c:set var="index_img_rdate" value="${index_imgVO.index_img_rdate}" />
   <tr id ='trevent${index_img_no}'>   
        <td style="text-align: center; "><img src='/team5/storage/${index_img_fupname }' style='width: 120px; height: 80px;'></td>
        <td style="text-align: center; vertical-align: middle;">${index_img_fname }</td>   
        <td style="text-align: center; vertical-align: middle;"><a href='${index_img_url }'>${index_img_url}</a></td>
        <td style="text-align: center; vertical-align: middle;">${index_img_division}</td>
        <td style="text-align: center; vertical-align: middle;" >${index_img_rdate.substring(0,10) }</td>
        <td style="text-align: center; vertical-align: middle;">
        <a href='javascript:index_imgupdate("이벤트",${index_img_no },"${index_img_fupname }","${index_img_fname }","${index_img_url }","${index_img_division}","${index_img_rdate.substring(0,10) }" )'>수정</A>      
        /
        <A href='./index/delete.do?index_img_no=${index_img_no }'>삭제</A></td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
  
  </div>
  </div>

