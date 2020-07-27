<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Unique Games - 연락처 수정</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
$(function() { // 자동 실행
	if(${cnt != null}){
		  $('#modal_panel_consumer').modal();  		
	}
  });
</script>
    
    
<script type="text/javascript">

$(function() { // 자동 실행
  
	  //---------------------이메일 * 표시 부분-----------------
	  var email =  "${consumerVO.consumer_email}".split('@');  
	  var re = /^(.{2})(.*)/;
	  var email_1  = re.exec(email[0]);
	  var email_2  = re.exec(email[1]);
	  var str4 = email_1[1] + email_1[2].replace(/./g, '*') + '@' +email_2[1] + email_2[2].replace(/./g, '*'); ;
	  $('#consumer_email_show').html(str4);

	    //-------------------전화번호 * 표시 부분------------------
	    var phone_num =  "${consumerVO.consumer_phone_num}".split('-');  
	    var re = /^(.{2})(.*)/;
	    var phone_num_0  = phone_num[0];
	    var phone_num_1  = re.exec(phone_num[1]);
	    var phone_num_2  = re.exec(phone_num[2]);
	    var marking_phone_num =phone_num_0+ '-'+ phone_num_1[1] + phone_num_1[2].replace(/./g, '*') + '-' +phone_num_2[1] + phone_num_2[2].replace(/./g, '*'); ;
	    $('#consumer_phone_num_show').html(marking_phone_num);
});

	function emaildivhide(){
		$('#emaildivshow').hide();
		$('#email_div').show();
	}
	function emaildivshow(){
		$('#emaildivshow').show();
		$('#email_div').hide();
	}
	function phonedivhide(){
		$('#phonedivshow').hide();
		$('#phone_div').show();
	}
	function phonedivshow(){
	  $('#phonedivshow').show();
	  $('#phone_div').hide();
	}
	  
    function validateEmail(email) {
        var re =/^([A-Za-z0-9._-]*@[a-zA-z0-9]+\.[a-zA-z0-9]+)$/
        return re.test(String(email).toLowerCase());
    }
    
    function ChangeMailDomain(obj) {
        CheckDuplicatedEmail();
      if (obj.value == "direct_input") {
        $("#email2").show();
      }
      else
        $("#email2").hide();
    }
    
    
    $("#consumer_id, #consumer_passwd, #consumer_passwd_confirm, #consumer_phone_num2, #consumer_phone_num3, #email1").bind("keypress", function (e) { 
        Events.PreventSpace(e);
      });

      // 숫자만 입력받을 수 있도록 keypress 이벤트로 등록
      $("#consumer_phone_num2, #consumer_phone_num3").bind("keypress", function (e) {
        Events.CheckDigit(e);
      });
    
    
    
	
    //-----------------------이메일 관련-------------------------------------
    
	   function CheckDuplicatedEmail(){
	        var emailValidateMessage_success = '변경 가능한 이메일입니다.';
	        var emailValidateMessage_duplicate= '이미 사용중인 이메일입니다.';
	        var emailValidateMessage_empty = '이메일 주소를 입력해 주세요.';
	        var emailValidateMessage_regex_error = '이메일 주소를 다시 확인해 주세요.';
	        
	        var email1 =  $('#email1').val();
	        var email2 =  $('#email2').val();
	        if( $('#ddlEmailDomain').val() != "direct_input") {
	            email2 = $('#ddlEmailDomain').val();
	        }
	        email1 = email1.trim();
	        email2 = email2.trim();
	        var email = email1 + "@" + email2;
	        $('#consumer_email').val(email);

	        if( (email1=='이메일'  || email1.length ==0) && email2.length ==0 ){
	            $('#email_duplicate_err').text(emailValidateMessage_empty);
	            $('#email_duplicate_err').show();
	            $('#email_validate_complete').hide();
	            return;
	            }
	       
	        if( !validateEmail(email1 + "@" + email2) || email1=='이메일' || email1 ==''){
	            $('#email_duplicate_err').text(emailValidateMessage_regex_error);
	            $('#email_duplicate_err').show();
	            $('#email_validate_complete').hide();
	            return;
	        }

	        var email = 'consumer_email='+ email1 + "@" + email2 ;
	        $.ajax({
	            type: "GET",
	            url: "./checkEmail.do",
	            data: email,
	            //contentType: "application/json; charset=utf-8",
	            dataType: "json",
	            success: function(result) {
	                if(result.cnt == 1){
	                    $('#email_duplicate_err').text(emailValidateMessage_duplicate);
	                    $('#email_duplicate_err').show();
	                    $('#email_validate_complete').hide();
	                    return;
	                } else{
	                    $('#email_duplicate_err').hide();
	                    $('#email_validate_complete').show();
	                    return;
	                }
	            },
	            error: function (XMLHttpRequest, textStatus, errorThrown) {
	                alert("죄송합니다. 잠시 후 다시 시도해 주십시오.");
	                return;
	            }
	        });
	        return;
	    }
	   
	   //----------------------전화번호 관련----------------------------------
	   
	    function CheckNumberWithKeyupEvent(obj){
	        var keycode = event.keyCode;
	   
	        if( !((48 <= keycode && keycode <=57) || (96 <= keycode && keycode <=105 ) ||
	               keycode == 46 || keycode == 8 || keycode == 32 || keycode == 9) ){
	          alert("숫자만 입력 가능합니다. 다시 입력해주세요");
	          $(obj).val("");
	        }
	        var consumer_phone_num1 =  $('#consumer_phone_num1').val();
	        var consumer_phone_num2 =  $('#consumer_phone_num2').val();
	        var consumer_phone_num3 =  $('#consumer_phone_num3').val();
	        var consumer_phone_num  = $('#consumer_phone_num1').val() + "-" + $('#consumer_phone_num2').val() + "-" + $('#consumer_phone_num3').val();
	        $('#consumer_phone_num').val(consumer_phone_num);
	     // select box Name로 접근하여 선택된 값 읽기
	     
	    Events.PreventSpace = function (e) {

        if (e.which && (e.which == 13 || e.which == 32)) {
          e.preventDefault();
        }
      }

      // 숫자만 입력받을 수 있도록 keypress 이벤트로 처리
      Events.CheckDigit = function (e) {

        if (e.which && (e.which > 47 && e.which < 58 || e.which == 8)) {

        }
        else {
          e.preventDefault();
        }
      }


	      }
  /* --------------------------------------------------------------------------- */
	    function consumer_update_send () {
	        // alert('삭제 진행');
	        // return;
	        
	        //var frm = $('#frm_consumer');  // Youtube 삭제 폼
	        var consumer_no = ${consumerVO.consumer_no };
	        var consumer_email = $('#consumer_email').val();
	        var params = 'consumer_no=' + consumer_no + '&consumer_email=' + consumer_email;
	        /* int consumer_no, String consumer_id , String consumer_nickname , String consumer_age */
	        $.ajax({
	          url: './update_contact1.do',
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
  
	      function consumer_update_send1 () {
	          // alert('삭제 진행');
	          // return;
	          
	          //var frm = $('#frm_consumer');  // Youtube 삭제 폼
	          var consumer_no = ${consumerVO.consumer_no };
	          var consumer_phone_num = $('#consumer_phone_num').val();
	          var params = 'consumer_no=' + consumer_no + '&consumer_phone_num=' + consumer_phone_num;
	          /* int consumer_no, String consumer_id , String consumer_nickname , String consumer_age */
	          $.ajax({
	            url: './update_contact2.do',
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











 <div style ="padding: 30px 0px;">
 <DIV style ="width: 80%; margin: 0px auto; height: auto; border: 1px solid #dadada;
    margin: 0px auto;
    padding: 20px 29px 30px;
    text-align: left;
    border: 1px solid #dadada;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    background: #fff;
    background-color: #1b2838;">
    <fieldset>
      <legend style ="margin-bottom: 0px; color: #c7d5e0;">연락처 수정</legend>
      <table style="position: relative; width: 100%; table-layout: fixed; border-spacing: 0; border-collapse: collapse; word-wrap: break-word; word-break: keep-all; border: 0; border-bottom: 1px solid #e5e5e5;">
      <tbody>
        <tr>
          <th scope="row" style="color: #333; border-right: 1px solid #e5e5e5; background-color: #1b2838;"><div style ="padding: 32px 31px 32px;">이메일</div></th>
          <td>
            <div style ="padding: 32px 31px 32px;">
              <div style = "position: relative; height: 100px;">
                 <span style="font-weight: bold; ">이메일 :</span> <span id="consumer_email_show"></span>
                 <p style ="line-height: 19px; padding-top: 10px; color: #8e8e8e; font-size: 9px;">아이디, 비밀번호 찾기 등 본인확인이 필요한 경우 또는 유료 결제 등 알림을 받을 때 사용할 이메일입니다.</p>
              </div>
              
               <div id="emaildivshow"><button  type="button" onclick="emaildivhide();" >수정</button></div>
				      <input type='hidden' name='consumer_no' id='consumer_no' value='${consumerVO.consumer_no }'>
				      <!-- 값이 실제로 들어옴 -->
				      <input type='hidden' name="consumer_email" id="consumer_email" value="" />
              <div id="email_div"style="display: none; width: 100%">
                <span style="font-weight: bold;">이메일 변경</span><br>
                
                <input name="email1" type="text" id="email1" autocomplete="off" onkeyup="CheckDuplicatedEmail();" placeholder="이메일" value="이메일" class="placeholder" onchange="CheckDuplicatedEmail();" style="width:100px; " onfocus="if(this.value == '이메일') {this.value ='';}" title="이메일" /> 
                  <span class="gol">@</span> 
                  <input name="email2" type="text" id="email2" title="이메일 계정 입력" onkeyup="CheckDuplicatedEmail();" onchange="CheckDuplicatedEmail();" style="width:100px; margin-right:7px; display:none;" />
                  <span id="email_span">
                    <select name="ddlEmailDomain" id="ddlEmailDomain" class="styled" onchange="ChangeMailDomain(this);" style="width:100px; height: 26px;">
                    <option value="naver.com" selected="selected">naver.com</option>
                    <option value="hanmail.net">hanmail.net</option>
                    <option value="daum.net">daum.net</option>
                    <option value="nate.com">nate.com</option>
                    <option value="gmail.com">gmail.com</option>
                    <option value="hotmail.com">hotmail.com</option>
                    <option value="direct_input">직접입력</option>
                  </select>
                  </span>

                                    <p style="display:none" class="txt01" id="email_validate_complete">변경 가능한 이메일입니다.</p>
                                    <p style="display:none; color: #ff4000;" class="txt02" id="email_duplicate_err"></p>    
                
                <!-- <p style ="line-height: 19px; padding-top: 10px; color: #8e8e8e; font-size: 9px;">변경할 이메일 주소를 입력해주세요.</p> -->
                <div style="margin-top: 10px;">
                <button type="button" onclick="consumer_update_send();">수정</button>
                <button type="button" onclick="emaildivshow();">수정취소</button>
                </div>        
              </div>
            </div>
          </td>
        </tr>
        <tr style ="border-top: 1px solid #dadada;">
          <th scope="row" style="color: #333; border-right: 1px solid #e5e5e5; background-color: #1b2838;"><div style ="padding: 32px 31px 32px;">전화번호</div></th>
          <td>
            <div style ="padding: 32px 31px 32px;">
              <div style = "position: relative; height: 100px;">
                <div><span style="font-weight: bold;">전화번호 :</span><span id = "consumer_phone_num_show"></span></div>
                <p style ="line-height: 19px; padding-top: 10px; color: #8e8e8e; font-size: 9px;">아이디, 비밀번호 찾기 등 본인확인이 필요한 경우 또는 유료 결제 등 알림을 받을 때 사용할 휴대전화입니다.</p>
              </div>
              
              <div id="phonedivshow"><button  type="button" onclick="phonedivhide();" >수정</button></div>
              <input type='hidden' name='consumer_no' id='consumer_no' value='${consumerVO.consumer_no }'>
              <!-- 값이 실제로 들어옴 -->
              <input type='hidden' name="consumer_phone_num" id="consumer_phone_num"  value="" />
              <div id="phone_div"style="display: none; ">
                <span style="font-weight: bold;">전화번호 변경</span><br>
                
                <span id="consumer_phone_num1_span">
                  <select name="consumer_phone_num1" id="consumer_phone_num1" required="required" class="styled" title="휴대폰 앞자리 선택" style="width:80px; height: 26px; margin-top: 1px;">
                    <option value="010">010</option>
                    <option value="011">011</option>
                    <option value="0130">0130</option>
                    <option value="016">016</option>
                    <option value="017">017</option>
                    <option value="018">018</option>
                    <option value="019">019</option>
                  </select>
                  </span>
                  <input type="text" id="consumer_phone_num1_temp" style="width:123px; display:none " title="선택된 휴대폰 앞자리" />
                  <span class="dash">-</span> 
                  <input name="consumer_phone_num2" type="text" autocomplete="off" id="consumer_phone_num2" style="width:100px;" maxlength="4" title="휴대폰 중간자리 입력" onkeyup="CheckNumberWithKeyupEvent(this);" /> <span class="dash">-</span> 
                  <input name="consumer_phone_num3" type="text" autocomplete="off" id="consumer_phone_num3" style="width:100px;" maxlength="4" title="휴대폰 뒷자리 입력" onkeyup="CheckNumberWithKeyupEvent(this);" />
                
                
                  <div style="margin-top: 10px;">
	                <button type="button" onclick="consumer_update_send1();">수정</button>
	                <button type="button" onclick="phonedivshow();">수정취소</button>                
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
 
 