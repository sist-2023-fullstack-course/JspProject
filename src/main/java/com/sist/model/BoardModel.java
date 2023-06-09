package com.sist.model;

import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

public class BoardModel {

	//목록 출력
	@RequestMapping("board/board_list.do")
	public String board_list(HttpServletRequest request, HttpServletResponse response)
	{
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		// DAO연동 
		BoardDAO dao=BoardDAO.newInstance();
		// 게시물 목록
		List<BoardVO> list=dao.boardListData(curpage);
		// 총페이지 
		int totalpage=dao.freeboardTotalPage();
		
		// 출력에 필요한 데이터를 모아서 전송 
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("list", list);
		// board/list.jsp로 전송 
		request.setAttribute("main_jsp", "../board/board_list.jsp");
		//CommonModel.commonRequestData(request);
		// main_jsp => 화면 출력 
		return "../jsp/main/main.jsp";
	}
	
	// 게시글 추가
	@RequestMapping("board/board_insert.do")
	public String board_insert(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../board/board_insert.jsp");
		return "../jsp/main/main.jsp";
	}
	@RequestMapping("board/board_insert_ok.do")
	public String board_insert_ok(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		
		BoardVO vo=new BoardVO();
		vo.setUser_id(request.getParameter("name"));
		vo.setTitle(request.getParameter("subject"));
		vo.setContent(request.getParameter("content"));
		vo.setBoard_category(request.getParameter("category"));
		BoardDAO dao=BoardDAO.newInstance();
		dao.boardInsert(vo);
		
		return "redirect:../board/board_list.do";
	}
	
	// 상세 보기 
	@RequestMapping("board/board_detail.do")
	public String board_detail(HttpServletRequest request,HttpServletResponse response)
	{
		String no=request.getParameter("no");
		BoardDAO dao=BoardDAO.newInstance();
		BoardVO vo=dao.boardDetailData(Integer.parseInt(no));
		
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../board/board_detail.jsp");
		
		//댓글 읽기
		BoardReplyDAO fdao=BoardReplyDAO.newInstance();
		List<BoardReplyVO> list=fdao.replyListData(Integer.parseInt(no));
		request.setAttribute("list", list);
		
		return "../jsp/main/main.jsp";
	}
	
	// 게시글 수정
	@RequestMapping("board/board_update.do")
	public String board_update(HttpServletRequest request, HttpServletResponse response)
	{
		String no=request.getParameter("no");
		BoardDAO dao=BoardDAO.newInstance();
		BoardVO vo=dao.boardUpdateData(Integer.parseInt(no));
		
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../board/board_update.jsp");
		return "../jsp/main/main.jsp";
	}
	
	@RequestMapping("board/board_update_ok.do")
	public String board_update_ok(HttpServletRequest request,HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		BoardVO vo=new BoardVO();
		vo.setUser_id(request.getParameter("name"));
		vo.setTitle(request.getParameter("subject"));
		vo.setContent(request.getParameter("content"));
		vo.setBoard_category(request.getParameter("category"));
		vo.setBoard_id(Integer.parseInt(request.getParameter("no")));
		String pwd=request.getParameter("pwd");
		
		BoardDAO dao=BoardDAO.newInstance();
		boolean bCheck=dao.boardUpdate(vo, pwd);
		
		request.setAttribute("bCheck", bCheck);
		request.setAttribute("no", vo.getBoard_id());
		return "../jsp/board/board_update_ok.jsp";
	}
	
	// Ajax 삭제
	@RequestMapping("board/board_delete.do")
	public void board_delete(HttpServletRequest request,HttpServletResponse response)
	{
		String no=request.getParameter("no");
		String pwd=request.getParameter("pwd");
		
		BoardDAO dao=BoardDAO.newInstance();
		String res=dao.boardDelete(Integer.parseInt(no), pwd);
		
		try
		{
			PrintWriter out=response.getWriter();
			out.println(res);//=> Ajax에서 읽어서 처리 
		}catch(Exception ex) {}
	}
	
	
}
	
	
	
	



