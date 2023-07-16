package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.ProductDAO;
import com.sist.vo.ProductVO;

public class ProductModel {
	
	@RequestMapping("product/list.do")
	public String product_list(HttpServletRequest request, HttpServletResponse response) {
		String cate = request.getParameter("cate");
		if(cate == null)
			cate = "";
		
		ProductDAO dao = ProductDAO.newInstance();
		int totalpage = dao.getTotalPage("", cate);
		int endpage = (10>totalpage)?totalpage:10;
		List<ProductVO> list = dao.getProductList(cate, 1);
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", 1);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startpage", 1);
		request.setAttribute("endpage", endpage);
		request.setAttribute("main_jsp", "/jsp/product/product_list.jsp");
		return "/jsp/main/main.jsp";
	}
	
	@RequestMapping("product/detail.do")
	public String product_detail(HttpServletRequest request, HttpServletResponse response) {
		
		return "/jsp/main/main.jsp";
	}
}
