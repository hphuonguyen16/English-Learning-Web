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
    <body>
        <b>Upload | <a href="view.jsp">View</a></b><br/><br/>
        <form action="<%=request.getContextPath()%>/flashcard?action=addNewFlashcard" method="post" enctype="multipart/form-data">
        	<input type="text" name="word" required="required"/><br/><br/>
        	<input type="text" name="word_type" required="required"/><br/><br/>
        	<input type="text" name="meaning" required="required"/><br/><br/>
            <input type="file" name="image" required="required"/><br/><br/>
            <input type="submit"/>
        </form>
    </body>
</html>