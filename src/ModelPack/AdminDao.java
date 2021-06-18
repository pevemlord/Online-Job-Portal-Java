package ModelPack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class AdminDao {

	public static boolean updateStatus(int userid,String type,String status){  
		try
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull","root","root");
        PreparedStatement ps= con.prepareStatement("update login set authorization=? where userid=? and type=?");
        ps.setString(1, status);
        ps.setInt(2, userid);
        ps.setString(3, type);
        
        int i = ps.executeUpdate();
        if(i>0) return true;
        
        }catch(Exception e)
		{System.out.println(e);}  
		return false;
	}
	
	public static boolean deleteJobseeker(int userid){  
		try
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull","root","root");
        PreparedStatement ps= con.prepareStatement("delete from jobseeker where jskid=?");
        ps.setInt(1, userid);
        
        int i = ps.executeUpdate();
        if(i>0) {
        	PreparedStatement pss= con.prepareStatement("delete from login where userid=? and type=?");
        	pss.setInt(1, userid);
        	pss.setString(2, "Jobseeker");
        	
        	int j = pss.executeUpdate();
        	if(j>0) return true;
        }
        }catch(Exception e)
		{System.out.println(e);}  
		return false;
	}
	
	public static boolean deleteEmployer(int userid){  
		try
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull","root","root");
        PreparedStatement ps= con.prepareStatement("delete from employer where empid=?");
        ps.setInt(1, userid);
        
        int i = ps.executeUpdate();
        if(i>0) {
        	PreparedStatement pss= con.prepareStatement("delete from login where userid=? and type=?");
        	pss.setInt(1, userid);
        	pss.setString(2, "Employer");
        	
        	int j = pss.executeUpdate();
        	if(j>0) return true;
        }
        }catch(Exception e)
		{System.out.println(e);}  
		return false;
	}
	
	public static boolean updateJobseeker(String fname, String lname, String contactno, String gender, String dob, String email, String education, String college, String address, String city, 
			String state, String workexp, String category, String skills, int userid){  
		try
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull","root","root");
        PreparedStatement ps= con.prepareStatement("update jobseeker set firstname=?,lastname=?,contactno=?,gender=?,dob=?,email=?,education=?,college=?,address=?,city=?,state=?,workexp=?,category=?,skills=? where jskid=?");
        ps.setString(1, fname);
        ps.setString(2, lname);
        ps.setString(3, contactno);
        ps.setString(4, gender);
        ps.setString(5, dob);
        ps.setString(6, email);
        ps.setString(7, education);
        ps.setString(8, college);
        ps.setString(9, address);
        ps.setString(10, city);
        ps.setString(11, state);
        ps.setString(12, workexp);
        ps.setString(13, category);
        ps.setString(14, skills);
        ps.setInt(15, userid);
        int i = ps.executeUpdate();
        if(i>0) return true;
        
        }catch(Exception e)
		{System.out.println(e);}  
		return false;
	}
	
	public static boolean updateEmployer(String cmpname, String email, String contactno, String link , String address, String city, String state, String category, String about, int userid){  
		try
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull","root","root");
        PreparedStatement ps= con.prepareStatement("update employer set cmpname=?,email=?,contactno=?,link=?,address=?,city=?,state=?,category=?,about=? where empid=?");
        ps.setString(1, cmpname);
        ps.setString(2, email);
        ps.setString(3, contactno);
        ps.setString(4, link);
        ps.setString(5, address);
        ps.setString(6, city);
        ps.setString(7, state);
        ps.setString(8, category);
        ps.setString(9, about);
        ps.setInt(10, userid);
        
        int i = ps.executeUpdate();
        if(i>0) return true;
        
        }catch(Exception e)
		{System.out.println(e);}  
		return false;
	}
	
	public static boolean updateJobDetail(int userid, int jobid, String status, String timed) {
		try
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull","root","root");
        PreparedStatement ps= con.prepareStatement("update jobdetails set userid=?,jobid=?,status=?,timed=?");
        ps.setInt(1, userid);
        ps.setInt(2, jobid);
        ps.setString(3, status);
        ps.setString(4, timed);
        
        int i = ps.executeUpdate();
        if(i>0) return true;
        
        }catch(Exception e)
		{System.out.println(e);} 
		return false;
	}
	
}
