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
			String sql="INSERT INTO member VALUES("
					+ "?,?,?,?,?,?,?,?,?,SYSDATE,'n',?,?)"; 
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getName());
			ps.setString(4, vo.getPhone());
			ps.setString(5, vo.getEmail());
			ps.setString(6, vo.getNickname());
			ps.setString(7, vo.getPost());
			ps.setString(8, vo.getAddr1());
			ps.setString(9, vo.getAddr2());
			ps.setString(10, vo.getGender());
			ps.setString(11, vo.getBirthday());
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
	
	
	// 아이디 찾기 - 이메일
	public String memberIdFind_Email(String email)
	{
		String result="";
		try {
			conn=db.getConnection();
			String sql="SELECT COUNT(*) FROM member "
					+ "WHERE email=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			rs.close();
			
			if(count==0)
			{
				result="NO";
			}
			else
			{
				sql="SELECT RPAD(SUBSTR(user_id,1,2),LENGTH(user_id),'*') "
					+ "FROM member "
					+ "WHERE email=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, email);
				rs=ps.executeQuery();
				rs.next();
				result=rs.getString(1);
				rs.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return result;
	}
	
	// 아이디 찾기 - 전화번호
	public String memberIdFind_Phone(String phone)
	{
		String result="";
		try {
			conn=db.getConnection();
			String sql="SELECT COUNT(*) FROM member "
					+ "WHERE phone=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, phone);
			ResultSet rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			rs.close();
			
			if(count==0)
			{
				result="NO";
			}
			else
			{
				sql="SELECT RPAD(SUBSTR(user_id,1,2),LENGTH(user_id),'*') "
					+ "FROM member "
					+ "WHERE phone=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, phone);
				rs=ps.executeQuery();
				rs.next();
				result=rs.getString(1);
				rs.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return result;
	} 
	
	// 비밀번호 찾기 - 아이디, 이메일
	public String memberPasswordFind_Email(String id, String email)
	{
		String result="";
		try {
			conn=db.getConnection();
			String sql="SELECT COUNT(*) FROM member "
					+ "WHERE user_id=? AND email=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, email);
			ResultSet rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			rs.close();
			
			if(count==0)
			{
				result="NO";
			}
			else
			{
				sql="SELECT password "
					+ "FROM member "
					+ "WHERE user_id=? AND email=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				ps.setString(2, email);
				rs=ps.executeQuery();
				rs.next();
				result=rs.getString(1);
				rs.close();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return result;
	}
	
	// 비밀번호 찾기 - 아이디, 전화번호
	public String memberPasswordFind_Phone(String id, String phone)
	{
		String result="";
		try {
			conn=db.getConnection();
			String sql="SELECT COUNT(*) FROM member "
					+ "WHERE user_id=? AND phone=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, phone);
			ResultSet rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			rs.close();
			
			if(count==0)
			{
				result="NO";
			}
			else
			{
				sql="SELECT password "
					+ "FROM member "
					+ "WHERE user_id=? AND phone=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				ps.setString(2, phone);
				rs=ps.executeQuery();
				rs.next();
				result=rs.getString(1);
				rs.close();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return result;
	}
	
	// 비밀번호 변경
	
	
	// 로그인
	public MemberVO Login(String id, String pwd)
	{
		MemberVO vo=new MemberVO();
		try {
			conn=db.getConnection();
			String sql="SELECT password, user_name, admin, gender, nickname "
					+ "FROM member "
					+ "WHERE user_id=?";
			
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()) { // id가 있는 경우
				vo.setId(id);
				vo.setPwd(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setAdmin(rs.getString(3));
				vo.setGender(rs.getString(4));
				vo.setNickname(rs.getString(5));
				
				if(pwd.equals(vo.getPwd())) {
					// 비밀번호가 맞는 경우 => 로그인 성공
					vo.setMsg("OK");
				}
				else {
					// 비밀번호가 틀린 경우
					vo.setMsg("NOPWD");
				}
			}
			
			else { // id가 없는 경우
				vo.setMsg("NOID");
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
