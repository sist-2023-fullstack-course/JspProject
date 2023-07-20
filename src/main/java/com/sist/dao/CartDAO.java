package com.sist.dao;

import java.util.*;
import java.sql.*;
import com.sist.common.*;
import com.sist.vo.*;

public class CartDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDataBase db=new CreateDataBase();
	private static CartDAO dao;
	
	
	// 싱글턴
	public static CartDAO newInstance()
	{
		if(dao==null)
			dao=new CartDAO();
		return dao;
	}
	
	/*
	PRODUCT_ID NOT NULL NUMBER        
	USER_ID    NOT NULL VARCHAR2(100) 
	REGDATE    NOT NULL DATE          
	CART_NO    NOT NULL NUMBER        
	AMOUNT     NOT NULL NUMBER        
	ISSALE              NUMBER
	 */
	
	// 장바구니 삽입
	public void cartInsert(CartVO vo)
	{
		try {
			conn=db.getConnection();
			String sql="SELECT COUNT(*) "
					+ "FROM shop_cart "
					+ "WHERE product_id=? AND issale=0";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getProduct_id());
			ResultSet rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			rs.close();
			
			if(count!=0) // 같은 상품일 경우 => 수량만 증가
			{
				sql="UPDATE shop_cart SET "
					+ "amount=amount+"+vo.getAmount()
					+ " WHERE product_id=? AND user_id=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, vo.getProduct_id());
				ps.setString(2, vo.getUser_id());
				ps.executeUpdate();
			}
			else // 다른 상품일 경우 => 목록 추가
			{
				sql="INSERT INTO shop_cart "
						+ "VALUES(?,?,sysdate,cart_cno_seq.nextval,?,?)";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, vo.getProduct_id());
				ps.setString(2, vo.getUser_id());
				ps.setInt(3, vo.getAmount());
				ps.setInt(4, vo.getIssale());
				ps.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
	}
	
	// 장바구니 취소
	public void cartCancel(int no)
	{
		try {
			conn=db.getConnection();
			String sql="DELETE FROM shop_cart "
					+ "WHERE cart_no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
	}
	
	// 장바구니 구매
	public void cartBuy(int no)
	{
		try {
			conn=db.getConnection();
			String sql="UPDATE shop_cart SET "
					+ "issale=1 "
					+ "WHERE cart_no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
	}
	
	// 장바구니 목록
	public List<CartVO> CartListData(String id)
	{
		List<CartVO> list=new ArrayList<CartVO>();
		try {
			conn=db.getConnection();
			String sql="SELECT s.product_id, user_id, amount, issale, s.PRODUCT_NAME, s.PRODUCT_DISCOUNT_PRICE, product_poster,sc.cart_no "
					+ "FROM SHOP_CART sc, shop s "
					+ "WHERE sc.PRODUCT_ID = s.PRODUCT_ID AND user_id=? AND issale=0";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				CartVO vo=new CartVO();
				
				vo.setProduct_id(rs.getInt(1));
				vo.setUser_id(rs.getString(2));
				vo.setAmount(rs.getInt(3));
				vo.setIssale(rs.getInt(4));
				vo.setProduct_name(rs.getString(5));
				vo.setProduct_price(rs.getInt(6));
				vo.setProduct_poster(rs.getString(7));
				vo.setCart_no(rs.getInt(8));
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
	
	// 구매 목록
	public List<CartVO> BuyListData(String id)
	{
		List<CartVO> list=new ArrayList<CartVO>();
		try {
			conn=db.getConnection();
			String sql="SELECT USER_ID, AMOUNT, s.PRODUCT_ID, ISSALE, s.PRODUCT_NAME, s.PRODUCT_DISCOUNT_PRICE, s.PRODUCT_POSTER, TO_CHAR(regdate,'YY/MM/DD') "
					+ "FROM SHOP_CART sc, shop s "
					+ "WHERE sc.PRODUCT_ID = s.PRODUCT_ID AND user_id=? AND issale=1 "
					+ "ORDER BY regdate DESC";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				CartVO vo=new CartVO();
				vo.setUser_id(rs.getString(1));
				vo.setAmount(rs.getInt(2));
				vo.setProduct_id(rs.getInt(3));
				vo.setIssale(rs.getInt(4));
				vo.setProduct_name(rs.getString(5));
				vo.setProduct_price(rs.getInt(6));
				vo.setProduct_poster(rs.getString(7));
				vo.setRegdate(rs.getString(8));
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
}
