<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
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
			response.sendRedirect("adminmain.jsp");
		}
	} catch (Exception e) {
		response.sendRedirect("adminmain.jsp");
	}
%>

<%
int empid = Integer.parseInt((request.getParameter("userid")));
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull", "root", "root");
	PreparedStatement ps = con.prepareStatement("select * from employer where empid=?");
	ps.setInt(1, empid);
	ResultSet rs = ps.executeQuery();
	
%>
<html>
<head>
<title>Update Employer</title>
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
		
		<h2>Update Employer Details</h2>
		
		<%while(rs.next()){%>
				<form name="form" action="../updateCompanyProfile" method="post">
					
					<input type="hidden" name="userid" value=<%= empid%>>
					<input type="hidden" name="updater" value="admin">
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="cmpName">Organization
								Name</label>
							<div class="col-md-9">
								<input type="text" name="cmpName" id="cmpName"
									class="form-control input-sm" value="<%= rs.getString("cmpname") %>" readonly>
							</div>
						</div>
					</div>


					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="webstie">Website</label>
							<div class="col-md-9">
								<intput type="text" name="OrganizationLink" id="OrganizationLink"
									class="form-control input-sm" value=<%= rs.getString("email") %>>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="emailEmp">About
								Organization</label>
							<div class="col-md-9">
								<textarea name="AboutCompany" id="AboutCompany"
									class="form-control input-sm"><%= rs.getString("about") %></textarea>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="emailEmp">Organization
								Email</label>
							<div class="col-md-9">
								<input type="email" name="emailEmp" id="emailEmp"
									class="form-control input-sm" value=<%= rs.getString("email") %> />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="contactEmp">Contact
								Number</label>
							<div class="col-md-9">
								<input type="text" name="contactEmp" id="contactEmp"
									class="form-control input-sm"  value=<%= rs.getString("contactno") %> />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="OrganizationAddress">Organization
								Address</label>
							<div class="col-md-9">
								<input type="text" name="OrganizationAddress"
									id="OrganizationAddress" class="form-control input-sm" value=<%= rs.getString("address") %> />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="cityEmp">City</label>
							<div class="col-md-9">
								<input type="text" name="cityEmp" id="cityEmp"
									class="form-control input-sm" value=<%= rs.getString("city") %> />
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="stateEmp">State</label>
							<div class="col-md-9">
								<select name="stateEmp" id="stateEmp"
									class="form-control input-sm">
									<option value=<%= rs.getString("state") %>><%= rs.getString("state")%></option>
									<option value="Andhra Pradesh">Andhra Pradesh</option>
									<option value="Arunachal Pradesh">Arunachal Pradesh</option>
									<option value="Assam">Assam</option>
									<option value="Bihar">Bihar</option>
									<option value="Chandigarh">Chandigarh</option>
									<option value="Delhi">Delhi</option>
									<option value="Goa">Goa</option>
									<option value="Gujarat">Gujarat</option>
									<option value="Haryana">Haryana</option>
									<option value="Himachal Pardesh">Himachal Pardesh</option>
									<option value="Jammu & Kashmir">Jammu & Kashmir</option>
									<option value="Jharkhand">Jharkhand</option>
									<option value="Karnatka">Karnatka</option>
									<option value="Kerla">Kerla</option>
									<option value="MadhyaPardesh">MadhyaPardesh</option>
									<option value="Maharasthra">Maharasthra</option>
									<option value="Mainpur">Mainpur</option>
									<option value="Meghalaya">Meghalaya</option>
									<option value="Mizoram">Mizoram</option>
									<option value="Nagaland">Nagaland</option>
									<option value="Odisha">Odisha</option>
									<option value="Punjab">Punjab</option>
									<option value="Rajasthan">Rajasthan</option>
									<option value="Sikkim">Sikkim</option>
									<option value="Tamil Nadu">Tamil Nadu</option>
									<option value="Telangana">Telangana</option>
									<option value="Tripura">Tripura</option>
									<option value="Uttarakhand">Uttarakhand</option>
									<option value="Uttar Pardesh">Uttar Pardesh</option>
									<option value="West Bengal">West Bengal</option>
									<option value="Hyderbad">Hyderbad</option>
									<option value="Damn and Diu">Damn and Diu</option>
									<option value="Lakhdeep & Islands">Lakhdeep & Islands</option>
									<option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
									<option value="Pondicherry">Pondicherry</option>

								</select>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="categoryEmp">Category</label>
							<div class="col-md-9">
								<select name="categoryEmp" id="categoryEmp"
									class="form-control input-sm" value=<% rs.getString("category"); %>>
									<option value=<%= rs.getString("category") %>><%= rs.getString("category") %></option>
									<option value="Accounting / Auditing / Tax">Accounting
										/ Auditing / Tax</option>
									<option value="Administration / Secretary / Front Office">Administration
										/ Secretary / Front Office</option>
									<option value="Architecture / Civil Engineering">Architecture
										/ Civil Engineering</option>
									<option value="Art / Design / Creative / Fashion">Art
										/ Design / Creative / Fashion</option>
									<option value="Banking / Financial Services">Banking /
										Financial Services</option>
									<option value="Construction">Construction</option>
									<option value="Consulting / Strategy / Corporate Planning">Consulting
										/ Strategy / Corporate Planning</option>
									<option value="Content / Edition / Journalism">Content
										/ Edition / Journalism</option>
									<option
										value="Customer Service / Call Centre / Operations / Data Entry">Customer
										Service / Call Centre / Operations / Data Entry</option>
									<option value="Education / Teaching / Language">Education
										/ Teaching / Language</option>
									<option value="Engineering / R&D">Engineering / R&D</option>
									<option value="Executive Management">Executive
										Management</option>
									<option value="Freshers Jobs">Freshers Jobs</option>
									<option value="Healthcare / Medical / Pharmacy">Healthcare
										/ Medical / Pharmacy</option>
									<option value="Hotel / Restaurant / Catering">Hotel /
										Restaurant / Catering</option>
									<option value="HR / Recruitment">HR / Recruitment</option>
									<option value="Import-Export / Merchandising / Trading">Import-Export
										/ Merchandising / Trading</option>
									<option value="Insurance">Insurance</option>
									<option value="Internet Technologies / Web / E-Commerce">Internet
										Technologies / Web / E-Commerce</option>
									<option value="IT - Databases / Datawarehousing">IT -
										Databases / Datawarehousing</option>
									<option value="IT - ERP / CRM">IT - ERP / CRM</option>
									<option value="IT - Hardware / Telecom / Support">IT -
										Hardware / Telecom / Support</option>
									<option value="IT - Project Management">IT - Project
										Management</option>
									<option value="IT - Software Programming / Analysis">IT
										- Software Programming / Analysis</option>
									<option value="IT - Systems / Networking / Security">IT
										- Systems / Networking / Security</option>
									<option value="Legal / Law">Legal / Law</option>
									<option
										value="Logistics / Purchase / Supply Chain / Procurement">Logistics
										/ Purchase / Supply Chain / Procurement</option>
									<option
										value="Manufacturing / Packaging / Printing / Industrial Jobs">Manufacturing
										/ Packaging / Printing / Industrial Jobs</option>
									<option value="Marketing / Communication / Advertising / PR">Marketing
										/ Communication / Advertising / PR</option>
									<option value="Mechanical Engineering / Mechatronics">Mechanical
										Engineering / Mechatronics</option>
									<option value="Media / TV / Films / Production">Media
										/ TV / Films / Production</option>
									<option value="Pharma, Biotech and Chemical Industry">Pharma,
										Biotech and Chemical Industry</option>
									<option value="Project Management">Project Management</option>
									<option value="Quality / Testing / Process Control">Quality
										/ Testing / Process Control</option>
									<option value="Real Estate / Property">Real Estate /
										Property</option>
									<option value="Sales / Business Development">Sales /
										Business Development</option>
									<option value="Security Services / Guards">Security
										Services / Guards</option>
									<option value="Skilled Trade / Service / Installation / Repair">Skilled
										Trade / Service / Installation / Repair</option>
									<option value="Social Services / NGOs / Nonprofit">Social
										Services / NGOs / Nonprofit</option>
									<option value="Travel / Reservation / Airlines">Travel
										/ Reservation / Airlines</option>
									<option value="Others">Others</option>
								</select>
							</div>
						</div>
					</div>


					<div class="row">
						<div class="form-actions floatRight">
							<input type="submit" value="Update"
								class="btn btn-primary btn-sm">
						</div>
					</div>
				</form>
				<%} %>
		
		
		</div>
	</div>
	<div class="footer">
		<div class="container">
			<div class="col-md-3 grid_3">
				<h4>Navigation</h4>
				<ul class="f_list f_list1">
					<li><a href="index.jsp">Home</a></li>
					<li><a href="login.jsp">Login</a></li>
					<li><a href="register.jsp">Register</a></li>
					<li><a href="login.jsp">Jobseeker</a></li>
					<li><a href="login.jsp">Employer</a></li>
				</ul>
				<ul class="f_list">
					<li><a href="about.jsp">About Us</a></li>
					<li><a href="contact.jsp">Contact Us</a></li>
					<li><a href="features.jsp">Features</a></li>
					<li><a href="services.jsp">Services</a></li>
					<li><a href="terms.jsp">Terms of use</a></li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="col-md-3 grid_3">
				<h4>Benefits</h4>
				<div class="footer-list">
					<ul>
						<li><p>Wider Search Reach</p></li>
						<li><p>Fully Secured</p></li>
						<li><p>Easy to Apply</p></li>
						<li><p>Find the Right Job</p></li>
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
					<img src="images/11.jpg" width="160" height="70" alt="" />
				</p>
				<h5>Not Registered? Register Now</h5>
				<p>
					<button type="button" class="btn red"
						onclick="location.href='register.jsp'">Register Now!</button>
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