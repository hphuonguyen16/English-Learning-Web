<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.bean.*"%>
<%@ page language="java" import="java.util.ArrayList" %>
<% User user = (User)request.getSession().getAttribute("user"); %>
<% if (!user.getRole().equals("admin")) response.sendRedirect("../login.jsp"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
<% 
User user2= (User)request.getSession().getAttribute("user");
if (!user2.getRole().equals("admin")) response.sendRedirect("../login.jsp"); 
ArrayList<Lesson> lessons = (ArrayList<Lesson>)request.getAttribute("lessons");
for (int i = 0; i < lessons.size(); i++){
%>
<a href="<%=request.getContextPath()%>/QuizServlet?action=showAllQuestions_admin&lesson_id=<%=lessons.get(i).getLessonID() %>"><%=lessons.get(i).getTopic() %></a>
<%} %>
</body>
</html>