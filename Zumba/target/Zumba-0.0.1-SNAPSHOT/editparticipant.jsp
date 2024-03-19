<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.model.Participant"%>
<%@page import="com.db.database"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Zumba Management APP - Edit Participant Details</title>
</head>
<body>
<%@ include file="index.jsp" %>
	<%
        database d = new database();
		Participant p = new Participant();
		int id = Integer.parseInt(request.getParameter("id"));
	    p = d.getParticipantDetails(id);
	
    	   %>
    	<div style="text-align: center"> 
  <form action="participant-update.jsp" method="post">
  
           <input type="hidden" name="id" value="<%=p.participant_id %>">
           <label>Full Name</label>
           <input type="text" name="name" value="<%=p.full_name %>"><br><br>
           <label>Email</label>
           <input type="email" name="email" value="<%= p.email %>"><br><br>
           <label>DOB</label>
           <input type="date" name="dob" value="<%= p.date_of_birth %>"><br><br>
           <label>Enrollment Date</label>
           <input type="date" name="edate" value="<%=p.enrollment_date%>"><br><br>
           <label>Batch Number</label>
           <input type="number" name="bno" value="<%= p.batch_id %>"><br> <br>
           <input type="submit" value="Update Details">
     </form>
</div>


</body>
</html>