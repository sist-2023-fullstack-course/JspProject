package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MainModel {
	
	
	@RequestMapping("main/main.do")
	public String main_page(HttpServletRequest request,HttpServletResponse response)
	{
		return "../main/main.jsp";
	}
}
