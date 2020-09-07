<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.Date" %>
<%@ page import="java.util.Date" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>Testing JSPs</h3>

<%!
	public int add(int a, int b){
		return a + b;
	}

%>

<% 

	int i = 1;
	int j = 2;
	int k = i + 2;
	
	out.println("Value of k is " + k);
	
	
%>
<br>
The value of k is: <%=k %>

<%
	k = add(500,600);
%>
<br>
The value of k is: <%=k %>

<%
	for(i=0;i<5;i++){
		out.println("<br> i = " + i);
	}
	
%>

<%
	for(i=0;i<5;i++){
%>		<br> The new value of i = <%=i %>
<% 	}
	
%>
<br>
<b>The time is: <%=new Date() %></b>
<br>
<%@ include file="/hello.jsp" %>

</body>
</html>