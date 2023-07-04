package com.sist.dao;

//dbcp
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import javax.security.auth.Subject;
import com.sist.vo.*;

public class BoardDAO {
	//연결
	private Connection conn;
	//sql 전송
	private PreparedStatement ps;
	//싱글턴
	private static BoardDAO dao;
	
	public static BoardDAO newInstance() {
		if(dao==null)
			dao=new BoardDAO();
		return dao;
	}
	//주소값 얻기
	public void getConnection() {
		try {
			Context init=new InitialContext();
			Context c=(Context)init.lookup("java://comp/env");
			DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			conn=ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//반환
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!= null) conn.close();
			//오라클 전송 : exit
		} catch (Exception ex) {}
	}
	
	//기능수행
	

}
