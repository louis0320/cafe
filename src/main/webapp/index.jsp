<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="chanyang">
    <title>Cafe Latte</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/notosans_kr_CDN.css">
    <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
    <!-- 페이지 CSS -->
    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/footer.css">
    <!-- JS 플러그인 파일 -->
    <script src="./js/jquery-1.12.4.min.js"></script>
    <script src="./js/jquery-3.3.1.min.js"></script>
    <script src="./js/prefixfree.min.js"></script>
</head>
<body>
	<div id="wrap">
	<%@ include file="./header_page.jsp" %>
		<div class="slide_area">
			<!-- 이미지 슬라이드 영역 -->
			<article class="slideshow_container">
			    <!-- Slide Image1 -->
			    <h2 class="slide">
			        <img src="./images/slide01.jpg" alt="메인">
			        <div class="number_text">1 / 3</div>
			    </h2>
			    <!-- Slide Image1 -->
			    <!-- Slide Image1 -->
			    <h2 class="slide">
			        <img src="./images/slide02.jpg" alt="메인">
			        <div class="number_text">2 / 3</div>
			    </h2>
			    <!-- Slide Image1 -->
			    <!-- Slide Image1 -->
			    <h2 class="slide">
			        <img src="./images/slide03.jpg" alt="메인">
			        <div class="number_text">2 / 3</div>
			    </h2>
			    <!-- Slide Image1 -->
			</article>
			<!-- 이미지 슬라이드 영역 -->
			
			<!-- DOT DOT DOT -->
			<aside class="circle">
			    <span class="dot" onclick="currentSlides(1)"></span>
			    <span class="dot" onclick="currentSlides(2)"></span>
			    <span class="dot" onclick="currentSlides(3)"></span>
			</aside>
			<!-- /DOT DOT DOT --> 
		</div>
	</div>
	<%@ include file="./footer.jsp" %>
<script src="./js/join.js"></script>	
</body>
</html>