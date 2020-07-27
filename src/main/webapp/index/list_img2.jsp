<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<style type="text/css">

</style>
 
   <div id="myCarousel" class="carousel slide col-md-8" data-ride="carousel" style="height: 350px;">
    <!-- Indicators -->
    <ol class="carousel-indicators">
    <c:forEach var="index_imgVO"  items="${list_main }" varStatus="info">
    <c:if test="${info.count==1 }"> 
      <li data-target="#myCarousel" data-slide-to="${info.count -1 }" class="active"></li>
      </c:if>
      <c:if test="${info.count >1 }"> 
      <li data-target="#myCarousel" data-slide-to="${info.count -1 }"></li>
      </c:if>
      </c:forEach>
    </ol>
    
    <div class="carousel-inner">
    <!-- Wrapper for slides -->
     <c:forEach var="index_imgVO"  items="${list_main }" varStatus="info"> <!-- request 객체에 접근 -->
     <c:set var="index_img_fname" value="${index_imgVO.index_img_fname}" />
     <c:set var="index_img_url" value="${index_imgVO.index_img_url}" />
     <c:if test="${info.count==1 }">  
      <div class="item active">
      <a href='${index_img_url }'>
        <img src='/team5/storage/${index_img_fname }' style='width: 100%; height: 350px;'>
      </a>
      </div>
    </c:if>      
    <c:if test="${info.count > 1 }">  
      <div class="item">
      <a href='${index_img_url }'>
        <img src='/team5/storage/${index_img_fname }' style='width: 100%; height: 350px;'>
      </a>
      </div>
    </c:if>   
    
     </c:forEach>


    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  </div>
  
  
  <!-- --------------------------------------- -->
    <div class="col-md-4" style="height: 350px; ">

   <div style="margin-left: 30px;  font-weight:bold; margin-bottom: 5px;">진행중인 이벤트 </div>
    <!-- id 확인 -->
      <div id="Carousel" class="carousel slide" data-ride="carousel" style="margin-left: 30px;" >
    <!-- Indicators -->
    <ol class="carousel-indicators">
    <c:forEach var="index_imgVO"  items="${list_event }" varStatus="info">
    <c:if test="${info.count==1 }"> 
      <li data-target="#myCarousel" data-slide-to="${info.count -1 }" class="active"></li>
      </c:if>
      <c:if test="${info.count >1 }"> 
      <li data-target="#myCarousel" data-slide-to="${info.count -1 }"></li>
      </c:if>
      </c:forEach>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner"> <!-- 처음 시작 -->
     <c:forEach var="index_imgVO"  items="${list_event }" varStatus="info"> <!-- request 객체에 접근 -->
     <c:set var="index_img_fname" value="${index_imgVO.index_img_fname}" />
     <c:set var="index_img_url" value="${index_imgVO.index_img_url}" />
     <c:if test="${info.count==1 }">  
      <div class="item active">
      <a href='${index_img_url }'>
        <img src='/team5/storage/${index_img_fname }' style='width: 100%; height: 320px;'>
      </a>
      </div>
    </c:if>      
    <c:if test="${info.count > 1 }">  
      <div class="item">
      <a href='${index_img_url }'>
        <img src='/team5/storage/${index_img_fname }' style='width: 100%; height: 320px;'>
      </a>
      </div>
    </c:if>   
    
     </c:forEach>
    

    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#Carousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#Carousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>

  </div>
  
  
  
   