package com.sist.model;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;
import com.sist.vo.ZipcodeVO;

public class MemberModel {
	
	
	@RequestMapping("member/login.do")
	public String memberLogin(HttpServletRequest request, HttpServletResponse response)
	{
//		String id=request.getParameter("id");
//		String pwd=request.getParameter("pwd");
//		MemberDAO dao=MemberDAO.newInstance();
//		MemberVO vo=dao.Login(id, pwd);
//		HttpSession session=request.getSession();
//		
//		// 로그인 => 사용자의 일부 정보를 저장
//		if(vo.getMsg().equals("OK"))
//		{
//			session.setAttribute("id", vo.getId());
//			session.setAttribute("name", vo.getName());
//			session.setAttribute("gender", vo.getGender());
//			session.setAttribute("admin", vo.getAdmin());
//		}
//		try {
//			PrintWriter out=response.getWriter();
//			out.println(vo.getMsg()); // NOID, NOPWD, OK
//		} catch (Exception e) {}
		request.setAttribute("main_jsp", "../member/login.jsp");
		return "../jsp/main/main.jsp";
	}
	
	@RequestMapping("member/join.do")
	public String memberJoin(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../member/join.jsp");
		return "../jsp/main/main.jsp";
	}
	
	@RequestMapping("member/idcheck.do")
	public String memberIdCheck(HttpServletRequest request, HttpServletResponse response)
	{
		return "../jsp/member/idcheck.jsp";
	}
	
	@RequestMapping("member/idcheck_ok.do")
	public void memberIdCheckOk(HttpServletRequest request, HttpServletResponse response)
	{
		String id=request.getParameter("id");
		MemberDAO dao=MemberDAO.newInstance();
		int count=dao.IdCheck(id);
		
		try {
			PrintWriter out=response.getWriter();
			out.println(count);
		} catch (Exception e) {}
	}
	
	@RequestMapping("member/nicknamecheck.do")
	public String memberNicknameCheck(HttpServletRequest request, HttpServletResponse response)
	{
		return "../jsp/member/nicknamecheck.jsp";
	}
	
	@RequestMapping("member/nicknamecheck_ok.do")
	public void memberNicknameCheckOk(HttpServletRequest request, HttpServletResponse response)
	{
		String nickname=request.getParameter("nickname");
		MemberDAO dao=MemberDAO.newInstance();
		int count=dao.NicknameCheck(nickname);
		
		try {
			PrintWriter out=response.getWriter();
			out.println(count);
		} catch (Exception e) {}
	}
	
	// phonecheck
	
	// emailcheck
	
	@RequestMapping("member/postfind.do")
	public String memberPostFind(HttpServletRequest request, HttpServletResponse response)
	{
		return "../jsp/member/postfind.jsp";
	}
	
	@RequestMapping("member/postfind_result.do")
	public String memberPostFindResult(HttpServletRequest request, HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		
		String dong=request.getParameter("dong");
		MemberDAO dao=MemberDAO.newInstance();
		int count=dao.postFindCount(dong);
		List<ZipcodeVO> list=dao.postFindData(dong);
		
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		return "../jsp/member/postfind_result.jsp";
	}
	
	@RequestMapping("member/join_ok.do")
	public String memberJoinOk(HttpServletRequest request, HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String name=request.getParameter("name");
		String gender=request.getParameter("gender");
		String birthday=request.getParameter("birthday");
		String email=request.getParameter("email");
		String post=request.getParameter("post");
		String addr1=request.getParameter("addr1");
		String addr2=request.getParameter("addr2");
		String phone=request.getParameter("phone");
		String phone1=request.getParameter("phone1");
		String nickname=request.getParameter("nickname");
		
		MemberVO vo=new MemberVO();
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setGender(gender);
		vo.setBirthday(birthday);
		vo.setEmail(email);
		vo.setPost(post);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		vo.setPhone(phone1+"-"+phone);
		vo.setNickname(nickname);
		
		MemberDAO dao=MemberDAO.newInstance();
		dao.memberInsert(vo);
		
		return "redirect:../jsp/main/main.do";
	}
	
	
	@RequestMapping("member/logout.do")
	public String memberLogout(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		session.invalidate();
		
		return "redirect:../jsp/main/main.do";
	}
}
