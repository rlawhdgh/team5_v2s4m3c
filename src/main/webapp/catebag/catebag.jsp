<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>catebag</title>
 
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
   장바구니
  <p style="text-align: right;"><button onclick="">계속 쇼핑하기</button></p>
  </DIV>
  
  
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' 
                action='./create.do'>
      <!-- <input type='hidden' name='lang' id='lang' value='en'> --> <!-- ko, en -->
    <div style="text-align: left; color: red;" >적립금은 1,000원 이상 적립되면 100원 단위의 적립금이 자동 할인 적용됩니다. (일부상품은 제외될수 있습니다.)</div>

    <div style="text-align: left; color: red;">※ 캐시의 사용 가능한 최소 금액은 10원입니다.</div>
     
    </FORM>
  </DIV>
   
<TABLE class="table table-striped;">
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
    <TH class="th_bs"><label><input type="checkbox" name="" value=""></label></TH>
    <TH class="th_bs">이미지</TH>
    <TH class="th_bs">상품명</TH>
    <TH class="th_bs">수량</TH>
    <TH class="th_bs">가격</TH>
    <TH class="th_bs">할인</TH>
    <TH class="th_bs">합계</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="" items="">  <!-- request 객체에 접근 -->
    <c:set var="" value="" />
    <TR>
      <TD class="td_bs"></TD>
      <TD class="td_bs_left"><A href=""></A></TD>
      <TD class="td_bs"></TD>
      <TD class="td_bs">
      <c:choose>
        <c:when test="">
        <A href=""><span></span></A>
        </c:when>
        <c:otherwise>
        <A href=""><span class="glyphicon glyphicon-eye-close"></span></A>
        </c:otherwise>
        </c:choose>
        </TD>
      <TD class="td_bs">
        <A href=""><span class="glyphicon glyphicon-pencil"></span></A>
        <A href=""><span class="glyphicon glyphicon-trash"></span></A>
        <A href=""><span class="glyphicon glyphicon-arrow-up"></span></A>
        <A href=""><span class="glyphicon glyphicon-arrow-down"></span></A>         
      </TD>             
    </TR>
  </c:forEach>
  </tbody>
  <tfoot>
   <TR>
    <TD class="th_bs;" colspan="7">
    <button onclick="">전체 삭제
    </button>
    <button onclick="">선택삭제
    </button>
    </TD>
   </TR> 
   
   <TR>
    <TD class="th_bs;" colspan="3">합계</TD>
    <TD class="th_bs"></TD>
    <TD class="th_bs"></TD>
    <TD class="th_bs"></TD>
    <TD class="th_bs">합계</TD>
   </TR> 
  
   
  </tfoot>
  
</TABLE>
<DIV class="bottom_menu">
         <div style="text-align: right;"><button type="submit">주문하기</button></div>
     
      </DIV>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 