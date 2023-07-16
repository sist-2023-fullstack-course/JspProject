package com.sist.dao;

import java.sql.*;
import java.util.*;
import com.sist.vo.*;
import com.sist.common.*;

public class AdminDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	private CreateDataBase db=new CreateDataBase();
	private static AdminDAO dao;
	
	// 싱글턴
	public static AdminDAO newInstance()
	{
		if(dao==null)
			dao=new AdminDAO();
		return dao;
	}
	
	
	/* ------ 예약 관리 관련 -------- */
	// 관리자 예약 목록 출력(state>n )
	public List<ReserveVO> admin_booking_list()
	{
		List<ReserveVO> list=new ArrayList<ReserveVO>();
		try
		{
			conn=db.getConnection();
			String sql="SELECT res_id,res_state,res_date,res_msg,res_img,user_id,c.com_id,pet_id,c.COM_NAME,c.POSTER "  
					 + "FROM reservation r, COMPANY c " 
					 + "WHERE r.COM_ID = c.COM_ID";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next())
			{
				ReserveVO vo=new ReserveVO();
				vo.setRes_id(rs.getInt(1));
				vo.setRes_state(rs.getString(2));
				vo.setRes_date(rs.getDate(3));
				vo.setRes_msg(rs.getString(4));
				vo.setRes_img(rs.getString(5));
				vo.setUser_id(rs.getString(6));
				vo.setCom_id(rs.getInt(7));
				vo.setPet_id(rs.getInt(8));
				vo.setCom_name(rs.getString(9));
				vo.setPoster(rs.getString(10));
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
	// 예약 상세내역 보기
	public ReserveVO booking_detail(int rno)
	{
		ReserveVO vo=new ReserveVO();
		try
		{
			conn=db.getConnection();
			String sql="SELECT res_id,res_state,res_date,res_msg,res_img,user_id,com_id,pet_id,companyName(com_id) "
					+ "FROM reservation "
					+ "WHERE res_id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, rno);
			rs=ps.executeQuery();
			rs.next();
			vo.setRes_id(rs.getInt(1));
			vo.setRes_state(rs.getString(2));
			vo.setRes_date(rs.getDate(3));
			vo.setRes_msg(rs.getString(4));
			vo.setRes_img(rs.getString(5));
			vo.setUser_id(rs.getString(6));
			vo.setCom_id(rs.getInt(7));
			vo.setPet_id(rs.getInt(8));
			vo.setCom_name(rs.getString(9));
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
	
	// 관리자 예약 상태 변경
	public void admin_booking_confirm(int cno)
	{
		try
		{
			conn=db.getConnection();
			String sql="UPDATE reservation SET "
					+ "res_state='y' "
					+ "WHERE res_id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cno);
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
	
	
}
