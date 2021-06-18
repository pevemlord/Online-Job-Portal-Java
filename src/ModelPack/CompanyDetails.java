package ModelPack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CompanyDetails {
	int CompanyID;
	String CompanyName;
	String CompanyEmailID;
	String CompanyContactNo;
	String CompanyAddress;
	String CompanyCity;
	String CompanyState;
	String CompanyAbout;
	String CompanyCategory;
	String CompanyLink;
	public int getCompanyID() {
		return CompanyID;
	}
	public void setCompanyID(int companyID) {
		CompanyID = companyID;
	}
	public String getCompanyName() {
		return CompanyName;
	}
	public void setCompanyName(String companyName) {
		CompanyName = companyName;
	}
	public String getCompanyEmailID() {
		return CompanyEmailID;
	}
	public void setCompanyEmailID(String companyEmailID) {
		CompanyEmailID = companyEmailID;
	}
	public String getCompanyContactNo() {
		return CompanyContactNo;
	}
	public void setCompanyContactNo(String companyContactNo) {
		CompanyContactNo = companyContactNo;
	}
	public String getCompanyAddress() {
		return CompanyAddress;
	}
	public void setCompanyAddress(String companyAddress) {
		CompanyAddress = companyAddress;
	}
	public String getCompanyCity() {
		return CompanyCity;
	}
	public void setCompanyCity(String companyCity) {
		CompanyCity = companyCity;
	}
	public String getCompanyState() {
		return CompanyState;
	}
	public void setCompanyState(String companyState) {
		CompanyState = companyState;
	}
	public String getCompanyAbout() {
		return CompanyAbout;
	}
	public void setCompanyAbout(String companyAbout) {
		CompanyAbout = companyAbout;
	}
	public String getCompanyCategory() {
		return CompanyCategory;
	}
	@Override
	public String toString() {
		return "CompanyDetails [CompanyID=" + CompanyID + ", CompanyName=" + CompanyName + ", CompanyEmailID="
				+ CompanyEmailID + ", CompanyContactNo=" + CompanyContactNo + ", CompanyAddress=" + CompanyAddress
				+ ", CompanyCity=" + CompanyCity + ", CompanyState=" + CompanyState + ", CompanyAbout=" + CompanyAbout
				+ ", CompanyCategory=" + CompanyCategory + ", CompanyLink=" + CompanyLink + "]";
	}
	public void setCompanyCategory(String companyCategory) {
		CompanyCategory = companyCategory;
	}
	public String getCompanyLink() {
		return CompanyLink;
	}
	public void setCompanyLink(String companyLink) {
		CompanyLink = companyLink;
	}
	
	public void fetchingComanyDetailsThroughJobID(int jobid) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull", "root", "root");
			PreparedStatement ps = con.prepareStatement("select createdby from jobdetails where jobid=?");
			ps.setInt(1, jobid);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				fetchingCompanyDetails(rs.getInt("createdby"));
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void fetchingCompanyDetails(int CompanyID) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull", "root", "root");
			PreparedStatement ps = con.prepareStatement("select * from employer where empid=?");
			ps.setInt(1, CompanyID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				setCompanyID(CompanyID);
				setCompanyName(rs.getString("cmpname"));
				setCompanyEmailID(rs.getString("email"));
				setCompanyContactNo(rs.getString("contactno"));
				setCompanyAddress(rs.getString("address"));
				setCompanyCity(rs.getString("city"));
				setCompanyState(rs.getString("state"));
				setCompanyCategory(rs.getString("category"));
				setCompanyAbout(rs.getString("about"));
				setCompanyLink(rs.getString("link"));
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}		
	}
	
	public void fetchingCompanyDetails(String CompanyName) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull", "root", "root");
			PreparedStatement ps = con.prepareStatement("select * from employer where cmpname=?");
			ps.setString(1, CompanyName);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				setCompanyName(rs.getString("cmpname"));
				setCompanyEmailID(rs.getString("email"));
				setCompanyContactNo(rs.getString("contactno"));
				setCompanyAddress(rs.getString("address"));
				setCompanyCity(rs.getString("city"));
				setCompanyState(rs.getString("state"));
				setCompanyCategory(rs.getString("category"));
				setCompanyAbout(rs.getString("about"));
				setCompanyLink(rs.getString("link"));
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}		
	}
}
