package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.CompanyDAO;
import com.sist.vo.CompanyVO;

public class CompanyModel {
	@RequestMapping("company/main.do")
	public String search_main(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		String sc = request.getParameter("sc");
		String ec = request.getParameter("ec");
		String cate = request.getParameter("cate");
		
		if(page==null)
			page="1";
		if(sc==null)
			sc = "1";
		if(ec==null)
			ec = "";
		
		int curpage = Integer.parseInt(page);
		
		CompanyDAO dao = CompanyDAO.getInstance();
		List<CompanyVO> list = dao.getCompanyVOListByPage(curpage, 1, 230, 0);
		int totalpage = dao.getTotalPage();
		int startpage = curpage/10*10+1;
		int endpage = (startpage+9>totalpage)?totalpage:startpage+9;
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("main_jsp", "../search/blog.jsp");
		System.out.println("모델 수행");
		return "../jsp/main/main.jsp";
	}
	
	@RequestMapping("company/detail.do")
	public String company_detail(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../search/blog-details.jsp");
		return "../jsp/main/main.jsp";
	}
}
