<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>Unique Games - 회원 찾기</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
<script type="text/javascript">

$(function() { // 자동 실행

 	if(${param.id_cnt != null}){
		$('#modal_panel_id').modal();  		
	}
	if(${param.passwd_cnt != null}){
		$('#modal_panel_passwd').modal();     
	}
  });
</script>

<script type="text/javascript">
   
    
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
    
    function ChangeMailDomain_id(obj) {
        CheckDuplicatedEmail_id();
      if (obj.value == "direct_input") {
        $("#email_id1").show();
      }
      else
        $("#email_id2").hide();
    }
    
    
    $("#consumer_id, #consumer_passwd, #consumer_passwd_confirm, #consumer_phone_num2, #consumer_phone_num3, #email1").bind("keypress", function (e) { 
        Events.PreventSpace(e);
      });

      // 숫자만 입력받을 수 있도록 keypress 이벤트로 등록
      $("#consumer_phone_num2, #consumer_phone_num3").bind("keypress", function (e) {
        Events.CheckDigit(e);
      });
    
    
    //---------------------아이디 관련------------------------------------
      function Change_IDForm(obj) {
    	


          $(obj).addClass('focus');
          if ($(obj).hasClass('incorrect') || $(obj).hasClass('usable')) {
            $('#enter-guide').hide();
          }
          else {
            $('#enter-guide').show();
          }
          CheckIDValidation(obj);

        }
      
      function FocusIn_IDForm(obj) {
        if (obj.value == '아이디')
          obj.value = '';

        $(obj).addClass('focus');
        if ($(obj).hasClass('incorrect') || $(obj).hasClass('usable')) {
          $('#enter-guide').hide();
        }
        else {
          $('#enter-guide').show();
        }
        CallbackIDCheck();
      }

      function FocusOut_IDForm(obj) {
        $(obj).removeClass('focus');
        $('#enter-guide').hide();
        CheckIDValidation(obj);
      }

	 ////// 사용자ID 유효성 체크 ////////////

    /*[입력한 ID 유효성 검사 후 중복확인 팝업 표시] membersignup.js에 있는 함수의 수정 버젼*/
    function CheckID(TextBoxControl, valueReset, messageControl)
    {
      inputValue = TextBoxControl.value.replace(/ /g, "") ;
      if (inputValue.length ==0)
      {
        messageControl.innerHTML ="사용자 아이디를 입력하세요.";  // 실제로는 노출되지 않는다.
        if(valueReset){TextBoxControl.value="";}
        //TextBoxControl.focus();
        return false;
      }
      //1.입력값체크
      if(inputValue.replace(/[A-Za-z0-9]/g,"").length!=0){
        messageControl.innerHTML ="아이디는 영문, 숫자만 사용하실 수 있습니다.";
        $("#consumer_id").val("");
        if(valueReset){TextBoxControl.value="";}
        //TextBoxControl.focus();
        return false;
      }
    
      //1.공백문자체크
      if(TextBoxControl.value.indexOf(' ') >= 0)
      {
        messageControl.innerHTML = "아이디에 띄어쓰기는 사용할 수 없습니다.";
        TextBoxControl.value = TextBoxControl.value.replace(/ /g, "") ;
        //TextBoxControl.focus();
  
        return false;
      }

      //2.길이체크
      if (inputValue.length < 4 || inputValue.length > 12) {
        messageControl.innerHTML ="아이디는 4~12자를 사용해 주세요.";
        $("#consumer_id").val("");
        if(valueReset){TextBoxControl.value="";}
        //TextBoxControl.focus();
        return false;
      }
      return true;
    }
          
    // 타이머 콜백 - ID체크용 
    var previousTick = 0;
    var remainTick = 0;
    var eventSignal = false;
    function CallbackIDCheck() {
      eventSignal = false;
      var inputForm = document.getElementById("consumer_id");
      // 포커스가 없거나 remainTick이 0이면 타이머콜백 종료
      if (!($(inputForm).hasClass('focus')) || remainTick == 0)
        return;
      var currentTick = new Date().getTime();
      var elapsedTick = currentTick - previousTick;
      remainTick -= elapsedTick;
      if(remainTick <= 0)
      {
        remainTick = 0;
        CheckIDValidation(inputForm);
        //$("#tickcount").text("[DEBUG MSG]tickcount=" + currentTick + " elapsedTick="+elapsedTick+" remainTick="+remainTick); // 디버그 메세지
        return;
      }
      //$("#tickcount").text("[DEBUG MSG]tickcount=" + currentTick + " elapsedTick=" + elapsedTick + " remainTick=" + remainTick); // 디버그 메세지
      previousTick = currentTick;

      // 포커스를 가지고 있다면 다시 타이머 콜백 세팅
      if ($(inputForm).hasClass('focus') && !eventSignal) {
        setTimeout("CallbackIDCheck()", 100);
        eventSignal = true;
      }
    }

    //남은 시간을 재설정 - 타이머 콜백 세트
    function SetTickCount(milliSec) {
      remainTick = milliSec;
      previousTick = new Date().getTime();
      if(!eventSignal)
        setTimeout("CallbackIDCheck()", 100);
    }
    
    // 서버에 유효성 체크 요청(AJAX) - 타이머 콜백
    function CheckIDValidation(obj) {
      CheckDuplicatedEmail_id();
      // 결과 처리는 비동기 호출이므로 우선 입력폼을 노멀 상태로 세팅
      var current = $('#consumer_id');
      current.removeClass('incorrect');
      current.removeClass('usable');
      $('#enter-guide').hide();
      $('#txt03').hide();
      $('#txt04').hide();

      // 공란일때는 기본 안내 메세지 출력
      if (obj.value == '')
      {
        $('#enter-guide').show();
        return;
      }

      if (!CheckID(obj, false, $('#txt04').get(0))) {
        $('#consumer_id').addClass('incorrect');
        $('#txt04').show();       
        return;
      }     
      var inArg = 'consumer_id=' +obj.value;
      $.ajax({
        type: "GET",
        url: './checkID.do',
        data: inArg,
        //contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function(result) {
          switch (result.cnt) {
            case 0: 
              current.addClass('usable');
              $('#txt03').show();
              break;              
            case 1: 
              $('#txt04').text("존재하는 아이디입니다.");
              current.addClass('incorrect');
              $('#txt04').show();
              break;  
            default:                
              alert(result.cnt);
              alert(typeof (result.cnt));
              break;
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
          alert("죄송합니다. 잠시 후 다시 시도해 주십시오.");
          return;
        }
      });
      
    //  var inArg = { memberID: obj.value };
    //  var settings = {
    //    type: "POST",
    //    url: "SignupIndivisualEasy.aspx/CheckIDValidation",
    //    contentType: "application/json; charset=utf-8",
    //    data: JSON.stringify(inArg),
    //    dataType: "json"
    //  };

    //  settings.success = function (result) {
    //    switch (result.d) {
    //      case "IDCHECK_INVALID":
    //      case "IDCHECK_DUPLICATED":
    //        $('.info-enter .info-cont ul .enterid_area .txt02').text("이미 사용중인 아이디입니다.");
    //        current.addClass('incorrect');
    //        $('.info-enter .info-cont ul .enterid_area .txt02').show();
    //        break;
          //case "IDCHECK_CANNOT_USE_ANYMORE":
    //      case "IDCHECK_NOCELLPHONE":
    //        $('.info-enter .info-cont ul .enterid_area .txt02').text("사용 불가능한 아이디입니다.");
    //        current.addClass('incorrect');
    //        $('.info-enter .info-cont ul .enterid_area .txt02').show();
    //        break;
    //      case "IDCHECK_GOOD":
    //        current.addClass('usable');
    //        $('.info-enter .info-cont ul .enterid_area .txt01').show();
    //        break;
    //      default:
    //        $('.info-enter .info-cont ul .enterid_area .enter-guide').show();
    //        break;
    //    }

    //  };
    //  $.ajax(settings);
    }
	

      
      
      
  
    //-----------------------이메일 관련-------------------------------------
    
     function CheckDuplicatedEmail(){
          var emailValidateMessage_success = '이름과 이메일이 일치합니다.';
          var emailValidateMessage_duplicate= '이미 사용중인 이메일입니다.';
          var emailValidateMessage_empty = '이메일 주소를 입력해 주세요.';
          var emailValidateMessage_regex_error = '이메일 주소를 다시 확인해 주세요.';
          var emailValidateMessage_mustname = '이름을 입력해 주세요.';
          
          var consumer_name = $('#consumer_name').val();
          var email1 =  $('#email1').val();
          var email2 =  $('#email2').val();
          
          if( $('#ddlEmailDomain').val() != "direct_input") {
              email2 = $('#ddlEmailDomain').val();
          }
          email1 = email1.trim();
          email2 = email2.trim();
          var email = email1 + "@" + email2;

          if( (email1=='이메일'  || email1.length ==0) && email2.length ==0 ){
              $('#email_duplicate_err').text(emailValidateMessage_empty);
              $('#submit').removeClass('success');
              $('#email_duplicate_err').show();
              $('#email_validate_complete').hide();
              return;
              }
          
          if(consumer_name == null){
        	  $('#email_duplicate_err').text(emailValidateMessage_mustname);
        	  $('#submit').removeClass('success');
        	  $('#email_validate_complete').hide();
          }
         
          if( !validateEmail(email1 + "@" + email2) || email1=='이메일' || email1 ==''){
              $('#email_duplicate_err').text(emailValidateMessage_regex_error);
              $('#submit').removeClass('success');
              $('#email_duplicate_err').show();
              $('#email_validate_complete').hide();
              return;
          }

          
          var data = 'consumer_email='+ email1 + "@" + email2 +'&consumer_name='+ consumer_name;
          $.ajax({
              type: "GET",
              url: "./matchNameEmail.do",
              data: data,
              //contentType: "application/json; charset=utf-8",
              dataType: "json", 
              success: function(result) {
                  if(result.cnt == 1){
                      $('#email_duplicate_err').text(emailValidateMessage_success);
                      $('#email_duplicate_err').show();
                      $('#email_validate_complete').hide();
                      $('#consumer_email').val(email);
                      $('#submit').addClass('success');
                      return;
                  } else{
                      $('#email_duplicate_err').hide();
                      $('#submit').removeClass('success');
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
    
    
    
    
    
    
     function CheckDuplicatedEmail_id(){
         var emailValidateMessage_success = '아이디와 이메일이 일치합니다.';
         var emailValidateMessage_duplicate= '이미 사용중인 이메일입니다.';
         var emailValidateMessage_empty = '이메일 주소를 입력해 주세요.';
         var emailValidateMessage_regex_error = '이메일 주소를 다시 확인해 주세요.';
         var emailValidateMessage_mustname = '아이디을 입력해 주세요.';
         
         var consumer_id = $('#consumer_id').val();
         var email1 =  $('#email_id1').val();
         var email2 =  $('#email_id2').val();
         
         if( $('#ddlEmailDomain_id').val() != "direct_input") {
             email2 = $('#ddlEmailDomain_id').val();
         }
         email1 = email1.trim();
         email2 = email2.trim();
         var email = email1 + "@" + email2;

         if( (email1=='이메일'  || email1.length ==0) && email2.length ==0 ){
             $('#email_duplicate_err_id').text(emailValidateMessage_empty);
             $('#submit1').removeClass('success');
             $('#email_duplicate_err_id').show();
             $('#email_validate_complete_id').hide();
             return;
             }
         
         if(consumer_name == null){
           $('#email_duplicate_err_id').text(emailValidateMessage_mustname);
           $('#submit1').removeClass('success');
           $('#email_validate_complete_id').hide();
         }
        
         if( !validateEmail(email1 + "@" + email2) || email1=='이메일' || email1 ==''){
             $('#email_duplicate_err_id').text(emailValidateMessage_regex_error);
             $('#submit1').removeClass('success');
             $('#email_duplicate_err_id').show();
             $('#email_validate_complete_id').hide();
             return;
         }

         
         var data = 'consumer_email='+ email1 + "@" + email2 +'&consumer_id='+ consumer_id;
         $.ajax({
             type: "GET",
             url: "./matchIdEmail.do",
             data: data,
             //contentType: "application/json; charset=utf-8",
             dataType: "json", 
             success: function(result) {
                 if(result.cnt == 1){
                     $('#email_duplicate_err_id').text(emailValidateMessage_success);
                     $('#email_duplicate_err_id').show();
                     $('#email_validate_complete_id').hide();
                     $('#consumer_email1').val(email);
                     $('#submit1').addClass('success');
                     return;
                 } else{
                     $('#email_duplicate_err_id').hide();
                     $('#submit1').removeClass('success');
                     $('#email_validate_complete_id').show();
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
    

     function submitproc(){
    	 if($('#submit').hasClass('success')){
    		 $('#submit').click();
    	 }
     }
     
     function submitproc1(){
         if($('#submit1').hasClass('success')){
           $('#submit1').click();
         }
       }
     
     
     
     
     
  
</script>
</head>

<body>
	<jsp:include page="/menu/top3.jsp" />
	
	
	  <!--  id Modal  시작 -->
  <div class="modal fade" id="modal_panel_id" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">알림</h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <c:choose>
            <c:when test="${param.id_cnt == 1}">
              <div>메일로 아이디를 발송했습니다.</div>
            </c:when>
            <c:otherwise>
              <div>처리에 실패했습니다. 다시 시도해주세요.</div>
            </c:otherwise>
          </c:choose>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">확인</button> 
        </div>
      </div>
    </div>
  </div> <!-- id Modal   종료 -->
  
      <!--  passwd Modal  시작 -->
  <div class="modal fade" id="modal_panel_passwd" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">알림</h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <c:choose>
            <c:when test="${param.passwd_cnt == 1}">
              <div>메일로 임시 비밀번호를 발송했습니다.</div>
            </c:when>
            <c:otherwise>
              <div>처리에 실패했습니다. 다시 시도해주세요.</div>
            </c:otherwise>
          </c:choose>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" onclick="../index.jsp" data-dismiss="modal">확인</button>
          
        </div>
      </div>
    </div>
  </div> <!-- passwd Modal   종료 -->
	
	
	
	
	
	
	
	
	<div style="padding: 30px 0px;">
		<DIV
			style="width: 80%; margin: 0px auto; height: auto; border: 1px solid #dadada; margin: 0px auto; padding: 20px 29px 30px; text-align: left; border: 1px solid #dadada; -webkit-border-radius: 2px; border-radius: 2px; background: #fff; background-color: #1b2838;">
			<fieldset>
				<legend style="margin-bottom: 0px; color: #c7d5e0;">회원정보 찾기</legend>
				<FORM name='frm' method='POST' action='./sendmail.do'
					class="form-horizontal">
					<input type='hidden' name="consumer_email" id="consumer_email"
						value="" />
					<table
						style="position: relative; width: 100%; table-layout: fixed; border-spacing: 0; border-collapse: collapse; word-wrap: break-word; word-break: keep-all; border: 0; border-bottom: 1px solid #e5e5e5;">
						<tbody>
							<tr>
								<th scope="row"
									style="color: #333; border-right: 1px solid #e5e5e5; background-color: #1b2838;"><div
										style="padding: 32px 31px 32px;">아이디 조회</div></th>
								<td>
									<div style="padding: 32px 31px 32px;">
										<div style="position: relative; height: 40px;">
											<span style="font-weight: bold;">이름 : </span> <input
												id="consumer_name" name="consumer_name" autocomplete="off"
												onkeyup="CheckDuplicatedEmail();" placeholder="이름"
												style="width: 230px; height: 26px;" />
										</div>
										<div>
											<span style="font-weight: bold;">이메일 : </span> <input
												name="email1" type="text" id="email1"
												onkeyup="CheckDuplicatedEmail();" autocomplete="off"
												required="required" placeholder="이메일" class="placeholder"
												onchange="CheckDuplicatedEmail();" style="width: 120px;"
												title="이메일" /> <span class="gol">@ </span> <input
												name="email2" type="text" id="email2" title="이메일 계정 입력"
												onkeyup="CheckDuplicatedEmail();"
												onchange="CheckDuplicatedEmail();"
												style="width: 123px; margin-right: 7px; height: 28px; display: none;" />
											<span id="email_span"> <select name="ddlEmailDomain"
												id="ddlEmailDomain" class="styled"
												onchange="ChangeMailDomain(this);"
												style="width: 136px; height: 26px;">
													<option value="">선택</option>
													<option value="naver.com">naver.com</option>
													<option value="hanmail.net">hanmail.net</option>
													<option value="daum.net">daum.net</option>
													<option value="nate.com">nate.com</option>
													<option value="gmail.com">gmail.com</option>
													<option value="hotmail.com">hotmail.com</option>
													<option value="direct_input">직접입력</option>
											</select>
											</span>
											<p style="display: none; color: #ff4000;" class="txt01"
												id="email_validate_complete">이름과 이메일이 일치하지 않습니다.</p>
											<p style="display: none;" class="txt02"
												id="email_duplicate_err"></p>
											<p
												style="line-height: 19px; padding-top: 10px; color: #8e8e8e; font-size: 9px;">클릭시 이메일주소로 아이디를 발송합니다.</p>
										</div>

										<div>
											<button type="button" onclick="submitproc();">찾기</button>
										</div>
										<div>
											<button id="submit" type="submit" style="display: none;">찾기</button>
										</div>

									</div>
								</td>
							</tr>
					</table>
				</FORM>


				<FORM name='frm1' method='POST' action='./sendmail2.do'
					class="form-horizontal">
					<!-- 값이 실제로 들어옴 -->
					<input type='hidden' name="consumer_email" id="consumer_email1"
						value="" />
					<table
						style="position: relative; width: 100%; table-layout: fixed; border-spacing: 0; border-collapse: collapse; word-wrap: break-word; word-break: keep-all; border: 0; border-bottom: 1px solid #e5e5e5;">
						<tbody>
							<tr>
								<th scope="row"
									style="color: #333; border-right: 1px solid #e5e5e5; background-color: #1b2838;"><div
										style="padding: 32px 31px 32px;">비밀번호 변경</div></th>
								<td>
									<div style="padding: 32px 31px 32px;">
										<div style="position: relative; height: 40px;">
											<span style="font-weight: bold;">아이디 : </span><input
												name="consumer_id" autocomplete="off" type="text"
												id="consumer_id" onkeyup="SetTickCount(1000);"
												placeholder="아이디" value="아이디" maxlength="12"
												class="enter-id placeholder" onfocus="FocusIn_IDForm(this);"
												onblur="FocusOut_IDForm(this)"
												style="width: 230px; height: 26px;" title="아이디" />
											<!--onfocus="FocusIn_IDForm(this);"  -->
											<p id="enter-guide" class="enter-guide"
												style="font-size: 12px; margin-top: 5px;">띄어쓰기 없이 영문과 숫자를 혼합하여 4~12자를 사용할 수 있습니다.</p>
											<p id="txt03" class="txt03"
												style="display: none; color: #ff4000; font-size: 12px; margin-top: 5px;">존재하지 않는 아이디입니다.</p>
											<!-- 사용가능한 아이디인 경우 -->
											<p id="txt04" class="txt04"
												style="display: none; font-size: 12px; margin-top: 5px;">존재하는
												아이디입니다.</p>
											<!-- 아이디가 조건에 맞지않는 경우 -->
										</div>
										<div style="padding-top: 15px;">
											<span style="font-weight: bold;">이메일 : </span> <input
												name="email_id1" type="text" id="email_id1"
												onkeyup="CheckDuplicatedEmail_id();" autocomplete="off"
												required="required" placeholder="이메일" class="placeholder"
												onchange="CheckDuplicatedEmail_id" style="width: 120px;"
												title="이메일" /> <span class="gol">@ </span> <input
												name="email_id2" type="text" id="email_id2"
												title="이메일 계정 입력" onkeyup="CheckDuplicatedEmail_id();"
												onchange="CheckDuplicatedEmail_id"
												style="width: 123px; margin-right: 7px; height: 28px; display: none;" />
											<span id="email_span"> <select
												name="ddlEmailDomain_id" id="ddlEmailDomain_id"
												class="styled" onchange="ChangeMailDomain_id(this);"
												style="width: 136px; height: 26px;">
													<option value="">선택</option>
													<option value="naver.com">naver.com</option>
													<option value="hanmail.net">hanmail.net</option>
													<option value="daum.net">daum.net</option>
													<option value="nate.com">nate.com</option>
													<option value="gmail.com">gmail.com</option>
													<option value="hotmail.com">hotmail.com</option>
													<option value="direct_input">직접입력</option>
											</select>
											</span>
											<p style="display: none; color: #ff4000;" class="txt01"
												id="email_validate_complete_id">아이디과 이메일이 일치하지 않습니다.</p>
											<p style="display: none;" class="txt02"
												id="email_duplicate_err_id"></p>
											<p
												style="line-height: 19px; padding-top: 10px; color: #8e8e8e; font-size: 9px;">클릭시 이메일주소로 임시비밀번호를 발송합니다.</p>
										</div>

										<div>
											<button type="button" onclick="submitproc1();">찾기</button>
										</div>
										<div>
											<button id="submit1" type="submit" style="display: none;">찾기</button>
										</div>

									</div>
								</td>
							</tr>
					</table>
				</FORM>

			</fieldset>
		</DIV>
	</div>

	<jsp:include page="/menu/bottom.jsp" />
</body>

</html>

