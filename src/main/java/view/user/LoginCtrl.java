package view.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.common.JDBCConnection;


@WebServlet("/LoginCtrl")
public class LoginCtrl extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		// 폼데이터 받기
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		// DB 접속
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			// DB 접속
			conn = JDBCConnection.getConnection();
			// SQL 준비
			String	sql = "select * from new_guest where id=?";
			// ?
			stmt = conn.prepareStatement(sql);
			// ? mappping
			stmt.setString(1, id);
			// 실행
			rs = stmt.executeQuery();
			// 메서드
			if(rs.next()) {
				String name = rs.getString("name");
				HttpSession session = request.getSession();
				session.setAttribute("name", name);
				response.sendRedirect("GetBoardListCtrl");
			}else {
				response.sendRedirect("login.jsp");
			}
			
		} 	catch (ClassNotFoundException e) {
			e.printStackTrace();
		}	catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			JDBCConnection.close(rs, stmt, conn);
		}
	}

}
