package com.sist.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.sist.common.CreateDataBase;

public class ReserveDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	private CreateDataBase db;
	private static ReserveDAO dao;
	
	private ReserveDAO() {
		db = new CreateDataBase();
	}
	
	public static ReserveDAO getInstance() {
		if(dao == null)
			dao = new ReserveDAO();
		return dao;
	}
	
	public int insertReservation(int cid, String uid, String regdate, String msg, int pid) {
		int cnt = 0;
		
		try {
			conn = db.getConnection();
			String sql = "INSERT INTO reservation VALUES("
					   + "pm_rsi_seq.nextval, 'w', TO_DATE(?, 'YYYY-MM-DD HH24:MI:SS'), ?, '', ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, regdate);
			ps.setString(2, msg);
			ps.setString(3, uid);
			ps.setInt(4, cid);
			ps.setInt(5, pid);
			
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			db.disConnection(conn, ps);
		}
		
		return cnt;
	}
}
