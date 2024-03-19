<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.db.database"%>
<%@page import="com.model.Batch"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

%@ include file="index.jsp" %>
	<%
        database d = new database();
		Batch b = new Batch();
		b.batch_id = Integer.parseInt(request.getParameter("id"));
		b.start_time = request.getParameter("stime");
		b.end_time = request.getParameter("etime");
		b.Instructor = request.getParameter("instructor");
		d.updateBatch(b);
    %>
   	<jsp:forward page="batches.jsp"></jsp:forward>

</body>
</html>