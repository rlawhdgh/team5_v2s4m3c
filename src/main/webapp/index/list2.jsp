<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>리스트</title>
</head>
<body>
<div style='overflow:auto; height: 500px;'>
  <table class="table table-hover" style='margin-bottom: 0px; '>
    <colgroup>
      <col style='width: 20%;'/>
      <col style='width: 10%;'/>
      <col style='width: 40%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>

    </colgroup>
    

     <thead style="background-color: rgba(250, 250, 250, 0.9);">
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
   <tr>      
        <td style="text-align: center; "><img src='/team5/storage/${index_img_fname }' style='width: 120px; height: 80px;'></td>
        <td style="text-align: center; vertical-align: middle;">${index_img_fname }</td>   
        <td style="text-align: center; vertical-align: middle;"><a href='${index_img_url }'>${index_img_url}</a></td>
        <td style="text-align: center; vertical-align: middle;">${index_img_division}</td>
        <td style="text-align: center; vertical-align: middle;" >${index_img_rdate.substring(0,10) }</td>
        <td style="text-align: center; vertical-align: middle;">
        <A href="#">수정</A>      
        /
        <A href="#">삭제</A></td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
  </div>


</body>
</html>