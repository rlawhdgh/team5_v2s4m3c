<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Unique Games - 사이트맵</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


 <style type="text/css">
div#asCnt1 > ul {
    overflow: hidden;
    width: 752px;
    margin-left: -1px;
}
 
 div#asCnt1 > ul > li{
     float: left;
    width: 150px;
    height: 220px;
    padding: 0 38px 0 0;
    background: none;
    text-align: left;
 }
 
 div#asCnt1 > ul > li ul {
    list-style:none;
    margin: 7px 0 0;
    padding: 7px 0 25px;
    border-top: 2px solid #ddd;
}

div#asCnt1 > ul > li ul li {
    display: block;
    float: none;
    padding: 4px 0;
    background: none;
}

li { list-style: none }
 
 </style>
 
 
</head>
<body>
<jsp:include page="/menu/top3.jsp" flush='false' />
<div style='padding: 40px 0px;'>
<div class="center" style ="width: 790px;
    height: 850px;
    border: 1px solid #d6d6d6;
    margin: 0px auto;
    padding: 20px 38px 20px 38px;">
<h2>사이트맵</h2><br>
		<div id="asCnt1" style="display: block;">
			<ul>
				<li><a href="#">회원</a>
					<ul>
						<li>- <a
							href="../consumer/create.do" target="">회원등록</a>
						</li>

						<li>- <a
							href="../consumer/list.do" target="">회원목록</a>
						</li>

						<li>- <a
							href="../consumer/list.do" 	target="">회원수정</a>
						</li>

						<li>- <a
							href="../consumer/list.do"	target="">회원삭제</a>
						</li>

					</ul></li>
				<li><a href="#">회원등급</a>
					<ul>
						<li>- <a href="../grade/create.do" target="">회원등급등록</a>
						</li>

						<li>- <a href="../grade/list.do" target="">회원등급목록</a>
						</li>

						<li>- <a href="../grade/list.do" target="">회원등급수정</a>
						</li>

						<li>- <a
							href="../grade/list.do"	target="">회원등급삭제</a>
						</li>

					</ul></li>
				<li><a href="#">관리자</a>
					<ul>
						<li>- <a
							href="../consumer/list.do"	target="">관리자등록</a>
						</li>

						<li>- <a href="../admin/list.do"	target="">관리자목록</a>
						</li>

						<li>- <a
							href="../admin/list.do"	target="">관리자수정</a>
						</li>

						<li>- <a
							href="../admin/list.do"	target="">관리자삭제</a>
						</li>


					</ul></li>
				<li><a href="#">공지사항</a>
					<ul>
						<li>- <a
							href="#"
							target="">공지사항등록</a>
						</li>

						<li>- <a
							href="#"
							target="">공지사항목록</a>
						</li>

						<li>- <a
							href="#"
							target="">공지사항수정</a>
						</li>

						<li>- <a
							href="#"
							target="">공지사항삭제</a>
						</li>

					</ul></li>
				<li><a href="#">통계 자료</a>
					<ul>
						<li>- <a
							href="../statistics/meter.jsp" target="">실시간그래프</a>
						</li>

						<li>- <a
							href="#"
							target="">기능1목록</a>
						</li>

						<li>- <a
							href="#" target="">기능1수정</a>
						</li>

						<li>- <a href="#"
							target="">기능1삭제</a>
						</li>


					</ul></li>
				<li><a href="#">마케팅</a>
					<ul>
						<li>- <a
							href="#"
							target="">입점광고</a>
						</li>

						<li>- <a
							href="#"
							target="">검색광고</a>
						</li>

						<li>- <a
							href="#"
							target="">쇼핑광고</a>
						</li>

						<li>- <a
							href="#"
							target="">배너/리타게팅광고</a>
						</li>


					</ul></li>
				<li><a href="#">기능</a>
					<ul>
						<li>- <a href="#"
							target="">아카데미 교육</a>
						</li>

						<li>- <a
							href="#"
							target="">실시간 온라인 교육</a>
						</li>

						<li>- <a
							href="#"
							target="">1:1 방문컨설팅</a>
						</li>





					</ul></li>
				<li><a href="#">마이</a>
					<ul>
						<li>- <a
							href="#"
							target="">쇼핑몰관리</a>
						</li>

						<li>- <a
							href="#" target="">아카데미관리</a>
						</li>

						<li>- <a href="#"
							target="">회원/결제/쿠폰</a>
						</li>

						<li>- <a href="#"
							target="">1:1문의/답변</a>
						</li>


					</ul></li>
				<li><a href="#">고객센터</a>
					<ul>
						<li>- <a
							href="#"
							target="_blank">나를 위한 이용가이드</a>
						</li>

						<li>- <a href="#"
							target="">자주 묻는 질문</a>
						</li>

						<li>- <a
							href="#"
							target="_blank">1:1문의</a>
						</li>

						<li>- <a href="#"
							target="">패치&amp;업그레이드</a>
						</li>


					</ul></li>
				<li><strong>회사소개</strong>
					<ul>
						<li><a href="#"
							target="_blank">- 회사소개</a></li>
						<li><a
							href="#"
							target="_blank">- 오시는 길</a></li>
						<li><a
							href="#"
							target="_blank">- 사업영역</a></li>
						<li><a
							href="#"
							target="_blank">- 고도인</a></li>
						<li><a
							href="#"
							target="_blank">- 채용안내</a></li>

					</ul></li>
				<li><strong>파트너</strong>
					<ul>
						<li><a href="#"
							target="_blank">- 디자인 파트너</a></li>
						<li><a href="#"
							target="_blank">- 맞춤개발 파트너</a></li>
						<li><a href="#">- 호스팅 파트너센터</a></li>
						<li class="line"><a
							href="#"
							onclick="window.open(this.href,'pop','width=821px,height=870px,scrollbars=yes');return false;">-
								제휴문의</a></li>

					</ul></li>
				<li><strong>리셀러</strong>
					<ul>
						<li><a href="#">-
								리셀러 안내</a></li>
						<li><a href="#">-
								수익배분</a></li>
						<li><a href="#">-
								리셀러 신청</a></li>
						<li><a href="#">-
								영업지원</a></li>
					</ul></li>
			</ul>
		</div>

	</div>
  </div>
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>