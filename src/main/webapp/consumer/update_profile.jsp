<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Unique Games - 마이페이지</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- <script type="text/javascript">
$(function() { // 자동 실행
  if(${cnt != null}){
      $('#modal_panel_consumer').modal();     
  }
  });
</script>
 -->
<script type="text/javascript">

$(function(){
	var grade = "${consumerVO.grade_no}";
	
 switch (grade) {
	case "0":
		$('#consumer_grade').text("일반회원");
		break;
	case "1":
	  $('#consumer_grade').text("BRONZE");
	  break;
	case "2":
	  $('#consumer_grade').text("SILVER");
	  break;
	case "3":
	  $('#consumer_grade').text("GOLD");
	  break;
	case "4":
	  $('#consumer_grade').text("PLATINUM");
	  break;
	case "5":
	  $('#consumer_grade').text("VIP");
	  break;
	case "10":
	  $('#consumer_grade').text("Manager");
	  break;

	default:
		break;
	}	
});

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


  $(obj).addClass('focus');
  if ($(obj).hasClass('incorrect') || $(obj).hasClass('usable')) {
    $('#enter-guide').hide();
  }
  else {
    $('#enter-guide').show();
  }
  CheckIDValidation(obj);
  //CallbackIDCheck();
}

function FocusOut_IDForm(obj) {
    $(obj).removeClass('focus');
    $('#enter-guide').hide();
    CheckIDValidation(obj);
  }



// 타이머 콜백 - ID체크용 
var previousTick = 0;
var remainTick = 0;
var eventSignal = false;
function CallbackIDCheck() {
  eventSignal = false;
  var inputForm = $('#consumer_id');
  // 포커스가 없거나 remainTick이 0이면 타이머콜백 종료
  if (!($('#consumer_id').hasClass('focus')) || remainTick == 0)
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
  if ($('#consumer_id').hasClass('focus') && !eventSignal) {
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


function profileupdatehide(){
	$('#updatebutton').hide();
	$('#updatediv').show();
}
function profileupdateshow(){
	$('#updatebutton').show();
	$('#updatediv').hide();
	}
	
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
    if(valueReset){TextBoxControl.value="";}
    //TextBoxControl.focus();
    return false;
  }
  return true;
}

function CheckIDValidation(obj) {
    // 결과 처리는 비동기 호출이므로 우선 입력폼을 노멀 상태로 세팅
    var current = $('#consumer_id');
    current.removeClass('incorrect');
    current.removeClass('usable');
    $('#enter-guide').hide();
    $('#txt01').hide();
    $('#txt02').hide();

    // 공란일때는 기본 안내 메세지 출력
    if (obj.value == '')
    {
      $('#enter-guide').show();
      return;
    }

    if (!CheckID(obj, false, $('#txt02').get(0))) {
      $('#consumer_id').addClass('incorrect');
      $('#txt02').show();       
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
            $('#txt01').show();
            break;              
          case 1: 
            $('#txt02').text("이미 사용중인 아이디입니다.");
            current.addClass('incorrect');
            $('#txt02').show();
            break;  
          default:                
            break;
          }
      },
      error: function (XMLHttpRequest, textStatus, errorThrown) {
        alert("죄송합니다. 잠시 후 다시 시도해 주십시오.");
        return;
      }
    });
}

