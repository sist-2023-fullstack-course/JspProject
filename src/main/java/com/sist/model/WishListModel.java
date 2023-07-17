package com.sist.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.WishListDAO;

public class WishListModel {
	

	@RequestMapping("wishlist/update_ajax.do")
	public void update_wishlist_by_ajax(HttpServletRequest request, HttpServletResponse response) {
		boolean isInsert = Boolean.parseBoolean(request.getParameter("isInsert"));
		String uid = request.getParameter("uid");
		int cid = Integer.parseInt(request.getParameter("cid"));
		
		WishListDAO dao = WishListDAO.newInstance();
		
		if(isInsert) {
			dao.company_wish_insert(uid, cid);
		}
		else {
			dao.company_wish_cancel(uid, cid);
		}
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("success");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
