package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

public class MyPageModel {
	@RequestMapping("mypage/main.do")
	public String mypage_main(HttpServletRequest request, HttpServletResponse response)
	  {
		  request.setAttribute("mypage_jsp", "mypage_wishlist.jsp");
		  request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		  return "../jsp/main/main.jsp";
	  }
	
	@RequestMapping("mypage/mypage_info.do")
	public String mypage_info(HttpServletRequest request, HttpServletResponse response)
	{

		request.setAttribute("mypage_jsp", "mypage_info.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../jsp/main/main.jsp";
	}
	
	@RequestMapping("mypage/mypage_wishlist.do")
	public String mypage_wishlist(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("mypage_jsp", "mypage_wishlist.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../jsp/main/main.jsp";
	}
}
