package com.sist.dao;

//dbcp
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import com.sist.common.*;
import com.sist.vo.*;

public class BoardDAO {
	// 연결
	private Connection conn;
	// sql 전송
	private PreparedStatement ps;
	// db 생성
	private CreateDataBase db = new CreateDataBase();
	// 싱글턴
	private static BoardDAO dao;

	public static BoardDAO newInstance() {
		if (dao == null)
			dao = new BoardDAO();
		return dao;
	}

	// 기능
	// 리스트
	public List<BoardVO> boardListData(int page, String cat) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		try {
			conn = db.getConnection();
			int rowSize = 10;
			int start = (rowSize * page) - (rowSize - 1);
			int end = rowSize * page;
			
			if(cat.equals("전체"))
			{
				String sql = "SELECT BOARD_ID, title, board_category, USER_ID, TO_CHAR(regdate,'yyyy-MM-dd'),hit ,num "
						   + "FROM (SELECT BOARD_ID, title , board_category, USER_ID, regdate, hit, rownum as num "
						   + "FROM (SELECT /*+ INDEX_DESC(BOARD PK_BOARD)*/ BOARD_ID, title, board_category, USER_ID, regdate, hit "
						   + "FROM BOARD)) " + "WHERE num BETWEEN ? AND ? ";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, start);
				ps.setInt(2, end);
				
			}else {
				String sql = "SELECT BOARD_ID, title, board_category, USER_ID, TO_CHAR(regdate,'yyyy-MM-dd'),hit ,num "
						   + "FROM (SELECT BOARD_ID, title , board_category, USER_ID, regdate, hit, rownum as num "
						   + "FROM (SELECT /*+ INDEX_DESC(BOARD PK_BOARD)*/ BOARD_ID, title, board_category, USER_ID, regdate, hit "
						   + "FROM BOARD WHERE board_category = ?)) " + "WHERE num BETWEEN ? AND ? ";
				
				ps = conn.prepareStatement(sql);
				ps.setString(1, cat);
				ps.setInt(2, start);
				ps.setInt(3, end);
			}

