package com.servlet.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.servlet.bean.Batch;
import com.servlet.bean.Course;

public class BatchDao {

	String url = "jdbc:mysql://localhost:3306/studentprojectdb";
	String username = "root";
	String password = "";
	PreparedStatement pst;
	Statement st;
	Connection con;
	ResultSet rs;

	public void openDb() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password);
			System.out.println("connection established");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	public int addDataBatch(String batchname, int year) {
		int status = 0;
		openDb();
		try {
			if (con != null) {
				pst = con.prepareStatement("insert into batch(batchname,year) values(?,?)");
				pst.setString(1, batchname);
				pst.setInt(2, year);
				pst.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				pst.close();

				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return status;
	}
	public List<Batch> detailsOfBatch() {

		String query = "select * from batch";
		List<Batch> list = new ArrayList<Batch>();

		try {
			openDb();
			pst = con.prepareStatement(query);
			rs = pst.executeQuery();

			while (rs.next()) {
				Batch batch = new Batch();
				batch.setId(rs.getInt("id"));
				batch.setBatchname(rs.getString("batchname"));
				batch.setYear(rs.getInt("year"));;
				list.add(batch);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		finally {
			try {
				pst.close();

				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	public Batch getBatchbyid(int id) {
		String query = "select * from batch where id=?";
		Batch batch=new Batch();
		try {
			openDb();
			pst = con.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();

			while (rs.next()) {
				batch.setId(rs.getInt("id"));
				batch.setBatchname(rs.getString("batchname"));
				batch.setYear(rs.getInt("year"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return batch;

	}

	public int updateBatchDetails(Batch batch) {
		int status=0;
		String query = "update batch set batchname=?,year=? where id=?";
		try {
			openDb();
			pst = con.prepareStatement(query);
			pst.setString(1, batch.getBatchname());
			pst.setInt(2, batch.getYear());
			pst.setInt(3, batch.getId());
			status= pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public int deleteBatchbyid(Batch batch) {
		int status=0;
		String query = "delete from batch where id=?";
		
		try {
			openDb();
			pst = con.prepareStatement(query);
			pst.setInt(1, batch.getId());
			status= pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;

	}


}
