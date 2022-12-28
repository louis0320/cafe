<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%
	// 세션값을 가져와서 name에 할당

	String name  = (String) session.getAttribute("name");

	// join 페이지에서 넘어온 데이터 저장
	request.setCharacterEncoding("utf-8");
  	String id = request.getParameter("id");
  	String pw =request.getParameter("password");
  	String pwd =request.getParameter("pwd");
  	String name_user =request.getParameter("name");

  	
  	// db 접속
  	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url ="jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "hr", "hr");
	System.out.println("db접속");
	
	// db 처리
	// 1. sql 준비
	String sql = "insert into new_guest(id,password,pwd,name)"+"values(?,?,?,?)";
	// 2. ?
	PreparedStatement stmt = conn.prepareStatement(sql);
	// 3. ? 맵핑
	stmt.setString(1, id);
	stmt.setString(2, pw);
	stmt.setString(3, pwd);
	stmt.setString(4, name_user);

	// 4. 실행
	int cnt = stmt.executeUpdate();
	if(cnt != 0){
		response.sendRedirect("index.jsp");
	}
	// 5. 자원반남
	stmt.close();
	conn.close();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>