package ModelPack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AuthDao {

	public static String getAuthorization(int userId, String type) {
		String authorization = "";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull", "root", "root");

			PreparedStatement ps = con.prepareStatement("select * from login where userid=? and type=?");
			ps.setInt(1, userId);
			ps.setString(2, type);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				authorization = rs.getString("authorization");
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return authorization;
	}

	public static UserBean getUserById(int userId, String type) {
		UserBean user = new UserBean();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull", "root", "root");

			PreparedStatement ps = con.prepareStatement("select * from login where userid=? and type=?");
			ps.setInt(1, userId);
			ps.setString(2, type);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setType(rs.getString("type"));
				System.out.println(rs.getString("authorization"));
				user.setAuthorization(rs.getString("authorization"));
				if (rs.getString("type").equalsIgnoreCase("jobseeker")) {
					PreparedStatement pss = con
							.prepareStatement("select firstname,lastname from jobseeker where username=?");
					pss.setString(1, rs.getString("username"));
					ResultSet rss = pss.executeQuery();

					if (rss.next()) {
						user.setFirstname(rss.getString("firstname"));
						user.setLastname(rss.getString("lastname"));
						return user;
					}

				} else if (rs.getString("type").equalsIgnoreCase("employer")) {
					PreparedStatement pss = con.prepareStatement("select * from employer where cmpname=?");
					pss.setString(1, rs.getString("username"));
					ResultSet rss = pss.executeQuery();
					if (rss.next()) {
						user.setCompanyname(rss.getString("cmpname"));
						return user;
					}
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public static boolean checkUserPass(String username, String password, String type) {
		boolean status = false;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull", "root", "root");

			PreparedStatement ps = con
					.prepareStatement("select * from login where username=? and password=? and type=?");
			ps.setString(1, username);
			ps.setString(2, password);
			ps.setString(3, type);
			ResultSet rs = ps.executeQuery();
			status = rs.next();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static boolean checkAdmin(String username, String password) {
		boolean status = false;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull", "root", "root");

			PreparedStatement ps = con.prepareStatement("select * from adminuser where username=? and password=?");
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			status = rs.next();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static boolean checkJskUserName(String username) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull", "root", "root");

			PreparedStatement ps = con.prepareStatement("select * from jobseeker where username=?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				if (username.equals(rs.getString("username")))
					return false;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return true;
	}

	public static boolean checkEmpUserName(String username) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull", "root", "root");

			PreparedStatement ps = con.prepareStatement("select * from employer where cmpname=?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				if (username.equals(rs.getString("cmpname")))
					return false;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return true;
	}

	public static boolean addNewJobseeker(String username, String password, String firstname, String lastname,
			String contactno, String gender, String dob, String email, String school10, String percent10, String school12, String percent12, String education, String college, String address,
			String city, String state, String workexp, String category, String resumefile, String skills) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull", "root", "root");

			PreparedStatement ps = con.prepareStatement(
					"insert into jobseeker(username,firstname,lastname,contactno,gender,dob,email,education,College,address,city,state,workexp,category,skills,resumefile,school10, percent10,school12, percent12) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, username);
			ps.setString(2, firstname);
			ps.setString(3, lastname);
			ps.setString(4, contactno);
			ps.setString(5, gender);
			ps.setString(6, dob);
			ps.setString(7, email);
			ps.setString(8, education);
			ps.setString(9, college);
			ps.setString(10, address);
			ps.setString(11, city);
			ps.setString(12, state);
			ps.setString(13, workexp);
			ps.setString(14, category);
			ps.setString(15, skills);
			ps.setString(16, resumefile);
			ps.setString(17, school10);
			ps.setString(18, percent10);
			ps.setString(19, school12);
			ps.setString(20, percent12);
			int i = ps.executeUpdate();
			System.out.println(i);
			if (i > 0) {
				ps = con.prepareStatement("select jskid from jobseeker where username=?");
				ps.setString(1, username);
				ResultSet rs = ps.executeQuery();

				if (rs.next()) {
					ps = con.prepareStatement(
							"insert into login(userid,username,password,type,authorization) values (?,?,?,?,?)");
					ps.setInt(1, rs.getInt("jskid"));
					ps.setString(2, username);
					ps.setString(3, password);
					ps.setString(4, "Jobseeker");
					ps.setString(5, "Pending");
					int j = ps.executeUpdate();
					if (j > 0)
						return true;
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}

	public static boolean updateJobSeeker(String username, String password, String firstname, String lastname,
			String contactno, String gender, String dob, String email,String school10, String percent10, String school12, String percent12, String education, String college, String address,
			String city, String state, String workexp, String category, String resumefile, String skills, int userid) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull", "root", "root");

			PreparedStatement ps = con.prepareStatement(
					"update jobseeker set username=?,firstname=?,lastname=?,contactno=?,gender=?,dob=?,email=?,education=?,College=?,address=?,city=?,state=?,workexp=?,category=?,skills=?,resumefile=?,school10=?,percent10=?,school12=?,percent12=? where jskid=?");
			ps.setString(1, username);
			ps.setString(2, firstname);
			ps.setString(3, lastname);
			ps.setString(4, contactno);
			ps.setString(5, gender);
			ps.setString(6, dob);
			ps.setString(7, email);
			ps.setString(8, education);
			ps.setString(9, college);
			ps.setString(10, address);
			ps.setString(11, city);
			ps.setString(12, state);
			ps.setString(13, workexp);
			ps.setString(14, category);
			ps.setString(15, skills);
			ps.setString(16, resumefile);
			ps.setString(17, school10);
			ps.setString(18, percent10);
			ps.setString(19, school12);
			ps.setString(20, percent12);
			ps.setInt(21, userid);
			
			int i = ps.executeUpdate();
			System.out.println(i);
			if (i > 0) {
					return true;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}
	
	public static boolean addNewEmployer(String cmpname, String password, String email, String contactno, String link,
			String address, String city, String state, String category, String about) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull", "root", "root");

			PreparedStatement ps = con.prepareStatement(
					"insert into employer(cmpname,email,contactno,link,address,city,state,category,about) values (?,?,?,?,?,?,?,?,?)");
			ps.setString(1, cmpname);
			ps.setString(2, email);
			ps.setString(3, contactno);
			ps.setString(4, link);
			ps.setString(5, address);
			ps.setString(6, city);
			ps.setString(7, state);
			ps.setString(8, category);
			ps.setString(9, about);
			int i = ps.executeUpdate();
			if (i > 0) {
				ps = con.prepareStatement("select empid from employer where cmpname=?");
				ps.setString(1, cmpname);
				ResultSet rs = ps.executeQuery();

				if (rs.next()) {
					ps = con.prepareStatement(
							"insert into login(userid,username,password,type,authorization) values (?,?,?,?,?)");
					ps.setInt(1, rs.getInt("empid"));
					ps.setString(2, cmpname);
					ps.setString(3, password);
					ps.setString(4, "Employer");
					ps.setString(5, "Pending");
					int j = ps.executeUpdate();
					if (j > 0)
						return true;
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}

	public static boolean addNewJob(String jobprofile, String jobcategory, String jobtype, String jobopening,
			String workexperience, String salaryexpected, String noticeperiod, String location, String state,
			int createdBy) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull", "root", "root");

			PreparedStatement ps = con.prepareStatement(
					"insert into jobdetails(jobprofile,jobcategory,jobtype, jobopening,workexperience,salaryexpected,noticeperiod,location,state,createdBy) values (?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, jobprofile);
			ps.setString(2, jobcategory);
			ps.setString(3, jobtype);
			ps.setString(4, jobopening);
			ps.setString(5, workexperience);
			ps.setString(6, salaryexpected);
			ps.setString(7, noticeperiod);
			ps.setString(8, location);
			ps.setString(9, state);
			ps.setInt(10, createdBy);
			int j = ps.executeUpdate();
			if (j > 0) {
				ps = con.prepareStatement("select jobid from jobdetails where empid=? order by jobid desc");
				ps.setInt(1, createdBy);
				ResultSet rs = ps.executeQuery();
				if(rs.next())
					Activity.creatingActivity("PostingJob", "Employer", createdBy, rs.getInt("jobid"), "Job");
				return true;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}

	public static boolean addStatusToJob(int userid, int jobid, String status, String time) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull", "root", "root");

			PreparedStatement ps = con
					.prepareStatement("insert into candidateapplied(userid,jobid,status,time) values (?,?,?,?)");
			ps.setInt(1, userid);
			ps.setInt(2, jobid);
			ps.setString(3, "Pending");
			ps.setString(4, time);
			int j = ps.executeUpdate();
			if (j > 0)
				return true;
		} catch (Exception e) {
			System.out.println(e);
		}

		return false;
	}

	public static int getUserId(String username, String type) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull", "root", "root");

			PreparedStatement ps = con.prepareStatement("select * from login where username=? and type=?");
			ps.setString(1, username);
			ps.setString(2, type);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				int userid = rs.getInt(1);
				return userid;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}
}
