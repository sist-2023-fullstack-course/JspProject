package com.sist.dao;

import java.sql.*;
import java.util.*;
import com.sist.common.*;
import com.sist.vo.*;
import com.sist.dao.*;

public class WishListDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	private CreateDataBase db;
	private static WishListDAO dao;
	
	private WishListDAO() {
		db = new CreateDataBase();
	}
	
	public static WishListDAO newInstance()
	{
		if(dao==null)
			dao=new WishListDAO();
		return dao;
	}
	
	// 위시리스트 저장
	public void company_wish_insert(String uid, int cid)
	{
		try
		{
			conn=db.getConnection();
			String sql="INSERT INTO wish_company VALUES("
					+ "SYSDATE,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cid);
			ps.setString(2, uid);
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
	
	// 위시리스트 취소 - 기업> 상세페이지 ==> 보류
	public void company_wish_cancel(String uid, int cid)
	{
		try
		{
			conn=db.getConnection();
			String sql="DELETE FROM wish_company "
					+ "WHERE com_id=? AND user_id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cid);
			ps.setString(2, uid);
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
	
	
	// 위시리스트 취소 - 마이페이지> 위시리스트
	public void company_wish_cancel(int no)
	{
		try
		{
			conn=db.getConnection();
			String sql="DELETE FROM wish_company "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
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
	
	// 위시리스트 목록 => 마이페이지 (위시리스트)
	public List<WishListVO> company_wish_list(String id)
	{
		List<WishListVO> list=new ArrayList<WishListVO>();
		try
		{
			conn=db.getConnection();
			String sql="SELECT com_id,companyName(com_id),companyCategory(com_id) "
					+ "FROM wish_company "
					+ "WHERE id=? "
					+ "ORDER BY wish_no DESC";

			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				WishListVO vo=new WishListVO();
				vo.setCom_id(1);
				vo.setCom_name(rs.getString(2));
				vo.setCom_category_id(rs.getInt(3));
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

	// 회원이 해당 업체를 이미 좋아요를 했는지 확인하는 함수
	public boolean isClicked(String uid, int cid) {
		boolean ret = false;
		try {
			conn = db.getConnection();
			String sql = "SELECT count(*) FROM wish_company WHERE user_id=? AND com_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, uid);
			ps.setInt(2, cid);
			rs = ps.executeQuery();
			
			if(rs.next() && rs.getInt(1)>=1) {
				ret = true;
			}
			else {
				ret = false;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			db.disConnection(conn, ps);
		}
		return ret;
	}
}
