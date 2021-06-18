<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="ModelPack.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	response.setHeader("Cache-Control",
			"no-store, no-cache, must-revalidate, max-age=0, post-check=0, pre-check=0");
	response.setHeader("Pragma", "no-cache");
%>
<%
	try {
		if ((session.getAttribute("username")).toString() == null) {
			response.sendRedirect("adminlogin.jsp");
		}
	} catch (Exception e) {
		response.sendRedirect("adminlogin.jsp");
	}
%>
<%
	String boxStyle="";
	String userToApplyStyle = "margin: 5%; width: 90%; height: 20%; border: solid 1px grey; padding: 10px;";
	String userUnderReviewStyle = "margin: 5%; width: 90%; height: 20%; border: solid 1px grey; padding: 10px; background-color: #fdfd8a;";
	String userSelectedStyle = "margin: 5%; width: 90%; height: 20%; border: solid 1px grey; padding: 10px; background-color: #88fd96;";
	String userRejectedStyle = "margin: 5%; width: 90%; height: 20%; border: solid 1px grey; padding: 10px; background-color: #fd8888;";
	String username = session.getAttribute("username").toString();
	int userid = AuthDao.getUserId(username, "jobseeker");
	CompanyDetails companydetails = new CompanyDetails();
	JobDetails jobdetails = new JobDetails();
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull", "root", "root");
	PreparedStatement ps = con.prepareStatement("select * from jobresult where jskid=? order by jobid desc");
	ps.setInt(1, userid);
	ResultSet rs = ps.executeQuery();
%>
<html>
<head>
<title>Jobseeker Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<link href="../css/bootstrap-3.1.1.min.css" rel='stylesheet'
	type='text/css' />
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<link href="../css/style.css" rel='stylesheet' type='text/css' />
<link
	href='//fonts.googleapis.com/css?family=Roboto:100,200,300,400,500,600,700,800,900'
	rel='stylesheet' type='text/css'>
