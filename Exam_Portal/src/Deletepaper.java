

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
 * Servlet implementation class Deletepaper
 */
@WebServlet("/Deletepaper")
public class Deletepaper extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Deletepaper() {
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
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal","root","patidar");
			String qr="delete from paper where code=? and exam=?";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(1, code);
			ps.setString(2, exam);
			int i=ps.executeUpdate();
			qr="drop table "+code+"_"+exam;
			Statement st=con.createStatement();
			st.executeUpdate(qr);
			qr="drop table "+code+"_"+exam+"_response";
			st=con.createStatement();
			st.executeUpdate(qr);
			if(i>0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("deletepaper.jsp");
				rd.include(request, response);
				out.println("<script>window.alert('deleted succesfully')</script>");
			}
			else
			{
				out.println("some error occured");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}


