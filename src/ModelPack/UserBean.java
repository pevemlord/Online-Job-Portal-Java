package ModelPack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserBean {

	private int jskid;
	private int empid;
	private int userid;
	private String college;
	private String skills;
	private String type;
	private String username;
	private String password;
	private String firstname;
	private String lastname;
	private String cmpname;
	private String contactname;
	private String contactno;
	private String gender;
	private String dob;
	private String email;
	private String education;
	private String city;
	private String state;
	private String workexp;
	private String category;
	private String authorization;
	private String address;
	
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	public String getSkills() {
		return skills;
	}
	public void setSkills(String skills) {
		this.skills = skills;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getCmpname() {
		return cmpname;
	}
	public void setCmpname(String cmpname) {
		this.cmpname = cmpname;
	}
	public String getContactno() {
		return contactno;
	}
	public void setContactno(String contactno) {
		this.contactno = contactno;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getWorkexp() {
		return workexp;
	}
	public void setWorkexp(String workexp) {
		this.workexp = workexp;
	}
	
	public int getJskid() {
	return jskid;
	}
	public void setJskid(int jskid) {
	this.jskid = jskid;
	}
	public int getEmpid() {
	return empid;
	}
	public void setEmpid(int empid) {
	this.empid = empid;
	}
	public String getType() {
	return type;
	}
	public void setType(String type) {
	this.type = type;
	}
	public String getUsername() {
	return username;
	}
	public void setUsername(String username) {
	this.username = username;
	}
	public String getPassword() {
	return password;
	}
	public void setPassword(String password) {
	this.password = password;
	}
	public String getFirstname() {
	return firstname;
	}
	public void setFirstname(String firstname) {
	this.firstname = firstname;
	}
	public String getLastname() {
	return lastname;
	}
	public void setLastname(String lastname) {
	this.lastname = lastname;
	}
	public String getCompanyname() {
	return cmpname;
	}
	public void setCompanyname(String cmpname) {
	this.cmpname = cmpname;
	}
	public String getContactname() {
	return contactname;
	}
	public void setContactname(String contactname) {
	this.contactname = contactname;
	}
	public String getContactNo() {
	return contactno;
	}
	public void setContactNo(String contactno) {
	this.contactno = contactno;
	}
	public String getGender() {
	return gender;
	}
	public void setGender(String gender) {
	this.gender = gender;
	}
	public String getDateOfBirth() {
	return dob;
	}
	public void setDateOfBirth(String dob) {
	this.dob = dob;
	}
	public String getEmail() {
	return email;
	}
	public void setEmail(String email) {
	this.email = email;
	}
	public String getEducation() {
	return education;
	}
	public void setEducation(String education) {
	this.education = education;
	}
	public String getCity() {
	return city;
	}
	public void setCity(String city) {
	this.city = city;
	}
	public String getState() {
	return state;
	}
	public void setState(String state) {
	this.state = state;
	}
	public String getWorkExp() {
	return workexp;
	}
	public void setWorkExp(String workexp) {
	this.workexp = workexp;
	}
	public String getCategory() {
	return category;
	}
	public void setCategory(String category) {
	this.category = category;
	}
	public String getAuthorization() {
	return authorization;
	}
	public void setAuthorization(String authorization) {
	this.authorization = authorization;
	}
	public String getAddress() {
	return address;
	}
	public void setAddress(String address) {
	this.address = address;
	}
	
	public void fetchValuesfromDB(int userid, String type) {
		if(type.equalsIgnoreCase("jobseeker"))
			fetchValuesfromDB(userid);
	}
	
	public void fetchValuesfromDB(int userid) {
		try {
			System.out.println("User ID " + userid);
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull", "root", "root");
			PreparedStatement ps = con.prepareStatement("select * from jobseeker where jskid=?");
			ps.setInt(1, userid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				setUserid(userid);
				setUsername(rs.getString("username"));
				setFirstname(rs.getString("firstname"));
				setLastname(rs.getString("lastname"));
				setEmail(rs.getString("email"));
				setContactNo(rs.getString("contactno"));
				setDateOfBirth(rs.getString("dob"));
				setEducation(rs.getString("education"));
				setCollege(rs.getString("college"));
				setAddress(rs.getString("address"));
				setCity(rs.getString("city"));
				setState(rs.getString("state"));
				setWorkExp(rs.getString("workexp"));
				setWorkexp(rs.getString("workexp"));
				setCategory(rs.getString("category"));
				setGender(rs.getString("gender"));
				setSkills(rs.getString("skills"));
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
