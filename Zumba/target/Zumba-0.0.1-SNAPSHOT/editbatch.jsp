<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.model.Batch"%>
<%@page import="com.db.database"%>
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
		int id = Integer.parseInt(request.getParameter("id"));
		Batch b = new Batch();
       	b = d.getBatchDetails(id);
    	   %>
    	   
    	   <div style="text-align: center"> 
		  <form action="batch-update.jsp" method="post">
		           <input type="hidden" name="id" value="<%=b.batch_id %>">
		           <label>Start Time</label>
		           <input type="time" name="stime" value = "<%=b.start_time%>"><br><br>
		           <label>End Time</label>
		           <input type="time" name="etime" value = "<%= b.end_time %>"><br><br>
		           <label>Instructor</label>
		           <input type="text" name="instructor" value = "<%=b.Instructor%>"><br><br>
		           <input type="submit" value="Update Details">
		     </form>
		</div>
</body>
</html>