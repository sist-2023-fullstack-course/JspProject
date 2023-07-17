package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

public class MyPageModel {
	@RequestMapping("mypage/main.do")
	public String mypage_main(HttpServletRequest request, HttpServletResponse response)
	  {
		  request.setAttribute("mypage_jsp", "mypage_info.jsp");
		  request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		  return "../jsp/main/main.jsp";
	  }
	
	@RequestMapping("mypage/myinfo.do")
	public String mypage_info(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		String uid=(String)session.getAttribute("id");
		
		MyPageDAO dao=MyPageDAO.newInstance();
		MemberVO vo=dao.myinfo_detail(uid);
		
		request.setAttribute("vo", vo);
		request.setAttribute("mypage_jsp", "mypage_info.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../jsp/main/main.jsp";
	}
	
	@RequestMapping("mypage/mypet.do")
	public String mypage_mypet(HttpServletRequest request, HttpServletResponse response)
	{
		
		request.setAttribute("mypage_jsp", "mypage_mypet.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../jsp/main/main.jsp";
	}
	
	@RequestMapping("mypage/wishlist.do")
	public String mypage_wishlist(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("mypage_jsp", "mypage_wishlist.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../jsp/main/main.jsp";
	}
	
	@RequestMapping("mypage/booking.do")
	public String mypage_booking_list(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		String uid=(String)session.getAttribute("id");
		
		MyPageDAO dao=MyPageDAO.newInstance();
		List<ReserveVO> list=dao.booking_list(uid);

		request.setAttribute("list", list);
		request.setAttribute("mypage_jsp", "mypage_booking.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../jsp/main/main.jsp";
	}
	
	@RequestMapping("mypage/booking_detail.do")
	public String mypage_booking_detail(HttpServletRequest request, HttpServletResponse response)
	{
		String res_id=request.getParameter("res_id");
		String com_id=request.getParameter("com_id");
		MyPageDAO dao=MyPageDAO.newInstance();
		//dao 예약번호로 예약정보 조회!
		ReserveVO rvo=dao.booking_detail(Integer.parseInt(res_id));
		CompanyVO cvo=dao.company_detail(Integer.parseInt(com_id));
		
		request.setAttribute("rvo", rvo);
		request.setAttribute("cvo", cvo);
		return "../jsp/mypage/mypage_booking_detail.jsp";
	}
	
	//개인정보 수정
	@RequestMapping("mypage/updatemyinfo")
	public String mypage_updatemyinfo(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		MemberDAO dao=MemberDAO.newInstance();
		
		return "../jsp/main/main.jsp";
	}
	
	
}
