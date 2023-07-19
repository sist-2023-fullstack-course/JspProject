package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.BoardDAO;
import com.sist.vo.BoardVO;

public class MainModel {
	@RequestMapping("main/main.do")
	public String main_page(HttpServletRequest request,HttpServletResponse response)
	{
		BoardDAO dao = BoardDAO.newInstance();
		List<BoardVO> freeList = dao.getRecentList("자유토크");
		List<BoardVO> boastList = dao.getRecentList("자랑하기");
		
		request.setAttribute("freeList", freeList);
		request.setAttribute("boastList", boastList);
		request.setAttribute("main_jsp", "home.jsp");
		return "../jsp/main/main.jsp";
	}
}
