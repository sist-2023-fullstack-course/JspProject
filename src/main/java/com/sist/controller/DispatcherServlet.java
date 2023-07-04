package com.sist.controller;

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

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<String> clsList;
	
	public void init(ServletConfig config) throws ServletException {
		clsList = new ArrayList<>();
		
		String curpath = config.getServletContext().getRealPath(".");
		Path path = Paths.get(curpath, "WEB-INF", "application.xml");
		// XML 파싱
		try
		{
			DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
			DocumentBuilder parser=dbf.newDocumentBuilder();
			
			Document doc=parser.parse(path.toString());
			Element beans=doc.getDocumentElement();

			NodeList list=beans.getElementsByTagName("bean");
			for(int i=0;i<list.getLength();i++)
			{
				Element bean=(Element)list.item(i);
				String cls=bean.getAttribute("class");
				clsList.add(cls);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String path=request.getRequestURI();
			path=path.substring(request.getContextPath().length()+1);
			
			for(String cls:clsList)
			{
				Class<?> clsName=Class.forName(cls);
				Object obj=clsName.getDeclaredConstructor().newInstance();
				
				Method[] methods=clsName.getDeclaredMethods();
				for(Method m:methods)
				{
					RequestMapping rm=m.getAnnotation(RequestMapping.class);
					if(rm.value().equals(path))
					{
						String jsp=(String)m.invoke(obj, request, response);
						if(jsp==null) // void (ajax 용)
						{
							return;
						}
						else if(jsp.startsWith("redirect:"))
						{
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
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}

}














