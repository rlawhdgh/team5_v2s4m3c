<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<title>프로젝트</title>
<meta http-equiv="refresh" content="5; url=http://172.16.12.10:9090/team5/index.do"> 
<style>


.loader {
  border: 7px solid #f3f3f3;
  border-radius: 50%;
  border-top: 7px solid #ff0000;
  width: 20px;
  height: 20px;
  -webkit-animation: spin 2s linear infinite; /* Safari */
  animation: spin 2s linear infinite;
}

/* Safari */
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}


.glow:hover {
  -ms-transform: scale(1.5); /* IE 9 */
  -webkit-transform: scale(1.5); /* Safari 3-8 */
  transform: scale(1.5); 
}

body {
  background-color: black;
  font-family: cursive;
}

.glow {
  color: #fff;
  text-align: center;
  -webkit-animation: glow 1s ease-in-out infinite alternate;
  -moz-animation: glow 1s ease-in-out infinite alternate;
  animation: glow 1s ease-in-out infinite alternate;
}

@-webkit-keyframes glow {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #e60073, 0 0 40px #e60073, 0 0 50px #e60073, 0 0 60px #e60073, 0 0 70px #e60073;
  }
  
  to {
    text-shadow: 0 0 20px #fff, 0 0 30px #ff4da6, 0 0 40px #ff4da6, 0 0 50px #ff4da6, 0 0 60px #ff4da6, 0 0 70px #ff4da6, 0 0 80px #ff4da6;
  }
}


body, html {
  height: 100%;
  margin: 0;
}

.bgimg {
  background-color: #000000;
  height: 100%;
  background-position: center;
  background-size: cover;
  position: relative;
  color: white;
  font-family: "Courier New", Courier, monospace;
  font-size: 25px;
}

.topleft {
  absolute;
  right: 0;
  top: 10;
  
}

.bottomleft {
  position: absolute;
  bottom: 0;
  left: 16px;
}

.middle {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
}

hr {
  margin: auto;
  width: 70%;
}
</style>
<body>

<div class="bgimg">
  <div class="topleft" style="text-align: right; padding-top: 20px; padding-right:20px;">
   <a href='http://172.16.12.10:9090/team5/index.do'>
   <img src="/team5/css/images/다운로드.png" style='width: 3%'>
   </a>
  </div>
  <div class="middle">
    <h1 class="glow">프로젝트 제작(7/27)예정</h1>
    5초뒤에 홈페이지로 이동합니다.
    <hr>
    <p id="demo" style="font-size:30px"></p>
  </div>
  <div class="bottomleft" style="width: 80%">
    <p style='float: left; height: 20px;' class="loader"></p><p style='height: 20px; '>　준비중입니당.</p>

  </div>
</div>

<script>
// Set the date we're counting down to
var countDownDate = new Date("July 27, 2020 12:00:00").getTime();

// Update the count down every 1 second
var countdownfunction = setInterval(function() {

  // Get todays date and time
  var now = new Date().getTime();
  
  // Find the distance between now an the count down date
  var distance = countDownDate - now;
  
  // Time calculations for days, hours, minutes and seconds
  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
  
  // Output the result in an element with id="demo"
  document.getElementById("demo").innerHTML = days + "일 " + hours + "시 "
  + minutes + "분 " + seconds + "초 ";
  
  // If the count down is over, write some text 
  if (distance < 0) {
    clearInterval(countdownfunction);
    document.getElementById("demo").innerHTML = "EXPIRED";
  }
}, 1);
</script>

</body>
</html>
