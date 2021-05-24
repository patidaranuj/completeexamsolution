

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Todayexam
 */
@WebServlet("/Todayexam")
public class Todayexam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Todayexam() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		response.setContentType("Text/HTML");
		HttpSession session =request.getSession();
		 String studentid = (String)session.getAttribute("studentid");
		 try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal","root","patidar");
			String qr="select class from student where studentid=?";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(1,studentid);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				out.println("value of class is "+rs.getString("class"));
				String q="select * from paper where classsec="+rs.getString("class");
				Statement st=con.createStatement();
				ResultSet r=st.executeQuery(q);
				if(r.next())
				{
					
				}
				out.println(q);
			}
			else
			{
				out.println("no data found");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		
	}

}
