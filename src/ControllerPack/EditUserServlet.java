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

/**
 * Servlet implementation class EditUserServlet
 */
@WebServlet("/EditUserServlet")
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        int id = Integer.parseInt(request.getParameter("userid"));
        String type=request.getParameter("type");
        
        boolean result = false;
        if(type.equalsIgnoreCase("jobseeker")){
            String fname=request.getParameter("firstname");
            String lname=request.getParameter("lastname");
            String contact=request.getParameter("contactno");
            String gender=request.getParameter("gender");
            String dob=request.getParameter("dob");
            String email=request.getParameter("email");
            String education=request.getParameter("education");
            String college=request.getParameter("college");
            String address=request.getParameter("address");
            String city=request.getParameter("city");
            String state=request.getParameter("state");
            String workexp=request.getParameter("workexp");
            String category=request.getParameter("category");
            String skills=request.getParameter("skills");
        	result = AdminDao.updateJobseeker(fname,lname,contact,gender,dob,email,education,college,address,city,state,workexp,category,skills,id);
        	if(result){		
    			out.println("<script type=\"text/javascript\">");
    	        out.println("alert('Updated Successfully!')"); 
    	        out.println("location='Admin/alljobseekers.jsp';");
    	        out.println("</script>");
    			RequestDispatcher rd=request.getRequestDispatcher("Admin/alljobseekers.jsp");  
    	        rd.include(request,response);
        	}else{
    			out.println("<script type=\"text/javascript\">");
    	        out.println("alert('Error while updating!')"); 
    	        out.println("location='Admin/alljobseekers.jsp';");
    	        out.println("</script>");
    		RequestDispatcher rd=request.getRequestDispatcher("Admin/alljobseekers.jsp");  
            rd.include(request,response);
    		}
        }else {
        	String cmpname=request.getParameter("Empname");
            String email=request.getParameter("Eemail");
            String contactno=request.getParameter("econtactno");
            String link=request.getParameter("link");
            String address=request.getParameter("address");
            String city=request.getParameter("city");
            String state=request.getParameter("state");
            String category=request.getParameter("category");
            String about=request.getParameter("about");
        	result = AdminDao.updateEmployer(cmpname,email,contactno,link,address,city,state,category,about,id);
        	if(result){		
    			out.println("<script type=\"text/javascript\">");
    	        out.println("alert('Updated Successfully!')"); 
    	        out.println("location='Admin/allemployers.jsp';");
    	        out.println("</script>");
    			RequestDispatcher rd=request.getRequestDispatcher("Admin/allemployers.jsp");  
    	        rd.include(request,response);
    	
    		}else{
    			out.println("<script type=\"text/javascript\">");
    	        out.println("alert('Error while updating!')"); 
    	        out.println("location='Admin/allemployers.jsp';");
    	        out.println("</script>");
    		RequestDispatcher rd=request.getRequestDispatcher("Admin/allemployers.jsp");  
            rd.include(request,response);
    		}
        } 
	}

}
