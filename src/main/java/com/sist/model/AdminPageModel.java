package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

public class AdminPageModel {
	@RequestMapping("adminpage/main.do")
	public String adminpage_main(HttpServletRequest request, HttpServletResponse response)
	{
		
		request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");
		return "../jsp/main/main.jsp";
	}
}
