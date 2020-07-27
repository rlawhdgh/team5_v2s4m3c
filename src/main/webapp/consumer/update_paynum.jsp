<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Unique Games - 결제정보 수정</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> 
    
<script type="text/javascript">

   
	 $(function(){
		 var paynum =  "${consumerVO.consumer_pay_num}".split(',');
		 $('#consumer_pay_bank').html(paynum[0]);
		 $('#consumer_pay_num').html(paynum[1]);
		 $('#bank').val(paynum[0]);
		 $('#consumer_paynum_show').val(paynum[1]);
		 
		 
	 });
	   
/*  function submit_process(){
   var allpaynum = $('#bank').val() +',' + $('#consumer_paynum_show').val();
   $('#consumer_allpaynum').val(allpaynum);
   $('#consumer_update_send').click();
 } */
  
  
 function divhide(){
   $('#paydivshow').hide();
   $('#pay_div').show();
 }
 function paydivshow(){
   $('#paydivshow').show();
   $('#pay_div').hide();
 }

 /* --------------------------------------------------------------------------- */
 function consumer_update_send () {
	    var consumer_allpaynum = $('#bank').val() +',' + $('#consumer_paynum_show').val();
      var consumer_no = ${consumerVO.consumer_no };
      var params = 'consumer_no=' + consumer_no + '&consumer_allpaynum=' + consumer_allpaynum;
      //alert(params);
      /* int consumer_no, String consumer_id , String consumer_nickname , String consumer_age */
       $.ajax({
        url: './update_paynum_proc.do',
        type: 'POST',  // post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
          if (rdata.cnt == 1){
            $('#body').html("수정이 완료되었습니다.");
            $('#consumer_update_modal').modal(); 
          }else{
            $('#body').html("수정에 실패했습니다.");
            $('#consumer_update_modal').modal();
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
    }
</script>
</head> 
 
<body>
<jsp:include page="/menu/top3.jsp" />

  <!-- Modal  시작 -->
  <div class="modal fade" id="consumer_update_modal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close"  onclick="location.reload();" data-dismiss="modal">×</button>
          <h4 class="modal-title">알림</h4><!-- 제목 -->
        </div>
        <div class="modal-body" id="body">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" onclick="location.reload();" data-dismiss="modal">확인</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal   종료 -->

<div style='padding: 30px 0px;'>
 <DIV style ="width: 80%; margin: 0px auto; height: auto; border: 1px solid #dadada;
    margin: 0px auto;
    padding: 20px 29px 30px;
    text-align: left;
    border: 1px solid #dadada;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    background: #fff;
    background-color: #1b2838;
    ">
    <fieldset>
      <legend style ="margin-bottom: 0px; color: #c7d5e0;" >계좌정보 수정</legend>
      <input type='hidden' name='consumer_no' id='consumer_no' value='${consumerVO.consumer_no }'>
      <!-- 값이 실제로 들어옴 -->
      <input type='hidden' name='consumer_allpaynum' id='consumer_allpaynum' value=''>
      <button type="submit" id="submit" style ="display: none;"></button>
      <!-- <input type='hidden' name="consumer_pay_num" id="consumer_pay_num"  value="" /> -->
      <table style="position: relative; width: 100%; table-layout: fixed; border-spacing: 0; border-collapse: collapse; word-wrap: break-word; word-break: keep-all; border: 0; border-bottom: 1px solid #e5e5e5;">
      <tbody>
        <tr >
          <th scope="row" style="color: #333; border-right: 1px solid #e5e5e5; background-color: #1b2838;"><div style ="padding: 32px 31px 32px;">계좌정보</div></th>
          <td>
            <div style ="padding: 32px 31px 32px;">
              <span  style="font-weight: bold; " >은행명 :</span> <span id="consumer_pay_bank"></span>
              <div style = "position: relative; height: 100px;">
                 <span style="font-weight: bold; ">계좌번호 :</span> <span id="consumer_pay_num"></span>
                 <p style ="line-height: 19px; padding-top: 10px; color: #8e8e8e; font-size: 9px;">결제를 위한 정보를 수정합니다.</p>
              </div>
              
               <div id="paydivshow"><button type="button" onclick="divhide();" >수정</button></div>
               
              <div id="pay_div"style="display: none; width: 100%">
                <!-- <p style ="line-height: 19px; padding-top: 10px; color: #8e8e8e; font-size: 9px;">변경할 이메일 주소를 입력해주세요.</p> -->
                <span style="font-weight: bold;">계좌번호 변경</span><br>
                <span id="consumer_pay_bank_span">
                  <select name="bank" id="bank" class="styled"  style="width:100px; height: 26px;">
                    <option value="우리은행" selected="selected">우리은행</option>
                    <option value="국민은행">국민은행</option>
                    <option value="기업은행">기업은행</option>
                    <option value="농협은행">농협은행</option>
                    <option value="신한은행">신한은행</option>
                    <option value="씨티은행">씨티은행</option>
                    <option value="하나은행">하나은행</option>
                  </select>
                  </span>
                  <span style="font-weight: bold; ">계좌번호 :</span> <input id="consumer_paynum_show" autocomplete="off" value=""/> 
                  <div style="margin-top: 10px;">
                  <button type="button" onclick="consumer_update_send();">수정</button>
                  <!-- <button type="button" onclick="submit_process();">수정</button> -->
                  <button type="button" onclick="paydivshow();">수정취소</button>                
                  </div>
                </div>
              
            </div>
          </td>
        </tr>
      </tbody>
      </table>
    </fieldset>
  </DIV>
</div>  

<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 