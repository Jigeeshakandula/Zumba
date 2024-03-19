package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.db.database;
import com.model.Batch;


public class addBatch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Batch b = new Batch();
		database d = new database();
		b.start_time = request.getParameter("stime");
		b.end_time = request.getParameter("etime");
		b.Instructor = request.getParameter("instructor");
		
		d.addBatch(b);

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

