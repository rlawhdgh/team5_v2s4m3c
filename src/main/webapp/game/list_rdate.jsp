<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!-- 상단1 --
  <!-- 상품1 for문으로 돌리기 -->
 <c:set var="i" value="0" /> 
 <c:set var="j" value="3" />
  <table style='width: 100%;'>
    <c:forEach begin="0" end="5" var="gameVO" items="${list }" varStatus="info">
    <c:if test="${i%j==0 }">
  <tr>
  </c:if>
  <td style="width: 33%;">
    <div class="" style="height: 300px; width: 95%; margin: 0px auto;">
      <div style="border: solid 2px #999999; ">
        <div style=" height: 100px;">
        <c:if test="${gameVO.game_image != null }">
          <a href="./game/read1.do?game_gameno=${gameVO.game_gameno}">
          <img style=" width: 100%;  right: 2px; margin-bottom: 20px; height: 110px;" src="./game/storage/images/${gameVO.game_image }">
          </a> 
        </c:if>
        <c:if test="${gameVO.game_image == null }">
          <a href="./game/read1.do?game_gameno=${gameVO.game_gameno}">
          <img style=" width: 100%;  right: 2px; margin-bottom: 20px; height: 110px;" src="./game/images/none1.png">
          </a> 
        </c:if>
        </div>
        
        <div style="padding-left: 10px;">
         <div style="height: 50px; margin-top: 20px; margin-bottom: 5px;   ">
          <span style="font-weight:bold">
          <a href="./game/read1.do?game_gameno=${gameVO.game_gameno}">
          ${gameVO.game_title }
          </a>
          </span><br>
          <span class="label label-light" style="background-color: #474747; font-size: 13px;">${gameVO.kind_kindname }</span>
          
         </div>
       
          <div style="margin-bottom: 10px; font-size: 16px;">
            가격: <span style="font-size: 16px; text-decoration: line-through;">
            <c:if test="${gameVO.game_price != 0}">
               ${gameVO.game_price}
            </c:if>
            <c:if test="${gameVO.game_price == 0}">
                무료게임<br>
            </c:if>
             </span>
            
             <br>     
            <span style="font-size: 16px;">
            <c:if test="${gameVO.game_sale != 0}">
            판매가: 
            ${gameVO.game_sale}
            </c:if>
            </span>    
           </div>
         
         
         
        </div>
        
        <div style="border-top:solid 1px #999999; margin-top: 5px;padding-top: 10px; margin-bottom: 20px; padding-left: 10px;">
          <span style="font-size: 16px;" class="label label-danger">
          <c:if test="${gameVO.game_price != 0}">
          <fmt:formatNumber value="${((gameVO.game_price-gameVO.game_sale)/gameVO.game_price)}" type="percent"/>
          </c:if>
          <c:if test="${gameVO.game_price == 0}">
            무료게임
          </c:if>
          </span>
          <button class="btn btn-default btn-warning btn_cart pull-right" style="margin-right: 10px;">
          <span class="glyphicon glyphicon-shopping-cart" style="color: #FFFFFF; font-size: 13px; "></span>
           장바구니 담기</button>
        </div>
      </div>    
    </div>
    
    </td>
    <c:if test="${i%j == j-1}">
    </c:if>
    <c:set var="i" value="${i+1 }" />
    </c:forEach>
<tr>
<td  colspan='3' style=''>
    <div class="" style="text-align: right;">
      <a href="#">
        전체보기
      </a>
    </div>
    </td>
    
 </tr>
 </table>

<!-- 종료 -->    


 
