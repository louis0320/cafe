package view.board;

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

import biz.common.JDBCConnection;

/**
 * Servlet implementation class DeleteBoardCtrl
 */
@WebServlet("/DeleteBoardCtrl")
public class DeleteBoardCtrl extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);		
	}

	// Get,Post 처리
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션 로그인
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		if(name==null) {
			response.sendRedirect("login.jsp");
		}
		// 한글 처리
		request.setCharacterEncoding("utf-8");
		// hidden으로 넘어오는 값 받기
		int num = Integer.parseInt(request.getParameter("num"));
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		// Connection DB 연결
		try {
			// DB 연결
			conn = JDBCConnection.getConnection();
			// SQL 준비
			String sql = "delete from user_board where seq=?";
			// ?
			stmt = conn.prepareStatement(sql);
			// ? mapping
			stmt.setInt(1, num);
			// 실행
			int cnt = stmt.executeUpdate();
			if(cnt!=0) {
				response.sendRedirect("GetBoardListCtrl");
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
