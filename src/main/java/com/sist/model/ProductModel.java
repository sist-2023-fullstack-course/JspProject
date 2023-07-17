package com.sist.model;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.sist.controller.RequestMapping;
import com.sist.dao.ProductDAO;
import com.sist.vo.CompanyVO;
import com.sist.vo.ProductVO;

public class ProductModel {
	
	@RequestMapping("product/list.do")
	public String product_list(HttpServletRequest request, HttpServletResponse response) {
		String cate = request.getParameter("cate");
		if(cate == null) {
			cate = "";
			request.setAttribute("cate", "전체");
		}
		else {
			request.setAttribute("cate", cate);
		}
		
		ProductDAO dao = ProductDAO.newInstance();
		int totalpage = dao.getTotalPage("", cate);
		int endpage = (10>totalpage)?totalpage:10;
		List<ProductVO> list = dao.getProductList(cate, 1, "");
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", 1);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startpage", 1);
		request.setAttribute("endpage", endpage);
		request.setAttribute("main_jsp", "/jsp/product/product_list.jsp");
		return "/jsp/main/main.jsp";
	}
	
	@RequestMapping("product/detail.do")
	public String product_detail(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		
		ProductDAO dao = ProductDAO.newInstance();
		ProductVO vo = dao.getProductDetailById(id);
		
		JSONObject json = null;
		try {
			JSONParser p = new JSONParser();
			json = (JSONObject)p.parse(vo.getInfo());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("vo", vo);
		request.setAttribute("info", json);
		request.setAttribute("main_jsp", "/jsp/product/product_detail.jsp");
		return "/jsp/main/main.jsp";
	}
	
	@RequestMapping("product/newdata.do")
	public void product_list_ajax(HttpServletRequest request, HttpServletResponse response) {
		String cate = request.getParameter("cate");
		int page = Integer.parseInt(request.getParameter("page"));
		String searchword = request.getParameter("searchword");
		if(cate.equals("전체"))
			cate = "";
		
		ProductDAO dao = ProductDAO.newInstance();
		List<ProductVO> list = dao.getProductList(cate, page, searchword);
		int totalpage = dao.getTotalPage(searchword, cate);
		int startpage = (page-1)/10*10+1;
		int endpage = (startpage+9>totalpage) ? totalpage : startpage+9;
		
		HashMap<String, Object> hash = new HashMap<>();
		hash.put("totalpage", totalpage);
		hash.put("listcount", list.size());
		hash.put("curpage", page);
		hash.put("startpage", startpage);
		hash.put("endpage", endpage);
		
		List<HashMap<String, Object>> data = new ArrayList<>();
		for(ProductVO vo : list) {
			HashMap<String, Object> tmp = new HashMap<>();
			tmp.put("id", vo.getId());
			tmp.put("poster", vo.getPoster());
			tmp.put("name", vo.getName());
			tmp.put("price", vo.getPrice());
			tmp.put("discount_price", vo.getDiscount_price());
			tmp.put("discount_rate", vo.getDiscount_rate());
			tmp.put("star", vo.getStar());
			data.add(tmp);
		}
		hash.put("data", data);
		
		JSONObject ret = new JSONObject(hash);
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(ret.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
