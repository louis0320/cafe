<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/login.css">
    <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
    <!-- 페이지 js 추가 -->
    <script src="./js/join.js"></script>
    <!-- 1. 제이쿼리 코어파일 사용 -->
    <script src="./js/jquery-1.12.4.min.js"></script>
    <script src="./js/jquery-3.3.1.min.js"></script>
	<script src="./js/join.js"></script>
</head>
<body>
	<div id="wrap">
	<%@ include file="./header_page.jsp" %>
		<header class="join_header">
			<h1>회원가입</h1>
		</header>
        <div id="join_form">
            <form action="joinCtrl.jsp" method="post" name="joinForm">
                <fieldset class="float_left">
                	<legend class="blind">기본정보</legend>
                	<table>
                		<tr>
                			<th>
                				아이디
                			</th>
                			<td> 
	                            <input type="text" name="id" placeholder="아이디" required autocomplete="off">                				
                			</td>
                		</tr>
                		<tr>
                			<th>
                				비밀번호
                			</th>
                			<td>
                            	<input type="password" name="password" id="password" placeholder="비밀번호" autocomplete="off" onchange="check_pw()">                			
                			</td>
                		</tr>
                		<tr>
                			<th>
                				비밀번호 확인
                			</th>
                			<td>
	                            <input type="password" name="pwd" id="pwd" placeholder="비밀번호 확인" autocomplete="off" onchange="check_pw()">
	                            &nbsp;<span id="check"></span>	
                			</td>
                		</tr>
                		<tr>
                			<th>
                				이름
                			</th>
                			<td>
	                            <input type="text" name="name" placeholder="이름" >                			
                			</td>
                		</tr>
                		<tr>
                			<th>
	                            <input type="submit" value="회원가입" onclick="validation_pw()">                			
                			</th>
                		</tr>
                	</table>
                </fieldset> 
                <fieldset class="join_check">
                    <legend class="blind">동의</legend>
                    <label for="agree">
                        <input type="checkbox" class="checkInput" id="check_all" name="agreement1" required>모두 동의합니다. <small>(선택 시 적립금 3,000원을 지급해드립니다.)</small> 
                    </label>
                    <label for="agree">
                        <input type="checkbox" class="ck" name="agreement2" required>(필수) 개인정보 처리 방침에 동의합니다.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span><a href="./#">약관보기</a></span>
                    </label>
                    <label for="agree">
                        <input type="checkbox" class="ck" name="agreement3" required>(필수) 이용약관에 동의합니다.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span><a href="./#">약관보기</a></span>
                    </label>
                    <label for="agree">
                        <input type="checkbox" class="ck" name="agreement4">(선택) 마케팅 정보 수신에 동의합니다.
                    </label>
                    <label for="agree">
                        <input type="checkbox" class="ck" name="agreement5">(선택) 평생회원 가입에 동의합니다.
                    </label>
                </fieldset>                      
            </form>
        </div>  
	</div>      
	<%@ include file="./footer.jsp" %>
</body>
</html>