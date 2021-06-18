<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0, post-check=0, pre-check=0");
    response.setHeader("Pragma", "no-cache");
%>
<%
    try {
        if ((session.getAttribute("username")).toString() == null) {
            response.sendRedirect("../login.jsp");
        }
    } catch (Exception e) {
        response.sendRedirect("../login.jsp");
    }
%>
<html>
<head>
<title>Employer Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="../css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css' />
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<link href="../css/style.css" rel='stylesheet' type='text/css' />
<link href='//fonts.googleapis.com/css?family=Roboto:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<link href="../css/font-awesome.css" rel="stylesheet"> 
</head>
<body>
	<nav class="navbar navbar-default" role="navigation">
	<div class="container">
		<div class="navbar-header">
	        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
	        </button>
	        <a class="navbar-brand" href="index.jsp"><img src="../images/4.png" width="160" height="70" alt=""/></a>
	    </div>
		<!--/.navbar-header-->
		<div class="navbar-collapse collapse"
			id="bs-example-navbar-collapse-1" style="height: 1px;">
			<ul class="nav navbar-nav">
				<li><a href="employermain.jsp">Home</a></li>
				<li><a href="postjob.jsp">Post Jobs</a></li>
				<li><a href="companyprofile.jsp">Company Profile</a></li>
				<li><a href="" onclick="window.load()">Search Candidate</a></li>
				<li><a href="../LogoutServlet">Logout</a></li>
			</ul>
		</div>
		<div class="clearfix"></div>
	</div>
	<!--/.navbar-collapse--> </nav>
	<div class="banner_1">
		<div class="container">
			<div id="search_wrapper1">
				<div id="search_form" class="clearfix">
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="single">
			<div class="form-container">
				<h2>Search Suitable Candidate</h2>
				<form method="post" id="SearchingCandidate" action="CandidateList.jsp">
					
					
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="Candiateprofile">Profile</label>
							<div class="col-md-9">
								<input type="text" name="profile" id="profile" placeholder="Profile" class="form-control input-sm">
							</div>
						</div>
					</div>
					
					
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="Candiateprofile">Experience Required</label>
							<div class="col-md-9">
								<select name="ExperienceReq" id="ExperienceReq"
									class="form-control input-sm">
									<option value="">-- Select Experience --</option>
									<option value="Fresher">Fresher</option>
									<option value="1To2Years">1-2 Years</option>
									<option value="2To3Years">2-3 Years</option>
									<option value="3To5Years">3-5 Years</option>
									<option value="5To10Years">5-10 Years</option>
									<option value="10To15Years">10-15 Years</option>
									<option value="15To20Years">15-20 Years</option>
									<option value="20To30Years">20-30 Years</option>
									<option value="MoreThan30Years">More than 30 Years</option>
								</select>
							</div>
						</div>
					</div>
					
					
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="Candiateprofile">Salary</label>
							<div class="col-md-9">
								<select name="SalaryExpected" id="SalaryExpected"
									class="form-control input-sm">
									<option value="">-- Select Salary --</option>
									<option value="LessThan1Lakhs">less than 1 lakhs</option>
									<option value="1To2Lakhs">1-3 Lakhs</option>
									<option value="3To5Lakhs">3-5 Lakhs</option>
									<option value="5To8Lakhs">5-8 Lakhs</option>
									<option value="8ToLakhs">8-10 Lakhs</option>
									<option value="10To15Lakhs">10-15 Lakhs</option>
									<option value="15To20Lakhs">15-20 Lakhs</option>
									<option value="20To30Lakhs">20-30 Lakhs</option>
									<option value="30To50Lakhs">30-50 Lakhs</option>
									<option value="MoreThan50Lakhs">More than 50 Lakhs</option>
								</select>
							</div>
						</div>
					</div>
					
					
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="Candiateprofile">Preferred City</label>
							<div class="col-md-9">
								<input type="text" name="city" id="city" placeholder="Preferred City" class="form-control input-sm" />
							</div>
						</div>
					</div>
					
					
					<div class="row">
						<div class="form-actions floatRight">
							<input type="submit" value="Search"
								class="btn btn-primary btn-sm">
						</div>
					</div>
					
					
				</form>
			</div>
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
					<img src="images/logo.png" width="160" height="70" alt="" />
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
