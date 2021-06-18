package ControllerPack;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ModelPack.Activity;
import ModelPack.AuthDao;

/**
 * Servlet implementation class JobPosting
 */
@WebServlet("/JobPosting")
public class JobPosting extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobPosting() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        System.out.println(request.getParameter("username").toString());
        int id = AuthDao.getUserId(request.getParameter("username").toString(), "employer");
        System.out.println(id);
        String jobprofile =request.getParameter("JobTitle");
        String jobcategory=request.getParameter("categoryEmp");
        String jobtype = request.getParameter("jobtype");
        String jobopening=request.getParameter("NumberOfOpening");
        String workexp=request.getParameter("ExperienceReq");
        String salarexp=request.getParameter("SalaryExpected");
        String noticeper=request.getParameter("noticeperiod");
        String city=request.getParameter("location");
        String state=request.getParameter("stateEmp");
        String url="";
        boolean result = AuthDao.addNewJob(jobprofile, jobcategory, jobtype, jobopening, workexp, salarexp, noticeper, city, state, id);
        System.out.println(result);
        if(result){	
        	url = "Employer/employermain.jsp";
        	out.println("<script type=\"text/javascript\">");
	        out.println("alert('Updated Successfully!')"); 
	        out.println("location='"+ url + "';");
	        out.println("</script>");
			RequestDispatcher rd=request.getRequestDispatcher(url);  
	        rd.include(request,response);
    	}else{
    		url = "Employer/employermain.jsp";
    		out.println("<script type=\"text/javascript\">");
	        out.println("alert('Error while updating!')");
	        out.println("location='"+ url + "';");
	        out.println("</script>");
		RequestDispatcher rd=request.getRequestDispatcher(url);  
        rd.include(request,response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
