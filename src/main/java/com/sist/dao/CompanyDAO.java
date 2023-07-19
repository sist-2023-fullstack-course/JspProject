package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.common.CreateDataBase;
import com.sist.vo.CompanyReviewVO;
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
					vo.setStar(Math.round((double)star_sum/star_cnt*10)/10.0);
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
					vo.setStar(Math.round((double)sum/cnt*10)/10.0);
				else
					vo.setStar(0.0);
				vo.setId(id);
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
	
	public int insertCompanyReview(CompanyReviewVO vo) {
		int cnt = 0;
		
		try {
			conn = db.getConnection();
			String sql = "INSERT INTO review VALUES("
					   + "pm_rvi_seq.nextval,?,0,SYSDATE,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getContent());
			ps.setString(2, vo.getUser_id());
			ps.setInt(3, vo.getCid());
			
			cnt = ps.executeUpdate();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			db.disConnection(conn, ps);
		}
		
		return cnt;
	}
	
	public List<CompanyReviewVO> getReviewListByCompany(int cid){
		List<CompanyReviewVO> list = new ArrayList<>();
		
		try {
			conn = db.getConnection();
			String sql = "SELECT /*+ INDEX_DESC(r PK_REVIEW) */ "
					   + "REV_ID, REV_CONTENT, TO_CHAR(REV_REG_DATE,'YYYY-MM-DD HH24:mi:ss'), m.USER_ID, m.USER_NAME "
					   + "FROM REVIEW r, MEMBER m "
					   + "WHERE com_id=? AND m.user_id = r.user_id";

			ps = conn.prepareStatement(sql);
			ps.setInt(1, cid);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				CompanyReviewVO vo = new CompanyReviewVO();
				
				vo.setId(rs.getInt(1));
				vo.setContent(rs.getString(2));
				vo.setDbday(rs.getString(3));
				vo.setUser_id(rs.getString(4));
				vo.setUser_name(rs.getString(5));
				
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
	
	public int delete_review(int id) {
		int cnt = 0;
		
		try {
			conn = db.getConnection();
			String sql = "DELETE FROM REVIEW WHERE rev_id = ?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			cnt = ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			db.disConnection(conn, ps);
		}
		
		return cnt;
	}
	
	public int update_review(int id, String comment) {
		int cnt = 0;
		
		try {
			conn = db.getConnection();
			String sql = "UPDATE review SET REV_CONTENT = ? WHERE REV_ID = ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, comment);
			ps.setInt(2, id);
			cnt = ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			db.disConnection(conn, ps);
		}
		
		return cnt;
	}
	
	public List<CompanyVO> companyListTop(String cate){
		List<CompanyVO> list =new ArrayList<>();
		
		try {
			conn=db.getConnection();
			
			String sql="SELECT rownum, a.* "
					+ "FROM ( "
					+ "	SELECT decode(c.COM_STAR_CNT, 0, 0, c.COM_STAR_SUM/c.COM_STAR_CNT) AS star, c.*, cc.CATEGORY "
					+ "	FROM COMPANY c, COMPANY_CATEGORY cc "
					+ "	WHERE c.COM_CATEGORY_ID = cc.COM_CATEGORY_ID AND cc.CATEGORY LIKE '%'||?||'%' "
					+ "	ORDER BY decode(c.COM_STAR_CNT, 0, 0, c.COM_STAR_SUM/c.COM_STAR_CNT) DESC "
					+ ") a "
					+ "WHERE rownum <= 10";
			ps=conn.prepareStatement(sql);
			ps.setString(1, cate);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				CompanyVO vo=new CompanyVO();
				vo.setStar(rs.getDouble(2));
				vo.setId(rs.getInt(3));
				vo.setCom_name(rs.getString(4));
				vo.setAddress(rs.getString(5));
				vo.setPoster(rs.getString(12));
				vo.setPhone(rs.getString(15));
				list.add(vo);
			}
			rs.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
		return list;
	}
	// 최상단 댓글
	public CompanyReviewVO getReviewByComId(int cid) {
		CompanyReviewVO vo = new CompanyReviewVO();
		
		try {
			conn=db.getConnection();
			String sql="SELECT rev_content, TO_CHAR(rev_reg_date,'yyyy-MM-dd HH24:mm:ss'), user_name "
					+ "FROM review r, member m "
					+ "WHERE r.com_id=? AND rev_id=(select max(rev_id) from review where com_id=?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cid);
			ps.setInt(2, cid);
			ResultSet rs= ps.executeQuery();
			if(rs.next()) {
				vo.setContent(rs.getString(1));
				vo.setDbday(rs.getString(2));
				vo.setUser_name(rs.getString(3));
			}
			System.out.println(cid + " : " + vo.getContent());
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.disConnection(conn, ps);
		}
		
		return vo;
	}

}























