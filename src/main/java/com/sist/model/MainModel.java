package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;


public class MainModel {
	
	
	@RequestMapping("jsp/main.do")
	public String main_page(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "home.jsp");
		return "index.jsp";
	}
}
