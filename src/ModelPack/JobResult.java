package ModelPack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JobResult {
	int CompanyID;
	int JobSeekerID;
	int JobID;
	String JobStatus;
	public int getCompanyID() {
		return CompanyID;
	}
	public void setCompanyID(int companyID) {
		CompanyID = companyID;
	}
	public int getJobSeekerID() {
		return JobSeekerID;
	}
	public void setJobSeekerID(int jobSeekerID) {
		JobSeekerID = jobSeekerID;
	}
	public int getJobID() {
		return JobID;
	}
	public void setJobID(int jobID) {
		JobID = jobID;
	}
	public String getJobStatus() {
		return JobStatus;
	}
	public void setJobStatus(String jobStatus) {
		JobStatus = jobStatus;
	}
	
	public void generatingData(int ID, String type) {
		String statement = "";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull", "root", "root");
			if(type.equalsIgnoreCase("employer"))
				statement = "select * from jobresult where empid=?";
			else if(type.equalsIgnoreCase("jobseeker"))
				statement = "select * from jobresult where jskid=?";
			else 
				statement = "select * from jobresult where jobid=?";
			PreparedStatement ps = con.prepareStatement(statement);
			ps.setInt(1, JobID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				setCompanyID(rs.getInt("empid"));
				setJobSeekerID(rs.getInt("jskid"));
				setJobID(rs.getInt("jobid"));
				setJobStatus(rs.getString("jobstatus"));
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	public String getJobStatus(int JobID) {
		String jobStatus = "";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull", "root", "root");
			PreparedStatement ps = con.prepareStatement("select * from employer where cmpname=?");
			ps.setInt(1, JobID);
			ResultSet rs = ps.executeQuery();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return jobStatus;
	}
	
	public String getJobStatus(int ID, String type) {
		String jobStatus = "";
		return jobStatus;
	}
	
	public String getJobStatus(int EmpID, int JobSeekerID) {
		String jobStatus = "";
		return jobStatus;
	}
	
	
	public boolean applyForJob(int jobid, int jskid, int empid) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull", "root", "root");
			PreparedStatement ps = con.prepareStatement("insert into jobresult(jobid, jskid, empid, jobstatus) values(?,?,?,?)");
			ps.setInt(1, jobid);
			ps.setInt(2, jskid);
			ps.setInt(3, empid);
			ps.setString(4, "Apply");
			int rs = ps.executeUpdate();
			if(rs > 0) {
				Activity.creatingActivity("Apply", "JobSeeker", jskid, jobid, "WaitingForResponse");
				return true;
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean selectCandidate(int jobid, int jskid, int empid) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull", "root", "root");
			PreparedStatement ps = con.prepareStatement("insert into jobresult(jobid, jskid, empid, jobstatus) values(?,?,?,?)");
			ps.setInt(1, jobid);
			ps.setInt(2, jskid);
			ps.setInt(3, empid);
			ps.setString(4, "Select");
			int rs = ps.executeUpdate();
			if(rs > 0) {
				Activity.creatingActivity("Decision", "JobSeeker", jskid, jobid, "Selected");
				return true;
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean rejectCandidate(int jobid, int jskid, int empid) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull", "root", "root");
			PreparedStatement ps = con.prepareStatement("insert into jobresult(jobid, jskid, empid, jobstatus) values(?,?,?,?)");
			ps.setInt(1, jobid);
			ps.setInt(2, jskid);
			ps.setInt(3, empid);
			ps.setString(4, "Reject");
			int rs = ps.executeUpdate();
			if(rs > 0) {
				Activity.creatingActivity("Decision", "JobSeeker", jskid, jobid, "Reject");
				return true;
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean reviewCandidate(int jobid, int jskid, int empid) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull", "root", "root");
			PreparedStatement ps = con.prepareStatement("insert into jobresult(jobid, jskid, empid, jobstatus) values(?,?,?,?)");
			ps.setInt(1, jobid);
			ps.setInt(2, jskid);
			ps.setInt(3, empid);
			ps.setString(4, "Review");
			int rs = ps.executeUpdate();
			if(rs > 0) {
				Activity.creatingActivity("Decision", "JobSeeker", jskid, jobid, "Review");
				return true;
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
