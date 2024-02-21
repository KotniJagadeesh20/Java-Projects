package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import com.User.NotesDetails;
import com.connection.DBUtil;

public class NotesDao {
	private Connection conn;

	public boolean Addnotes(String Title, String Content, int Uid) {
		boolean Addnotes = false;
		try {
			String AddNotes_Query = " INSERT INTO new_table(Title,Content,Uid) values(?,?,?)";
			conn = DBUtil.getconnection();
			// String AddNotes_Query = " INSERT INTO new_table(Title,Content,Uid) values(" +
			// Title + "," + Content + ","
			// + Uid + ")";

			// Statement statement = conn.createStatement();
			// int update = statement.executeUpdate(AddNotes_Query);
			PreparedStatement PreStatement = conn.prepareStatement(AddNotes_Query);
			PreStatement.setString(1, Title);
			PreStatement.setString(2, Content);
			PreStatement.setInt(3, Uid);

			int update = PreStatement.executeUpdate();
			if (update >= 1) {
				Addnotes = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return Addnotes;

	}

	public List<NotesDetails> Getdata(int id) {
		LinkedList<NotesDetails> NotesD = new LinkedList<NotesDetails>();
		NotesDetails Notes;
		try {
			String Data_query = "SELECT * FROM new_table where Uid=? ";
			conn = DBUtil.getconnection();
			PreparedStatement PreStatement = conn.prepareStatement(Data_query);
			PreStatement.setInt(1, id);
			ResultSet Rset = PreStatement.executeQuery();
			while (Rset.next()) {
				Notes = new NotesDetails();
				Notes.setId(Rset.getInt(1));
				Notes.setTitle(Rset.getString(2));
				Notes.setContent(Rset.getString(3));
				Notes.setAdate(Rset.getTimestamp(4));
				NotesD.add(Notes);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return NotesD;

	}

	public NotesDetails getDataByid(int notesid) {
		NotesDetails Editnotes = null;
		try {
			String Data_query = "SELECT * FROM new_table where id=?";
			conn = DBUtil.getconnection();
			PreparedStatement PreStatement = conn.prepareStatement(Data_query);
			PreStatement.setInt(1, notesid);
			ResultSet Rset = PreStatement.executeQuery();
			while (Rset.next()) {
				Editnotes = new NotesDetails();
				Editnotes.setId(Rset.getInt(1));
				Editnotes.setTitle(Rset.getString(2));
				Editnotes.setContent(Rset.getString(3));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return Editnotes;

	}

	public boolean UpdateNotes(int id, String Title, String Content) {
		boolean UpdateStatus = false;
		try {
			String UpdateNotes_Query = " UPDATE new_table set Title=?,Content=? Where id=?";
			conn = DBUtil.getconnection();
			PreparedStatement PreStatement = conn.prepareStatement(UpdateNotes_Query);
			PreStatement.setString(1, Title);
			PreStatement.setString(2, Content);
			PreStatement.setInt(3, id);

			int update = PreStatement.executeUpdate();
			if (update >= 1) {
				UpdateStatus = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return UpdateStatus;

	}

	public boolean DeleteNotes(int id) {
		boolean DeleteStatus = false;
		try {
			String Delete_Query = "DELETE FROM new_table WHERE id =?";
			conn = DBUtil.getconnection();
			PreparedStatement PreStatement = conn.prepareStatement(Delete_Query);
			PreStatement.setInt(1, id);
			int Updatecount = PreStatement.executeUpdate();
			if (Updatecount >= 1) {
				DeleteStatus = true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return DeleteStatus;

	}

}
