

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class Addsub
 */
@WebServlet("/Addsub")
public class Addsub extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addsub() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String subname=request.getParameter("subname");
		String subcode=request.getParameter("subcode");
		String stream=request.getParameter("stream");
		PrintWriter out=response.getWriter();
		response.setContentType("text/HTML");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal","root","patidar");
			String qr="insert into course values(?,?,?)";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(1, subname);
			ps.setString(2, subcode);
			ps.setString(3, stream);
			int i=ps.executeUpdate();
			String q="create table "+subname+"_"+subcode+"(studentid varchar(20),midsem1 varchar(5),midsem2 varchar(5),endsem varchar(5))" ;
			Statement st =con.createStatement();
			st.executeUpdate(q);
			if(i>0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("Addsub.jsp");
				rd.include(request, response);
				out.println("<script> window.alert('subject added succesfuly');</script>");
			}
			else{
				RequestDispatcher rd=request.getRequestDispatcher("Addsub.jsp");
				rd.include(request, response);
				out.println("<script> window.alert('!!!!!!oops Something went Wrong!!!!!');</script>");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
