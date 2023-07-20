package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.CartDAO;
import com.sist.vo.CartVO;

public class CartModel {
	@RequestMapping("cart/cart_insert.do")
	public String cart_insert(HttpServletRequest request, HttpServletResponse response)
	{
		String amount=request.getParameter("amount");
		String product_id=request.getParameter("id");

		CartVO vo=new CartVO();
		vo.setAmount(Integer.parseInt(amount));
		vo.setProduct_id(Integer.parseInt(product_id));
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		vo.setUser_id(id);
		
		CartDAO dao=CartDAO.newInstance();
		dao.cartInsert(vo);

		return "redirect:../mypage/mypage_cart.do";
	}
	
	@RequestMapping("mypage/cart_cancel.do")
	public String cart_cancel(HttpServletRequest request, HttpServletResponse response)
	{
		String no=request.getParameter("no");
		CartDAO dao=CartDAO.newInstance();
		dao.cartCancel(Integer.parseInt(no));
		return "redirect:../mypage/mypage_cart.do";
	}
	
	@RequestMapping("cart/cart_buy.do")
	public String cart_buy(HttpServletRequest request, HttpServletResponse response)
	{
		String no=request.getParameter("no");
		CartDAO dao=CartDAO.newInstance();
		dao.cartBuy(Integer.parseInt(no));
		
		return "redirect:../mypage/mypage_buy.do";
	}
	
	@RequestMapping("mypage/mypage_cart.do")
	public String cartList(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		CartDAO dao=CartDAO.newInstance();
		List<CartVO> list=dao.CartListData(id);
		request.setAttribute("list", list);
		
		request.setAttribute("mypage_jsp", "../mypage/mypage_cart.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../jsp/main/main.jsp";
	}
	
	@RequestMapping("mypage/mypage_buy.do")
	public String buyList(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		CartDAO dao=CartDAO.newInstance();
		List<CartVO> list=dao.BuyListData(id);
		request.setAttribute("list", list);
		
		request.setAttribute("mypage_jsp", "../mypage/mypage_buy.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../jsp/main/main.jsp";
	}
}
