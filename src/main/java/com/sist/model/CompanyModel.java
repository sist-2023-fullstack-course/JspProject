package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

public class CompanyModel {
	@RequestMapping("company/main.do")
	public String search_main(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../search/blog.jsp");
		return "../jsp/main/main.jsp";
	}
	
	@RequestMapping("company/detail.do")
	public String company_detail(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../search/blog-details.jsp");
		return "../jsp/main/main.jsp";
	}
}
