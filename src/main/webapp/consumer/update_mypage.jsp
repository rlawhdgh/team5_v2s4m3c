<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Unique Games - 마이페이지</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
 
$(function() { // 자동 실행
  
    //---------------------이메일 * 표시 부분-----------------
    var email =  "${consumerVO.consumer_email}".split('@');  
    var re = /^(.{2})(.*)/;
    var email_1  = re.exec(email[0]);
    var email_2  = re.exec(email[1]);
    var marking_email = email_1[1] + email_1[2].replace(/./g, '*') + '@' +email_2[1] + email_2[2].replace(/./g, '*'); ;
    $('#consumer_email').html(marking_email);

    //-------------------전화번호 * 표시 부분------------------
    var phone_num =  "${consumerVO.consumer_phone_num}".split('-');  
    var re = /^(.{2})(.*)/;
    var phone_num_0  = phone_num[0];
    var phone_num_1  = re.exec(phone_num[1]);
    var phone_num_2  = re.exec(phone_num[2]);
    var marking_phone_num = phone_num_0+'-'+phone_num_1[1] + phone_num_1[2].replace(/./g, '*') + '-' +phone_num_2[1] + phone_num_2[2].replace(/./g, '*'); ;
    $('#consumer_phone_num').html(marking_phone_num);
    
    //-------------------계좌번호 * 표시 부분------------------ 아직 미구현
/*     var pay_num =  "${consumerVO.consumer_pay_num}".split(',');  
    var re = /^(.{2})(.*)/;
    var phone_num_1  = re.exec(pay_num[1]);
    var phone_num_2  = re.exec(pay_num[2]);
    var marking_phone_num = '010-'+phone_num_1[1] + phone_num_1[2].replace(/./g, '*') + '-' +phone_num_2[1] + phone_num_2[2].replace(/./g, '*'); ;
    $('#consumer_phone_num').html(marking_phone_num); */
});
 
  
</script>
</head> 
 
<body>
<jsp:include page="/menu/top3.jsp" />


 <DIV style ="width: 80%; margin: 0px auto; padding: 30px 0px; ">
  <DIV style = "float:left; width: 50%;">
    <DIV style = "min-height: 185px; margin: 16px 8px 0;
    padding: 20px 29px 30px;
    text-align: left;
    border: 1px solid #dadada;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    background: #fff;
    background-color: #1b2838;">
      <DIV style = "position: relative;">
        <h3>프로필</h3>
      </DIV>
      <DIV style = "min-height: 131px; padding-top: 9px;">
          <div><span style="font-weight: bold;">이름 :</span> <span>${consumerVO.consumer_name }</span></div><br>
          <div><span style="font-weight: bold;">ID :</span> <span>${consumerVO.consumer_id }</span></div><br>
          <div><span style="font-weight: bold;">별명 :</span> <span>${consumerVO.consumer_nickname }</span></div>
      </DIV>     
      <DIV style = "position: relative; min-height: 20px;">
        <form name="form1"  method="POST" action="./update_profile.do" style="width: 20px; float: right;">
        <input type="hidden" name ="consumer_no" value="${consumerVO.consumer_no }">
        <button type="submit" class="btn btn-default pull-right" >수정</button>
        </form>
      </DIV>
    </DIV>
    
    <DIV style = "min-height: 185px; margin: 16px 8px 0;
    padding: 20px 29px 30px;
    text-align: left;
    border: 1px solid #dadada;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    background: #fff;
    background-color: #1b2838;">
      <DIV style = "position: relative;">
        <h3>결제정보</h3>
      </DIV>
      <DIV style = "min-height: 131px; padding-top: 9px;">
        <div><span style="font-weight: bold;">계좌번호 :</span> <span>${consumerVO.consumer_pay_num}</span></div><br>
        <div><span style="font-weight: bold;">포인트 :</span> <span>${consumerVO.consumer_point}</span></div>
      </DIV>     
      <DIV style = "position: relative; min-height: 20px;">
        <form name="form1"  method="POST" action="./update_paynum.do" style="width: 20px; float: right;">
        <input type="hidden" name ="consumer_no" value="${consumerVO.consumer_no }">
        <button type="submit" class="btn btn-default pull-right" >수정</button>
        </form>
      </DIV>
    </DIV>
  </DIV>
  
   <DIV style = " display: inline-block; width: 50%;">
    <DIV style = "min-height: 185px; margin: 16px 8px 0;
    padding: 20px 29px 30px;
    text-align: left;
    border: 1px solid #dadada;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    background: #fff;
    background-color: #1b2838;">
      <DIV style = "position: relative;">
        <h3>연락처</h3>
      </DIV>
      <DIV style = "min-height: 131px; padding-top: 9px;">
        <div><span style="font-weight: bold;">이메일 : </span><span id = "consumer_email"></span></div><br>
        <div><span style="font-weight: bold;">휴대전화 : </span> <span id ="consumer_phone_num"></span></div>
      </DIV>     
      <DIV style = "position: relative; min-height: 20px;">
        <form name="form1"  method="POST" action="./update_contact.do" style="width: 20px; float: right;">
        <input type="hidden" name ="consumer_no" value="${consumerVO.consumer_no }">
        <button type="submit" class="btn btn-default pull-right" >수정</button>
        </form>
      </DIV>
    </DIV>
    
    <DIV style = "min-height: 185px; margin: 16px 8px 0;
    padding: 20px 29px 30px;
    text-align: left;
    border: 1px solid #dadada;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    background: #fff;
    background-color: #1b2838;">    
      <DIV style = "position: relative;">
        <h3>보안정보/로그인내역</h3>
      </DIV>
      <DIV style = "min-height: 131px; padding-top: 9px;">
        <span style ="font-size: 7px;">보안관련 정보를 수정해보세요!</span>
      </DIV>     
      <DIV style = "position: relative; min-height: 20px;">
        <form name="form1"  method="POST" action="./update_passwd.do" style="width: 20px; float: right;">
        <input type="hidden" name ="consumer_no" value="${consumerVO.consumer_no }">
        <button type="submit" class="btn btn-default pull-right" >수정</button>
        </form>
      </DIV>
    </DIV>
  </DIV>
 </DIV>

  
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 