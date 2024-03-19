<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.*"%>
<%@page import="com.model.Participant"%>
<%@page import="com.db.database"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Zumba Management APP - Participants</title>
</head>
<body>
	<%@ include file="index.jsp" %>
	<%
        database d = new database();
       ArrayList<Participant> participant =d.getAllParticipantsDetails();
       if(participant.size()>0){
    	   %>
    	   <table border=1 width=60% align="center">
    	      <tr>
    	         <th>ID</th>
    	         <th>NAME</th>
    	         <th>SHOW DETAILS</th>
    	         <th>EDIT</th>
    	         <th>DELETE</th>
    	      </tr>
    	      <% 
    	         for(Participant p: participant){
    	        	 %>
    	        	 <tr>
    	        	    <td><%=p.participant_id %></td>
    	        	    <td><%=p.full_name %></td>
    	        	    <td><a href="participantDetails.jsp?id=<%=p.participant_id%>">Info</a></td>
    	        	    <td><a href="editparticipant.jsp?id=<%=p.participant_id%>">Click Here</a></td>
    	        	    <td><a href="deleteparticipant.jsp?id=<%=p.participant_id%>">ClickHere</a></td>
    	        	 </tr>
    	        	 <% 
    	         }
    	      %>
    	   </table>
    	   
    	   <br> <br>
    	   <div style="text-align: center"> 
    	   <a  href="add-participant.html"> ADD PARTICIPANT</a>
    	   </div>
    	   <% 
       }
       else{
    	   %>
    	   <h3>No Participants</h3>
    	   <% 
       }
     %>

</body>
</html>