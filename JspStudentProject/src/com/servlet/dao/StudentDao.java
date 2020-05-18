package com.servlet.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.servlet.bean.Course;
import com.servlet.bean.Student;

public class StudentDao {


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
	public int addDataStudent(String studname,String course,String batch,String address,String phone ) {
		int status = 0;
		openDb();
		try {
			if (con != null) {
				pst = con.prepareStatement("insert into student(studname,course,batch,address,phone) values(?,?,?,?,?)");
				pst.setString(1, studname);
				pst.setString(2, course);
				pst.setString(3, batch);
				pst.setString(4, address);
				pst.setString(5, phone);
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


	public List<Student> getAllStudent() {

		String query = "select s.id,s.studname,c.coursename,b.batchname,s.address,s.phone from student s join course c on s.course=c.id join batch b on s.batch=b.id";
		List<Student> list = new ArrayList<Student>();

		try {
			openDb();
			pst = con.prepareStatement(query);
			rs = pst.executeQuery();

			while (rs.next()) {
				Student student = new Student();
				student.setId(rs.getString("s.id"));
				student.setStudname(rs.getString("s.studname"));
				student.setCourse(rs.getString("c.coursename"));
				student.setBatch(rs.getString("b.batchname"));
				student.setAddress(rs.getString("s.address"));
				student.setPhone(rs.getString("s.phone"));
				list.add(student);
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

	public int deleteStudentbyid(Student student) {
		int status = 0;
		String query = "delete from student where id=?";

		try {
			openDb();
			pst = con.prepareStatement(query);
			pst.setString(1, student.getId());
			status = pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;

	}

}
