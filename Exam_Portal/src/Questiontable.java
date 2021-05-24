

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
//import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Questiontable
 */
@WebServlet("/Questiontable")
public class Questiontable extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Questiontable() {
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
		String code=request.getParameter("code");
		String exam=request.getParameter("exam");
		//String number=request.getParameter("number");

		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal","root","patidar");
			String qr="create table "+code+"_"+exam+"(number int(3),question varchar(200),a varchar(50),b varchar(50),c varchar(50),d varchar(50),answer varchar(50))";
			Statement s=con.createStatement();
			int i =s.executeUpdate(qr);
			String q="create table "+code+"_"+exam+"_response(studentid varchar(20))";
			s.executeUpdate(q);
			
			//ps.setString(1, code);
			//out.println("i="+i);
			if(i==0)
			{
				//out.println("value of j is "+j);
				RequestDispatcher rd=request.getRequestDispatcher("Addquestion.jsp?number=1");
				rd.include(request, response);
			}
			else
			{
				out.println("some error occured in table creation for question");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
