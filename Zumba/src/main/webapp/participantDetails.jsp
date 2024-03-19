<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.model.Participant"%>
<%@page import="com.db.database"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Zumba Management APP - Participant Details</title>
</head>
<body>
<%@ include file="index.jsp" %>
	<%
        database d = new database();
		Participant p = new Participant();
		int id = Integer.parseInt(request.getParameter("id"));
	    p = d.getParticipantDetails(id);
	
    	   %>
    	   <table border=1 width=60% align="center">
    	      <tr>
    	         <th>ID</th>
    	         <th>FULL NAME</th>
    	         <th>EMAIL</th>
    	         <th>DOB</th>
    	         <th>ENROLLMENT DATE</th>
    	         <th>BATCH NUMBER</th>
    	      </tr>
    	        	 <tr>
    	        	    <td><%=p.participant_id %></td>
    	        	    <td><%=p.full_name %></td>
    	        	    <td><%=p.email %></td>
    	        	    <td><%=p.date_of_birth %></td>
    	        	    <td><%=p.enrollment_date %></td>
    	        	    <td><%=p.batch_id %></td>
    	        	 </tr>
    	   </table>

</body>
</html>