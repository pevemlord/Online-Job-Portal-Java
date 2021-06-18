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
<html>
<head>
<title>Admin Home</title>
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
				<li><a href="adminmain.jsp">View Requests</a></li>
				<li><a href="alljobseekers.jsp">List Jobseekers</a></li>
				<li><a href="allemployers.jsp">List Employers</a></li>
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

			<h2>New Requests:</h2>

			<%
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull", "root", "root");
				PreparedStatement ps = con.prepareStatement("select * from login where authorization=? order by userid desc");
				ps.setString(1, "Pending");
				ResultSet rs = ps.executeQuery();
				UserBean userdetails = new UserBean();
				CompanyDetails employerdetails = new CompanyDetails();
			%>

			<%
				while (rs.next()) {
					if(rs.getString(4).equalsIgnoreCase("jobseeker")){
						userdetails.fetchValuesfromDB(rs.getInt(1));%>
						<div class="row" style="margin:5%;width:90%;height:20%;border:solid 1px grey;padding:10px;">
					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" for="CandidateName"><h3><%= userdetails.getUsername() %></h3></label>
						<label class="col-md-3 control-lable" for="CandidateName"><h3><%= userdetails.getWorkExp()%></h3></label>
						<div class="form-actions floatRight">
						<a class="btn btn-primary btn-sm"
							href="../RequestServlet?userid=<%=rs.getInt(1)%>&type=<%=rs.getString(4)%>&status=Accepted">Accept</a>
						<a class="btn btn-primary btn-sm"
							href="../RequestServlet?userid=<%=rs.getInt(1)%>&type=<%=rs.getString(4)%>&status=Denied">Reject</a>
					</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="Name"><h4><%= userdetails.getFirstname() %> <%= userdetails.getLastname() %></h4></label>
							<label class="col-md-3 control-lable" for="Gender"><h4><%= userdetails.getGender() %></h4></label>
							<label class="col-md-3 control-lable" for="Date of Birth"><h4><%= userdetails.getDateOfBirth() %></h4></label>
						</div>

						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable"
								for="Candidate-Contact-Number"><h5><%= userdetails.getContactNo() %></h5></label> <label
								class="col-md-3 control-lable" for="Candidate-EmailID"><h5><%= userdetails.getEmail() %></h5></label> 
						</div>
						
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable"
								for="Candidate-Higher-Education"><h5><%= userdetails.getEducation() %></h5></label>
							<label class="col-md-3 control-lable"
								for="Candidate-Job-Category"><h5><h5><%= userdetails.getCategory()%></h5></h5></label>
						</div>
						
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable"
								for="Candidate-Address"><h5><%= userdetails.getAddress() %></h5></label> <label
								class="col-md-3 control-lable" for="Candidate-City"><h5><%= userdetails.getCity() %></h5></label> 
							<label class="col-md-3 control-lable"
								for="Candidate-State"><h5><%= userdetails.getState() %></h5></label>
						</div>
					</div>
				</div>			
					<%}else{
						employerdetails.fetchingCompanyDetails(rs.getInt(1));
					%>
						
						<div class="row"
				style="margin: 5%; width: 90%; height: 20%; border: solid 1px grey; padding: 10px;">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="Organizatino-Name"><h3><%=employerdetails.getCompanyName() %></h3></label>
					<div class="form-actions floatRight">
						<a class="btn btn-primary btn-sm"
							href="../RequestServlet?userid=<%=rs.getInt(1)%>&type=<%=rs.getString(4)%>&status=Accepted">Accept</a>
						<a class="btn btn-primary btn-sm"
							href="../RequestServlet?userid=<%=rs.getInt(1)%>&type=<%=rs.getString(4)%>&status=Denied">Reject</a>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" for="Organization-Email"><h4><%=employerdetails.getCompanyEmailID()%></h4></label>
						<label class="col-md-3 control-lable" for="Organization-ContactNo"><h4><%=employerdetails.getCompanyContactNo() %></h4></label>
						<label class="" for="Orgranization-Type"><h4><%=employerdetails.getCompanyCategory() %></h4></label>
					</div>

					<div class="form-group col-md-12">
						<label class="col control-lable"for="About Organization"><h5><%= employerdetails.getCompanyAbout()%></h5></label>
					</div>

					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable"
							for="Orgainzation-Address"><h5><%= employerdetails.getCompanyAddress()%></h5></label> <label
							class="col-md-3 control-lable" for="Organization-City"><h5><%= employerdetails.getCompanyCity()%></h5></label>
						<label class="col-md-3 control-lable"
							for="Organization-State"><h5><h5><%= employerdetails.getCompanyState() %></h5></label>
					</div>
				</div>
			</div>
					
					<%} %>
				<%}%>
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
				<p>Copyright © 2018 Job Portal. All Rights Reserved.</p>
			</div>
		</div>
	</div>
</body>
</html>
