package com.sist.model;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.controller.RequestMapping;
import com.sist.dao.CompanyDAO;
import com.sist.dao.WishListDAO;
import com.sist.vo.CompanyVO;

public class CompanyModel {
	@RequestMapping("company/list.do")
	public String search_main(HttpServletRequest request, HttpServletResponse response) {
		String cate = request.getParameter("cate");
		if(cate==null)
			cate="전체";
				
		CompanyDAO dao = CompanyDAO.getInstance();
		List<CompanyVO> list = dao.getCompanyVOList(1, cate, "전국", "시군선택", "");
		int totalpage = dao.getTotalPage(1, cate, "전국", "시군선택", "");
		int endpage = (10>totalpage)?totalpage:10;
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", 1);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startpage", 1);
		request.setAttribute("endpage", endpage);
		request.setAttribute("cate", cate);
		request.setAttribute("main_jsp", "../search/company_list.jsp");
		return "../jsp/main/main.jsp";
	}
	
	@RequestMapping("company/detail.do")
	public String company_detail(HttpServletRequest request, HttpServletResponse response) {
		int com_id = Integer.parseInt(request.getParameter("id"));
		
		CompanyDAO dao = CompanyDAO.getInstance();
		CompanyVO vo = dao.getCompanyVO(com_id);
		
		HttpSession session = request.getSession();
		if(session.getAttribute("id")!=null) {
			String user_id = (String)session.getAttribute("id");
			boolean isClicked = WishListDAO.newInstance().isClicked(user_id, com_id);
			request.setAttribute("like", isClicked);
		}
		
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../search/company_details.jsp");
		return "../jsp/main/main.jsp";
	}
	
	@RequestMapping("company/newdata.do")
	public void send_new_data(HttpServletRequest request, HttpServletResponse response) {
		int page = Integer.parseInt(request.getParameter("page"));
		String cate = request.getParameter("cate");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String searchword = request.getParameter("searchword");
		
		CompanyDAO dao = CompanyDAO.getInstance();
		List<CompanyVO> list = dao.getCompanyVOList(page, cate, addr1, addr2, searchword);
		int totalpage = dao.getTotalPage(page, cate, addr1, addr2, searchword);
		int startpage = (page-1)/10*10+1;
		int endpage = (startpage+9>totalpage) ? totalpage : startpage+9;
		
		HashMap<String, Object> hash = new HashMap<>();
		hash.put("totalpage", totalpage);
		hash.put("listcount", list.size());
		hash.put("curpage", page);
		hash.put("startpage", startpage);
		hash.put("endpage", endpage);
		
		List<HashMap<String, Object>> data = new ArrayList<>();
		for(CompanyVO vo : list) {
			HashMap<String, Object> tmp = new HashMap<>();
			tmp.put("id", vo.getId());
			tmp.put("poster", vo.getPoster());
			tmp.put("name", vo.getCom_name());
			tmp.put("time", vo.getTime());
			tmp.put("address", vo.getAddress());
			data.add(tmp);
		}
		hash.put("data", data);
		
		JSONObject ret = new JSONObject(hash);
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().println(ret.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
