package view.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.board.BoardVO;
import biz.common.JDBCConnection;


@WebServlet("/GetBoardListCtrl")
public class GetBoardListCtrl extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request,response);
	}

	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		// 세션
		HttpSession session = request.getSession();
		// DB 접속
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			// DB 접속
			conn = JDBCConnection.getConnection();
			// SQL
			String sql = null;
			String options = request.getParameter("options");    
			String search = request.getParameter("search"); 

		    // 검색 유무에 따라 실행할 SQL 변경 
		    if (options == null){    
			    options = "0";
		    }
		    if (search == null){
		        search = "";
		    }
		    if (options.equals("0")){
		        sql = "select * from user_board order by seq desc";
		    }else if(options.equals("1")){    // 이름으로 검색할 때
		        sql = "select * from user_board where nickname like '%" + search +"%' order by seq desc";
		    }else if(options.equals("2")){    // 제목으로 검색할 때
		        sql = "select * from user_board where title like '%" + search + "%' order by seq desc";
		    }else if(options.equals("3")){    // 내용으로 검색할 때
		        sql = "select * from user_board where content like '%" + search + "%' order by seq desc";
		    }else if(options.equals("4")){    // 내용으로 검색할 때
		        sql = "select * from user_board where regdate like '%" + search + "%' order by seq desc";
		    }
		    
		    // ?
		    stmt = conn.prepareStatement(sql);
		    // 실행
		    rs = stmt.executeQuery();
		    
		    // 자바빈 생성
		    ArrayList<BoardVO> boardList = new ArrayList<BoardVO>();
		    while(rs.next()) {
		    	int seq = rs.getInt("seq");
		    	String title = rs.getString("title");
		    	String nickname = rs.getString("nickname"); 
		    	String content = rs.getString("content");
		    	Date regdate = rs.getDate("regdate");
		    	int cnt = rs.getInt("cnt");
		    	String userid = rs.getString("userid");
		    	
		    	// 위에 작업한 동적 데이터를 자바빈에 셋팅하기
		    	BoardVO board = new BoardVO();
		    	board.setSeq(seq);
		    	board.setTitle(title);
		    	board.setNickname(nickname);
		    	board.setContent(content);
		    	board.setRegdate(regdate);
		    	board.setCnt(cnt);
		    	board.setUserid(userid);
		    	
		    	// 패키징하기
		    	boardList.add(board); 	
		    }
		    
		    // 바인딩
		    request.setAttribute("boardList", boardList);
		    // 포워딩
		    RequestDispatcher dis = request.getRequestDispatcher("getBoardList.jsp");
		    dis.forward(request, response);
		    
		} catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	    	JDBCConnection.close(stmt,conn);
	    }
	}

}
