package ModelPack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

public class Activity {
	int ActivityID;
	String ActivityNature;
	String ActivityOwner;
	int ActivityUserID;
	String ActivityResult;
	String ActivityDate;
	String ActivityTime;
	public int getActivityID() {
		return ActivityID;
	}
	public void setActivityID(int activityID) {
		ActivityID = activityID;
	}
	public String getActivityNature() {
		return ActivityNature;
	}
	public void setActivityNature(String activityNature) {
		ActivityNature = activityNature;
	}
	public String getActivityOwner() {
		return ActivityOwner;
	}
	public void setActivityOwner(String activityOwner) {
		ActivityOwner = activityOwner;
	}
	public int getActivityUserID() {
		return ActivityUserID;
	}
	public void setActivityUserID(int activityUserID) {
		ActivityUserID = activityUserID;
	}
	public String getActivityResult() {
		return ActivityResult;
	}
	public void setActivityResult(String activityResult) {
		ActivityResult = activityResult;
	}
	public String getActivityDate() {
		return ActivityDate;
	}
	public void setActivityDate(String activityDate) {
		ActivityDate = activityDate;
	}
	public String getActivityTime() {
		return ActivityTime;
	}
	public void setActivityTime(String activityTime) {
		ActivityTime = activityTime;
	}
	
	public static void creatingActivity(String ActivityNature, String ActivityOwner, int ActivityUserID, int ActivityJobID, String ActivityResult){
		try {
			java.util.Date date=new java.util.Date();
			java.sql.Date sqlDate=new java.sql.Date(date.getTime());
            java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull", "root", "root");
			PreparedStatement ps = con.prepareStatement("insert into Activity(ActivityNature, ActivityOwner, ActivityUserID, ActivityJobID, ActivityResult, ActivityDate, ActivityTime) values(?,?,?,?,?,?,?)");
			ps.setString(1, ActivityNature);
			ps.setString(2, ActivityOwner);
			ps.setInt(3, ActivityUserID);
			ps.setInt(4, ActivityUserID);
			ps.setString(5, ActivityResult);
			ps.setDate(6, sqlDate);
			ps.setTimestamp(7, sqlTime);
			int result = ps.executeUpdate();
			if(result > 0)
				System.out.println("Activity created successfully...");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
