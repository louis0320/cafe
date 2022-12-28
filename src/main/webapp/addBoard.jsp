<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	// 한글처리
	request.setCharacterEncoding("utf-8");
	// 세션값 가져오기
	String name = (String)session.getAttribute("name");
	if(name==null) {
	response.sendRedirect("login.jsp");
	}
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글쓰기 게시판</title>
    <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/login.css">
</head>
<body>
    <div id="wrap">
	<%@ include file="./header_page.jsp" %>
		<form method="post" action="AddBoardCtrl" class="inquiry_form">      
			<fieldset>
				<legend>문의게시판</legend>
				<ul>
					<li>
					    <input name="title" type="text" placeholder="제목을 입력해주세요." required autocomplete="off" autofocus> 
					</li>
					<li>
					    <input name="nickname" type="text"  placeholder="작성자를 입력해주세요." required maxlength="12">
					</li>
					<li>
					    <textarea name="content"  minlength="10" placeholder="내용을입력해주세요." required></textarea>
					</li>
					<li>
					    <input type="submit" value="등록하기">    
					</li>
				</ul>
			</fieldset>
		</form>
	<%@ include file="./footer.jsp" %>
    </div> 
</body>
</html>