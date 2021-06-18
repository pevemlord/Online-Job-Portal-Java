package ControllerPack;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ModelPack.AdminDao;
import ModelPack.AuthDao;

/**
 * Servlet implementation class updateCompanyProfile
 */
@WebServlet("/updateCompanyProfile")
public class updateCompanyProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateCompanyProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        //System.out.println(request.getParameter("userid"));
        //System.out.println(AuthDao.getUserId(request.getParameter("userid"), "employer"));
        String updater = request.getParameter("updater");
        int id = 0;
        if(updater.equalsIgnoreCase("admin"))
        	id = Integer.parseInt(request.getParameter("userid"));
        else
        	id = AuthDao.getUserId(request.getParameter("userid"), "employer");        
        String username = request.getParameter("cmpName");
        String link = request.getParameter("companywebsite");
        String about = request.getParameter("AboutCompany");
        String emailEmp = request.getParameter("emailEmp");
        String contactEmp = request.getParameter("contactEmp");
        String OrganizationAddress = request.getParameter("OrganizationAddress");
        String cityEmp = request.getParameter("cityEmp");
        String stateEmp = request.getParameter("stateEmp");
        String categoryEmp = request.getParameter("categoryEmp");
        System.out.println("Employer ID : "+ id);
        String url = "";
        boolean result = AdminDao.updateEmployer(username, emailEmp, contactEmp, link, OrganizationAddress, cityEmp, stateEmp, categoryEmp, about, id);
       try { if(result){		
    	   if(updater.equalsIgnoreCase("admin"))
    		   url = "Admin/adminmain.jsp";
    	   else
    		   url = "Employer/employermain.jsp";
			out.println("<script type=\"text/javascript\">");
	        out.println("alert('Updated Successfully!')"); 
	        out.println("location='"+ url + "';");
	        out.println("</script>");
			RequestDispatcher rd=request.getRequestDispatcher(url);  
	        rd.include(request,response);
    	}else{
    		if(updater.equalsIgnoreCase("admin"))
     		   url = "Admin/adminmain.jsp";
     	   else
     		   url = "Employer/employermain.jsp";
 			out.println("<script type=\"text/javascript\">");
 	        out.println("alert('Updated Successfully!')"); 
 	        out.println("location='"+ url + "';");
 	        out.println("</script>");
 			RequestDispatcher rd=request.getRequestDispatcher(url);  
 	        rd.include(request,response);
		}
       }catch(Exception e) {
			e.printStackTrace();
			if(updater.equalsIgnoreCase("admin"))
	    		   url = "Admin/adminmain.jsp";
	    	   else
	    		   url = "Employer/employermain.jsp";
				out.println("<script type=\"text/javascript\">");
		        out.println("alert('Updated Successfully!')"); 
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
