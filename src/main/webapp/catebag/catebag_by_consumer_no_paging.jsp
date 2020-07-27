<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>장바구니</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <script type="text/javascript"> 
   /* $(function() { // 자동 실행
        // id가 'btn_send'인 태그를 찾아 'click' 이벤트 처리자(핸들러)로 send 함수를 등록
        $('#order_pay').on('click', send);  
        // document.getElementById('btn_send').addEventListener('click', send); 동일 
      });
 
   function send() {
   var params = $("#frm").serialize();
   //var params = 'catebag_catebagno=' +checkOne;
    //alert(params);
    //return;  
    $.ajax({ 
     url: '/team5/pay/create.do',
     type: 'post', 
     cache: false,
     async: true, 
     dataType: 'json',
     data:  params,
     success: function(rdata) {
       //alert(rdata)
       var msg ="";
       //alert('rdata.order_cnt:' +rdata.order_cnt) //rdata.cnt가 undefind가 나오는 이유는 catabag_catebagno 가 없다.
       //return;
       if(rdata.order_cnt == rdata.order_cnt) {
         var sw = confirm('결재 하시겠습니까?\n결재 화면으로 이동합니다.');
         if(sw == true) {
           location.href="http://172.16.12.87:9090/team5/pay/pay_by_consumer_no.do"
         } else {
           location.reload();
         }
       }
      },
   // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR request.status: '+request.status + '/ ' + error;
        console.log(msg); // Chrome에 출력
      }   
    });
   } */

 function delete_cate(catebag_catebagno, nowPage) {
   var sw = confirm("파일을 삭제 하시겠습니까?");
   if (sw == true) {
     location.href="./delete.do?catebag_catebagno="+catebag_catebagno+"&nowPage="+nowPage;
   } else {
     alert('파일 삭제를 취소합니다.');
   }
  }
  
 function delete_consumer_file(catebag_catebagno, nowPage) {
    var sw = confirm("파일을 전체 삭제 하시겠습니까?");
    if (sw == true) {
      location.href="./delete_consumer.do?catebag_catebagno="+catebag_catebagno+"&nowPage="+nowPage;
    } else {
      alert('파일 삭제를 취소합니다.');
    }
   }
  
  
 function upup(catebag_catebagno, nowPage, catebag_cnt) {
    var sw = confirm("수량을 추가 하시겠습니까?");
    if (sw == true) {
      location.href="update_cnt_up.do?catebag_catebagno="+catebag_catebagno+"&nowPage="+nowPage+"&catebag_cnt="+catebag_cnt;
    } else {
      alert('수량 추가를 취소합니다.');
    }
   }
  
 function downdown(catebag_catebagno, nowPage, catebag_cnt) {
     var sw = confirm("수량을 하향 하시겠습니까?");
     if (sw == true) {
       location.href="update_cnt_down.do?catebag_catebagno="+catebag_catebagno+"&nowPage="+nowPage+"&catebag_cnt="+catebag_cnt;
     } else {
       alert('수량 하향를 취소합니다.');
     }
    }  
 
 
</script>
 
<style type="text/css">

.table .table {
    background-color: #1b2838;
}

