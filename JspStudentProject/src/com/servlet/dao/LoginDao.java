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
import com.servlet.bean.CourseDetails;

public class LoginDao {

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

	public boolean check(String uname, String pass) {
		boolean checkuser = false;
		String sql = "Select * from studentlogin where username=? and password=?";

		openDb();
		try {

			if (con != null) {

				pst = con.prepareStatement(sql);
				pst.setString(1, uname);
				pst.setString(2, pass);
				rs = pst.executeQuery();

				if (rs.next()) {
					checkuser = true;
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pst.close();

				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return checkuser;

	}

	public int addDataCourse(String courseName, String duration) {
		int status = 0;
		openDb();
		try {
			if (con != null) {
				pst = con.prepareStatement("insert into course(coursename,duration) values(?,?)");
				pst.setString(1, courseName);
				pst.setString(2, duration);
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

	public CourseDetails detailsOfCourse(int pageNo, String direction, int pageSize) {

		String query = "select * from course limit ?, ?";
		String totalQuery = "select count(*) from course";
		CourseDetails courseDetails = new CourseDetails();

		try {
			openDb();
			pst = con.prepareStatement(totalQuery);
			rs = pst.executeQuery();
			rs.next();
			courseDetails.setTotal(rs.getInt(1));

			if (direction != null) {
				if (direction.equals("prev") && pageNo > 1) {
					pageNo--;
				} else if (direction.equals("next")) {
					if ((courseDetails.getTotal() % pageSize == 0 && pageNo < courseDetails.getTotal() / pageSize)
							|| (courseDetails.getTotal() % pageSize != 0 && pageNo <= courseDetails.getTotal() / pageSize)) {
						pageNo++;
					}
				}
			}

			pst = con.prepareStatement(query);
			pst.setInt(1, (pageNo - 1) * pageSize);
			pst.setInt(2, pageSize);
			rs = pst.executeQuery();

			List<Course> list = new ArrayList<Course>();

			while (rs.next()) {
				Course course = new Course();
				course.setId(rs.getInt("id"));
				course.setCoursename(rs.getString("coursename"));
				course.setDuration(rs.getString("duration"));
				list.add(course);
			}

			courseDetails.setCourse(list);

			courseDetails.setPageNo(pageNo);

			pst = con.prepareStatement(totalQuery);
			rs = pst.executeQuery();
			rs.next();
			courseDetails.setTotal(rs.getInt(1));
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
		return courseDetails;
	}

	public List<Course> getAllCorse() {

		String query = "select * from course";
		List<Course> list = new ArrayList<Course>();

		try {
			openDb();
			pst = con.prepareStatement(query);
			rs = pst.executeQuery();

			while (rs.next()) {
				Course course = new Course();
				course.setId(rs.getInt("id"));
				course.setCoursename(rs.getString("coursename"));
			    course.setDuration(rs.getString("duration"));
				list.add(course);
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

	
	public Course getCoursebyid(int id) {
		String query = "select * from course where id=?";
		Course course = new Course();
		try {
			openDb();
			pst = con.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();

			while (rs.next()) {
				course.setId(rs.getInt("id"));
				course.setCoursename(rs.getString("coursename"));
				course.setDuration(rs.getString("duration"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return course;

	}

	public int updateCourseDetails(Course course) {
		int status = 0;
		String query = "update course set coursename=?,duration=? where id=?";
		try {
			openDb();
			pst = con.prepareStatement(query);
			pst.setString(1, course.getCoursename());
			pst.setString(2, course.getDuration());
			pst.setInt(3, course.getId());
			status = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public int deleteCoursebyid(Course course) {
		int status = 0;
		String query = "delete from course where id=?";

		try {
			openDb();
			pst = con.prepareStatement(query);
			pst.setInt(1, course.getId());
			status = pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;

	}

}
