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
			String sql="SELECT /*+ INDEX_DESC(r PK_RESERVATION) */ "
					+ "res_id, res_state, TO_CHAR(res_date, 'YYYY-MM-DD HH24:MI:ss'), res_msg, r.com_id, c.COM_NAME, c.POSTER, c.address, c.phone, r.res_date-sysdate, p.pet_name "
					+ "FROM RESERVATION r, COMPANY c, pet p "
					+ "WHERE r.user_id = ? AND c.COM_ID = r.COM_ID AND r.pet_id = p.pet_id";
			ps=conn.prepareStatement(sql);
			ps.setString(1, uid);
			rs=ps.executeQuery();
			while(rs.next())
			{
				ReserveVO vo=new ReserveVO();

				vo.setUser_id(uid);
				vo.setRes_id(rs.getInt(1));
				vo.setRes_state(rs.getString(2));
				vo.setDbday(rs.getString(3));
				vo.setRes_msg(rs.getString(4));
				vo.setCom_id(rs.getInt(5));
				vo.setCom_name(rs.getString(6));
				vo.setPoster(rs.getString(7));
				vo.setAddress(rs.getString(8));
				vo.setPhone(rs.getString(9));
				double tmp = rs.getDouble(10);
				vo.setTimeOver(tmp>0?false:true);
				vo.setPet_name(rs.getString(11));
				
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
	public void delete_booking(int res_id) {
		try {
			conn = db.getConnection();
			String sql = "DELETE FROM reservation where res_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, res_id);
			ps.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			db.disConnection(conn, ps);
		}
	}
	
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
	
    /* ---- END OF 예약 ----- */

	
	/* ---- START OF myinfo ----- */
	// 로그인 된 내정보 찾기
	public MemberVO myinfo_detail(String id)
	{
		MemberVO vo=new MemberVO();
		try
		{
			conn=db.getConnection();
			String sql="SELECT USER_ID,USER_NAME,PHONE,EMAIL,NICKNAME,BIRTHDAY,POST,ADDR1,ADDR2,gender FROM member WHERE user_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
			rs.next();
			vo.setId(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setPhone(rs.getString(3));
			vo.setEmail(rs.getString(4));
			vo.setNickname(rs.getString(5));
			vo.setBirthday(rs.getString(6));
			vo.setPost(rs.getString(7));
			vo.setAddr1(rs.getString(8));
			vo.setAddr2(rs.getString(9));
			vo.setGender(rs.getString(10));
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
	
	// 회원정보 수정
	public int memberinfoUpdate(MemberVO vo)
	{
		int cnt = 0;
		try
		{
			conn=db.getConnection();
			String sql="SELECT password "
					+ "FROM member "
					+ "WHERE user_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ResultSet rs=ps.executeQuery();
			rs.next();
			String db_pwd=rs.getString(1);
			rs.close();
			
			if(db_pwd.equals(vo.getPwd()))
			{
				// 수정
				sql="UPDATE member SET "
						+ "user_name=?, "
						+ "email=?, "
						+ "phone=?, "
						+ "nickname=?, "
						+ "birthday=?, "
						+ "post=?, "
						+ "addr1=?, "
						+ "addr2=? "
						+ "WHERE user_id=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, vo.getName());
				ps.setString(2, vo.getEmail());
				ps.setString(3, vo.getPhone());
				ps.setString(4, vo.getNickname());
				ps.setString(5, vo.getBirthday());
				ps.setString(6, vo.getPost());
				ps.setString(7, vo.getAddr1());
				ps.setString(8, vo.getAddr2());
				ps.setString(9, vo.getId());
				cnt = ps.executeUpdate();
			}
			
		
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return cnt;
	}
	
	/* ----- END OF MYINFO ------- */
	
	
	/* --- START OF WISHLIST  ----*/
	// 위시리스트 취소 - 마이페이지> 위시리스트
		public void company_wish_cancel(int cno, String uid)
		{
			try
			{
				conn=db.getConnection();
				String sql="DELETE FROM wish_company "
						+ "WHERE com_id=? AND user_id=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, cno);
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
		
		// 위시리스트 목록 => 마이페이지 (위시리스트)
		public List<WishListVO> company_wish_list(String uid)
		{
			List<WishListVO> list=new ArrayList<WishListVO>();
			try
			{
				conn=db.getConnection();
				String sql="SELECT wc.USER_ID, c.COM_NAME, c.POSTER, cc.CATEGORY, wc.com_id "
						+ "FROM wish_company wc "
						+ "JOIN company c ON wc.COM_ID = c.COM_ID "
						+ "JOIN company_category cc ON c.COM_CATEGORY_ID = cc.COM_CATEGORY_ID "
						+ "WHERE wc.USER_ID = ?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, uid);
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					WishListVO vo=new WishListVO();
					vo.setUser_id(uid);
					vo.setCom_name(rs.getString(2));
					vo.setPoster(rs.getString(3));
					vo.setCategory(rs.getString(4));
					vo.setCom_id(rs.getInt(5));
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
	/* --- END OF WISHLIST  ----*/
	
	/* --- START OF MYPET ----*/
	// 마이펫 추가하기
	
		
	// 마이펫 수정하기

		// 마이펫 목록 보기 : 이름, 사진
		
	public List<MyPetVO> listmypet(String uid)
	{
		List<MyPetVO> list=new ArrayList<MyPetVO>();
		try
		{
			conn=db.getConnection();
			String sql="SELECT /*+ INDEX(p, PK_PET) */ "
					+ "pet_name, pet_birthyear, pet_gender, PET_CATEGORY, pet_id "
					+ "FROM pet p "
					+ "WHERE USER_ID = ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, uid);
			rs=ps.executeQuery();
			while(rs.next())
			{
				MyPetVO vo=new MyPetVO();
				vo.setName(rs.getString(1));
				int birthyear = rs.getInt(2);
				vo.setBirthyear(birthyear);
				vo.setGender(rs.getString(3));
				// 현재 연도를 구하는 방법 (java.util.Calendar 사용)
				Calendar calendar = Calendar.getInstance();
				int currentYear = calendar.get(Calendar.YEAR);
				// 만 나이 계산
				int age = currentYear-birthyear;
				vo.setAge(String.valueOf(age));
				vo.setCategory(rs.getString(4));
				vo.setPid(rs.getInt(5));
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
	
	public void delete_pet(int pid) {
		try {
			conn = db.getConnection();
			String sql = "DELETE FROM pet WHERE pet_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, pid);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			db.disConnection(conn, ps);
		}
	}
		
/*
 PET_ID
PET_CATEGORY
PET_NAME
PET_GENDER
PET_BIRTHYEAR
PET_WEIGHT
NEUTERED
USER_ID
 */
	// 마이펫 상세 보기
	public void addmypet(MyPetVO vo,String uid)
	{
		try
		{
			conn=db.getConnection();
			String sql="INSERT INTO pet VALUES("
					+ "pm_pti_seq.nextval,?,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getCategory() );
			ps.setString(2, vo.getName());
			ps.setString(3, vo.getGender());
			ps.setInt(4, vo.getBirthyear());
			ps.setString(5, vo.getWeight());
			ps.setString(6, vo.getNeutered());
			ps.setString(7, uid);
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
		
    /* --- END OF MYPET ----*/
		
		
		
}
