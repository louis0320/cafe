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


@WebServlet("/UpdateBoardCtrl")
public class UpdateBoardCtrl extends HttpServlet {
	
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);
	}

	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션 로그인
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		if(name==null) {
			response.sendRedirect("login.jsp");
		}
		
		// 한글 처리
		request.setCharacterEncoding("utf-8");
		
		// hidden으로 넘어오는 값 처리
		int num = Integer.parseInt(request.getParameter("seq"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		// Connection DB 연결
		try {
			// DB 연결
			conn = JDBCConnection.getConnection();
			// SQL 작성
			String sql = "Update user_board set title=?, content=? where seq=?";
			// ?
			stmt = conn.prepareStatement(sql);
			// ? mapping
			stmt.setString(1, title);
			stmt.setString(2, content);
			stmt.setInt(3, num);
			
			int cnt = stmt.executeUpdate();
			if(cnt !=0) {
				response.sendRedirect("GetBoardListCtrl");
			}
			stmt.close();
			
		} catch (ClassNotFoundException e) {
	         e.printStackTrace();
	    } catch (SQLException e) {
	       e.printStackTrace();
	    } finally {
	       JDBCConnection.close(stmt, conn);
	    }
	}

}
