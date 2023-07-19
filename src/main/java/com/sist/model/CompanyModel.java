package com.sist.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.sist.controller.RequestMapping;
import com.sist.dao.CompanyDAO;
import com.sist.dao.WishListDAO;
import com.sist.vo.CompanyReviewVO;
import com.sist.vo.CompanyVO;

public class CompanyModel {
	public final int MAX_RECENT_COUNT = 5;
	
	@RequestMapping("company/list.do")
	public String search_main(HttpServletRequest request, HttpServletResponse response) {
		String cate = request.getParameter("cate");
		if(cate==null)
			cate="전체";
				
		CompanyDAO dao = CompanyDAO.getInstance();
		List<CompanyVO> list = dao.getCompanyVOList(1, cate, "전국", "시군선택", "");
		int totalpage = dao.getTotalPage(1, cate, "전국", "시군선택", "");
		int endpage = (10>totalpage)?totalpage:10;
		
		Cookie[] cookies = request.getCookies();
		List<CompanyVO> recentList = new ArrayList<>();
		if(cookies!=null) {
			for(Cookie c : cookies) {
				if(c.getName().equals("company_recent")) {
					String value = c.getValue();
					StringTokenizer st = new StringTokenizer(value, "|");
					
					while(st.hasMoreTokens()) {
						int id = Integer.parseInt(st.nextToken());
						recentList.add(dao.getCompanyVO(id));
					}
				}
			}
		}
		Collections.reverse(recentList);
		
		request.setAttribute("list", list);
		request.setAttribute("recentList", recentList);
		request.setAttribute("curpage", 1);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("cate", cate);
		request.setAttribute("main_jsp", "../search/company_list.jsp");
		return "../jsp/main/main.jsp";
	}
	
	@RequestMapping("company/detail.do")
	public String company_detail(HttpServletRequest request, HttpServletResponse response) {
		int com_id = Integer.parseInt(request.getParameter("id"));
		
		CompanyDAO dao = CompanyDAO.getInstance();
		CompanyVO vo = dao.getCompanyVO(com_id);
		List<CompanyReviewVO> rlist = dao.getReviewListByCompany(com_id);
		
		// 좋아요 눌렀는 지 확인
		HttpSession session = request.getSession();
		if(session.getAttribute("id")!=null) {
			String user_id = (String)session.getAttribute("id");
			boolean isClicked = WishListDAO.newInstance().isClicked(user_id, com_id);
			request.setAttribute("like", isClicked);
		}
		
		// 최근 방문 추가(쿠기)
		Cookie[] cookies = request.getCookies();
		if(cookies==null) {
			Cookie cookie = new Cookie("company_recent", String.valueOf(com_id));
			cookie.setPath("/JspProject/company");
			cookie.setMaxAge(60*60*24);
			response.addCookie(cookie);
		}
		else {
			boolean hasCookie = false;
			for(Cookie c : cookies) {
				if(c.getName().equals("company_recent")) {
					// 중복 체크 => 꽉 찼는지 확인 후 제거 => 새로운 데이터 추가
					StringTokenizer st = new StringTokenizer(c.getValue(), "|");
					List<String> vals = new ArrayList<>();
					while(st.hasMoreTokens())
						vals.add(st.nextToken());

					boolean isDup = false;
					for(String val : vals) {
						if(val.equals(String.valueOf(com_id))) {
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
						newValue = newValue + "|" + com_id;
						Cookie cookie = new Cookie("company_recent", newValue);
						cookie.setPath("/JspProject/company");
						cookie.setMaxAge(60*60*24);
						response.addCookie(cookie);
					}
					
					hasCookie = true;
					break;
				}
			}
			if(!hasCookie) {
				Cookie cookie = new Cookie("company_recent", String.valueOf(com_id));
				cookie.setPath("/JspProject/company");
				cookie.setMaxAge(60*60*24);
				response.addCookie(cookie);
			}
		}
		
		request.setAttribute("vo", vo);
		request.setAttribute("rlist", rlist);
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
			tmp.put("star", vo.getStar());
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
	
	@RequestMapping("company/remove_cookie_ajax.do")
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
			if(c.getName().equals("company_recent")) {
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
	
	@RequestMapping("company/write_review.do")
	public String write_review(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String cid = "";
		
		if(session.getAttribute("id")!=null) {
			try {
				request.setCharacterEncoding("UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			String user_id = (String)session.getAttribute("id");
			String content = request.getParameter("comment");
			cid = request.getParameter("cid");
			
			CompanyReviewVO vo = new CompanyReviewVO();
			vo.setUser_id(user_id);
			vo.setContent(content);
			vo.setCid(Integer.parseInt(cid));
			
			CompanyDAO dao = CompanyDAO.getInstance();
			dao.insertCompanyReview(vo);
		}
		
		
		return "redirect:../company/detail.do?id=" + cid;
	}
	
	@RequestMapping("company/delete_review.do")
	public void delete_review(HttpServletRequest request, HttpServletResponse response) {
		PrintWriter out = null;
		try {
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		int rid = Integer.parseInt(request.getParameter("id"));
		int cnt = CompanyDAO.getInstance().delete_review(rid);
		
		if(cnt == 1)
			out.write("success");
		else
			out.write("fail");
	}
	
	@RequestMapping("company/update_review.do")
	public void update_review(HttpServletRequest request, HttpServletResponse response) {
		PrintWriter out = null;
		try {
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		int id = Integer.parseInt(request.getParameter("id"));
		String comment = request.getParameter("comment");
		int cnt = CompanyDAO.getInstance().update_review(id, comment);
		
		if(cnt == 1) {
			out.write("success");
		}
		else {
			out.write("fail");
		}
	}
}


















