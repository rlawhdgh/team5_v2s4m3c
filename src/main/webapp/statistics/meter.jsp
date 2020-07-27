<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>시각화</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- jqPlot 기본 설정 파일 -->
<link rel="stylesheet" type="text/css" href="./jquery.jqplot.min.css" />
<script type="text/javascript" src="./jquery.jqplot.min.js"></script>
 
<!-- 막대그래프 추가 설정 파일 -->
<script type="text/javascript" src="./plugins/jqplot.barRenderer.js"></script>
<script type="text/javascript" src="./plugins/jqplot.categoryAxisRenderer.js"></script>
 
<!-- 원형 그래프 추가 설정 파일 -->
<script type="text/javascript" src="./plugins/jqplot.pieRenderer.js"></script>
<script type="text/javascript" src="./plugins/jqplot.enhancedPieLegendRenderer.js"></script>

<!-- Meter gauge -->
<script type="text/javascript" src="./plugins/jqplot.meterGaugeRenderer.js"></script>

<!-- 막대 그래프 값 출력 -->
<script type="text/javascript" src="./plugins/jqplot.pointLabels.js"></script>
<script type="text/javascript" src="./plugins/jqplot.dateAxisRenderer.js"></script>


<script type="text/javascript">
  var auto_reload = null;
  var auto_reload2 = null;
  var auto_reload3 = null;
  $(function() { // 자동 실행
    auto_reload = meter();
    auto_reload2 = meter2();
    auto_reload3 = meter3();
    // clearInterval(auto_reload);
  });
  

  // jQuery ajax 요청 그래프1
  function meter() {
    // alert('자동 호출됨');
    $('#chart_panel').hide();
    var params = 'statistics_code=BAR4';
    var msg = '';
    var plot;

    var ticks = ['10대이하', '10대', '20대', '40대', '50대이상'];
    //alert("ticks type : " + ticks);
      $.ajax({
        url: './read_top_statistics_code.do',
        type: 'get',  // post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        	$( '#chart_panel').html (' '); 
        	var statistics_age_cnt = rdata.age_cnt;
        	var statistics_age_cnt_object = JSON.parse(statistics_age_cnt);

        	
        	//var statistics_age_group_object = JSON.parse(statistics_age_group);
        	//alert("statistics_age_group_object : " + typeof(statistics_age_group_object));
        	//alert("테스트 : ");
          //alert("statistics_age_group : " + statistics_age_group);
          //alert("statistics_age_group_object : " + typeof(statistics_age_group_object));
          $.jqplot('chart_panel',[statistics_age_cnt_object],{ /* [] 안에 Object타입이 들어가야댐..  그래서 위에서 JSON.parse 해줌*/
              animate: true,
              animateReplot: true,
              seriesDefaults: {
                  renderer: $.jqplot.BarRenderer,
                  rendererOptions: { barWidth: 15 },
                  pointLabels : {
                      show : true
                    , stackedValue : true
                  },
                  rendererOptions:{
                      varyBarColor:true
                  }


           
              },axes: { 
                  xaxis: {
                      renderer: $.jqplot.CategoryAxisRenderer,
                      ticks: ticks,
                      label:'연령별',
                      
                  },
                  yaxis: {
                	  label:'회원수', 
                      
                  }
              },
              grid: {
                  drawBorder: false,

                  background: '#111923',
                  shadow: false
              },
              title:{
            	  text: '실시간 회원 연령그래프',
            	  fontSize: 16,
              }
              
          });
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          var msg = 'ERROR<br><br>';
          msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
          msg += '<strong>error</strong><br>'+error + '<hr>';
          console.log(msg);
        }
        });
      $('#chart_panel').show();
      setTimeout(meter, 8000)
    } 
  
  // jQuery ajax 요청 그래프2
  function meter2() {
    // alert('자동 호출됨');
    //var s1 = [['Sony',7], ['Samsumg',13.3], ['LG',14.7], ['Vizio',5.2], ['Insignia', 1.2]];
    $('#chart_panel_2').hide();
    var params = 'statistics_code=PIE';
    var msg = '';
    var plot;

    //var ticks = ['10대이하', '10대', '20대', '40대', '50대이상'];
    //alert("ticks type : " + ticks);
      $.ajax({
        url: './read_top_statistics_code_2.do',
        type: 'get',  // post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
          $( '#chart_panel_2').html (' '); 
          //alert(typeof(rdata.c[0]));
          var s2 = [['FPS',rdata.c[0]],['MMORPG',rdata.c[1]],['롤플레잉',rdata.c[3]],['스포츠',rdata.c[4]],['시뮬레이션',rdata.c[5]],['아케이드',rdata.c[6]],['액션',rdata.c[7]],['어드벤처',rdata.c[8]],['퍼즐',rdata.c[9]]];
          //alert("s2 data : " + s2);
          //alert("s2 type : " + typeof(s2));
          //var c = rdata;
          //var statistics_age_cnt_object = JSON.parse(statistics_game_tend_cnt);
        
          //alert(c);
          //alert(typeof(c));
          //alert(typeof(s1));

          
          //var statistics_age_group_object = JSON.parse(statistics_age_group);
          //alert("statistics_age_group_object : " + typeof(statistics_age_group_object));
          //alert("테스트 : ");
          //alert("statistics_age_group : " + statistics_age_group);
          //alert("statistics_age_group_object : " + typeof(statistics_age_group_object));
          $.jqplot('chart_panel_2',[s2],{ /* [] 안에 Object타입이 들어가야댐..  그래서 위에서 JSON.parse 해줌*/
              animate: true,
              animateReplot: true,
              seriesDefaults:{
                  renderer:$.jqplot.PieRenderer,
                  rendererOptions: {
                      showDataLabels: true
                  }
              },axesDefaults: {
                  
              },
              grid: {
                  drawBorder: true, 
                  drawGridlines: false,
                  background: '#111923',
                  shadow:false
              },
              title:{
                text: '실시간 게임 선호도 그래프',
                fontSize: 16,
              },
              legend: {
                  show: true,
                  location: 'e',
                  renderer: $.jqplot.EnhancedPieLegendRenderer,
                  rendererOptions: {
                      numberColumns: 2
                      
                  }
              }
              
          });
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          var msg = 'ERROR<br><br>';
          msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
          msg += '<strong>error</strong><br>'+error + '<hr>';
          console.log(msg);
        }
        });
      $('#chart_panel_2').show();
      setTimeout(meter2, 8000)
    } 
  
