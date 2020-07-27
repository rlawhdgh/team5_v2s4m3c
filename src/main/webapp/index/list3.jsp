<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>리스트</title>
</head>
<body>
  <ul class="nav nav-tabs" style='padding-left: 20px;'>
    <li class="active"><a data-toggle="tab" href="#img0">전체</a></li>
    <li><a data-toggle="tab" href="#img1">메인</a></li>
    <li><a data-toggle="tab" href="#img2">이벤트</a></li>
  </ul>

 <div class="tab-content">
<div id='img0' style='overflow:auto; height: 500px;' class="tab-pane fade in active">
<form name='frm' method='post' action='./index/update.do'>
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
     <tbody>


   <c:forEach var="index_imgVO"  items="${list }" varStatus="info"> <!-- request 객체에 접근 -->
    <c:set var="index_img_no" value="${index_imgVO.index_img_no}" />
    <c:set var="index_img_fname" value="${index_imgVO.index_img_fname}" />
    <c:set var="index_img_fupname" value="${index_imgVO.index_img_fupname}" />
    <c:set var="index_img_fsize" value="${index_imgVO.index_img_fsize}" />
    <c:set var="index_img_url" value="${index_imgVO.index_img_url}" />
    <c:set var="index_img_division" value="${index_imgVO.index_img_division}" />
    <c:set var="index_img_rdate" value="${index_imgVO.index_img_rdate}" />
   <tr id ='tr${index_img_no}'>   
        <td style="text-align: center; "><img src='/team5/storage/${index_img_fupname }' style='width: 120px; height: 80px;'></td>
        <td style="text-align: center; vertical-align: middle;">${index_img_fname }</td>   
        <td style="text-align: center; vertical-align: middle;"><a href='${index_img_url }'>${index_img_url}</a></td>
        <td style="text-align: center; vertical-align: middle;">${index_img_division}</td>
        <td style="text-align: center; vertical-align: middle;" >${index_img_rdate.substring(0,10) }</td>
        <td style="text-align: center; vertical-align: middle;">
        <a href='javascript:index_imgupdate(${index_img_no },"${index_img_fupname }","${index_img_fname }","${index_img_url }","${index_img_division}","${index_img_rdate.substring(0,10) }" )'>수정</A>      
        /

        <A href='./index/delete.do?index_img_no=${index_img_no }'>삭제</A></td>

      </tr>
      </c:forEach>
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
   <tr>      
        <td style="text-align: center; "><img src='/team5/storage/${index_img_fupname }' style='width: 120px; height: 80px;'></td>
        <td style="text-align: center; vertical-align: middle;">${index_img_fname }</td>   
        <td style="text-align: center; vertical-align: middle;"><a href='${index_img_url }'>${index_img_url}</a></td>
        <td style="text-align: center; vertical-align: middle;">${index_img_division}</td>
        <td style="text-align: center; vertical-align: middle;" >${index_img_rdate.substring(0,10) }</td>
        <td style="text-align: center; vertical-align: middle;">
        <A href="#">수정</A>      
        /
         <A href="./index/delete.do?index_img_no=${index_img_no }">삭제</A></td>
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
   <tr>      
        <td style="text-align: center; "><img src='/team5/storage/${index_img_fupname }' style='width: 120px; height: 80px;'></td>
        <td style="text-align: center; vertical-align: middle;">${index_img_fname }</td>   
        <td style="text-align: center; vertical-align: middle;"><a href='${index_img_url }'>${index_img_url}</a></td>
        <td style="text-align: center; vertical-align: middle;">${index_img_division}</td>
        <td style="text-align: center; vertical-align: middle;" >${index_img_rdate.substring(0,10) }</td>
        <td style="text-align: center; vertical-align: middle;">
        <A href="#">수정</A>      
        /
        <A href="./index/delete.do?index_img_no=${index_img_no }">삭제</A></td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
  
  </div>
  </div>


</body>
</html>