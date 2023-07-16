package com.sist.dao;

import java.sql.*;
import java.util.*;
import com.sist.vo.*;
import com.sist.common.*;

public class MyPageDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	private CreateDataBase db=new CreateDataBase();
	private static MyPageDAO dao;
	
	// 싱글턴
	public static MyPageDAO newInstance()
	{
		if(dao==null)
			dao=new MyPageDAO();
		return dao;
	}
	
	/* ------ 예약 내역 관련 -------- */
	// 일반 사용자 예약 목록 출력
	public List<ReserveVO> booking_list(String uid)
	{
		List<ReserveVO> list=new ArrayList<ReserveVO>();
		conn=db.getConnection();
		try
		{
			String sql="SELECT res_id,res_state,res_date,res_msg,res_img,user_id,com_id,pet_id,companyName(com_id) "
					+ "FROM reservation "
					+ "WHERE user_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, uid);
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
	// 일반 사용자 예약 취소
	
	// 일반 사용자 예약 상세보기
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
	
	/*
	 주소 연락처 영업시간 별점 홈페이지
	 */
	// 일반 사용자 예약한 업체 상세정보 조회하기
	public CompanyVO company_detail(int cno)
	{
		CompanyVO vo=new CompanyVO();
		try {
			conn = db.getConnection();
			String sql = "SELECT com_name,address,poster,cc.category,phone,map_info "
					   + "FROM company c, company_category cc "
					   + "WHERE com_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cno);
			rs=ps.executeQuery();
			rs.next();
			vo.setCom_name(rs.getString(1));
			vo.setAddress(rs.getString(2));
			String poster = rs.getString(3);
			if(poster.equals("none")) {
				vo.setPoster("../Images/noimage.jpeg");
			}
			else {
				vo.setPoster(poster);
			}
			vo.setCategory(rs.getString(4));
			vo.setPhone(rs.getString(5));
			vo.setMap_info(rs.getString(6));
			rs.close();

		} catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			db.disConnection(conn, ps);
		}
		return vo;
	}
	
}
