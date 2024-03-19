<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.db.database"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Zumba Management APP - Delete Batch</title>
</head>
<body>
	<%@ include file="index.jsp" %>
	<%
        database d = new database();
		int id = Integer.parseInt(request.getParameter("id"));
       	d.deleteBatch(id);
    	   %>
   	<jsp:forward page="batches.jsp"></jsp:forward>
</body>
</html>