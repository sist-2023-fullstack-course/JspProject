package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.common.*;
import com.sist.vo.ProductVO;
public class ProductDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDataBase db=new CreateDataBase();
	private static ProductDAO dao;
	
	// 싱글턴
	public static ProductDAO newInstance()
	{
		if(dao==null)
			dao=new ProductDAO();
		return dao;
	}
	/*
 PRODUCT_ID                                NOT NULL NUMBER
 PRODUCT_NAME                              NOT NULL VARCHAR2(50)
 PRODUCT_CATEGORY                          NOT NULL VARCHAR2(100)
 PRODUCT_INFO                                       VARCHAR2(500)
 PRODUCT_PRICE                             NOT NULL NUMBER
 PRODUCT_DISCOUNT_PRICE                             NUMBER
 DELIVERY                                  NOT NULL VARCHAR2(200)
 PRODUCT_STAR_SUM                                   NUMBER
 PRODUCT_STAR_CNT                                   NUMBER
 PRODUCT_POSTER                                     VARCHAR2(400)
	 */
	public void insertProduct(ProductVO vo) {
		try {
			conn = db.getConnection();
			String sql = "INSERT INTO shop VALUES("
					   + "pm_pdi_seq.nextval,?,?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getCategory());
			ps.setString(3, vo.getInfo());
			ps.setInt(4, vo.getPrice());
			ps.setInt(5, vo.getDiscount_price());
			ps.setString(6, vo.getDelivery());
			ps.setInt(7, vo.getStar_sum());
			ps.setInt(8, vo.getStar_cnt());
			ps.setString(9, vo.getPoster());
			
			ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			db.disConnection(conn, ps);
		}
	}
}
