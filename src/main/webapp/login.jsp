<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/login.css">
    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/footer.css">
    <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
</head>
<body>
   	<div id="wrap">
	<%@ include file="./header_page.jsp" %>
   		<div id="login">
	        <div class="login cf">
	            <form action="LoginCtrl" method="post" class="login_form">
	                <fieldset>
	                    <legend>회원 로그인</legend>
	                    <ul>
	                        <li>
	                            <input type="text" name="id" placeholder="아이디" required>
	                        </li>
	                        <li>
	                            <input type="password" name="password" placeholder="비밀번호" required>
	                        </li>
	                        <li> 
	                        	<label>
                                	<input type="checkbox" >아이디 저장     
                        	    </label>
	                        </li>
	                        <li>
	                            <input type="submit" value="로그인" class="login_btn">
	                        </li>
	                    </ul>
	                    <ul>
	                        <li class="newbie">
	                            <a href="join.jsp"><input type="button" value="회원가입"></a>
	                            <input type="button" value="아이디 찾기">
	                            <input type="button" value="비밀번호 찾기">
	                        </li>
	                    </ul>
	                </fieldset>                    
	            </form>
	   		</div>
            <div class="login_img">
            	<img src="./images/coffee.jpg" alt="coffee" width="280" height="175">
            </div>
        </div>
    </div>     
    <%@ include file="./footer.jsp" %>    
</body>
</html>