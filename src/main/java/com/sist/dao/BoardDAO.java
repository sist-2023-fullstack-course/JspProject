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
	public List<BoardVO> freeboardListData(int page)
	{
		List<BoardVO> list=new ArrayList<BoardVO>();
		try {
			conn=db.getConnection();
			// SQL문 추후수정
			String sql="SELECT no, title ,name,TO_CHAR(regdate,'yyyy-mm-dd'),hit,num "
				     +"FROM (SELECT no,subject,name,regdate,hit,rownum as num "
				     +"FROM (SELECT /*+ INDEX_DESC(project_freeboard pf_no_pk)*/no,subject,name,regdate,hit "
				     +"FROM project_freeboard)) "
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
				   vo.setNo(rs.getInt(1));
				   //vo.setSubject(rs.getString(2));
				   vo.setName(rs.getString(3));
				   vo.setDbday(rs.getString(4));
				   vo.setHit(rs.getInt(5));
				   vo.setRownum(rs.getInt(6));
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
			   String sql="SELECT CEIL(COUNT(*)/10.0) FROM project_freeboard";
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

}
