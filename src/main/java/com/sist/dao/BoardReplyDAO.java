package com.sist.dao;

import java.util.*;
import java.sql.*;
import com.sist.common.*;
import com.sist.vo.*;

public class BoardReplyDAO {
   private Connection conn;
   private PreparedStatement ps;
   private CreateDataBase db=new CreateDataBase();
   private static BoardReplyDAO dao;
   
   // 싱글턴 
   public static BoardReplyDAO newInstance()
   {
	   if(dao==null)
		   dao=new BoardReplyDAO();
	   return dao;
   }
   
   // 목록 출력 bno:게시물번호 
   public List<BoardReplyVO> replyListData(int bno)
   {
	   List<BoardReplyVO> list=new ArrayList<BoardReplyVO>();
			   
	   try
	   {
		   conn=db.getConnection();
		   String sql="SELECT rep_id, board_id, user_id, rep_content, TO_CHAR(rep_reg_date,'yyyy-MM-dd HH24:MI:SS'),"
				     +"group_tab, user_name "
				     +"FROM reply "
				     +"WHERE board_id=? "
				     +"ORDER BY group_id DESC,group_step ASC";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, bno);
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   BoardReplyVO vo=new BoardReplyVO();
			   vo.setRep_id(rs.getInt(1));
			   vo.setBoard_id(rs.getInt(2));
			   vo.setUser_id(rs.getString(3));
			   vo.setRep_content(rs.getString(4));
			   vo.setDbday(rs.getString(5));
			   vo.setGroup_tab(rs.getInt(6));
			   vo.setUser_name(rs.getString(7));
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
   
   //댓글 추가
   public void replyInsert(BoardReplyVO vo)
   {
	   try
	   {
		   conn=db.getConnection();
		   //게시물 댓글수 증가
		   String sql = "UPDATE board SET comment_cnt=comment_cnt+1 WHERE board_id=?";
			// 조회수 증가
			ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getBoard_id());
			ps.executeUpdate();
		   
		   sql="INSERT INTO reply(rep_id, board_id, user_id, rep_content, group_id, user_name) "
				     +"VALUES(pm_rpi_seq.nextval,?,?,?,"
				     +"(SELECT NVL(MAX(group_id)+1,1) FROM reply),?)";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, vo.getBoard_id());
		   ps.setString(2, vo.getUser_id());
		   ps.setString(3, vo.getRep_content());
		   ps.setString(4, vo.getUser_name());
		   ps.executeUpdate();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   db.disConnection(conn, null);
	   }
   }
   
   
   // 수정 
   public void replyUpdate(int no,String msg)
   {
	   try
	   {
		   conn=db.getConnection();
		   String sql="UPDATE reply SET "
				     +"rep_content=? "
				     +"WHERE rep_id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, msg);
		   ps.setInt(2, no);
		   ps.executeUpdate();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   db.disConnection(conn, ps);
	   }
   }
   
   // 댓글 삭제 
  public void replyDelete(int no)
  {
	   try
	   {
		   conn=db.getConnection();
		   conn.setAutoCommit(false);
		   // SQL문장이 여러개 수행 
		   String sql="SELECT root, depth, rep_content "
				     +"FROM reply "
				     +"WHERE rep_id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, no);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   int root=rs.getInt(1);
		   int depth=rs.getInt(2);
		   String msg1=rs.getString(3);
		   rs.close();
		   
		   //댓글이 부모인지 확인
		   if(root==0) {
			   if(depth==0 || msg1.equals("관리자가 삭제한 댓글입니다.") )
			   {
				   sql="DELETE FROM reply "
					  +"WHERE rep_id=?";
				   ps=conn.prepareStatement(sql);
				   ps.setInt(1, no);
				   ps.executeUpdate();
				   conn.commit();
			   }
			   else
			   {
				   //가리기만 해둔다.
				   String msg="관리자가 삭제한 댓글입니다.";
				   sql="UPDATE reply SET "
					  +"rep_content=? "
					  +"WHERE rep_id=?";
				   ps=conn.prepareStatement(sql);
				   ps.setString(1, msg);
				   ps.setInt(2, no);
				   ps.executeUpdate();
				   conn.commit();
			   }
		   }else {
			   if(depth==0)
			   {
				   sql="DELETE FROM reply "
					  +"WHERE rep_id=?";
				   ps=conn.prepareStatement(sql);
				   ps.setInt(1, no);
				   ps.executeUpdate();
				   
				   // depth감소 
				   sql="UPDATE reply SET "
					  +"depth=depth-1 "
					  +"WHERE rep_id=?";
				   ps=conn.prepareStatement(sql);
				   ps.setInt(1,root);
				   ps.executeUpdate();
				   
				   sql="SELECT depth "
				   		+ "FROM reply "
				   		+ "WHERE rep_id=?";
				   ps=conn.prepareStatement(sql);
				   ps.setInt(1, root);
				   rs=ps.executeQuery();
				   rs.next();
				   int rodepth=rs.getInt(1);
				   rs.close();
				   
				   //부모의 depth가 0이면 가려둔 부모도 삭제
				   if(rodepth<=0) {
					   sql="DELETE FROM reply "
								  +"WHERE rep_id=?";
					   ps=conn.prepareStatement(sql);
					   ps.setInt(1, root);
					   ps.executeUpdate();
					   conn.commit();
				   }
				   conn.commit();
				   
			   }else {
				 //가리기만 해둔다.
				   String msg="관리자가 삭제한 댓글입니다.";
				   sql="UPDATE reply SET "
					  +"rep_content=? "
					  +"WHERE rep_id=?";
				   ps=conn.prepareStatement(sql);
				   ps.setString(1, msg);
				   ps.setInt(2, no);
				   ps.executeUpdate();
			   }
		   }
		   
	   }catch(Exception ex)
	   {
		   try
		   {
			   conn.rollback();
		   }catch(Exception e) {}
		   ex.printStackTrace();
	   }
	   finally
	   {
		   try
		   {
			   conn.setAutoCommit(true);
		   }catch(Exception ex) {}
		   db.disConnection(conn, ps);
	   }
  }
   
   
   // 삭제 => 트랜잭션 적용 (일괄처리) => commit() , catch => rollback()
   // 대댓글 입력 => 트랜잭션 적용 (일괄처리) => commit() , catch => rollback()
   // 대댓글 입력 
   // Spring 
   // @Transactional
   // 금융권 => 카드결제 => 포인트
   /*
    *                    gi    gs   gt
    *     AAAAAAA        1     0    0
    *       =>KKKKKKK    1     1    1
    *       =>DDDDDD     1     2    1
    *       =>BBBBBB     1     3    1
    *        =>CCCCCCC   1     4    2
    *       
    */
  
   
   public void replyReplyInsert(int pno, BoardReplyVO vo)
   {
	   try
	   {
		   conn=db.getConnection();
		   // autocommit해제 
		   conn.setAutoCommit(false);
		   // 처리 => SQL문장이 여러개 수행 => INSERT / UPDATE / DELETE
		   String sql="SELECT group_id,group_step,group_tab "
				     +"FROM reply "
				     +"WHERE rep_id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, pno);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   int gi=rs.getInt(1);
		   int gs=rs.getInt(2);
		   int gt=rs.getInt(3);
		   rs.close();
		   
		   // group_step+1 => update
		   sql="UPDATE reply SET "
			  +"group_step=group_step+1 "
			  +"WHERE group_id=? AND group_step>?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, gi);
		   ps.setInt(2, gs);
		   ps.executeUpdate(); // (commit()=>X)
		   // insert => insert
		   /*
				REP_ID
				BOARD_ID
				USER_ID
				REP_CONTENT
				REP_REG_DATE
				GROUP_ID
				GROUP_STEP
				GROUP_TAB
				ROOT
				DEPTH
				
				*/
		    
		   sql="INSERT INTO reply VALUES("
			  +"pm_rpi_seq.nextval,?,?,?,SYSDATE,?,?,?,?,0,?)";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, vo.getBoard_id());
		   ps.setString(2, vo.getUser_id());
		   ps.setString(3, vo.getRep_content());
		   
		   ps.setInt(4,gi);
		   ps.setInt(5, gs+1);
		   ps.setInt(6, gt+1);
		   ps.setInt(7, pno);
		   ps.setString(8,vo.getUser_name() );
		   ps.executeUpdate();
		   // depth => update
		   
		   sql="UPDATE reply SET "
			  +"depth=depth+1 "
			  +"WHERE rep_id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, pno);
		   ps.executeUpdate();
		   
		   conn.commit();
	   }catch(Exception ex)
	   {
		   try
		   {
			   conn.rollback();
		   }catch(Exception e) {}
		   ex.printStackTrace();
	   }
	   finally
	   {
		   // conn의 원래 기능으로 설정 
		   try
		   {
			   conn.setAutoCommit(true);
		   }catch(Exception ex) {}
		   db.disConnection(conn, ps);
	   }
   }
   
   
}