/* ------------------------------------------------------------------------------------------- */

 function consumer_update_send () {
      // alert('삭제 진행');
      // return;
      
      //var frm = $('#frm_consumer');  // Youtube 삭제 폼
      var consumer_no = $('#consumer_no').val();
      var consumer_id = $('#consumer_id').val();
      var consumer_nickname = $('#consumer_nickname').val();
      var consumer_age = $('#consumer_age').val();
      var params = 'consumer_no=' + consumer_no + '&consumer_id=' + consumer_id + '&consumer_nickname=' + consumer_nickname + '&consumer_age=' + consumer_age;
      
      /* int consumer_no, String consumer_id , String consumer_nickname , String consumer_age */
      $.ajax({
        url: './update_profile_proc.do',
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


<div style="padding: 30px 0px;">
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
      <legend style ="margin-bottom: 0px; color: #c7d5e0;">프로필</legend>
      <input type='hidden' name='consumer_no' id='consumer_no' value='${consumerVO.consumer_no }'>
      <table style="position: relative; width: 100%; table-layout: fixed; border-spacing: 0; border-collapse: collapse; word-wrap: break-word; word-break: keep-all; border: 0; border-bottom: 1px solid #e5e5e5;">
      <tbody>
        
        <tr style ="border-top: 1px solid #dadada;">
          <th scope="row" style="color: #333; border-right: 1px solid #e5e5e5; background-color: #1b2838;"><div style ="padding: 32px 31px 32px;">회원 정보</div></th>
          <td>
            <div style ="padding: 32px 31px 32px;">
            
              <div style = "position: relative; width: 200px; height: 50px;">
                <div><span style="font-weight: bold;">이름 :</span> <span id="consumer_name ">${consumerVO.consumer_name }</span></div>
              </div>
              <div style = "position: relative; width: 200px; height: 50px;">
                <div><span style="font-weight: bold;">아이디 :</span> <span id="consumer_id ">${consumerVO.consumer_id }</span></div>
              </div>
              <div style = "position: relative; width: 200px; height: 50px;">
                <div><span style="font-weight: bold;">별명 :</span> <span id="consumer_nickname ">${consumerVO.consumer_nickname }</span></div>
              </div>
              <div style = "position: relative; width: 200px; height: 50px;">
                <div><span style="font-weight: bold;">나이 :</span> <span id="consumer_age ">${consumerVO.consumer_age}</span></div>
              </div>
              <div style = "position: relative; width: 200px; height: 50px;">
                <div><span style="font-weight: bold;">등급 :</span> <span id="consumer_grade"></span></div>
              </div>
              <div id="updatebutton" style ="overflow: visible; position: relative; height: 33px; padding-top: 21px;">
                <button type="button" onclick="profileupdatehide();">수정</button>
              </div>
              <div id ="updatediv" style="display: none;">
	                <p style ="line-height: 19px; padding-top: 10px; color: #8e8e8e; font-size: 9px;">※수정가능한 회원정보만 표시됩니다.</p>
	                <span style="font-weight: bold;">아이디 :</span> <input name="consumer_id" autocomplete="off" type="text" id="consumer_id" placeholder="아이디" value="${consumerVO.consumer_id }" maxlength="12" class="enter-id placeholder" onfocus="FocusIn_IDForm(this);"  onblur="FocusOut_IDForm(this)" style=" margin-bottom: 10px"  title="아이디" /><br>
		                <p id="enter-guide" class="enter-guide" style="font-size: 12px;">띄어쓰기 없이 영문과 숫자를 혼합하여 4~12자를 사용할 수 있습니다.</p>
	                  <p id ="txt01" class="txt01" style="display:none; font-size: 12px;">사용가능한 아이디입니다.</p><!-- 사용가능한 아이디인 경우 -->
	                  <p id = "txt02" class="txt02" style="display:none; color: #ff4000; font-size: 12px;">아이디를 넣어주세요.</p><!-- 아이디가 조건에 맞지않는 경우 -->
	                <span style="font-weight: bold; ">별명 :</span> <input id="consumer_nickname" autocomplete="off" name="consumer_nickname" value="${consumerVO.consumer_nickname}" style="margin-bottom: 10px"/><br>
	                <span style="font-weight: bold; ">나이 :</span> <input id="consumer_age" name = "consumer_age" autocomplete="off" value="${consumerVO.consumer_age}" maxlength="3" style=" margin-bottom: 10px;" />
	                <div style ="margin-top: 20px;">
	                  <button type="button" onclick="consumer_update_send();">수정</button>
	                  <!-- <button type="submit" >수정</button> -->
	                  <button type="button" onclick="profileupdateshow();">수정취소</button>
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
 
 