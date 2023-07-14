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
	
	public static WishListDAO newInstance()
	{
		if(dao==null)
			dao=new WishListDAO();
		return dao;
	}
	
	// 위시리스트 저장
	public void company_wish_insert(WishListVO vo)
	{
		try
		{
			conn=db.getConnection();
			String sql="INSERT INTO wish_company VALUES("
					+ "wc_wn_seq.nextval,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getUser_id());
			ps.setInt(2, vo.getCom_category_id());
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
	
	/*
	// 위시리스트 취소 - 기업> 상세페이지 ==> 보류
	public void company_wish_cancel(int no,String id)
	{
		try
		{
			conn=db.getConnection();
			String sql="DELETE FROM wish_company "
					+ "WHERE com_id=? AND id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.setString(2, id);
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
	*/
	
	
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
			String sql="SELECT wish_no,com_id,companyName(com_id),companyCategory(com_id) "
					+ "FROM wish_company "
					+ "WHERE id=? "
					+ "ORDER BY wish_no DESC";

			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				WishListVO vo=new WishListVO();
				vo.setWish_no(rs.getInt(1));
				vo.setCom_category_id(rs.getInt(2));
				vo.setCom_name(rs.getString(3));
				vo.setCom_category_id(rs.getInt(4));
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

	
}
