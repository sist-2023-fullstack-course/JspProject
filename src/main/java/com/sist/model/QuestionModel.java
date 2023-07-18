package com.sist.model;
/*
 * 	Java :  오라클 연동 ===========> DAO
 * 			브라우저로 값 전송 =====> Model
 * 
 * 	(View)	.do(request)   (기능)
 * 	JSP(웹) ==============> Model ============> DAO
 * 						1. 값을 받는다.
 * 						request.getParameter()
 * 						DAO 연동 => 데이터 읽기
 * 						request.setAttribute()
 * 
 * 						2. request를 받을 JSP 설정
 * 
 * 		   <==============		 <=============
 * 
 * 	=> 사용자의 요청 (여러 개) --> 구분: (조건문)if 대신 @어노테이션 사용
 * 												----------
 * 										@RequestMapping("이 부분이 중복되면 안됨") => 중복제거를 위해 폴더명을 붙여줌 예) member/member.do
 */
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.QuestionDAO;
import com.sist.vo.QuestionVO;

public class QuestionModel {
	@RequestMapping("question/list.do")
	public String question_list(HttpServletRequest request, HttpServletResponse response)
	{
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		
		int curpage=Integer.parseInt(page);
		QuestionDAO dao=QuestionDAO.newInstance();
		List<QuestionVO> list=dao.questionData(curpage);
		int totalpage=dao.questionTotalPage();
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("list", list);
		
		request.setAttribute("main_jsp", "../question/list.jsp");
		return "../jsp/main/main.jsp";
	}
	
	@RequestMapping("question/insert.do")
	public String question_insert(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../question/insert.jsp");
		return "../jsp/main/main.jsp";
	}
	
	@RequestMapping("question/insert_ok.do")
	public String question_insert_ok(HttpServletRequest request, HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		
		QuestionVO vo=new QuestionVO();
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setId(id);
		vo.setName(name);
		
		QuestionDAO dao=QuestionDAO.newInstance();
		dao.questionInsert(vo);
		
		return "redirect:../question/list.do";
	}
	
	@RequestMapping("question/detail.do")
	public String question_detail(HttpServletRequest request, HttpServletResponse response)
	{
		String no=request.getParameter("no");
		QuestionDAO dao=QuestionDAO.newInstance();
		
		// DAO 연동
		QuestionVO vo=dao.questionDetailData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		
		request.setAttribute("main_jsp", "../question/detail.jsp");
		return "../jsp/main/main.jsp";
	}
	
	@RequestMapping("question/delete.do")
	public String question_delete(HttpServletRequest request, HttpServletResponse response)
	{
		String no=request.getParameter("no");
		QuestionDAO dao=QuestionDAO.newInstance();
		dao.questionDelete(Integer.parseInt(no));
		return "redirect:../question/list.do";
	}
	
	@RequestMapping("question/update.do")
	public String question_update(HttpServletRequest request, HttpServletResponse response)
	{
		String no=request.getParameter("no");
		QuestionDAO dao=QuestionDAO.newInstance();
		QuestionVO vo=dao.questionUpdateData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		
		request.setAttribute("main_jsp", "../question/update.jsp");
		return "../jsp/main/main.jsp";
	}
	
	@RequestMapping("question/update_ok.do")
	public String question_update_ok(HttpServletRequest request, HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String no=request.getParameter("no");
		
		QuestionVO vo=new QuestionVO();
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setNo(Integer.parseInt(no));
		
		QuestionDAO dao=QuestionDAO.newInstance();
		dao.questionUpdate(vo);
		return "redirect:../question/detail.do?no="+no;
	}
}
