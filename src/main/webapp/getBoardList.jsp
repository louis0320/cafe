<%@page import="biz.board.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = (String)session.getAttribute("name");
	if(name==null) response.sendRedirect("login.jsp");
	request.setCharacterEncoding("utf-8");   
  	String options = (String)session.getAttribute("options");   
	String search = (String)session.getAttribute("search");

	// (중요) 바이딩 데이터 가져오기
	ArrayList<BoardVO> boardList = (ArrayList<BoardVO>)request.getAttribute("boardList");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글 목록 보기</title>
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="./css/login.css">
    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/footer.css">
    <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
    <script>
     // select에 선택한 값 표시하기
    function load_init() {
        var opt = <%=options%>;    // 선택된 option값 변수로 선언
        document.frm.options.selectedIndex = opt;
    }
	</script>
</head>
<body onload="load_init()">
	<div id="wrap">
	<%@ include file="./header_page.jsp" %>
		<form class="board_list_form"> 
			<fieldset>
				<legend>상품Q&amp;A</legend>
				<table>
			        <tr class="table_header">
			            <th width="200">번호</th>
			            <th width="800">문의/답변</th>
			            <th width="200">작성자</th>
		             	<th width="200">조회수</th>
			            <th width="200">등록일</th>
			        </tr>
<%
	for(int i = 0; i<boardList.size();i++) {
		BoardVO board = boardList.get(i);
%>
			        <tr>
				        <td width="200"><%=board.getSeq() %></td>
				        <td width="800"><a href="GetBoardCtrl?num=<%=board.getSeq()%>"><%=board.getTitle()%></a></td>
				        <td width="200"><%=board.getNickname()%></td>
				        <td width="200"><%=board.getCnt() %></td>
				        <td width="200"><%=board.getRegdate()%></td>
			        </tr>
<%
	}
%>
		    	</table>
			</fieldset>     
		</form>
		<div class="list_acc">
			<h2><a href="./addBoard.jsp">작성하기</a></h2>
			<div class="search_box">
				<form name="frm" method="post" action="GetBoardListCtrl">
                    <select name="options">
                        <option value="0">전체</option>
                        <option value="1">작성자</option>
                        <option value="2">문의/답변</option>
                        <option value="3">내용</option>
                        <option value="4">날짜</option>
                    </select>
                    <input type="text" name="search" class="search_txt">
                    <input class="search_btn" type="submit" value="검색하기">	        
			    </form>
			</div>
		</div>
    </div> 
	<%@ include file="./footer.jsp" %>
</body>
</html>