package com.sist.dao;
import java.sql.*;
import java.util.*;
import com.sist.common.*;
import com.sist.vo.MemberVO;
import com.sist.vo.ZipcodeVO;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDataBase db=new CreateDataBase();
	private static MemberDAO dao;
	
	public static MemberDAO newInstance()
	{
		if(dao==null)
			dao=new MemberDAO();
		return dao;
	}
	
	/* 회원가입 */
	
	// 1. 아이디 중복체크
	public int IdCheck(String id)
	{
		int count=0;
		try {
			conn=db.getConnection();
			String sql="SELECT COUNT(*) FROM member WHERE user_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return count;
	}
	
	// 2. 전화 중복체크
	public int PhoneCheck(String phone)
	{
		int count=0;
		try {
			conn=db.getConnection();
			String sql="SELECT COUNT(*) FROM member WHERE phone=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, phone);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return count;
	}
		
	
	// 3. 이메일 중복체크
	public int EmailCheck(String email)
	{
		int count=0;
		try {
			conn=db.getConnection();
			String sql="SELECT COUNT(*) FROM member WHERE email=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return count;
	}
	
	// 4. 닉네임 중복체크
	public int NicknameCheck(String nickname)
	{
		int count=0;
		try {
			conn=db.getConnection();
			String sql="SELECT COUNT(*) FROM member WHERE nickname=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, nickname);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return count;
	}
	
	
	// 5. 우편번호
	// 5-1. 우편번호 갯수
	public int postFindCount(String dong)
	{
		int count=0;
		try {
			conn=db.getConnection();
			String sql="SELECT COUNT(*) "
					+ "FROM zipcode "
					+ "WHERE dong LIKE '%'||?||'%'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dong);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return count;
	}
	
	// 5-2. 우편번호 검색 데이터
	public List<ZipcodeVO> postFindData(String dong)
	{
		List<ZipcodeVO> list=new ArrayList<ZipcodeVO>();
		try {
			conn=db.getConnection();
			String sql="SELECT zipcode,sido,gugun,dong,NVL(bunji,' ') "
					+ "FROM zipcode "
					+ "WHERE dong LIKE '%'||?||'%'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dong);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				ZipcodeVO vo=new ZipcodeVO();
				vo.setZipcode(rs.getString(1));
				vo.setSido(rs.getString(2));
				vo.setGugun(rs.getString(3));
				vo.setDong(rs.getString(4));
				vo.setBunji(rs.getString(5));
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
	
	// 6. 회원가입
	public void memberInsert(MemberVO vo)
	{
		try {
			conn=db.getConnection();
			String sql="INSERT INTO pet_member VALUES("
					+ "?,?,?,?,?,?,?,?,?,?,?,'n',SYSDATE)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getName());
			ps.setString(4, vo.getGender());
			ps.setString(5, vo.getPhone());
			ps.setString(6, vo.getEmail());
			ps.setString(7, vo.getNickname());
			ps.setString(8, vo.getBirthday());
			ps.setString(9, vo.getPost());
			ps.setString(10, vo.getAddr1());
			ps.setString(11, vo.getAddr2());
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
	}
	
	// 회원수정
	
	
	// 회원탈퇴
	
	
	// 아이디 찾기
	
	
	// 비밀번호 찾기
	
	
	// 비밀번호 변경
	
	
	// 로그인
	public MemberVO Login(String id, String pwd)
	{
		MemberVO vo=new MemberVO();
		try {
			conn=db.getConnection();
			String sql="SELECT COUNT(*) "
					+ "FROM pet_member "
					+ "WHERE id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			rs.close();
			
			if(count==0) // id가 없는 상태
			{
				vo.setMsg("NOID");
			}
			else // id가 있는 상태
			{
				sql="SELECT pwd,name,admin,gender "
					+ "FROM pet_member "
					+ "WHERE id=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				rs=ps.executeQuery();
				rs.next();
				String db_pwd=rs.getString(1);
				String name=rs.getString(2);
				String admin=rs.getString(3);
				String gender=rs.getString(4);
				rs.close();
				
				if(db_pwd.equals(pwd)) // 로그인 된 상태
				{
					vo.setId(id);
					vo.setName(name);
					vo.setAdmin(admin);
					vo.setGender(gender);
					vo.setMsg("OK");
				}
				else // 비밀번호가 틀린 상태
				{
					vo.setMsg("NOPWD");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return vo;
	}
	
}