			// 결과값 읽기
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setBoard_id(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setBoard_category(rs.getString(3));
				vo.setUser_id(rs.getString(4));
				vo.setDbday(rs.getString(5));
				System.out.println(vo.getDbday());
				vo.setHit(rs.getInt(6));
				vo.setRownum(rs.getInt(7));
				list.add(vo);
			}
			rs.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
		return list;
	}

	// 1-1 총페이지 구하기
	public int freeboardTotalPage(String cat) {
		int total = 0;
		try {
			conn = db.getConnection();
			if(cat.equals("전체")) {
				String sql = "SELECT CEIL(COUNT(*)/10.0) FROM BOARD";
				ps = conn.prepareStatement(sql);
				
			}else {
				String sql = "SELECT CEIL(COUNT(*)/10.0) FROM BOARD "
						+ "WHERE board_category = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, cat);
				
			}
				
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
		return total;
	}

	// 2. 상세보기
	public BoardVO boardDetailData(int no) {
		BoardVO vo = new BoardVO();
		try {
			conn = db.getConnection();
			String sql = "UPDATE board SET " + "hit=hit+1 " + "WHERE board_id=?";
			// 조회수 증가
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();

			// 실제 데이터 읽기
			sql = "SELECT board_id, title, content, user_id, TO_CHAR(regdate,'yyyy-MM-dd'),hit " + "FROM board "
					+ "WHERE board_id=?";

			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);

			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setBoard_id(rs.getInt(1));
			vo.setTitle(rs.getString(2));
			vo.setContent(rs.getString(3));
			vo.setUser_id(rs.getString(4));
			vo.setDbday(rs.getString(5));
			vo.setHit(rs.getInt(6));
			rs.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
		return vo;
	}
	/*
	 * BOARD_ID
		TITLE
		REGDATE
		CONTENT
		HIT
		COMMENT_CNT
		BOARD_CATEGORY
		USER_ID
	 */


	// 게시글 추가
	public void boardInsert(BoardVO vo) {
		try {
			conn = db.getConnection();
			String sql = "INSERT INTO board VALUES(" + "pm_bi_seq.nextval,?,SYSDATE,?,0,0,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getContent());
			ps.setString(3, vo.getUser_id());
			ps.setString(4, vo.getBoard_category());
			ps.executeUpdate(); // commit => autocommit
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
	}

	/*
	 * BOARD_ID TITLE REGDATE CONTENT HIT COMMENT_CNT BOARD_CATEGORY USER_ID
	 * 
	 */

	// 게시글 수정
	public BoardVO boardUpdateData(int no) {
		BoardVO vo = new BoardVO();
		try {
			conn = db.getConnection();
			String sql = "SELECT BOARD_CATEGORY, TITLE, CONTENT, USER_ID, BOARD_ID "
						+ "FROM Board "
						+ "WHERE board_id=?";

			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);

			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setBoard_category(rs.getString(1));
			vo.setTitle(rs.getString(2));
			vo.setContent(rs.getString(3));
			vo.setUser_id(rs.getString(4));
			vo.setBoard_id(rs.getInt(5));

			rs.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
		return vo;
	}

	// 5-1. 수정
	public boolean boardUpdate(BoardVO vo, String pwd) {
		boolean bCheck = false;
		try {
			conn = db.getConnection();
		
			String sql = "UPDATE BOARD b SET "
					   + "b.CONTENT = ? , "
					   + "b.title = ? , "
					   + "b.board_category = ? "
					   + "WHERE (SELECT password FROM MEMBER m WHERE m.USER_ID=b.USER_ID AND b.BOARD_ID=? ) = ?";

			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getContent());
			ps.setString(2, vo.getTitle());
			ps.setString(3, vo.getBoard_category());
			ps.setInt(4, vo.getBoard_id());
			ps.setString(5, pwd);

			int ret = ps.executeUpdate();
			if(ret == 0) {
				return false;
			}
			else {
				return true;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
		return bCheck;
	}
	
	// 6. 삭제 ==> Ajax
	   public String boardDelete(int no,String pwd)
	   {
		   String res="NO";
		   try
		   {
			   conn=db.getConnection();
			   String sql="SELECT password "
			   		+ "FROM member m JOIN board b "
			   		+ "ON m.user_id = b.user_id "
			   		+ "AND board_id = ?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   String db_pwd=rs.getString(1);
			   rs.close();
			   
			   if(db_pwd.equals(pwd))
			   {
				   res="YES";
				   
				   // 댓글후
				   // 참조하고 있는 댓글을 먼저 지운다.
				   sql="DELETE FROM reply "
				   		+ "WHERE board_id=?";
				   
				   ps=conn.prepareStatement(sql);
				   ps.setInt(1, no);
				   ps.executeUpdate();
				   
				   
				   sql="DELETE FROM board "
					  +"WHERE board_id=?";
				   ps=conn.prepareStatement(sql);
				   ps.setInt(1, no);
				   ps.executeUpdate();
			   }
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   db.disConnection(conn, ps);
		   }
		   return res;
	   }
	   
	   public List<BoardVO> getRecentList(String category){
		   List<BoardVO> list = new ArrayList<>();
		   
		   try {
			   conn = db.getConnection();
			   String sql = "SELECT /*+ INDEX_DESC(board PK_BOARD) */ "
			   		      + "BOARD_ID, TITLE, TO_CHAR(REGDATE,'YYYY-MM-DD'), CONTENT, HIT, COMMENT_CNT, USER_ID, rownum "
			   		      + "FROM board "
			   		      + "WHERE rownum<=5 AND BOARD_CATEGORY = ?";
			   ps = conn.prepareStatement(sql);
			   ps.setString(1, category);
			   
			   ResultSet rs = ps.executeQuery();
			   
			   while(rs.next()) {
				   BoardVO vo = new BoardVO();

				   vo.setBoard_id(rs.getInt(1));
				   vo.setTitle(rs.getString(2));
				   vo.setDbday(rs.getString(3));
				   vo.setContent(rs.getString(4));
				   vo.setHit(rs.getInt(5));
				   vo.setComment_cnt(rs.getInt(6));
				   vo.setUser_id(rs.getString(7));
				   
				   list.add(vo);
			   }
		   }
		   catch (Exception e) {
			   e.printStackTrace();
		   }
		   finally {
			   db.disConnection(conn, ps);
		   }
		   
		   return list;
	   }
}
