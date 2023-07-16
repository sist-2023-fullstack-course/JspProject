package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

import com.sist.controller.RequestMapping;
import com.sist.dao.AdminDAO;
import com.sist.vo.*;

public class AdminModel {
	
	AdminDAO dao=AdminDAO.newInstance();
	
	@RequestMapping("admin/main.do")
	public String admin_main(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../admin/admin_main.jsp");
		return "../jsp/main/main.jsp";
	}
	
	
	@RequestMapping("admin/booking.do")
	public String admin_booking(HttpServletRequest request, HttpServletResponse response)
	{
		List<ReserveVO> list=dao.admin_booking_list();
		request.setAttribute("list", list);
		
		request.setAttribute("admin_jsp", "../admin/admin_booking.jsp");
		request.setAttribute("main_jsp", "../admin/admin_main.jsp");
		return "../jsp/main/main.jsp";
	}
	
	@RequestMapping("admin/booking_confirm.do")
	public void admin_booking_confirm(HttpServletRequest request, HttpServletResponse response)
	{
		String res_id=request.getParameter("rid");
		dao.admin_booking_confirm(Integer.parseInt(res_id));
		
	}
	
	
}
