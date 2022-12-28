<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>계정삭제</title>
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/login.css">
    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/footer.css">
</head>
<body>
   	<div id="wrap">
	<%@ include file="./header_page.jsp" %>
   		<div id="login">
	        <div class="login cf">
	            <form action="DeleteUserCtrl" method="post" class="login_form">
	                <fieldset>
	                    <legend>회원탈퇴</legend>
	                    <ul>
	                        <li>
	                            <input type="text" name="id" placeholder="아이디" required>
	                        </li>
	                        <li>
	                            <input type="password" name="password" placeholder="비밀번호" required>
	                        </li>
	                        <li>
	                            <input type="submit" value="계정삭제" class="login_btn" onclick="if(!confirm('회원탈퇴를 하시겠습니까?')){history.back();return false;}" >
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