//jQuery ajax 요청 그래프3
  function meter3() {
    // alert('자동 호출됨');
    //var s1 = [['Sony',7], ['Samsumg',13.3], ['LG',14.7], ['Vizio',5.2], ['Insignia', 1.2]];
    $('#chart_panel_3').hide();
    var params = 'statistics_code=PIE';
    var msg = '';
    var plot;

    //var ticks = ['10대이하', '10대', '20대', '40대', '50대이상'];
    //alert("ticks type : " + ticks);
      $.ajax({
        url: './read_top_statistics_code_3.do',
        type: 'get',  // post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
          $( '#chart_panel_3').html (' '); 
          var list = rdata.list;
          //alert(list[0].allconsumer_date_cnt);
          //alert(list[0].allconsumer_date_date);
/*           for(var i = 1; i< list.length; i ++){
        	  msg += 
          } */
          var line =[[list[6].allconsumer_date_date,list[6].allconsumer_date_cnt],[list[5].allconsumer_date_date,list[5].allconsumer_date_cnt],[list[4].allconsumer_date_date,list[4].allconsumer_date_cnt],[list[3].allconsumer_date_date,list[3].allconsumer_date_cnt],[list[2].allconsumer_date_date,list[2].allconsumer_date_cnt],  
              [list[1].allconsumer_date_date,list[1].allconsumer_date_cnt],[list[0].allconsumer_date_date,list[0].allconsumer_date_cnt],];

          //alert("최근일자 출력: " + list[0].allconsumer_date_date);
          $.jqplot('chart_panel_3', [line],{
              animate: true,
              animateReplot: true,
              seriesDefaults: {
                  pointLabels : {
                      show : true
                    , stackedValue : true
                  }
              },
              
              axes:{
                xaxis:{
                     // 날짜 형태로 입력을 하기위해서는 Date형식의 Renderer을 사용합니다.
                     renderer:$.jqplot.DateAxisRenderer,
/*                      rendererOptions: {
                         tickRenderer: $.jqplot.CanvasAxisTickRenderer
                      }, */
                     tickOptions:{ // 축에관한 옵션                    
                         // 입력된 값이 날짜형태로 인식되기 위해서 format 형식을 정해주고 입력값도
                         // yyyy/mm/dd 형식으로 입력해야만 정상적으로 나타납니다.
                           formatString:'%m/%d'
                           
                     },
                     ticks : [list[6].allconsumer_date_date, list[5].allconsumer_date_date, list[4].allconsumer_date_date, list[3].allconsumer_date_date, list[2].allconsumer_date_date, list[1].allconsumer_date_date, list[0].allconsumer_date_date],
                     label:'날짜(월/일) * 오전10시 최신일자 업데이트*',
                     /* tickInterval: '7 day', */
                     min: list[6].allconsumer_date_date,
                     /* max: list[0].allconsumer_date_date */
                 },
                 yaxis:{
                	 label:'회원수',
                 }
              },
              title:{
                  text: '실시간 회원 동향 그래프',
                  fontSize: 16,
                },
              grid: {
                  drawBorder: true, 
                  drawGridlines: true,
                  background: '#111923',
                  shadow:false
              }
        });
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          var msg = 'ERROR<br><br>';
          msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
          msg += '<strong>error</strong><br>'+error + '<hr>';
          console.log(msg);
        }
        });
      $('#chart_panel_3').show();
      setTimeout(meter3, 8000)
    } 
  

</script>
</head> 

<body>
<jsp:include page="/menu/top3.jsp" flush='false' />
  <DIV class='title_line'>
     통계 그래프
  </DIV>


  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span> 
  </ASIDE> 

  <div class='menu_line'></div>
  <c:choose>
	  <c:when test="${sessionScope.consumer_id != null && sessionScope.admin=='Y'}">
		  <DIV style='margin: 50px auto; width: 60%; text-align: center;'>
		    실시간 통계 그래프
		  </DIV>
		  <table>
		    <tr>
		      <td>
		        <div id="chart_panel" style='width: 30%; height: 300px;' ></div> <!-- border-bottom: 1px solid #dadada; -->
		      </td>
		      <td>
		        <div id="chart_panel_2" style='width: 30%; height: 300px; ' ></div>
		      </td>
		      <td>
		        <div id="chart_panel_3" style='width: 30%; height: 300px; ' ></div>
		      </td>
		        <p>*10시에 최신일자 업데이트</p>
		    </tr>
		  </table>
	  </c:when>
	  <c:otherwise>
	    <div style="text-align: center;">잘못된 접근 입니다.</div>
	  </c:otherwise>
  </c:choose>
     
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>