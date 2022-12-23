<!DOCTYPE html>
<html lang="en">
<%@page import="model.bean.*"%>
<% User user = (User)request.getSession().getAttribute("user");
int userID;
if (user == null ) userID = 0;
else{ userID = user.getUserID();
if (!user.getRole().equals("user")) response.sendRedirect("../login.jsp");} %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
</head>


<body>
    <div class="header">
        <div class="left-menu">
            <a href="home.jsp" class="item">Home</a>
            <a href="<%=request.getContextPath()%>/flashcard?action=getRandomizedFlashcards&userID=<%= userID %>"
                class="item">Flashcard</a>
            <a href="LessonServlet?action=getLessons" class="item">Quiz</a>
            <a href="<%= userID != 0 ? request.getContextPath() + "/point?action=getAllPointsByUserID&userID=" + userID  : "login.jsp" %>" class="item">Points</a>
        </div>
        <div class="right-menu">
            <a href="<%= userID != 0 ? request.getContextPath() + "/UserController?action=LogOut" : "login.jsp" %> " class="login-button"><%= userID != 0 ? "Logout" : "Login" %></a>
        </div>
    </div>
</body>

</html>