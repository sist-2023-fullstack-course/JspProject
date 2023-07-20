package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.CompanyDAO;
import com.sist.dao.CompanyReviewDAO;
import com.sist.vo.CompanyReviewVO;
import com.sist.vo.CompanyVO;
import com.sist.vo.ProductReviewVO;
import com.sist.vo.ProductVO;

public class CategoryListModel {
	
	@RequestMapping("etc/categorylist.do")
	public String categorylist(HttpServletRequest request,HttpServletResponse response)
	{
		String cate=request.getParameter("cate");
		Date date=new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		String date1 = formatter.format(date);
		
		CompanyDAO dao=CompanyDAO.getInstance();
		
		List<CompanyVO> list=dao.companyListTop(cate);
		List<CompanyReviewVO> rlist = new ArrayList<>();
		for(CompanyVO vo : list) {
			rlist.add(dao.getReviewByComId(vo.getId()));
		}
		request.setAttribute("cate", cate);
		request.setAttribute("date", date1);
		request.setAttribute("list", list);
		request.setAttribute("rlist", rlist);
		request.setAttribute("main_jsp", "../etc/categorylist.jsp"); 
		return "../jsp/main/main.jsp";
	}
	
	@RequestMapping("etc/categoryShoplist.do")
	public String categoryShoplist(HttpServletRequest request,HttpServletResponse response)
	{
		String cate=request.getParameter("cate");
		
		Date date=new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		String date1 = formatter.format(date);
		
		CompanyDAO dao=CompanyDAO.getInstance();
		List<ProductVO> list=dao.productTopListData(cate);
		List<ProductReviewVO> rlist = new ArrayList<>();
		for(ProductVO vo:list) {
			rlist.add(dao.getReviewByShopid(vo.getId()));
		}
		request.setAttribute("date", date1);
		request.setAttribute("cate", cate);
		request.setAttribute("list", list);
		request.setAttribute("rlist", rlist);
		request.setAttribute("main_jsp", "../etc/productList.jsp"); 
		return "../jsp/main/main.jsp";
	}
	
	
	

}

