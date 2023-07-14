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
	public List<CompanyVO> getCompanyVOList(int page, String cate, String addr1, String addr2, String searchword){
		List<CompanyVO> list = new ArrayList<>();
		try {
			conn = db.getConnection();
			String sql = "SELECT com_id,com_name,address,time,poster,com_star_sum,com_star_cnt "
					   + "FROM ("
					   + "	SELECT /*+ INDEX(c, PK_COMPANY) */ "
					   + "	rownum AS num, com_id,com_name,address,time,poster,com_star_sum,com_star_cnt "
					   + "	FROM COMPANY c, LOCAL_CATEGORY lc , COMPANY_CATEGORY cc "
					   + "	WHERE c.LOC_CATEGORY_ID = lc.LOC_CATEGORY_ID AND c.COM_CATEGORY_ID = cc.COM_CATEGORY_ID "
					   + "	AND lc.LOCAL1 LIKE '%'||?||'%' "
					   + "	AND lc.LOCAL2 LIKE '%'||?||'%' "
					   + "	AND cc.CATEGORY LIKE '%'||?||'%' "
					   + "	AND c.com_name LIKE '%'||?||'%' "
					   + ")"
					   + "WHERE num BETWEEN ? AND ?";
			ps = conn.prepareStatement(sql);
			
			if(addr1.equals("전국")) {
				ps.setString(1, "");
				ps.setString(2, "");
			}
			else {
				ps.setString(1, addr1);
				if(addr2.equals("시군선택")) {
					ps.setString(2, "");
				}
				else {
					ps.setString(2, addr2);
				}
			}
			
			if(cate.equals("전체")) {
				ps.setString(3, "");
			}
			else {
				ps.setString(3, cate);
			}

			ps.setString(4, searchword);
			ps.setInt(5, (page-1)*PAGE_POSTING_COUNT + 1);
			ps.setInt(6, page*PAGE_POSTING_COUNT);
		
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
		return list;
	}
	
	// totalpage
	public int getTotalPage(int page, String cate, String addr1, String addr2, String searchword) {
		int cnt = 0;
		
		try {
			conn = db.getConnection();
			String sql = "SELECT count(*) "
					   + "FROM COMPANY c, LOCAL_CATEGORY lc , COMPANY_CATEGORY cc "
					   + "WHERE c.LOC_CATEGORY_ID = lc.LOC_CATEGORY_ID AND c.COM_CATEGORY_ID = cc.COM_CATEGORY_ID "
					   + "AND lc.LOCAL1 LIKE '%'||?||'%' "
					   + "AND lc.LOCAL2 LIKE '%'||?||'%' "
					   + "AND cc.CATEGORY LIKE '%'||?||'%' "
					   + "AND c.com_name LIKE '%'||?||'%'";
			ps = conn.prepareStatement(sql);
			
			if(addr1.equals("전국")) {
				ps.setString(1, "");
				ps.setString(2, "");
			}
			else {
				ps.setString(1, addr1);
				if(addr2.equals("시군선택")) {
					ps.setString(2, "");
				}
				else {
					ps.setString(2, addr2);
				}
			}
			if(cate.equals("전체")) {
				ps.setString(3, "");
			}
			else {
				ps.setString(3, cate);
			}
			ps.setString(4, searchword);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt(1);
				cnt = (int)Math.ceil(cnt/(double)PAGE_POSTING_COUNT);
			}
			rs.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			db.disConnection(conn, ps);
		}
		
		return cnt;
	}
	
	// 상세보기
	public CompanyVO getCompanyVO(int id) {
		CompanyVO vo = new CompanyVO();
		
		try {
			conn = db.getConnection();
			String sql = "SELECT com_name,address,time,content,com_star_sum,com_star_cnt,poster,cc.category,phone,homepage,map_info "
					   + "FROM company c, company_category cc "
					   + "WHERE c.com_category_id=cc.com_category_id "
					   + "AND com_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				vo.setCom_name(rs.getString(1));
				vo.setAddress(rs.getString(2));
				vo.setTime(rs.getString(3));
				vo.setContent(rs.getString(4));
				
				int sum = rs.getInt(5);
				int cnt = rs.getInt(6);
				if(cnt > 0)
					vo.setStar((double)sum/cnt);
				else
					vo.setStar(0.0);
				vo.setPoster(rs.getString(7));
				vo.setCategory(rs.getString(8));
				vo.setPhone(rs.getString(9));
				vo.setHomepage(rs.getString(10));
				String[] map = rs.getString(11).split(" ");
				vo.setMap_x(Double.parseDouble(map[0]));
				vo.setMap_y(Double.parseDouble(map[1]));
			}
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
