

import java.io.IOException;
import java.sql.Connection;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
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
		HttpSession session=request.getSession();
		String studentid=(String)session.getAttribute("studentid");
		
		String[] sub=request.getParameterValues("sub");
		int j=0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal","root","patidar");
			String q="select sem from student where studentid=?";
			PreparedStatement p=con.prepareStatement(q);
			p.setString(1,studentid);
			ResultSet rs=p.executeQuery();
			
			if(rs.next())
			{
				int sem=rs.getInt("sem");
				q="insert into sem_"+sem+"_registration(studentid) values(?)";
				
				PreparedStatement st =con.prepareStatement(q);
				st.setString(1,studentid);
				st.executeUpdate();
				
				for(int i=0;i<sub.length;i++)
				{
					String qr="insert into "+sub[i]+"(studentid) values(?)";
					PreparedStatement ps=con.prepareStatement(qr);
					ps.setString(1, studentid);
					j=ps.executeUpdate();
					
					int k=i+1;
					q="update sem_"+sem+"_registration set sub"+k+"=? where studentid=?";
					p=con.prepareStatement(q);
					p.setString(1, sub[i]);
					p.setString(2, studentid);
					p.executeUpdate();
					
				}
				for(int i=sub.length+1;i<=10;i++)
				{
					
					q="update sem_"+sem+"_registration set sub"+i+"=? where studentid=?";
					p=con.prepareStatement(q);
					p.setString(1, "null");
					p.setString(2, studentid);
					p.executeUpdate();
				}
				
				if(j>0)
				{
					RequestDispatcher rd=request.getRequestDispatcher("studenthome.jsp?studentid="+studentid);
					rd.include(request, response);
					out.println("<script>window.alert('registration successfull')</script>");
				}
				else
				{
					RequestDispatcher rd=request.getRequestDispatcher("studenthome.jsp");
					rd.include(request, response);
					out.println("<script>window.alert('registration not completed')</script>");
				}
			};
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
