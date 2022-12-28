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


@WebServlet("/AddBoardCtrl")
public class AddBoardCtrl extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);		 
	}

	// get/post 처리
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 유무
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		if(name==null) {
			response.sendRedirect("login.jsp");
		}
		
		// 새글 쓰기 페이지에서 넘어오는 값 할당
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String nickname = request.getParameter("nickname");
		String content = request.getParameter("content");
		
		// DB 연결

		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			// db 접속
			conn = JDBCConnection.getConnection();
			// sql 준비
			String sql = "insert into user_board(seq,title,nickname,content)"+
						"values((select nvl(max(seq),0)+1 from user_board),?,?,?)";
			// ?
			stmt = conn.prepareStatement(sql);
			// ? mapping
			stmt.setString(1, title);
			stmt.setString(2, nickname);
			stmt.setString(3, content);
			// 실행
			int cnt = stmt.executeUpdate();
			if(cnt !=0) {
				response.sendRedirect("GetBoardListCtrl");
			}
			// 자원반납
			stmt.close();
			conn.close();
			
		} catch (ClassNotFoundException e) {
		    e.printStackTrace();
	    } catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    JDBCConnection.close(stmt,conn);
}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
