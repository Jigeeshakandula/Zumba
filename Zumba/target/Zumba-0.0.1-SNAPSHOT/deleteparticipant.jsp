<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.db.database"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Zumba Management APP - Delete Participants</title>
</head>
<body>
	<%@ include file="index.jsp" %>
	<%
        database d = new database();
		int id = Integer.parseInt(request.getParameter("id"));
       	d.deleteParticipant(id);
    	   %>
   	<jsp:forward page="participants.jsp"></jsp:forward>
</body>
</html>