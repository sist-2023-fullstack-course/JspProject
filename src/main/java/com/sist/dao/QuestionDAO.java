package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.common.*;
import com.sist.vo.*;
public class QuestionDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDataBase db=new CreateDataBase();
	private static QuestionDAO dao;
	
	// 싱글턴
	public static QuestionDAO newInstance()
	{
		if(dao==null)
			dao=new QuestionDAO();
		return dao;
	}
	
	// 사용자 기능
	// 목록
	public List<QuestionVO> questionData(int page)
	{
		List<QuestionVO> list=new ArrayList<QuestionVO>();
		try {
			conn=db.getConnection();
			String sql="SELECT no,subject,name,TO_CHAR(regdate,'YYYY-MM-DD'),hit,group_tab,num "
					+ "FROM (SELECT no,subject,name,regdate,hit,group_tab,rownum as num "
					+ "FROM (SELECT no,subject,name,regdate,hit,group_tab "
					+ "FROM question_answer ORDER BY group_id DESC, group_step ASC)) "
					+ "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=10;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				QuestionVO vo=new QuestionVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setHit(rs.getInt(5));
				vo.setGroup_tab(rs.getInt(6));
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		
		return list;
	}
	
	// 총 페이지
	public int questionTotalPage()
	{
		int total=0;
  		try {
			conn=db.getConnection();
			String sql="SELECT CEIL(COUNT(*)/10.0) FROM question_answer";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return total;
	}
	
	// 질문 (새글)
	public void questionInsert(QuestionVO vo)
	{
  		try {
			conn=db.getConnection();
			String sql="INSERT INTO question_answer(no,id,name,subject,content,group_id) "
					+ "VALUES(qa_no_seq.nextval,?,?,?,?,"
					+ "(SELECT NVL(MAX(group_id)+1,1) FROM question_answer))";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getName());
			ps.setString(3, vo.getSubject());
			ps.setString(4, vo.getContent());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
	}
	
	// 삭제
	public void questionDelete(int no)
	{
  		try {
			conn=db.getConnection();
			String sql="SELECT group_id,isreply "
					+ "FROM question_answer "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			int gi=rs.getInt(1);
			int isreply=rs.getInt(2);
			rs.close();
			
			if(isreply==1)
			{
				sql="DELETE FROM question_answer "
					+ "WHERE group_id=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, gi);
				ps.executeUpdate();
			}
			else
			{
				sql="DELETE FROM question_answer "
					+ "WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, no);
				ps.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
	}
	
	// 상세내용 보기
	public QuestionVO questionDetailData(int no)
	{
		QuestionVO vo=new QuestionVO();
  		try {
			conn=db.getConnection();
			String sql="UPDATE question_answer SET "
					+ "hit=hit+1 "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();
			
			sql="SELECT no,name,id,subject,content,TO_CHAR(regdate,'YYYY-MM-DD'),hit "
					+ "FROM question_answer "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setId(rs.getString(3));
			vo.setSubject(rs.getString(4));
			vo.setContent(rs.getString(5));
			vo.setDbday(rs.getString(6));
			vo.setHit(rs.getInt(7));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return vo;
	}
	
	// 수정
	public QuestionVO questionUpdateData(int no)
	{
		QuestionVO vo=new QuestionVO();
  		try {
			conn=db.getConnection();
			String sql="SELECT no,name,id,subject,content,TO_CHAR(regdate,'YYYY-MM-DD'),hit "
					+ "FROM question_answer "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setId(rs.getString(3));
			vo.setSubject(rs.getString(4));
			vo.setContent(rs.getString(5));
			vo.setDbday(rs.getString(6));
			vo.setHit(rs.getInt(7));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return vo;
	}
	
	public void questionUpdate(QuestionVO vo)
	{
  		try {
			conn=db.getConnection();
			String sql="UPDATE question_answer SET "
					+ "subject=?, content=? "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getSubject());
			ps.setString(2, vo.getContent());
			ps.setInt(3, vo.getNo());
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
	}
	
	// 관리자 기능
	// 목록
	public List<QuestionVO> adminQuestionListData(int page)
	{
		List<QuestionVO> list=new ArrayList<QuestionVO>();
		try {
			conn=db.getConnection();
			String sql="SELECT no,subject,name,TO_CHAR(regdate,'YYYY-MM-DD'),hit,isreply,group_step,num "
					+ "FROM (SELECT no,subject,name,regdate,hit,isreply,group_step,rownum as num "
					+ "FROM (SELECT no,subject,name,regdate,hit,isreply,group_step "
					+ "FROM question_answer ORDER BY group_id DESC)) "
					+ "WHERE num BETWEEN ? AND ? "
					+ "AND group_step=0";
			
			ps=conn.prepareStatement(sql);
			int rowSize=10;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				QuestionVO vo=new QuestionVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setHit(rs.getInt(5));
				vo.setIsreply(rs.getInt(6));
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		
		return list;
	}
	
	// 총 페이지
	public int adminQuestionTotalPage()
	{
		int total=0;
  		try {
			conn=db.getConnection();
			String sql="SELECT CEIL(COUNT(*)/10.0) "
					+ "FROM question_answer "
					+ "WHERE group_step=0";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return total;
	}
	
	// 답변 (새글)
	public void adminQuestionInsert(int qno, QuestionVO vo)
	{
		try {
			conn=db.getConnection();
			conn.setAutoCommit(false);
			String sql="SELECT group_id FROM question_answer "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, qno);
			ResultSet rs=ps.executeQuery();
			rs.next();
			int gi=rs.getInt(1);
			rs.close();
			
			sql="INSERT INTO question_answer(no,id,name,subject,content,group_id,group_step,group_tab) "
				+ "VALUES(qa_no_seq.nextval,?,?,?,?,?,1,1)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getName());
			ps.setString(3, vo.getSubject());
			ps.setString(4, vo.getContent());
			ps.setInt(5, gi);
			ps.executeUpdate();
			
			sql="UPDATE question_answer SET "
				+ "isreply=1 "
				+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, qno);
			ps.executeUpdate();
			
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (Exception e2) {}
			e.printStackTrace();
		}
		finally
		{
			try {
				conn.setAutoCommit(true);
			} catch (Exception e2) {}
			db.disConnection(conn, ps);
		}
	}
	
}
