

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class Studentlogin
 */
@WebServlet("/Studentlogin")
public class Studentlogin extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Studentlogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		response.setContentType("text/HTML");
		String studentid=request.getParameter("studentid");
		String pass=request.getParameter("pass");
		//out.println(studentid);
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal","root","patidar");
			String qr="select * from Student where studentid=? and pass=? ";
			PreparedStatement ps = con.prepareStatement(qr);
			ps.setString(1, studentid);
			ps.setString(2, pass);
			ResultSet rs=ps.executeQuery();
			//out.println("query executed");
			HttpSession session =request.getSession();
			session.setAttribute("studentid",studentid);
			if(rs.next())
			{
				RequestDispatcher rd=request.getRequestDispatcher("studenthome.jsp");
				rd.include(request, response);
				//out.println("welcome to your dashboard");
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("studentlogin.html");
				rd.include(request, response);
				out.println("invalid id");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
