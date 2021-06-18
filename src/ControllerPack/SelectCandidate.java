package ControllerPack;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ModelPack.JobResult;

/**
 * Servlet implementation class SelectCandidate
 */
@WebServlet("/SelectCandidate")
public class SelectCandidate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectCandidate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		int jskid = Integer.parseInt(request.getParameter("userid"));
		int jobid = Integer.parseInt(request.getParameter("jobid"));
		int empid = Integer.parseInt(request.getParameter("empid"));
		JobResult rs = new JobResult();
		String url = "";
		boolean result = rs.selectCandidate(jobid, jskid, empid);
		System.out.println(result);
		if (result) {
			url = "Employer/employermain.jsp";
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Candidate is Selected!')");
			out.println("location='" + url + "';");
			out.println("</script>");
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.include(request, response);
		} else {
			url = "Employer/employermain.jsp";
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Error while Selecting!')");
			out.println("location='" + url + "';");
			out.println("</script>");
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.include(request, response);
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
