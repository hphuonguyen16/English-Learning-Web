<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="model.bean.*"%>
<% User user = (User)request.getSession().getAttribute("user"); %>
<% if (!user.getRole().equals("admin")) response.sendRedirect("../login.jsp"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
        <form action="<%=request.getContextPath()%>/LessonServlet?action=AddNewLesson" method="post"  >
        	<input type="text" name="topic" required="required"/><br/><br/>
        	<select name="level">
  			<option value="1">1</option>
  			<option value="2">2</option>
  			<option value="3">3</option>
</select><br/>
            <input type="submit"/>
            <a href="<%=request.getContextPath()%>/LessonServlet?action=ShowLesson">Update</a>
        </form>
</body>
</html>