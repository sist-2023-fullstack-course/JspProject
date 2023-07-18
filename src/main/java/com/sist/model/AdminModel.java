package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;

import com.sist.controller.RequestMapping;
import com.sist.dao.AdminDAO;
import com.sist.dao.QuestionDAO;
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
	
	// Q&A 답변하기
	@RequestMapping("admin/question_list.do")
	public String admin_question_list(HttpServletRequest request, HttpServletResponse response)
	{
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		
		int curpage=Integer.parseInt(page);
		QuestionDAO dao=QuestionDAO.newInstance();
		List<QuestionVO> list=dao.adminQuestionListData(curpage);
		int totalpage=dao.questionTotalPage();
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("list", list);
		
		request.setAttribute("admin_jsp", "../admin/question_list.jsp");
		request.setAttribute("main_jsp", "../admin/admin_main.jsp");
		return "../jsp/main/main.jsp";
	}
	
	@RequestMapping("admin/question_insert.do")
	public String admin_question_insert(HttpServletRequest request, HttpServletResponse response)
	{
		String no=request.getParameter("no");
		request.setAttribute("no", no);
		
		request.setAttribute("admin_jsp", "../admin/question_insert.jsp");
		request.setAttribute("main_jsp", "../admin/admin_main.jsp");
		return "../jsp/main/main.jsp";
	}
	
	@RequestMapping("admin/question_insert_ok.do")
	public String admin_question_insert_ok(HttpServletRequest request, HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String qno=request.getParameter("qno");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		
		QuestionVO vo=new QuestionVO();
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setId(id);
		vo.setName(name);
		
		QuestionDAO dao=QuestionDAO.newInstance();
		dao.adminQuestionInsert(Integer.parseInt(qno), vo);
		return "redirect:../admin/question_list.do";
	}
}