<link href="../css/font-awesome.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-default" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="../index.jsp"><img
				src="../images/4.png" width="160" height="70" alt="" /></a>
		</div>
		<!--/.navbar-header-->
		<div class="navbar-collapse collapse"
			id="bs-example-navbar-collapse-1" style="height: 1px;">
			<ul class="nav navbar-nav">
				<li><a href="jobseekermain.jsp">Home</a></li>
				<li><a href="searchjob.jsp">Search Jobs</a></li>
				<li><a href="" onclick="document.location.reload()">My
						Profile</a></li>
				<li><a href="updateResume.jsp">Update Resume</a></li>
				<li><a href="../LogoutServlet">Logout</a></li>
			</ul>
		</div>
		<div class="clearfix"></div>
	</div>
	<!--/.navbar-collapse--> </nav>
	<div class="banner_1">
		<div class="container">
			<div id="search_wrapper1">
				<div id="search_form" class="clearfix"></div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="single">
			<div class="form-container">
				<h2>My Profile</h2>

				<%
					while (rs.next()) {
						companydetails.fetchingComanyDetailsThroughJobID(rs.getInt("jobid"));
						jobdetails.fetchValuesfromDB(rs.getInt("jobid"));
						if(rs.getString("jobstatus").equalsIgnoreCase("apply"))
							boxStyle= userToApplyStyle;
						else if(rs.getString("jobstatus").equalsIgnoreCase("selected"))
							boxStyle = userSelectedStyle;
						else if(rs.getString("jobstatus").equalsIgnoreCase("review"))
							boxStyle = userUnderReviewStyle;
						else
							boxStyle = userRejectedStyle;
				%>
				
				
				<div class="row" style="<%=boxStyle%>">
					<div class="form-group col-md-12">
						<label class="col-md-5 control-lable" for="Jobprofile"><h3><%= jobdetails.getJobProfile() %></h3></label>
						<label class="col-md-5 control-lable" for="Job-Company-Name"><h3>Employer: <%= companydetails.getCompanyName()%></h3></label>
						<div class="form-actions floatRight">
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="Salary"><h4>Salary: <%= jobdetails.getJobSalary()%></h4></label>
							<label class="col-md-3 control-lable" for="Experience"><h4>Experience: <%= jobdetails.getJobExperience() %></h4></label>
							<label class="col-md-3 control-lable" for="Job-Type"><h4>Type: <%= jobdetails.getJobType()%></h4></label>
							<label class="col-md-3 control-lable" for="Job Opening"><h4>Openings: <%= jobdetails.getJobOpening() %></h4></label>
						</div>

						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable"
								for="Notice-Period"><h5>Notice Period: <%= jobdetails.getJobNoticePeriod() %></h5></label> <label
								class="col-md-3 control-lable" for="Location">
								<h5>Location: <%= jobdetails.getJobLocation() %></h5></label> <label class="col-md-3 control-lable"
								for="State"><h5>State: <%= jobdetails.getJobState()%></h5></label>
						</div>
						
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable"
								for="Company-Contact-Number"><h5>Contact No: <%= companydetails.getCompanyContactNo()%></h5></label> <label
								class="col-md-3 control-lable" for="Company-EmailID">
								<h5><%= companydetails.getCompanyEmailID()%></h5></label> <label class="col-md-3 control-lable"
								for="Company-Address"><h5><%= companydetails.getCompanyAddress() %></h5></label>
						</div>
					</div>
				</div>




				<%
					}
				%>

			</div>
		</div>
	</div>
	<div class="footer">
		<div class="container">
			<div class="col-md-3 grid_3">
				<h4>Navigation</h4>
				<ul class="f_list f_list1">
					<li><a href="../index.jsp">Home</a></li>
					<li><a href="../login.jsp">Login</a></li>
					<li><a href="../register.jsp">Register</a></li>
					<li><a href="../login.jsp">Jobseeker</a></li>
					<li><a href="../login.jsp">Employer</a></li>
				</ul>
				<ul class="f_list">
					<li><a href="../about.jsp">About Us</a></li>
					<li><a href="../contact.jsp">Contact Us</a></li>
					<li><a href="../features.jsp">Features</a></li>
					<li><a href="../services.jsp">Services</a></li>
					<li><a href="../terms.jsp">Terms of use</a></li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="col-md-3 grid_3">
				<h4>Twitter</h4>
				<div class="footer-list">
					<ul>
						<li><i class="fa fa-twitter tw1"> </i>
							<p>
								<span class="yellow"><a href="#">consectetuer</a></span>
								adipiscing elit web design
							</p></li>
						<li><i class="fa fa-twitter tw1"> </i>
							<p>
								<span class="yellow"><a href="#">consectetuer</a></span>
								adipiscing elit web design
							</p></li>
						<li><i class="fa fa-twitter tw1"> </i>
							<p>
								<span class="yellow"><a href="#">consectetuer</a></span>
								adipiscing elit web design
							</p></li>
					</ul>
				</div>
			</div>
			<div class="col-md-3 grid_3">
				<h4>Who We Are!</h4>
				<p style="text-align: justify">We have a trusted relation with
					the employer and the jobseekers and we believe in maintaining that
					trust and relationship throughout. Our main aim is satisfied
					customers, be it employers or jobseekers.</p>
			</div>
			<div class="col-md-3 grid_3">
				<p style="margin-bottom: 2em">
					<img src="../images/logo.png" width="160" height="70" alt="" />
				</p>
				<h5>Not Registered? Register Now</h5>
				<p>
					<button type="button" class="btn red">Register Now!</button>
				</p>
			</div>
			<div class="clearfix"></div>
			<div class="copy">
				<p>Copyright © 2017 Job Portal. All Rights Reserved.</p>
			</div>
		</div>
	</div>
</body>
</html>
