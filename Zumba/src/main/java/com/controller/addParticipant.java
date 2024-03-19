package com.controller;

import jakarta.servlet.ServletException;
import com.db.*;
import com.model.Participant;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class addParticipant extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Participant p = new Participant();
		database d = new database();
		p.full_name = request.getParameter("name");
		p.email = request.getParameter("email");
		p.date_of_birth = request.getParameter("dob");
		p.enrollment_date = request.getParameter("edate");
		p.batch_id = Integer.parseInt(request.getParameter("bno"));
		
		d.addParticipant(p);

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("	<div style=\"text-align: center\"> \r\n"
				+ "		<h1>ZUMBA MANAGEMENT</h1>\r\n"
				+ "		<a href=\"index.jsp\">Home</a>\r\n"
				+ "	    &nbsp;| &nbsp;&nbsp;\r\n"
				+ "	    \r\n"
				+ "	    <a href=\"participants.jsp\">PARTICIPANTS</a>\r\n"
				+ "		&nbsp;| &nbsp;\r\n"
				+ "		\r\n"
				+ "		<a href=\"batches.jsp\">BATCHES</a>\r\n"
				+ "		<br> <br>\r\n"
				+ "		</div>\r\n"
				+ "		\r\n"
				+ "");

	}

}
