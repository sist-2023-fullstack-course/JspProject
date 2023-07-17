package com.sist.dao;

import java.util.*;
import java.sql.*;
import com.sist.common.*;
import com.sist.vo.ProductVO;

public class ProductDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	private CreateDataBase db=new CreateDataBase();
	private static ProductDAO dao;
	
	// 싱글턴
	public static ProductDAO newInstance()
	{
		if(dao==null)
			dao=new ProductDAO();
		return dao;
	}
	
	// product list 페이지의 데이터를 찾는 dao 함수
	public List<ProductVO> getProductList(String cate, int page){
		List<ProductVO> list = new ArrayList<>();
		
		try {
			conn = db.getConnection();
			String sql = "SELECT product_id,product_name,product_category,product_price,product_discount_price,product_star_sum,product_star_cnt,product_poster "
					   + "FROM ("
					       + "SELECT /*+ INDEX(c, PK_COMPANY) */ "
					       + "rownum as num,product_id,product_name,product_category,product_price,product_discount_price,product_star_sum,product_star_cnt,product_poster "
					       + "FROM shop "
					       + "WHERE product_category LIKE '%'||?||'%') "
					   + "WHERE num BETWEEN ? AND ?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, cate);
			ps.setInt(2, (page-1)*12 + 1);
			ps.setInt(3, page*12);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ProductVO vo = new ProductVO();
				
				vo.setId(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setCategory(rs.getString(3));
				vo.setPrice(rs.getInt(4));
				vo.setDiscount_price(rs.getInt(5));
				vo.setStar_sum(rs.getInt(6));
				vo.setStar_cnt(rs.getInt(7));
				vo.setPoster(rs.getString(8));
				
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			db.disConnection(conn, ps);
		}
		
		return list;
	}
	
	// product list의 페이지 개수
	public int getTotalPage(String searchword, String category) {
		int count = 0;
		
		try {
			conn = db.getConnection();
			String sql = "SELECT count(*) FROM shop "
					   + "WHERE product_category LIKE '%'||?||'%' AND product_name LIKE '%'||?||'%'";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, category);
			ps.setString(2, searchword);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			db.disConnection(conn, ps);
		}
		
		count = (int)Math.ceil((double)count/12);
		
		return count;
	}
}
