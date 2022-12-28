package view.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Connector;

import biz.common.JDBCConnection;


@WebServlet("/DeleteUserCtrl")
public class DeleteUserCtrl extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);		
	}

	// Get,Post 처리
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션 로그인
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		if(name==null) {
			response.sendRedirect("login.jsp");
		}
		
		// 한국어 
		request.setCharacterEncoding("utf-8");
		// 넘어오는 값 처리하기
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		
		// DB 연결
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			// DB 접속
			conn = JDBCConnection.getConnection();
			// SQL 
			String sql = "delete from new_guest where id=? and password=?";
			// ? 
			stmt = conn.prepareStatement(sql);
			// ? mapping
			stmt.setString(1, id);
			stmt.setString(2, pw);
			// 실행
			int cnt = stmt.executeUpdate();
			if(cnt!=0) {
				response.sendRedirect("index.jsp");
				session.invalidate();
			}
			
			
		} catch (ClassNotFoundException e) {
		    e.printStackTrace();
	    } catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    JDBCConnection.close(stmt,conn);
		}    
	}

}
