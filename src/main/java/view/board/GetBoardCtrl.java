package view.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.board.BoardVO;
import biz.common.JDBCConnection;


@WebServlet("/GetBoardCtrl")
public class GetBoardCtrl extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);
	}

	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// session 처리
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		if(name==null) {
			response.sendRedirect("login.jsp");
		}
		// 넘어오는 seq값 num에 할당
		int num = Integer.parseInt(request.getParameter("num"));
		
		// DB 접속
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			// DB 접속
			conn = JDBCConnection.getConnection();
			// SQL 
			// a. cnt 조회수 증가 
			String sql = "update user_board set cnt =(select cnt +1 from user_board where seq=?) where seq=?";
			// ?
			stmt = conn.prepareStatement(sql);
			// ? mapping
			stmt.setInt(1, num);
			stmt.setInt(2, num);
			// 실행
			stmt.executeUpdate();
			stmt.close();
			
			// b. 해당 글의 데이터 가져오기
			sql = "select * from user_board where seq=?";
			// ?
			stmt = conn.prepareStatement(sql);
			// ? mapping
			stmt.setInt(1, num);
			// 실행
			rs = stmt.executeQuery();
			// 자바빈 사용하기
			BoardVO board = new BoardVO();
			if(rs.next()) {
				board.setSeq(rs.getInt("seq"));
				board.setNickname(rs.getString("nickname"));
				board.setContent(rs.getString("content"));
				board.setTitle(rs.getString("title"));
				board.setRegdate(rs.getDate("regdate"));
				board.setCnt(rs.getInt("cnt"));
				board.setUserid(rs.getString("userid"));
			}
			// 패키징
			request.setAttribute("board", board);
			// 포워딩
			RequestDispatcher dis = request.getRequestDispatcher("getBoard.jsp");
			dis.forward(request, response);
			
			
		}  catch (ClassNotFoundException e) {
			e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCConnection.close(stmt,conn);
        }
	}

}
