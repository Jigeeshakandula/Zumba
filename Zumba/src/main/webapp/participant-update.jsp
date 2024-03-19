<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.db.database"%>
<%@page import="com.model.Participant"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ include file="index.jsp" %>
	<%
        database d = new database();
		Participant p = new Participant();
		p.participant_id = Integer.parseInt(request.getParameter("id"));
		p.full_name = request.getParameter("name");
		p.email = request.getParameter("email");
		p.date_of_birth = request.getParameter("dob");
		p.enrollment_date = request.getParameter("edate");
		p.batch_id = Integer.parseInt(request.getParameter("bno"));
		d.updateParticipant(p);
    %>
   	<jsp:forward page="participants.jsp"></jsp:forward>

</body>
</html>