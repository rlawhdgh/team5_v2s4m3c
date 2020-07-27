


//document.domain = "auction.co.kr";
      window.name = "Parent_window";

      //var keyFix = new beta.fix('txt_nickname');
      var keyFix = new beta.fix('ucStoreName_txtStoreNickName');

      $(document).ready(function () {   
      
        // input 밸류값 설정
        $("input[type='text'].placeholder").focusout(function () {
          if ($(this).val() == "") {
            $(this).val(this.title);
          }
        });

        $("input[type='text'].placeholder").focus(function () {
          if (this.value == $(this).attr('title')) {
            this.value = '';
          }
        });
 
        
        // 공백입력방지 keypress 이벤트로 등록 (#txt_nickname)
    $("#consumer_id, #consumer_passwd, #consumer_passwd_confirm, #consumer_phone_num2, #consumer_phone_num3, #email1").bind("keypress", function (e) { 
          Events.PreventSpace(e);
        });

        // 숫자만 입력받을 수 있도록 keypress 이벤트로 등록
        $("#consumer_phone_num2, #consumer_phone_num3").bind("keypress", function (e) {
          Events.CheckDigit(e);
        });

        // 한글입력방지
        $("#consumer_id, #consumer_passwd, #consumer_passwd_confirm, #consumer_phone_num2, #consumer_phone_num3, #email1").css("ime-mode", "disabled");

        $("#AvoidPostTwice").val("");
        CallbackIDCheck();              
      });
      // 약관동의 체크시 색상변경
      window.onload = $(function (){
        var $checkbox = $('.terms-cont input[type=checkbox]');
        $checkbox.removeAttr('checked');
        $checkbox.bind('click onfocus',function chked (){
          if($(this).is(':checked')){$(this).closest('.check-set').next('.terms-box').addClass('check');}
          else{$(this).closest('.check-set').next('.terms-box').removeClass('check');};
        });
      });

      // 약관내용보기
      $(document).ready(function(){
        $('.terms-cont-inner').find('.toggle').click(function(){
          //alert('dd');
          if($(this).attr('class') == 'btn-close toggle'){  
            $(this).attr('class','btn-open toggle');
            $(this).parent().next('.terms-box').slideDown();
          } else {
            $(this).attr('class','btn-close toggle');
            $(this).parent().next('.terms-box').slideUp();
          }
        });
      });

      
      function Events() { }

      // 공백막기
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
      function Change_IDForm(obj) {


          $(obj).addClass('focus');
          if ($(obj).hasClass('incorrect') || $(obj).hasClass('usable')) {
            $('.info-enter .info-cont ul .enterid_area .enter-guide').hide();
          }
          else {
            $('.info-enter .info-cont ul .enterid_area .enter-guide').show();
          }
          CheckIDValidation(obj);

        }
      
      function FocusIn_IDForm(obj) {
        if (obj.value == '아이디')
          obj.value = '';

        $(obj).addClass('focus');
        if ($(obj).hasClass('incorrect') || $(obj).hasClass('usable')) {
          $('.info-enter .info-cont ul .enterid_area .enter-guide').hide();
        }
        else {
          $('.info-enter .info-cont ul .enterid_area .enter-guide').show();
        }
        CallbackIDCheck();
      }

      function FocusOut_IDForm(obj) {
        $(obj).removeClass('focus');
        $('.info-enter .info-cont ul .enterid_area .enter-guide').hide();
        CheckIDValidation(obj);
      }

      function FocusIn_PwdForm(obj) {
        if (obj.value == '비밀번호')
          obj.value = '';

        if ($(obj).hasClass('incorrect') || $(obj).hasClass('usable')) {
          $('.info-enter .info-cont ul .enterpw_area .enter-guide').hide();
        }
        else {
          $('.info-enter .info-cont ul .enterpw_area .enter-guide').show();
        }
      }

      function FocusOut_PwdForm(obj) {
        $(obj).removeClass('focus');
        $('.info-enter .info-cont ul .enterpw_area .enter-guide').hide();
        CheckPasswordOnFocusOut(obj);

        if($("#consumer_passwd_confirm").val()){
          CheckPasswordConfirm();
        }
      }

      function CheckPasswordConfirm() {
        var passwdObj = $("#consumer_passwd");
        var passwdConfirmObj = $("#consumer_passwd_confirm");
        var errDisplayObj = $('#password_confirm_err');
        
        passwdConfirmObj.removeClass("incorrect");
        passwdConfirmObj.removeClass("usable");

        if (!passwdConfirmObj.val() || passwdConfirmObj.val().length == 0) {
          errDisplayObj.text("비밀번호를 재입력해주세요.");
          errDisplayObj.show();
          
          passwdConfirmObj.addClass("incorrect");
        }
        else if (passwdObj.val() != passwdConfirmObj.val()) {
          errDisplayObj.text("비밀번호가 일치하지 않습니다.");
          errDisplayObj.show();

          passwdConfirmObj.addClass("incorrect");
          passwdConfirmObj.val("");
        } else {
          passwdConfirmObj.addClass("usable");
          errDisplayObj.hide();
        }
      }


      jQuery(function ($) {
        $('select.styled').selectbox();

        $('.selectbox').hover(function () {
          $(this).addClass('over');
        }).mouseleave(function () {
          $(this).removeClass('over');
        });

        $('.selectbox-dropdown').each(function (index) {
          $(this).hover(function () {
            $('.selectbox').eq(index).addClass('over');
          }).mouseleave(function () {
            $('.selectbox').eq(index).removeClass('over');
          });
        });
      });

      function ChangeMailDomain(obj) {
          CheckDuplicatedEmail();
        if (obj.value == "direct_input") {
          $("#email2").show();
        }
        else
          $("#email2").hide();
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
        // 결과 처리는 비동기 호출이므로 우선 입력폼을 노멀 상태로 세팅
        var current = $('.info-enter .info-cont .enter-id');
        current.removeClass('incorrect');
        current.removeClass('usable');
        $('.info-enter .info-cont ul .enterid_area .enter-guide').hide();
        $('.info-enter .info-cont ul .enterid_area .txt01').hide();
        $('.info-enter .info-cont ul .enterid_area .txt02').hide();

        // 공란일때는 기본 안내 메세지 출력
        if (obj.value == '')
        {
          $('.info-enter .info-cont ul .enterid_area .enter-guide').show();
          return;
        }

        if (!CheckID(obj, false, $('.info-enter .info-cont ul .enterid_area .txt02').get(0))) {
          $('.enter-id').addClass('incorrect');
          $('.info-enter .info-cont ul .enterid_area .txt02').show();       
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
                $('.info-enter .info-cont ul .enterid_area .txt01').show();
                break;              
              case 1: 
                $('.info-enter .info-cont ul .enterid_area .txt02').text("이미 사용중인 아이디입니다.");
                current.addClass('incorrect');
                $('.info-enter .info-cont ul .enterid_area .txt02').show();
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
      //////////////////////////////////////////////////////////////////////////////

      /////// 패스워드 체크 ////////////////////////////////////////////////////////

      // 매 키입력시 호출. 구버젼을 개량하여 적용
      function validatePasswordType(objPassWord) {
        
      //  if(document.getElementById('cb_password').checked)        // 확인 체크박스에 표시되어있으면 리턴
      //    return;
        var current = $('#consumer_passwd');

        var resultType = objPw.getType(objPassWord); //MemberSignup.js
        current.removeClass('incorrect');
        current.removeClass('usable');
        $('.info-enter .info-cont ul .enterpw_area .enter-guide').show();
        $('.info-enter .info-cont ul .enterpw_area .txt01').hide();
        $("#password_err").hide();
        var id = $('#consumer_id').val();


        if (resultType != "" && resultType !="21" && resultType !="31") 
        {
          current.addClass('incorrect');
          $('.info-enter .info-cont ul .enterpw_area .enter-guide').hide();
          $('.info-enter .info-cont ul .enterpw_area .txt01').hide();
          $("#password_err").show();
          
          var message;
          switch (resultType) {
            case "00":
              message = "안전한 사용을 위해 " + passwordType + "자 이상 입력해주세요";
              break;
            case "01":
              message = "안전한 사용을 위해 숫자만 사용할 수 없습니다.";
              break;
            case "02":
              message = "안전한 사용을 위해 영문만 사용할 수 없습니다.";
              break;
            case "03":
              message = "안전한 사용을 위해 특수문자만 사용할 수 없습니다.";
              break;
            case "04":
              message = "연속되는 문자와 숫자를 사용하실 수 없습니다.";
              break;
            case "05":
              message = "동일한 문자, 숫자를 반복해서 사용하실 수 없습니다.";
              break;
            case "11":
              message = "안전한 사용을 위해 숫자만 사용할 수 없습니다.";
              break;
            case "12":
              message = "안전한 사용을 위해 영문만 사용할 수 없습니다.";
              break;
            case "13":
              message = "안전한 사용을 위해 특수문자만 사용할 수 없습니다.";
              break;
          }

          $("#password_err").text(message);
        }
        else if (!CheckPasswordWithID(objPassWord, id)) {
          current.addClass('incorrect');
          $("#lb_confirm_pwd").css("font-weight","normal");
          //$("#cb_password").attr("disabled",true);
          $('.info-enter .info-cont ul .enterpw_area .enter-guide').hide();
          $('.info-enter .info-cont ul .enterpw_area .txt01').hide();
          $("#password_err").show();
        }
        else {
          current.addClass('usable');
          $("#lb_confirm_pwd").css("font-weight","bold");
          //$("#cb_password").attr("disabled",false);
          $('.info-enter .info-cont ul .enterpw_area .enter-guide').hide();
          $('.info-enter .info-cont ul .enterpw_area .txt01').show();
          $("#password_err").hide();


          var message;
          switch (resultType) {
            case "21":
              message = "사용가능한 적정수준의 비밀번호입니다.";
              break;
            case "31":
              message = "매우 안전한 비밀번호 입니다.";
              break;
            
          }
          $('.info-enter .info-cont ul .enterpw_area .txt01').text(message);
        }

                
      }

      // 패스워드 입력창이 포커스 아웃될때 패스워드 유효성을 체크해줌
      function CheckPasswordOnFocusOut(objPassWord) {

      //  if(document.getElementById('cb_password').checked)        // 확인 체크박스에 표시되어있으면 리턴
      //    return;

        var id = $('#consumer_id').val();
        var current = $('#consumer_passwd');
        current.removeClass('incorrect');
        current.removeClass('usable');
        $('.info-enter .info-cont ul .enterpw_area .enter-guide').show();
        $('.info-enter .info-cont ul .enterpw_area .txt01').hide();
        $("#password_err").hide();

        if ($(objPassWord).val() == "")                           
        {
          $("#lb_confirm_pwd").css("font-weight","normal");
          return;
        }

        if (!CheckPasswordWithID(objPassWord, id)) {
          current.addClass('incorrect');
          $("#lb_confirm_pwd").css("font-weight","normal");
        //  $("#cb_password").attr("disabled",true);
          $('.info-enter .info-cont ul .enterpw_area .enter-guide').hide();
          $('.info-enter .info-cont ul .enterpw_area .txt01').hide();
          $("#password_err").show();
          
        }
        else {
          current.addClass('usable');
          $("#lb_confirm_pwd").css("font-weight","bold");
          //$("#cb_password").attr("disabled",false);
          $('.info-enter .info-cont ul .enterpw_area .enter-guide').hide();
          $('.info-enter .info-cont ul .enterpw_area .txt01').show();
          $("#password_err").hide();
          //$('.info-enter .info-cont ul .enterpw_area .txt01').text("적절한 비밀번호 입니다.");
        }
      }

      // MemberSignup.js 에서 추출하여 개량
      function CheckPasswordWithID(passwordControl, id) {
        if (!CheckPassword(passwordControl))
          return false;

        var pwd1 = passwordControl.value;

        //ID와 비밀번호가 4자 이상 중복되는지 체크
        if (checkDuplicate(id, pwd1, 4) == false) {
          objPw.strSecType = "";
          passwordControl.value = "";
          passwordControl.value = "";
          passwordControl.focus();
          $("#password_err").text("ID등의 개인정보가 포함된 비밀번호는 사용할 수 없습니다.");
          return false;
        }
        return true;
      }

      // MemberSignup.js 에서 추출하여 개량. 테스트 후 js파일에 삽입예정.
      function CheckPassword(passwordControl) {
        var bFlag = true;
        if (passwordControl.value.length == 0) { return false; }

        var secType = objPw.getType(passwordControl);
        if (secType.length == 2) {
          if (parseInt(secType.split("")[0]) < 2) //사용불가
          {
            bFlag = false;
          }
        }
        else {
          bFlag = false;

        }
        if (bFlag == false) {
          //$('.info-enter .info-cont ul .enterpw_area .txt02').text("비밀번호는 영문,숫자,특수문자중 두가지를 포함한\n" + passwordType + "~15자리 문자로 입력하셔야 합니다");
          objPw.strSecType = "";
          //passwordControl.value = "";
          //passwordControl.focus();
          return false;
        }
        return true;
      }

      // 비밀번호 확인 체크 박스. 
//      function ConfirmPassword(obj) {
//        if (obj.checked == true) {
//          var password = $("#consumer_passwd").val();
//          $("#htxtPassword").val(password);
//          $("#consumer_passwd").val("");
//          for (var i = 0; i < password.length; i++ ) {
//            $("#consumer_passwd").val($("#consumer_passwd").val() + "*");
//          }
//          $("#consumer_passwd").attr("readonly",true);
//        }
//        else {
//          $("#consumer_passwd").val("");
//          $("#htxtPassword").val("");
//          var current = $('.info-enter .info-cont .enter-pw');
//          
//          $("#consumer_passwd").attr("readonly", false);
//          $(obj).attr("disabled",true);
//          current.focus();
//          current.keyup();
//        }
//      }

      //약관 체크 다했는지 확인
      function CheckAllProvisions() {
        if (document.getElementById("cbProvision1").checked && document.getElementById("cbFinance").checked && document.getElementById("cbIndividualInfo").checked && document.getElementById("cbThirdParty").checked && document.getElementById("cbIndividualInfo_option").checked && document.getElementById("cbLocation").checked && document.getElementById("sms_yn").checked && document.getElementById("email_yn").checked && document.getElementById("cbIndividualInfo_option1").checked && document.getElementById("cbIndividualInfo_option2").checked) {         
          return true;
        }
        return false;
      }

      //개인정보수집및 이용 (주문,결제배송서비스약관, 신규서비스개발 약관) 동의
      function CheckIndividualInfoOptions(obj) {

        if (document.getElementById("cbIndividualInfo_option1").checked && document.getElementById("cbIndividualInfo_option2").checked) {
          return true;
        }
        return false;
      }

      // 약관 체크 박스 처리
      function ConfirmProvision(obj) {
        if (obj.checked == true) {
          if (document.getElementById("cbIndividualInfo_option").checked) {
            document.getElementById("cbIndividualInfo_option1").checked = true;
            document.getElementById("cbIndividualInfo_option2").checked = true;
          }         
          if (CheckIndividualInfoOptions(obj)) {
            document.getElementById("cbIndividualInfo_option").checked = true;
          }             
          if (CheckAllProvisions()) {
            document.getElementById("cb_agreeall_1").checked = true;      
          }
        }
        else {
          if (!document.getElementById("cbIndividualInfo_option").checked) {
            document.getElementById("cbIndividualInfo_option1").checked = false;
            document.getElementById("cbIndividualInfo_option2").checked = false;
          }
          if (!CheckIndividualInfoOptions(obj)) {
            document.getElementById("cbIndividualInfo_option").checked = false;
          }   
          document.getElementById("cb_agreeall_1").checked = false;       
        }
      }

      function OpenPasswordGuide()
      {
        window.open("./passwd_advice.jsp", "PasswordGuide", "width=550,height=550, toolbar=no ,location=no,directories=0,status=0,menubar=0,scrollbars=yes,copyhistory=0");
      }

      // 약관 동의
      function CheckProvisionAgreement() {

        if(document.getElementById("cbProvision1").checked == false){
          alert("이용약관에 동의하지 않으셨습니다.");
          $("#cbProvision1").select();
          $("#cbProvision1").focus();
          return false;
        }
                
        if(document.getElementById("cbFinance").checked == false){
          alert("전자금융서비스 이용약관에 동의하지 않으셨습니다.");
          $("#cbFinance").select();
          $("#cbFinance").focus();
          return false;
        } 
  
        if (document.getElementById("cbIndividualInfo").checked == false) {
          alert("개인정보 수집 및 이용약관에 동의하지 않으셨습니다.");
          $("#cbIndividualInfo").select();
          $("#cbIndividualInfo").focus();
          return false;
        }

      return true;
    }

    // 모든 약관 동의 체크박스 토글
    function ToggleAllProvisions(caller) {
      if(caller.checked) {
        document.getElementById("cb_agreeall_1").checked = true;
        document.getElementById("cbProvision1").checked = true;
        document.getElementById("cbFinance").checked = true;
        document.getElementById("cbIndividualInfo").checked = true;
        document.getElementById("cbThirdParty").checked = true;
        document.getElementById("cbIndividualInfo_option").checked = true;
        document.getElementById("cbLocation").checked = true;
        document.getElementById("sms_yn").checked = true;
        document.getElementById("email_yn").checked = true;
        document.getElementById("cbIndividualInfo_option1").checked = true;
        document.getElementById("cbIndividualInfo_option2").checked = true;           
      }
      else
      {
        document.getElementById("cbProvision1").checked = false;
        document.getElementById("cbFinance").checked = false;
        document.getElementById("cbIndividualInfo").checked = false;
        document.getElementById("cbThirdParty").checked = false;
        document.getElementById("cbIndividualInfo_option").checked = false;
        document.getElementById("cbLocation").checked = false;
        document.getElementById("sms_yn").checked = false;
        document.getElementById("email_yn").checked = false;
        document.getElementById("cb_agreeall_1").checked = false;
        document.getElementById("cbIndividualInfo_option1").checked = false;
        document.getElementById("cbIndividualInfo_option2").checked = false;                    
      }
    }

    // 가입 버튼 클릭
    function ClickSignupButton() {
      //alert("가입 버튼 클릭");
/*       if($("#AvoidPostTwice").val() != '')
      {
        alert('처리중입니다. 잠시만 기다려주십시요');
        return false;
      } */

       if(!CheckInput())               // 입력값 체크
         return false;
      
       if(!CheckProvisionAgreement())  // 약관 체크
         return false;
            
      //$("#AvoidPostTwice").val("POSTBACK"); // 가입버튼을 여러번 누르는것을 방지
      $('#btnSignup').click();    // 가입 요청
    }

    //반복된 문자인지 체크
    function CheckPattern(value, name) {
      //반복 문자 3자 이상 입력 여부 체크
      if (checkRepetitionForAddress(value, 3) == false) {
        alert("정확한 정보를 입력해주세요.");
        return false;
      }

      //반복 초중종성문자 2자 이상 입력 여부 체크
      if (checkRepetitionHangeul(value) == false) {
        alert("정확한 정보를 입력해주세요.");
        return false;
      }

      //반복 숫자 6자 이상 입력 여부 체크
      if (checkNumRepetition(value, 6) == false) {
        alert("정확한 정보를 입력해주세요.");
        return false;
      }

      return true;
    }
        
    function validateEmail(email) {
        var re =/^([A-Za-z0-9._-]*@[a-zA-z0-9]+\.[a-zA-z0-9]+)$/
        return re.test(String(email).toLowerCase());
    }

    function CheckDuplicatedEmail(){
        var emailValidateMessage_success = '사용가능한 이메일입니다.';
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

    function CheckInput()
    { 
        if(document.getElementById('email_duplicate_err').style.display == 'block'){
            alert('이메일 주소를 확인해주세요');
            return false;
        }

      if($("#consumer_name").val() =='' || $("#consumer_name").val() =='이름')
      {
        alert("이름을 입력해주세요.");
        $("#consumer_name").focus();
        return false;
      }
      
      if($("#consumer_id").val() =='')
      {
        alert("ID를 입력해주세요.");
        $("#consumer_id").focus();
        return false;
      }
      
//      if(!document.getElementById("cb_password").checked)
//      {
//        alert("비밀번호 사용 확인을 체크해주세요.");
//        $("#cb_password").focus();
//        return false;
//      }

//      if($("#htxtPassword").val() == "")
//      {
//        alert("비밀번호를 입력해주세요.");
//        $("#consumer_passwd").focus();
//        return false;
      //      }

      var password = $("#consumer_passwd").val();
      var password_confirm = $("#consumer_passwd_confirm").val();

      if(password_confirm == ""){
        alert("비밀번호를 재입력해주세요.");
        $("#consumer_passwd_confirm").focus();
        return false;
      }

      if(password != password_confirm){
        alert("새로운 비밀번호와 재입력한 비밀번호가 일치하지 않습니다.");
        $("#consumer_passwd_confirm").focus();
        return false;
      }
    
      if(CheckMobilePhone(document.getElementById('consumer_phone_num1'), document.getElementById("consumer_phone_num2"), document.getElementById("consumer_phone_num3"),false,false)==false) return false;
      //핸드폰 번호 국번 입력시 000, 0000, 111, 1111 입력 차단 필터링
      if ((checkRepetitionForTel(document.getElementById("consumer_phone_num2").value, 3) == false) 
        || (checkRepetitionForTel(document.getElementById("consumer_phone_num2").value, 4) == false))
      {
        alert("정확한 정보를 입력해주세요.");
        document.getElementById('consumer_phone_num2').focus();       
        return false;
      } 
      
 /*      //키보드 보안 작동시 변환
      if(window.ActiveXObject && GetCookie('KeySecurity')=='Y')
      {
        var len = form1.elements.length;
        for (i = 0; i < len; i++)
        {
          if ( form1.elements[i].type == "password" )
          {
            value = GetPwdValue_K(form1, Form1.elements[i],"KingsE2E", "", "");
            form1.elements[i].value  = value;
          }
        }
      } */
      return true;
    }
   
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


    }




  // 2014-06-18 회원가입 인증선택 탭 버튼 변경건
  $(function () {
    $('.cert-cont').find('.btn').bind('click focus', function(){
      $('.cert-cont li').removeClass( 'selected' );
      $(this).parent().addClass('selected');
    });
  });
  
/*   var email = 'consumer_email='+ email1 + "@" + email2 ;
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
  }); */
  
  
  function nameCheck(obj){
    var name = "consumer_name=" +$('#consumer_name').val();
    
    if(!varcheck(name)){
      alert("한글이나 영문만 입력하세요.");
      $('#consumer_name').val("");
      $('#consumer_name').focus();
    }/* else{
    $.ajax({
      type: "GET",
      url: "./checkName.do",
      data: name,
      dataType: "json",
      success: function(result){
        if(result.cnt == 1){
          $('#name_err').text("이미 가입되어 있는 회원입니다."); 
          $('#entername_area').css('padding-bottom','0px');
          $('#name_err').show();
        }else{
          $('#entername_area').css('padding-bottom','18px');
          $('#name_err').hide();
          
        }
      },
      error: function (XMLHttpRequest, textStatus, errorThrown) {
              alert("죄송합니다. 잠시 후 다시 시도해 주십시오.");
              return;
          }
    });  
    } */
  }
  
  function varcheck(name){
        var keycode;
        keycode = event.keyCode;
        if( !(( keycode < 48 || keycode >57 )||((keycode < 48 || keycode >57) && (keycode < 65 || keycode > 90) && (keycode < 97 || keycode > 122))) )
        {
          return false;
        }else{
          return true;
        }
    }
  