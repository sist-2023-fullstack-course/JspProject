package com.sist.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.Cookie;
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
	public final int MAX_RECENT_COUNT = 5;
	
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
		
		Cookie[] cookies = request.getCookies();
		List<ProductVO> recentList = new ArrayList<>();
		if(cookies!=null) {
			for(Cookie c : cookies) {
				if(c.getName().equals("product_recent")) {
					String value = c.getValue();
					StringTokenizer st = new StringTokenizer(value, "|");
					
					while(st.hasMoreTokens()) {
						int id = Integer.parseInt(st.nextToken());
						recentList.add(dao.getProductDetailById(id));
					}
				}
			}
		}
		Collections.reverse(recentList);
		
		request.setAttribute("list", list);
		request.setAttribute("recentList", recentList);
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
		
		// 최근 방문 추가(쿠기)
				Cookie[] cookies = request.getCookies();
				if(cookies==null) {
					Cookie cookie = new Cookie("product_recent", String.valueOf(id));
					cookie.setPath("/JspProject/product");
					cookie.setMaxAge(60*60*24);
					response.addCookie(cookie);
				}
				else {
					boolean hasCookie = false;
					for(Cookie c : cookies) {
						if(c.getName().equals("product_recent")) {
							// 중복 체크 => 꽉 찼는지 확인 후 제거 => 새로운 데이터 추가
							StringTokenizer st = new StringTokenizer(c.getValue(), "|");
							List<String> vals = new ArrayList<>();
							while(st.hasMoreTokens())
								vals.add(st.nextToken());

							boolean isDup = false;
							for(String val : vals) {
								if(val.equals(String.valueOf(id))) {
									isDup = true;
									break;
								}
							}
							
							if(!isDup) {
								int s = (vals.size() == MAX_RECENT_COUNT) ? 1 : 0; // 쿠키가 꽉 찼으면 앞 제거 
								String newValue = "";
								for(int i=s;i<vals.size();i++) {
									newValue = newValue + "|" +vals.get(i);
								}
								newValue = newValue + "|" + id;
								Cookie cookie = new Cookie("product_recent", newValue);
								cookie.setPath("/JspProject/product");
								cookie.setMaxAge(60*60*24);
								response.addCookie(cookie);
							}
							
							hasCookie = true;
							break;
						}
					}
					if(!hasCookie) {
						Cookie cookie = new Cookie("product_recent", String.valueOf(id));
						cookie.setPath("/JspProject/product");
						cookie.setMaxAge(60*60*24);
						response.addCookie(cookie);
					}
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
	
	@RequestMapping("product/remove_cookie_ajax.do")
	public void remove_cookie(HttpServletRequest request, HttpServletResponse response) {
		PrintWriter out = null;
		try {
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
		} catch(IOException e) {
			e.printStackTrace();
		}

		String id = request.getParameter("id");
		Cookie[] cookies = request.getCookies();

		Cookie cookie = null;
		for(Cookie c : cookies) {
			if(c.getName().equals("product_recent")) {
				cookie = c;
			}
		}
		
		if(cookie==null) {
			out.write("fail");
		}
		else if(id.equals("all")) {
			cookie.setMaxAge(0);
			response.addCookie(cookie);
			out.write("success");
		}
		else {
			StringTokenizer st = new StringTokenizer(cookie.getValue(), "|");
			String val = "";
			while(st.hasMoreTokens()) {
				String next = st.nextToken();
				if(!next.equals(id)) {
					val = val + "|" + next;
				}
			}
			cookie.setValue(val);
			response.addCookie(cookie);
			out.write("success");
		}
	}
}
