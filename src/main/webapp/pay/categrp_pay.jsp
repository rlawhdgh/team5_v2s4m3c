<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top3.jsp" />
 
  <DIV class='title_line'>
   주문하기
  <p style="text-align: center;">주문하기</p>
  </DIV>
  
  
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' 
                action='./create.do'>
      <!-- <input type='hidden' name='lang' id='lang' value='en'> --> <!-- ko, en -->
    <p style="text-align: left; color: red;" >적립금은 1,000원 이상 적립되면 100원 단위의 적립금이 자동 할인 적용됩니다. (일부상품은 제외될수 있습니다.)</p>

    <p style="text-align: left; color: red;">※ 캐시의 사용 가능한 최소 금액은 10원입니다.</p>
     
    </FORM>
  </DIV>
   
<TABLE class = "table table-striped">
<!-- table table-striped -->
<!-- border = "1" -->
  <colgroup>
    <col style="width: 5%;"/>
    <col style='width: 15%;'/>
    <col style='width: 30%;'/>
    <col style='width: 20%;'/>    
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
  </colgroup>
 
  <thead>  
  <TR>    
    <TH class="th_bs">이미지</TH>
    <TH class="th_bs">상품명</TH>
    <TH class="th_bs">수량</TH>
    <TH class="th_bs">가격</TH>
    <TH class="th_bs">할인</TH>
    <TH class="th_bs">합계</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="categrpVO" items="${list }">  <!-- request 객체에 접근 -->
    <c:set var="categrpno" value="${categrpVO.categrpno}" />
    <TR>
      <TD class="td_bs">${categrpVO.seqno }</TD>
      <TD class="td_bs_left"><A href="./read_update.do?categrpno=${categrpno }">${categrpVO.name }</A></TD>
      <TD class="td_bs">${categrpVO.rdate.substring(0, 10) }</TD>
      <TD class="td_bs">
      <c:choose>
        <c:when test="${categrpVO.visible == 'Y' }">
        <A href="./update_visible.do?categrpno=${categrpno }&visible=${categrpVO.visible }"><span class="glyphicon glyphicon-eye-open"></span></A>
        </c:when>
        <c:otherwise>
        <A href="./update_visible.do?categrpno=${categrpno }&visible=${categrpVO.visible }"><span class="glyphicon glyphicon-eye-close"></span></A>
        </c:otherwise>
        </c:choose>
        </TD>
      <TD class="td_bs">
        <A href="./read_update.do?categrpno=${categrpno }"><span class="glyphicon glyphicon-pencil"></span></A>
        <A href="./read_delete.do?categrpno=${categrpno }"><span class="glyphicon glyphicon-trash"></span></A>
        <A href="./update_seqno_up.do?categrpno=${categrpno }"><span class="glyphicon glyphicon-arrow-up"></span></A>
        <A href="./update_seqno_down.do?categrpno=${categrpno }"><span class="glyphicon glyphicon-arrow-down"></span></A>         
      </TD>             
    </TR>
  </c:forEach>
  </tbody>
  <tfoot>
 
   
   <TR>
    <TD class="th_bs;" colspan="3">합계</TD>
    <TD class="th_bs"></TD>
    <TD class="th_bs"></TD>
    <TD class="th_bs">합계</TD>
   </TR> 
  
   
  </tfoot>
  
</TABLE>
<DIV class="bottom_menu">
  
  <TABLE class = "table table-striped">
<!--class = "table table-striped"-->
<!-- border = "1" -->
  <colgroup>
    <col style="width: 30%;"/>
    <col style='width: 30%;'/>
    <col style='width: 10%;'/>
    <col style='width: 30%;'/>
  </colgroup>
 
  <thead> 
  </thead>
  <tbody>
  <TR>    
    <TD style = "text-align: left;">할인 적용</TD>
    <TD></TD>
    <TD rowspan ="8" ></TD>
    <TD style = "text-align: left;">결제 수단</TD>
  </TR>
  <TR>
      <TD style = "text-align: left;">적립금</TD>
      <TD></TD>
      <TD style = "text-align: left;" rowspan="2"><input type="radio" name="chk_info" value="">
      신용/체크카드 결제
      <div style = "color : red;">※ 결제 예정액이 1,000 원 이상일 때만 사용이 가능합니다.</div> 
      </TD>
  </TR>
  
  <TR>
      <TD style = "text-align: left;">캐시</TD>
      <TD style = "text-align: right;">
      <button onclick="">사용</button>
      <button onclick="">취소</button>
      </TD>     
  </TR>
  
  <TR>
      <TD style = "text-align: left;">최종 결제 정보</TD>
      <TD></TD>
  
      <TD style = "text-align: left;"><input type="radio" name="chk_info" value="">
      계좌이체 결제
      <div style = "color : red;">※ 결제 예정액이 1,000 원 이상일 때만 사용이 가능합니다.</div>
      </TD>
  </TR>
  
  <TR>
      <TD style = "text-align: left;">상품금액</TD>
      <TD></TD>
      <TD style = "text-align: left;" rowspan="2"><input type="radio" name="chk_info" value="">
      가상계좌 결제
      <div style = "color : red;">※ 결제 예정액이 10,000 원 이상일 때만 사용이 가능하며, 이벤트 상품의 경우 이벤트 종료 후 입금이 불가합니다.</div>
      </TD>
  </TR>
  
  <TR>
      <TD style = "text-align: left;">할인금액</TD>
      <TD></TD> 
  </TR>
  
  <TR>
      <TD style = "text-align: left;">결제예정액</TD>
      <TD></TD>  
      <TD style = "text-align: left;"><input type="radio" name="chk_info" value="">
      휴대폰 결제
      <div style = "color : red;">※ 결제 예정액이 350 원 이상일 때만 사용이 가능합니다.</div>
      </TD>   
      
  </TR>
  <TR>
  <TD colspan="2"></TD>
  <TD style = "text-align: left;"><input type="checkbox" name="" value="" checked> 구매하실 상품의 상품정보 및 가격을 확인하였으며, 이에동의합니다.
(전자상거래법 제8조 제2항)</TD>
  
  </TR>
  </TABLE>
      </DIV>
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 