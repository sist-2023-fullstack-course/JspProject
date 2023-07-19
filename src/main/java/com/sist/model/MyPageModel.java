package com.sist.model;

import java.io.PrintWriter;
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
		  HttpSession session=request.getSession();
		  String uid=(String)session.getAttribute("id");
		
		  MyPageDAO dao=MyPageDAO.newInstance();
		  MemberVO vo=dao.myinfo_detail(uid);
		 
		  request.setAttribute("vo", vo);
		  request.setAttribute("mypage_jsp", "mypage_update.jsp");
		  request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		  return "../jsp/main/main.jsp";
	  }
	
	@RequestMapping("mypage/editprofile.do")
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
	
	@RequestMapping("mypage/wishlist.ajax.do")
	public String mypage_wishlist_ajax(HttpServletRequest request, HttpServletResponse response)
	{
		
		HttpSession session=request.getSession();
		String uid=(String)session.getAttribute("id");
		
		MyPageDAO dao=MyPageDAO.newInstance();
		List<WishListVO> list=dao.company_wish_list(uid);
		WishListVO vo=new WishListVO();
		int cid=vo.getCom_category_id();
		
		boolean isClicked = WishListDAO.newInstance().isClicked(uid, cid);
		request.setAttribute("like", isClicked);
		
		request.setAttribute("list", list);
		
		request.setAttribute("mypage_jsp", "mypage_wishlist.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../jsp/main/main.jsp";
	}
	
	@RequestMapping("mypage/wishlist.do")
	public String mypage_wishlist(HttpServletRequest request, HttpServletResponse response)
	{
		
		HttpSession session=request.getSession();
		String uid=(String)session.getAttribute("id");
		
		MyPageDAO dao=MyPageDAO.newInstance();
		List<WishListVO> list=dao.company_wish_list(uid);
		
		request.setAttribute("list", list);
		
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
	@RequestMapping("mypage/updatemyinfo.do")
	public void member_updateOK(HttpServletRequest request,HttpServletResponse response)
	{	
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String name=request.getParameter("name");
		String nickname=request.getParameter("nickname");
		String birthday=request.getParameter("birthday");
		String email=request.getParameter("email");
		String post=request.getParameter("post");
		String addr1=request.getParameter("addr1");
		String addr2=request.getParameter("addr2");
		String phone=request.getParameter("phone");

		MemberVO vo=new MemberVO();
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setBirthday(birthday);
		vo.setEmail(email);
		vo.setPost(post);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		vo.setPhone(phone);
		vo.setNickname(nickname);
		
		MyPageDAO dao=MyPageDAO.newInstance();
		int cnt=dao.memberinfoUpdate(vo);

		try
		{
			PrintWriter out=response.getWriter();
			if(cnt==1)
			{
				out.write("success");
			}
			else
			{
				out.write("fail");
			}
		}catch(Exception ex) 
		{
			ex.printStackTrace();
		}
	}

	// 마이펫
	@RequestMapping("mypage/addpet.do")
	public String mypage_addpet(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("mypage_jsp", "mypage_addpet.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../jsp/main/main.jsp";
	}
	
	// 마이펫 등록하기
	@RequestMapping("mypage/adding_pet.do")
	public String mypage_adding_pet(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		String uid=(String)session.getAttribute("id");
		
		
		String category=request.getParameter("category");
		String pname=request.getParameter("pname");
		String gender=request.getParameter("gender");
		String neutered=request.getParameter("neutered");
		String birthyear=request.getParameter("birthyear");
		String weight=request.getParameter("weight");

		MyPetVO vo=new MyPetVO();
		vo.setName(pname);
		vo.setCategory(category);
		vo.setGender(gender);
		vo.setBirthyear(Integer.parseInt(birthyear));
		vo.setWeight(weight);
		vo.setNeutered(neutered);
		
		MyPageDAO dao=MyPageDAO.newInstance();
		dao.addmypet(vo, uid);
		
		request.setAttribute("mypage_jsp", "mypage_mypet.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../jsp/main/main.jsp";
	}
	
}
