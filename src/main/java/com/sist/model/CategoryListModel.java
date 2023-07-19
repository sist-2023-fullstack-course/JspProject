package com.sist.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.CompanyDAO;
import com.sist.dao.CompanyReviewDAO;
import com.sist.vo.CompanyReviewVO;
import com.sist.vo.CompanyVO;

public class CategoryListModel {
	
	@RequestMapping("etc/categorylist.do")
	public String categorylist(HttpServletRequest request,HttpServletResponse response)
	{
		String cate=request.getParameter("cate");
		CompanyDAO dao=CompanyDAO.getInstance();
		
		List<CompanyVO> list=dao.companyListTop(cate);
		List<CompanyReviewVO> rlist = new ArrayList<>();
		for(CompanyVO vo : list) {
			rlist.add(dao.getReviewByComId(vo.getId()));
		}
			
		request.setAttribute("list", list);
		request.setAttribute("rlist", rlist);
		request.setAttribute("main_jsp", "../etc/categorylist.jsp"); 
		return "../jsp/main/main.jsp";
	}
	
	@RequestMapping("etc/categoryShoplist.do")
	public String categoryShoplist(HttpServletRequest request,HttpServletResponse response)
	{
		String cate=request.getParameter("cate");
		CompanyDAO dao=CompanyDAO.getInstance();
		List<CompanyVO> list=dao.companyListTop(cate);
		
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../etc/categorylist.jsp"); 
		return "../jsp/main/main.jsp";
	}

}

