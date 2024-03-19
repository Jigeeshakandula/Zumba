<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="com.model.*"%>
<%@page import="com.db.database"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Zumba Management APP - Batches</title>
</head>
<body>
<%@ include file="index.jsp" %>
	<%
        database d = new database();
       ArrayList<Batch> batches =d.getAllBatchesDetails();
       if(batches.size()>0){
    	   %>
    	   <table border=1 width=60% align="center">
    	      <tr>
    	         <th>ID</th>
    	         <th>START TIME</th>
    	         <th>END TIME</th>
    	         <th>INSTRUCTOR</th>
    	         <th>EDIT</th>
    	         <th>DELETE</th>
    	      </tr>
    	      <% 
    	         for(Batch b: batches){
    	        	 %>
    	        	 <tr>
    	        	    <td><%=b.batch_id %></td>
    	        	    <td><%=b.start_time %></td>
    	        	    <td><%=b.end_time %></td>
    	        	    <td><%=b.Instructor %></td>
    	        	    <td><a href="editbatch.jsp?id=<%=b.batch_id%>">Click Here</a></td>
    	        	    <td><a href="deletebatch.jsp?id=<%=b.batch_id%>">ClickHere</a></td>
    	        	 </tr>
    	        	 <% 
    	         }
    	      %>
    	   </table>
    	   
    	   <br> <br>
    	   <div style="text-align: center"> 
    	   <a  href="add-batch.html"> ADD BATCH</a>
    	   </div>
    	   <% 
       }
       else{
    	   %>
    	   <h3>No BATCHES</h3>
    	   <% 
       }
     %>

</body>
</html>