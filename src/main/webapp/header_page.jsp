<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="chanyang">
    <title>header</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/notosans_kr_CDN.css">
    <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
    <!-- 페이지 CSS -->
    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/login.css">
    <!-- JS 플러그인 파일 -->
    <script src="./js/jquery-1.12.4.min.js"></script>
    <script src="./js/jquery-3.3.1.min.js"></script>
    <script src="./js/prefixfree.min.js"></script>
    <script>
        $(document).ready(function(){
            $('.second li').on({'mouseenter':function(){
                $(this).children('div').stop().show();
            },'mouseleave':function(){
                $(this).find('div:visible').stop().hide();
            }});
         });
    </script>
</head>
<body>
	<header class="w1280 cf">
	    <div class="first">
	        <h1 class="logo">
	            <a href="index.jsp">Cafe&nbsp;Latte</a>
	        </h1>
	        <form action="loginCtrl.jsp" method="post">
	        <nav>
	            <ul>
<%
	String name1 = (String)session.getAttribute("name");
	if(name1==null){
%>
                       <a href="login.jsp"><li>로그인&nbsp;&nbsp;&nbsp;&nbsp;</li></a>
                       <a href="addBoard.jsp"><li>문의하기&nbsp;&nbsp;&nbsp;&nbsp;</li></a>
                       <a href="GetBoardListCtrl"><li>문의글보기&nbsp;&nbsp;&nbsp;&nbsp;</li></a>
                       <a href="join.jsp"><li>회원가입&nbsp;&nbsp;&nbsp;&nbsp;</li></a>

<%	
	}else{
%>
                       <a href="LogoutCtrl"><li>로그아웃&nbsp;&nbsp;&nbsp;&nbsp;</li></a>
                       <a href="addBoard.jsp"><li>문의하기&nbsp;&nbsp;&nbsp;&nbsp;</li></a>
                       <a href="GetBoardListCtrl"><li>문의글보기&nbsp;&nbsp;&nbsp;&nbsp;</li></a>
                       <a href="delete_user.jsp"><li>회원탈퇴</li></a>
<%
	}
%>
                 </ul>
             </nav>
             </form>
         </div>
     </header>
     <nav class="w1280">
         <div id="menu">
             <ul class="second">
                 <li>
                     <a href="#" class="menu">커피/생두</a>
                     <div class="submenu">
                         <p><a href="#">스페셜티</a></p>
                         <p><a href="#">블렌딩</a></p>
                         <p><a href="#">디카페인</a></p>
                     </div>
                 </li>
                 <li>
                     <a href="#">핸드드립</a>
                     <div class="submenu">
                         <p><a href="#">용도별</a></p>
                         <p><a href="#">브랜드별</a></p>
                         <p><a href="#">재질별</a></p>
                     </div>
                 </li>
                 <li>
                     <a href="#">커피추출용품</a>
                     <div class="submenu">
                         <p><a href="#">침출식</a></p>
                         <p><a href="#">사이폰</a></p>
                         <p><a href="#">프렌치프레스</a></p>
                     </div>
                 </li>
                 <li>
                     <a href="#">베이커리</a>
                     <div class="submenu">
                         <p><a href="#">디저트</a></p>
                         <p><a href="#">시럽/소스</a></p>
                         <p><a href="#">파우더</a></p>
                     </div>
                 </li>
                 <li>
                     <a href="#">테이크아웃</a>
                     <div class="submenu">
                         <p><a href="#">종이컵</a></p>
                         <p><a href="#">아이스컵</a></p>
                         <p><a href="#">악세사리</a></p>
                     </div>
                 </li>
                 <li>
                     <a href="#">잔/텀블러</a>
                     <div class="submenu">
                         <p><a href="#">라떼잔</a></p>
                         <p><a href="#">머그</a></p>
                         <p><a href="#">텀블러</a></p>
                     </div>
                 </li>
                 <li>
                     <a href="#">카페용품</a>
                     <div class="submenu">
                         <p><a href="#">템퍼</a></p>
                         <p><a href="#">스팀피처</a></p>
                         <p><a href="#">밀크저그</a></p>
                     </div>
                 </li>
                 <li>
                     <a href="#">커피머신</a>
                     <div class="submenu">
                         <p><a href="#">가정용</a></p>
                         <p><a href="#">매장용</a></p>
                         <p><a href="#">전자동</a></p>
                     </div>
                 </li>
             </ul>
         </div>
     </nav>
</body>
</html>