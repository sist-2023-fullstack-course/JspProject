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
		conn=db.getConnection();
		try
		{
			String sql="SELECT /*+ INDEX_DESC(r PK_RESERVATION) */ "
					+ "res_id, res_state, TO_CHAR(res_date, 'YYYY-MM-DD HH24:MI:ss'), res_msg, r.com_id, c.COM_NAME, c.POSTER, c.address, c.phone,r.user_id,res_date-sysdate,m.user_name "
					+ "FROM RESERVATION r, COMPANY c, MEMBER m "
					+ "WHERE c.COM_ID = r.COM_ID AND r.user_id=m.user_id";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next())
			{
				ReserveVO vo=new ReserveVO();

				vo.setRes_id(rs.getInt(1));
				vo.setRes_state(rs.getString(2));
				vo.setDbday(rs.getString(3));
				vo.setRes_msg(rs.getString(4));
				vo.setCom_id(rs.getInt(5));
				vo.setCom_name(rs.getString(6));
				vo.setPoster(rs.getString(7));
				vo.setAddress(rs.getString(8));
				vo.setPhone(rs.getString(9));
				vo.setUser_id(rs.getString(10));
				double tmp = rs.getDouble(11);
				vo.setTimeOver(tmp>0.0?false:true);
				vo.setUser_name(rs.getString(12));
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
	public void admin_booking_confirm(int res_id, String state)
	{
		try
		{
			conn=db.getConnection();
			String sql="UPDATE reservation SET res_state=? WHERE res_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, state);
			ps.setInt(2, res_id);
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
