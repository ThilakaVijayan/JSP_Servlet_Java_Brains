<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String userName = request.getParameter("name");

	if (userName != null){
		session.setAttribute("sessionUserName",userName);
		application.setAttribute("applicationUserName",userName);//this is context object
		pageContext.setAttribute("pageContextUserName", userName);
	}
%>
<br>
User name in the request object is: <%= userName %>
<br>
User name in the session object is: <%= session.getAttribute("sessionUserName") %>
<br>
User name in the context object is: <%= application.getAttribute("applicationUserName") %>
<br>
User name in the page context object is: <%= pageContext.getAttribute("pageContextUserName") %>

<%
		pageContext.setAttribute("name", userName + " New Value", PageContext.REQUEST_SCOPE);
		pageContext.setAttribute("sessionUserName", userName + " New Value", PageContext.SESSION_SCOPE);
		pageContext.setAttribute("applicationUserName", userName + " New Value", PageContext.APPLICATION_SCOPE);
		
%>
<br>
User name in the new request object is: <%= request.getParameter("name") %>
<br>
User name in the new session object is: <%= session.getAttribute("sessionUserName") %>
<br>
User name in the new context object is: <%= application.getAttribute("applicationUserName") %>
</body>
</html>