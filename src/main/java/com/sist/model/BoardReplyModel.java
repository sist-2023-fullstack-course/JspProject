package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
public class BoardReplyModel {
	
  @RequestMapping("board/reply_insert.do")
  public String reply_insert(HttpServletRequest request, HttpServletResponse response)
  {
	  try
	  {
		 request.setCharacterEncoding("UTF-8");  
	  }catch(Exception ex) {}
	  
	  String bno=request.getParameter("bno");
	  String msg=request.getParameter("msg");
	  
	  HttpSession session=request.getSession();
	  String id=(String)session.getAttribute("id");
	  
	  BoardReplyVO vo=new BoardReplyVO();
	  vo.setBoard_id(Integer.parseInt(bno));
	  vo.setRep_content(msg);
	  vo.setUser_id(id);
	  
	  // DAO로 전송 
	  BoardReplyDAO dao=BoardReplyDAO.newInstance();
	  dao.replyInsert(vo);
	  return "redirect:../board/board_detail.do?no="+bno;
  }
  
  
  @RequestMapping("board/reply_update.do")
  public String reply_update(HttpServletRequest request, HttpServletResponse response)
  {
	  try
	  {
		 request.setCharacterEncoding("UTF-8");  
	  }catch(Exception ex) {}
	  // 디코딩 (한글 변환)
	  String bno=request.getParameter("bno");//게시물번호 (이동 목적)
	  String no=request.getParameter("no");// 댓글번호 
	  String msg=request.getParameter("msg");
	  // DAO연결 => 오라클 변경 
	  BoardReplyDAO dao=BoardReplyDAO.newInstance();
	  dao.replyUpdate(Integer.parseInt(no), msg);
	  return "redirect:../board/board_detail.do?no="+bno;
  }
  
  
  @RequestMapping("board/reply_reply_insert.do")
  public String reply_reply_insert(HttpServletRequest request,HttpServletResponse response)
  {
	  try
	  {
		 request.setCharacterEncoding("UTF-8");  
	  }catch(Exception ex) {}
	  
	  String bno=request.getParameter("bno");
	  String pno=request.getParameter("pno"); // 댓글의 번호
	  String msg=request.getParameter("msg"); // 작성한 댓글 내용
	  
	  HttpSession session=request.getSession();
	  String id=(String)session.getAttribute("id");
//	  String name=(String)session.getAttribute("name");
	  
	  BoardReplyVO vo=new BoardReplyVO();
	  vo.setBoard_id(Integer.parseInt(bno));
	  vo.setRoot(Integer.parseInt(pno));
	  vo.setRep_content(msg);
	  vo.setUser_id(id);
	  
	  BoardReplyDAO dao=BoardReplyDAO.newInstance();
	  dao.replyReplyInsert(Integer.parseInt(pno), vo);
	  return "redirect:../board/board_detail.do?no="+bno;
  }
  
  
  @RequestMapping("board/reply_delete.do")
  public String reply_delete(HttpServletRequest request, HttpServletResponse response)
  {
	  String no=request.getParameter("no");
	  String bno=request.getParameter("bno");
	  // DAO에 삭제 요청 
	  BoardReplyDAO dao=BoardReplyDAO.newInstance();
	  dao.replyDelete(Integer.parseInt(no));
	  return "redirect:board_detail.do?no="+bno;
  }
  
}