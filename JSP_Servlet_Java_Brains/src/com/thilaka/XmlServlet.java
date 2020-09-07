package com.thilaka;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class XmlServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("XML servlet called");
		
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		String userName = request.getParameter("userName");
		HttpSession session = request.getSession();
		ServletContext context = request.getServletContext();
		ServletConfig config = this.getServletConfig();
		
		if(userName != null && userName != "") {
			session.setAttribute("savedUserName", userName);
			context.setAttribute("savedUserName", userName);
		}
		
		out.println("Hello from GET  method! " + userName);
		out.println("Session parameter has username as " +  (String) session.getAttribute("savedUserName"));
		out.println("Context parameter has username as " +  (String) context.getAttribute("savedUserName"));
		out.println("Init parameter has username as " +  (String) config.getInitParameter("defaultUser"));
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		String userName = request.getParameter("userName");
		String fullName = request.getParameter("fullName");
		out.println("Hello from POST  method! " + userName + "! We you your full name is " + fullName);
		
		String prof = request.getParameter("prof");
		out.println("You are " + prof);
		
		String[] locations = request.getParameterValues("location");
		out.println("You are at " + locations.length + " places ");
		for (String location: locations)
			out.println(location);
		
	}

}
