<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.bean.*"%>
<% User user = (User)request.getSession().getAttribute("user"); %>
<% if (!user.getRole().equals("admin")) response.sendRedirect("../login.jsp"); %>
<!DOCTYPE html>
<html>
    <head>
        <title>Flashcard - admin</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body style="display: flex; flex-direction: column">
        <a href="flashcard.jsp"> Flashcard </a>
        <a href="../LessonServlet?action=getLessons_admin"> Lessons </a>
        <a href="AddLesson.jsp"> Add lesson </a>
        <a href="point.jsp"> Point </a>
    </body>
</html>