</style> 
</head>
<body>
 <jsp:include page="/menu/top3.jsp" flush='false' />  
  <table style="width: 1300px; border: solid 1px #000000; 
  border-collapse: collapse;">
  
  <TR>
    <td style='height: 100px; border: solid 1px #000000; width: 190px;'>
    <fieldset class='categrp_cate_left' >
    <table style="width : 150px; border: solid 1px #000000; 
      border-collapse: collapse; position: absolute; top: 250px; left: 190px;" class='categrp_cate__left'> 
     <tr>
       <th style="padding : 2px; padding-top: 8px; ">
       <a href = "http://localhost:9090/team5/catebag/catebag_by_consumer_no.do">
              장바구니
       </a>
       </th>
     </tr>    
     <tr>
       <th style="padding : 2px; padding-top: 8px; ">
       <a href = "http://localhost:9090/team5/wishlist/game_by_consumer_no.do">   
             위시리스트
       </a>
       </th>
     </tr>
     <tr>
       <th style="padding : 2px; padding-top: 8px; ">
       <a href ="http://localhost:9090/team5/pay/pay_by_consumer_no.do">
              결재내역</a></th>
     </tr>    
    </table>
    </fieldset> 
    </td>
    
    <td rowspan = "2;" style='height: 500px; border: solid 1px #000000;'>
     <ASIDE style='float: center;'>
      <h2>장바구니</h2>
      
        
      
      <p style="text-align: left; color: red;" >※ 구매 할 상품을 선택하고 선택구매 버튼을 누르시면 됩니다.</p>
          
              
     </ASIDE>
     <ASIDE style='float: right;'>
      
      <span class='top_menu_sep'>&nbsp;</span>
      <A href="javascript:location.reload();">새로고침</A>
      <%-- <span class='top_menu_sep'>&nbsp;</span> 
      <A href="./create.do?cateno=${cateVO.cateno } ">등록</A> --%>
     </ASIDE> 
     
     
     <FORM name='frm' id='frm' class="form-horizontal" method='get' action='../pay/create.do'>
     <button type="submit" id="order_pay">선택 구매</button> 
        
       
        
            
      <table class="table table-borderless table-dark" style='width: 100%; margin-bottom: 150px'>
       <colgroup>     
        <col style="width: 5%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 12%;"></col>
        <col style="width: 18%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
       </colgroup>
       <%-- table 컬럼 --%>
       <thead>
        <tr>                
         <th style='text-align: center;'> 
          <div class="allCheck">
           <input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck" ></label>  
           <script>
            $("#allCheck").click(function(){
            var chk = $("#allCheck").prop("checked");
            if(chk) {
             $(".checkOne").prop("checked", true);
            } else {
             $(".checkOne").prop("checked", false);
            } 
          });
            </script>
                            
          </div>
         </th> 
         <th style='text-align: center;'>이미지</th>
         <th style='text-align: center;'>상품명</th>
         <th style='text-align: center;'>개발사</th> 
         <th style='text-align: center;'>수량</th>           
         <th style='text-align: center;'>가격</th>     
         <th style='text-align: center;'>할인 가격</th>     
         <th style='text-align: center;'>합계</th>
         <th style='text-align: center;'>비고</th>
        </tr>    
       </thead>
       <%-- table 내용 --%>
        <tbody>
         <c:forEach var="game_Catebag_VO" items="${list }">
          <c:set var="game_gameno" value="${game_Catebag_VO.game_gameno }" />
          <c:set var="game_title" value="${game_Catebag_VO.game_title }" />
          <c:set var="game_writing" value="${game_Catebag_VO.game_writing }" />                   
          <c:set var="game_release" value="${game_Catebag_VO.game_release }" />
          <c:set var="game_developer" value="${game_Catebag_VO.game_developer }" />
          <c:set var="game_price" value="${game_Catebag_VO.game_price }" />
          <c:set var="game_image" value="${game_Catebag_VO.game_image }" />          
          <c:set var="game_sale" value="${game_Catebag_VO.game_sale }" />          
          <!--catebag내용  -->
          <c:set var="catebag_catebagno" value="${game_Catebag_VO.catebag_catebagno }" />
          <c:set var="catebag_date" value="${game_Catebag_VO.catebag_date }" />
          <c:set var="catebag_seqno" value="${game_Catebag_VO.catebag_seqno }" />
          <c:set var="catebag_cnt" value="${game_Catebag_VO.catebag_cnt }" />
          <c:set var="catebag_sum" value="${game_Catebag_VO.catebag_sum }" />                    
          <c:set var="sum" value="${catebag_cnt * game_price}"></c:set>
          <c:set var="catebag_sum" value="${sum}"></c:set>                        
          <c:set var="point_save" value="${tot*0.01}"></c:set>                        
        <tr>                       
         <td style='text-align: center;'>
                                         
          
          <input type="checkbox" id="checkOne" name="checkOne" class="checkOne" value="${catebag_catebagno} "/>
          <script>
           $(".checkOne").click(function(){
           $("#allCheck").prop("checked", false);
           });
          </script>
         </td>
         <td style= 'vertical-align: middle; text-align: center;'>
              <c:choose>
                <c:when test="${game_image.endsWith('jpg') || game_image.endsWith('png') || game_image.endsWith('gif') || game_image.endsWith('bmp')}">
                  <IMG src="../game/storage/images/${game_image }" style="width: 99.5%; height: 81px; margin: 0.8px;"> 
                </c:when>
                <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                  ${game_image}
                </c:otherwise>
              </c:choose>
            </td> 
         <td style='text-align: center; vertical-align: middle;'>${game_title}</td>
         <td style='text-align: center; vertical-align: middle;'>${game_developer}</td>
         <td style='text-align: center; vertical-align: middle;'>
          <%-- <A href="./update_cnt_up.do?catebag_catebagno=${catebag_catebagno }"><span class="glyphicon glyphicon-arrow-up"></span></A> --%>
          <a href="javascript:upup(${catebag_catebagno}, ${nowPage }, ${catebag_cnt})"><span class="glyphicon glyphicon-arrow-up"></span></a>
          <input type='number' name='catebag_cnt' value='${catebag_cnt}' readonly style='width: 30%; text-align: center'>
          <%-- <A href="./update_cnt_down.do?catebag_catebagno=${catebag_catebagno }"><span class="glyphicon glyphicon-arrow-down"></span></A>  --%> 
          <a href="javascript:downdown(${catebag_catebagno}, ${nowPage }, ${catebag_cnt} )"><span class="glyphicon glyphicon-arrow-down"></span></a>    
         </td>
         <td style='text-align: center; vertical-align: middle;'>${game_price}</td>          
         <td style='text-align: center; vertical-align: middle;'>${game_sale}</td>          
         <td style='text-align: center; vertical-align: middle;'>${catebag_sum}</td>          
         <td style='text-align: center; vertical-align: middle;'>
          <%-- <a href="./delete.do?attachfileno=${attachfileVO.attachfileno}"><img src="./images/delete.png" title="삭제"  border='0' /></a> --%>
           <a href="javascript:delete_cate(${catebag_catebagno}, ${nowPage })"><img src="./images/delete.png" title="삭제"  border='0' /></a>                    
         </td>                 
        </tr>
         </c:forEach>     
        </tbody>  
        <tfoot>
         <tr>
          <td colspan = "9">
           <table class='table table-borderless' style= 'width: 100%; margin-bottom: 150px;  background-color: #ff000;'>
            <colgroup>          
            
             <col style="width: 5%;"></col>
             <col style="width: 5%;"></col>
             <col style="width: 10%;"></col>
             <col style="width: 12%;"></col>
             <col style="width: 23%;"></col>
             <col style="width: 15%;"></col>
             <col style="width: 10%;"></col>
             <col style="width: 10%;"></col>
             <col style="width: 10%;"></col>
            </colgroup>
            <%-- table 컬럼 --%>
            <thead>
             <tr>
             <th style='text-align: center;'></th> 
              <th colspan = "2"></th>
              <th  style='text-align: center;'></th>    
              <th colspan = "2" style='text-align: center;'></th>         
              <th style='text-align: center;'>주문금액</th>                       
              <th colspan = "2" style='text-align: center;'>${tot} 원</th>           
             </tr>                 
            </thead>            
           </table>
           <DIV class='bottom_menu'>${paging }</DIV>                
          </td>
         </tr> 
        </tfoot>                             
      </table> 
      </FORM>       
     </td> 
    <td style='border: solid 1px #000000;'></td>
  </TR>
  </table>
 <jsp:include page="/menu/bottom.jsp" flush='false' />
</body> 
</html>


 