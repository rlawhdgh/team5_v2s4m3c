<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html> 
<html lang="ko">
<head>
  <title> Unique Games - 패스워드 도움말</title>
  <meta charset="UTF-8"> 
  <meta http-equiv="Content-type" content="text/html; charset=KSC_5601" />
  <meta name="Vs_targetschema" content="Http://Schemas.Microsoft.Com/Intellisense/Ie5" />
  <link rel="stylesheet" type="text/css" href="https://script.auction.co.kr/style/css_ssl/common/popup.css" />
  <script type="text/javascript">
  $(function(){
	  resize_popup(640, 634);
  });
  
   /*  window.onload = function () {
      resize_popup(640, 634);
    } */
  </script>
</head>
 
<body>

<!-- body -->
<div style="height: 100%; background: white;;">
  <!-- 타이틀 -->

  <!-- 타이틀 //-->
  <hr />

  <!-- 탑 15px, 좌우 5px영역 -->
  <div id="maxzone">
    <!-- 컨텐츠 -->
      <div class="help-passw">

        <h2>비밀번호 안전도</h2>
        <div class="help-passw-tab">
          <table>
            <caption>비밀번호 안전도</caption>
            <col style="width:25%" />
            <col style="width:25%" />
            <col style="width:25%" />
            <col style="width:25%" />
            <thead>
              <tr>
                <th><span>사용불가</span></th>
                <th><span>취약</span></th>
                <th><span>적정</span></th>
                <th><span>안전</span></th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>비밀번호 조합기준에<br />적합하지 않아<br />사용할 수 없는 경우</td>
                <td>보안이 취약하여<br />사용할 수 없는 경우</td>
                <td>사용가능하며<br>적정수준의<br />안전한 비밀번호</td>
                <td>매우 안전한 비밀번호</td>
              </tr>
            </tbody>
          </table>
        </div>
        <h2>비밀번호 만들기</h2>
        <ul class="help-passw-list">
          <li><span>1.</span>6~15자의 영문, 숫자, 특수문자가 포함되어야 합니다.</li>
          <li><span>2.</span>영문, 숫자, 특수문자 중 2가지 이상 조합하여 최소 10자리 이상 또는 3가지 이상을 조합하여 최소 8자리 이상으로 비밀번호를 사용하는 것이 안전합니다.</li>
          <li><span>3.</span>사용가능한 특수문자 : ! ” ! $ % & ’ ( ) * + , - . / : ; < > = ? @ [ \ ] ^ _ ` { | } ~ </li>
          <li><span>4.</span>연속된 숫자 및 문자 등 쉽게 알아낼 수 있는 비밀번호 사용은 위험합니다.</li>
          <li><span>5.</span>비밀번호는 3~6개월에 한번씩 주기적으로 바꾸어 사용하시는 것이 안전합니다.</li>
          <li><span>6.</span>비밀번호는 길수록, 그리고 많이 조합할수록 안전합니다.</li>
        </ul>
        <h2>사용 불가능한 비밀번호</h2>
        <ul class="help-passw-list">
          <li><span>1.</span>공백은 비밀번호로 사용 불가능합니다.</li>
          <li><span>2.</span>숫자, 영문, 특수문자 중 1개만 사용한 비밀번호는 사용 불가능합니다.</li>
          <li><span>3.</span>동일한 문자 또는 숫자를 많이 포함한 경우 사용 불가능합니다.</li>
          <li><span>4.</span>ID, 주민번호, 생일, 전화번호 등의 개인정보로 이루어진 비밀번호는 사용 불가능합니다. </li>
          <li><span>5.</span>비밀번호 변경 시 현재 사용 중인 비밀번호의 재사용은 불가능합니다.</li>
        </ul>
      </div>

    <!-- 컨텐츠 //-->

  </div>
  <!-- 탑 15px, 좌우 5px영역 //-->

</div>
<!-- body //-->

<hr />

<!-- 하단 버튼 -->
<div id="bottombutton">
  <a href="#" onclick="self.close();"><button type="button">닫기</button></a>
</div>
<!-- 하단 버튼 //-->

</body>
</html>