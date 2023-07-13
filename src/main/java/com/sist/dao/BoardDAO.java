package com.sist.dao;

//dbcp
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import com.sist.common.*;
import com.sist.vo.*;

public class BoardDAO {
	//연결
	private Connection conn;
	//sql 전송
	private PreparedStatement ps;
	//db 생성
	private CreateDataBase db=new CreateDataBase();
	//싱글턴
	private static BoardDAO dao;
	public static BoardDAO newInstance() {
		if(dao==null)
			dao=new BoardDAO();
		return dao;
	}
	
	
	//기능
	// 리스트
	public List<BoardVO> boardListData(int page)
	{
		List<BoardVO> list=new ArrayList<BoardVO>();
		try {
			conn=db.getConnection();
			
			String sql="SELECT BOARD_ID, title , USER_ID, TO_CHAR(regdate,'yyyy-mm-dd'),hit, board_category ,num "
				     +"FROM (SELECT BOARD_ID, title, USER_ID, regdate, hit, board_category, rownum as num "
				     +"FROM (SELECT /*+ INDEX_DESC(BOARD_ID PK_BOARD)*/BOARD_ID, title, USER_ID, regdate, hit, board_category "
				     +"FROM BOARD)) "
				     +"WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
		    int rowSize=10;
		    int start=(rowSize*page)-(rowSize-1);
		    int end=rowSize*page;
		    ps.setInt(1, start);
		    ps.setInt(2, end);
	   
		    // 결과값 읽기
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				   BoardVO vo=new BoardVO();
				   vo.setBoard_id(rs.getInt(1));
				   vo.setTitle(rs.getString(2));
				   vo.setUser_id(rs.getString(3));
				   vo.setDbday(rs.getString(4));
				   vo.setHit(rs.getInt(5));
				   vo.setBoard_category(rs.getString(6));
				   vo.setRownum(rs.getInt(7));
				   list.add(vo);
			   }
			   rs.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   db.disConnection(conn, ps);
		   }
		   return list;
	   }
	
	   // 1-1 총페이지 구하기 
	   public int freeboardTotalPage()
	   {
		   int total=0;
		   try
		   {
			   conn=db.getConnection();
			   String sql="SELECT CEIL(COUNT(*)/10.0) FROM BOARD";
			   ps=conn.prepareStatement(sql);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   total=rs.getInt(1);
			   rs.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   db.disConnection(conn, ps);
		   }
		   return total;
	   }
	   
	   // 2. 상세보기 
	   public BoardVO boardDetailData(int no)
	   {
		   BoardVO vo=new BoardVO();
		   try
		   {
			   conn=db.getConnection();
			   String sql="UPDATE board SET "
					     +"hit=hit+1 "
					     +"WHERE board_id=?";
			   // 조회수 증가 
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   ps.executeUpdate();
			   
			   // 실제 데이터 읽기 
			   sql="SELECT board_id, title, content, user_id, TO_CHAR(regdate,'yyyy-MM-dd'),hit "
				  +"FROM board "
				  +"WHERE board_id=?";
			   
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   vo.setBoard_id(rs.getInt(1));
			   vo.setTitle(rs.getString(2));
			   vo.setContent(rs.getString(3));
			   vo.setUser_id(rs.getString(4));
			   vo.setDbday(rs.getString(5));
			   vo.setHit(rs.getInt(6));
			   rs.close();
				  
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   db.disConnection(conn, ps);
		   }
		   return vo;
	   }
	   /*
	    *   BOARD_ID
			TITLE
			REGDATE
			CONTENT
			HIT
			COMMENT_CNT
			BOARD_CATEGORY
			USER_ID
	    * 
	    */
	   public void boardInsert(BoardVO vo)
	   {
		   try
		   {
			   conn=db.getConnection();
			   String sql="INSERT INTO board VALUES("
					     +"board_bi_seq.nextval,?,SYSDATE,?,0,0,?,?)";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, vo.getTitle());
			   ps.setString(2, vo.getContent());
			   ps.setString(3, vo.getBoard_category());
			   ps.setString(4, vo.getUser_id());
			   ps.executeUpdate(); // commit => autocommit
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   db.disConnection(conn, ps);
		   }
	   }


}
