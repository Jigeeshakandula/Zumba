package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import com.model.*;

public class database {
	
	Connection connection;
	PreparedStatement ps;
	public database(){	
		try {
			//Step-1 
			Class.forName("com.mysql.cj.jdbc.Driver");	
			
			//Step-2
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/zms", "root", "Jishu@97");
			
		}catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Participant> getAllParticipantsDetails() {
		ArrayList<Participant> participantsList = new ArrayList<Participant>();
		try {
			//step-3
			Statement stmt = connection.createStatement();
			
			//step-4
			ResultSet rs = stmt.executeQuery("SELECT participant_id, full_name FROM Participants");
			
			//step-5
			
			while(rs.next()) {
				Participant p = new Participant();
				p.participant_id = rs.getInt("participant_id");
				p.full_name =  rs.getString("full_name");
				
				participantsList.add(p);
				
			}
			
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return participantsList;
		
	}
	
	public Participant getParticipantDetails(int p_id) {
		Participant p = new Participant();
		String sqlcmd = "select * from PARTICIPANTS where participant_id = ?";
		
		try {
			ps = connection.prepareStatement(sqlcmd);
			ps.setInt(1, p_id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
			p.participant_id = rs.getInt("participant_id");
			p.full_name =  rs.getString("full_name");
			p.email =  rs.getString("email");
		    p.date_of_birth =  rs.getString("date_of_birth");
			p.enrollment_date =  rs.getString("enrollment_date");
			p.batch_id =  rs.getInt("batch_id");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return p;
	}
	
	
	public void addParticipant(Participant p) {
		try {
			ps = connection.prepareStatement(
					"INSERT INTO PARTICIPANTS VALUES(?,?,?,?,?,?)");
			ps.setInt(1, p.participant_id);
			ps.setString(2, p.full_name);
			ps.setString(3, p.email);
			ps.setString(4, p.date_of_birth);
			ps.setString(5, p.enrollment_date);
			ps.setInt(6, p.batch_id);
			

			int noOfRowsInserted = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void deleteParticipant(int p_id) {
		Participant p = new Participant();
		String sqlcmd = "DELETE FROM PARTICIPANTS where participant_id = ?";
		
		try {
			ps = connection.prepareStatement(sqlcmd);
			ps.setInt(1, p_id);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
	}
	
	public void updateParticipant(Participant p) {
		
		String sqlcmd = "update participants set full_name = ?, email = ?, date_of_birth = ?, enrollment_date = ?, batch_id =? where participant_id =?";
		
		try {
			ps = connection.prepareStatement(sqlcmd);
			ps.setString(1, p.full_name);
			ps.setString(2, p.email);
			ps.setString(3, p.date_of_birth);
			ps.setString(4, p.enrollment_date);
			ps.setInt(5, p.batch_id);
			ps.setInt(6, p.participant_id);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
	}
	
	public ArrayList<Batch> getAllBatchesDetails() {
		ArrayList<Batch> batchesList = new ArrayList<Batch>();
		try {
			//step-3
			Statement stmt = connection.createStatement();
			
			//step-4
			ResultSet rs = stmt.executeQuery("SELECT * FROM BATCHES");
			
			//step-5
			
			while(rs.next()) {
				Batch b = new Batch();
				b.batch_id = rs.getInt("batch_id");
				b.start_time =  rs.getString("start_time");
				b.end_time =  rs.getString("end_time");
				b.Instructor =  rs.getString("Instructor");
				
				batchesList.add(b);
				
			}
			
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return batchesList;
		
	}
	
	public void addBatch(Batch b) {
		try {
			ps = connection.prepareStatement(
					"INSERT INTO BATCHES VALUES(?,?,?,?)");
			ps.setInt(1, b.batch_id);
			ps.setString(2, b.start_time);
			ps.setString(3, b.end_time);
			ps.setString(4, b.Instructor);

			int noOfRowsInserted = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void deleteBatch(int b_id) {
		Batch p = new Batch();
		String sqlcmd = "DELETE FROM BATCHES where batch_id = ?";
		
		try {
			ps = connection.prepareStatement(sqlcmd);
			ps.setInt(1, b_id);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
	}
	
	public Batch getBatchDetails(int b_id) {
		Batch b = new Batch();
		String sqlcmd = "select * from BATCHES where batch_id = ?";
		
		try {
			ps = connection.prepareStatement(sqlcmd);
			ps.setInt(1, b_id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				
				b.batch_id = rs.getInt("batch_id");
				b.start_time =  rs.getString("start_time");
				b.end_time =  rs.getString("end_time");
				b.Instructor =  rs.getString("Instructor");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return b;
	}
	
	public void updateBatch(Batch b) {
		
		String sqlcmd = "update BATCHES set start_time = ?, end_time = ?, Instructor = ? where batch_id =?";
		
		try {
			ps = connection.prepareStatement(sqlcmd);
			ps.setString(1, b.start_time);
			ps.setString(2, b.end_time);
			ps.setString(3, b.Instructor);
			ps.setInt(4, b.batch_id);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
	}

}
