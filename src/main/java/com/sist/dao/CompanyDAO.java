package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.common.CreateDataBase;
import com.sist.vo.CompanyVO;

public class CompanyDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	private CreateDataBase db;
	private static CompanyDAO dao;
	
	private final int PAGE_POSTING_COUNT = 12;
	
	private CompanyDAO() {
		db = new CreateDataBase();
	}
	
	public static CompanyDAO getInstance() {
		if(dao == null)
			dao = new CompanyDAO();
		return dao;
	}
	
	// 리스트 출력
	public List<CompanyVO> getCompanyVOListByPage(int page, int sc, int ec, int cate){
		List<CompanyVO> list = new ArrayList<>();
		
		try {
			conn = db.getConnection();
			String sql = "SELECT /*+ INDEX_ACSC(company PK_COMPANY) */ com_id,com_name,address,time,poster,com_star_sum,com_star_cnt "
					   + "FROM company "
					   + "WHERE com_id BETWEEN ? AND ? "
					   + "AND loc_category_id BETWEEN ? AND ? "
					   + "AND com_category_id BETWEEN ? AND ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, (page-1)*PAGE_POSTING_COUNT + 1);
			ps.setInt(2, page*PAGE_POSTING_COUNT);
			ps.setInt(3, sc);
			ps.setInt(4, ec);
			if(cate==0) {
				ps.setInt(5, 1);
				ps.setInt(6, 6);
			}
			else {
				ps.setInt(5, cate);
				ps.setInt(6, cate);
			}
			
			rs = ps.executeQuery();
			while(rs.next()) {
				CompanyVO vo = new CompanyVO();
				vo.setId(rs.getInt(1));
				vo.setCom_name(rs.getString(2));
				vo.setAddress(rs.getString(3));
				vo.setTime(rs.getString(4));

				String poster = rs.getString(5);
				if(poster.equals("none")) {
					vo.setPoster("../Images/noimage.jpeg");
				}
				else {
					vo.setPoster(rs.getString(5));
				}
				
				int star_sum = rs.getInt(6);
				int star_cnt = rs.getInt(7);
				if(star_cnt==0)
					vo.setStar(0.0);
				else
					vo.setStar(star_sum/(double)star_cnt);
				list.add(vo);
			}
			rs.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			db.disConnection(conn, ps);
		}
		System.out.println("db수행" + list.size());
		return list;
	}
	
	// totalpage
	public int getTotalPage() {
		int cnt = 0;
		
		try {
			conn = db.getConnection();
			String sql = "SELECT ceil(count(*)/10.0) FROM company";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			rs.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
}
