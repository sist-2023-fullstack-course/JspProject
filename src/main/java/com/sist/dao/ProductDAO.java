package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.common.*;
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

}
