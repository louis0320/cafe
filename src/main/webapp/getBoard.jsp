<%@page import="biz.board.BoardVO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글
	request.setCharacterEncoding("utf-8");
	//로그인
	String name3 = (String)session.getAttribute("name");
	if(name3==null) response.sendRedirect("login.jsp");
	
	// 패키징한 데이터 바인딩으로 사용
	BoardVO board = (BoardVO)request.getAttribute("board"); 
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 상세내용 | 업데이트</title>
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="./css/login.css">
    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/footer.css">
    <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
</head>
<body>
	<div id="wrap">
	<%@ include file="./header_page.jsp" %>
		<form method="post" action="UpdateBoardCtrl" class="inquiry_form" name="removefrm">    
			<legend>수정하기</legend>
			<ul>
			    <li>
			        <input type="hidden" name="seq" value="<%=board.getSeq() %>">  
			    </li>
			    <li>
			        <input type="text" name="title" class="form-control" value=<%=board.getTitle() %>>   
			    </li>
			    <li>작성자 : 
			        <%=board.getNickname() %>
			    </li>
			    <li>
			        <textarea name="content" class="feedback-input"><%=board.getContent()%></textarea>
			    </li>
			    <li class="edit_btn">
			        <input type="submit" value="수정하기"  onclick="if(!confirm('수정하시겠습니까?')){history.back();return false;}">
					<a href="DeleteBoardCtrl?num=<%=board.getSeq()%>"><input type="button" value="글삭제" onclick="if(!confirm('삭제하시겠습니까?')){history.back();return false;}" name="title_del"></a>
					<a href="GetBoardListCtrl"><input type="button" value="글목록"></a>
			    </li>
			</ul>
		</form>
    </div> 
    <%@ include file="./footer.jsp" %>
</body>
</html>