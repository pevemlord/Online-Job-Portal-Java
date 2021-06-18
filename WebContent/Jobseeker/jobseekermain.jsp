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
	String username = session.getAttribute("username").toString();
	int userid = AuthDao.getUserId(username, "jobseeker");
	String boxStyle = "";
	String userToApplyStyle = "margin: 5%; width: 90%; height: 20%; border: solid 1px grey; padding: 10px;";
	String userUnderReviewStyle = "margin: 5%; width: 90%; height: 20%; border: solid 1px grey; padding: 10px; background-color: #fdfd8a;";
	String userSelectedStyle = "margin: 5%; width: 90%; height: 20%; border: solid 1px grey; padding: 10px; background-color: #88fd96;";
	String userRejectedStyle = "margin: 5%; width: 90%; height: 20%; border: solid 1px grey; padding: 10px; background-color: #fd8888;";
	CompanyDetails companydetails = new CompanyDetails();
	JobDetails jobdetails = new JobDetails();
	UserBean userdetails = new UserBean();
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull", "root", "root");
	PreparedStatement ps = con
			.prepareStatement("select * from activity where activityuserid=? order by activityid desc");
	ps.setInt(1, Integer.parseInt(session.getAttribute("userid").toString()));
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
				<li><a href="" onclick="window.load()">Home</a></li>
				<li><a href="searchjob.jsp">Search Jobs</a></li>
				<li><a href="MyProfile.jsp">My Profile</a></li>
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

			<%
				while (rs.next()) {
					jobdetails.fetchValuesfromDB(rs.getInt("activityjobid"));
					companydetails.fetchingComanyDetailsThroughJobID(rs.getInt("activityjobid"));
			%>
			<%
				if (rs.getString("activityowner").equalsIgnoreCase("employer")) {
			%>

			<a href=<%=companydetails.getCompanyLink()%>>

				<div class="row"
					style="margin: 5%; width: 90%; height: 20%; border: solid 1px grey; padding: 10px;">
					<div class="form-group col-md-12">
						<label class="col-md-5 control-lable" for="Jobprofile"><h3><%=rs.getString("jobprofile")%></h3></label>
						<label class="col-md-5 control-lable" for="Job-Company-Name"><h3>
								Employer:
								<%=companydetails.getCompanyName()%></h3></label>
						<div class="form-actions floatRight">
							<form method="get" action="../ApplyforJob">
								<input type="hidden" name="userid" value=<%=userid%>>
								<input type="hidden" name="jobid" value=<%=rs.getInt("jobid")%>>
								<input type="hidden" name="empid"
									value=<%=companydetails.getCompanyID()%>> <input
									type="submit" class="btn btn-primary btn-sm" value="Apply">
							</form>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="Salary"><h4>
									Salary:
									<%=rs.getString("salaryexpected")%></h4></label> <label
								class="col-md-3 control-lable" for="Experience"><h4>
									Experience:
									<%=rs.getString("workexperience")%></h4></label> <label
								class="col-md-3 control-lable" for="Job-Type"><h4>
									Type:
									<%=rs.getString("jobtype")%></h4></label> <label
								class="col-md-3 control-lable" for="Job Opening"><h4>
									Openings:
									<%=rs.getString("jobopening")%></h4></label>
						</div>

						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="Notice-Period"><h5>
									Notice Period:
									<%=rs.getString("noticeperiod")%></h5></label> <label
								class="col-md-3 control-lable" for="Location">
								<h5>
									Location:
									<%=rs.getString("location")%></h5>
							</label> <label class="col-md-3 control-lable" for="State"><h5>
									State:
									<%=rs.getString("state")%></h5></label>
						</div>

						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable"
								for="Company-Contact-Number"><h5>
									Contact No:
									<%=companydetails.getCompanyContactNo()%></h5></label> <label
								class="col-md-3 control-lable" for="Company-EmailID">
								<h5><%=companydetails.getCompanyEmailID()%></h5>
							</label> <label class="col-md-3 control-lable" for="Company-Address"><h5><%=companydetails.getCompanyAddress()%></h5></label>
						</div>
					</div>
				</div>
			</a>

			<%
				} else {
						if (jobdetails.getJobStatus().equalsIgnoreCase("apply"))
							boxStyle = userToApplyStyle;
						else if (jobdetails.getJobStatus().equalsIgnoreCase("selected"))
							boxStyle = userSelectedStyle;
						else if (jobdetails.getJobStatus().equalsIgnoreCase("review"))
							boxStyle = userUnderReviewStyle;
						else if (jobdetails.getJobStatus().equalsIgnoreCase("reject"))
							boxStyle = userRejectedStyle;
						else
							boxStyle = userToApplyStyle;
			%>

			<div class="row" style="<%=boxStyle%>">
				<div class="form-group col-md-12">
					<label class="col-md-5 control-lable" for="Jobprofile"><h3><%=jobdetails.getJobProfile()%>
							<%=jobdetails.getJobStatus()%></h3></label> <label
						class="col-md-5 control-lable" for="Job-Company-Name"><h3>
							Employer:
							<%=companydetails.getCompanyName()%></h3></label>
					<%
						if (jobdetails.getJobStatus().equalsIgnoreCase("apply")) {
					%>
					<div class="form-actions floatRight">
						<form method="get" action="../ApplyforJob">
							<input type="hidden" name="userid" value=<%=userid%>> <input
								type="hidden" name="jobid" value=<%=rs.getInt("jobid")%>>
							<input type="submit" class="btn btn-primary btn-sm" value="Apply">
						</form>
					</div>
					<%
						}
					%>
				</div>
				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" for="Salary"><h4>
								Salary:
								<%=jobdetails.getJobSalary()%></h4></label> <label
							class="col-md-3 control-lable" for="Experience"><h4>
								Experience:
								<%=jobdetails.getJobExperience()%></h4></label> <label
							class="col-md-3 control-lable" for="Job-Type"><h4>
								Type:
								<%=jobdetails.getJobType()%></h4></label> <label
							class="col-md-3 control-lable" for="Job Opening"><h4>
								Openings:
								<%=jobdetails.getJobOpening()%></h4></label>
					</div>

					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" for="Notice-Period"><h5>
								Notice Period:
								<%=jobdetails.getJobNoticePeriod()%></h5></label> <label
							class="col-md-3 control-lable" for="Location">
							<h5>
								Location:
								<%=jobdetails.getJobLocation()%></h5>
						</label> <label class="col-md-3 control-lable" for="State"><h5>
								State:
								<%=jobdetails.getJobState()%></h5></label>
					</div>

					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" for="Company-Contact-Number"><h5>
								Contact No:
								<%=companydetails.getCompanyContactNo()%></h5></label> <label
							class="col-md-3 control-lable" for="Company-EmailID">
							<h5><%=companydetails.getCompanyEmailID()%></h5>
						</label> <label class="col-md-3 control-lable" for="Company-Address"><h5><%=companydetails.getCompanyAddress()%></h5></label>
					</div>
				</div>
			</div>



			<%
				}
			%>
			<%
				}
			%>

		</div>
	</div>
	<div class="footer">
		<div class="container">
			<div class="col-md-3 grid_3">
				<h4>Navigation</h4>
				<ul class="f_list f_list1">
					<li><a href="#">Home</a></li>
					<li><a href="#">Login</a></li>
					<li><a href="#">Register</a></li>
					<li><a href="#">Jobseeker</a></li>
					<li><a href="#">Employer</a></li>
				</ul>
				<ul class="f_list">
					<li><a href="#">About Us</a></li>
					<li><a href="#">Contact Us</a></li>
					<li><a href="#">Features</a></li>
					<li><a href="#">Services</a></li>
					<li><a href="#">Terms of use</a></li>
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
				<p>Copyright © 2018 Job Portal. All Rights Reserved.</p>
			</div>
		</div>
	</div>
</body>
</html>
