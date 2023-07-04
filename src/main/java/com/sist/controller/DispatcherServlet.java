package com.sist.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import java.net.*;
import java.util.*;

@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<String> clsList=new ArrayList<String>();
	// 초기화 => XML에 등록된 클래스 읽기(메뉴)
	public void init(ServletConfig config) throws ServletException {
		try
		{
			URL url=this.getClass().getClassLoader().getResource(".");
			File file=new File(url.toURI());
//			System.out.println(file.getPath());
			String path=file.getPath();
			path=path.replace("\\", File.separator);
			// Window => \\ , Mac => /
			path=path.substring(0,path.lastIndexOf(File.separator));
			System.out.println(path); // C:\webDev\webStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSPMVCFinalProject\WEB-INF

			path=path+File.separator+"application.xml";
			
			
			// XML 파싱
			DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
			
			// 파서기 (XML => DocumentBuilder, HTML => Jsoup)
			DocumentBuilder db=dbf.newDocumentBuilder();
			
			// 파서
			Document doc=db.parse(new File(path));
			
			// 필요한 데이터 읽기
			// 루트 태그 읽기 ==> beans
			Element beans=doc.getDocumentElement();
			System.out.println(beans.getTagName());
			
			// 같은 태그를 묶어서 사용
			NodeList list=beans.getElementsByTagName("bean");
			for(int i=0;i<list.getLength();i++)
			{
				//bean 태그를 1개씩 가지고 온다
				Element bean=(Element)list.item(i);
				String id=bean.getAttribute("id");
				String cls=bean.getAttribute("class");
				System.out.println(id+":"+cls);
				clsList.add(cls);
			}
		}catch(Exception ex){}
	}
	// 웹에서 사용자 요청 => Servlet/ JSP
	/*
	 	Servlet: 화면 출력은 하지 않는다 (연결)
	 	화면: jsp(view)
	 	
	 	Controller : Servlet
	 	  Spring: DispatcherServlet
	 	  Struts: ActionServlet
	 	  Struts2: FilerDispatcher
	 	
	 	Controller : Servlet으로
	 	Model: 요청처리 담당 with Java
	 	View: 화면출력 담당 with JSP including HTML
	 	
	 	MVC 동작 과정
	 	----------
	 	1. 요청(JSP) === > DispatcherServlet을 찾는다 
	 	   list.do                    |
	 	   insert.do                  |
	 	                        서버에서 받을 수 있는 부분 URI, URL 
	 	                        URI -> Model을 찾는다
	 	2. DispatcherServlet(Controller)
	 	   => Front Controller : 요청 => Model 연결 => request를 전송
	 	   
	 	3. MVC 목적: 보안.. (JSP => 배포 하면 소스를 통으로 공개~)
	 	            역할 분담 (Front-jsp, Back-java,dao)
	 	            자바와 HTML 분리하는 이유 ?
	 	            ---  
	 	            확장성, 재사용, 변경이 쉽다 (JSP는 한번 사용하면 버린다)
	 	4. 동작 순서               .do                            request
	 	   JSP( 링크, 버튼)   --------------- DispatcherServlet ============ Model(DAO <=> 오라클)                
	 	   .....                                                          결과값을 request에 담아준다
	 	                                                                   request.setAttribute()
	 	       JSP   ------  ←    DispatcherServlet      request를 넘겨준다 ←
	 				request
	 	5. DispatcherServlet은 최대한 고정
	 	6. 등록 (model클래스 등록) => XML로 셋팅(메뉴판)
	 	
	 	7. 메소드찾기 => 어노테이션 (메소드 자동 호출이 가능)
	 	---------------------------------------------------------------------------------------------
	 	
	 	
	 		
	 */ 
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	try {
			String path=request.getRequestURI();
			System.out.println(path);
			path=path.substring(request.getContextPath().length()+1);
			//
			// /JSPMVCFinalProject/food/category.do : URI
			// /JSPMVCFinalProject/ : ContextPath
			// food/category.do : 경로명 안의 파일명 가져오기.
			
			for(String cls:clsList)
			{
				// Class 정보 읽기
				Class clsName=Class.forName(cls);
				System.out.println(cls);
				// 메모리 할당
				Object obj=clsName.getDeclaredConstructor().newInstance();
				
				// Method를 읽어온다
				Method[] methods=clsName.getDeclaredMethods();
				for(Method m:methods)
				{
					RequestMapping rm=m.getAnnotation(RequestMapping.class);
					System.out.println(rm.value());
					if(rm.value().equals(path))
					{
						String jsp=(String)m.invoke(obj, request, response);
						System.out.println(jsp);
						if(jsp==null) // void (ajax 용)
						{
							return;
						}
						else if(jsp.startsWith("redirect:"))
						{
							// sendRedirect
							response.sendRedirect(jsp.substring(jsp.indexOf(":")+1));
							
						}
						else
						{
							RequestDispatcher rd=request.getRequestDispatcher(jsp);
							rd.forward(request, response);
						}
						
						return; // 필수
					}
				}
		}
		}catch(Exception ex) {}
	}

}














