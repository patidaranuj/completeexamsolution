

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
 * Servlet implementation class Markanswer
 */
@WebServlet("/Markanswer")
public class Markanswer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Markanswer() {
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
		HttpSession session =request.getSession();
		String studentid = (String)session.getAttribute("studentid");
		String code=request.getParameter("code");
		String exam=request.getParameter("exam");
		String number=request.getParameter("number");
		String answer=request.getParameter("answer");
		String Answer=answer.replace('_',' ');
		String submit=request.getParameter("submit");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal","root","patidar");
			String qr="update "+code+"_"+exam+"_response set  _"+number+"=? where studentid=?";
			
			PreparedStatement st=con.prepareStatement(qr);
			st.setString(1,Answer);
			st.setString(2,studentid);
			int i=st.executeUpdate();
			
			if(i>0)
			{
				if(submit.equals("submit"))
				{
					
					RequestDispatcher rd=request.getRequestDispatcher("submit.jsp?code="+code+"&exam="+exam);
					rd.include(request, response);
				}
				else
				{
					
					int num=Integer.parseInt(number);
					num=num+1;
			
					String q="select * from paper where code=? and exam=?";
					
					PreparedStatement s=con.prepareStatement(q);
					s.setString(1,code);
					s.setString(2,exam);
					ResultSet rs=s.executeQuery();
					if(rs.next())
					{
						int total=rs.getInt("total");
						
						if(num>total)
						{
						num=1;
						}
					}	
					number=Integer.toString(num);
					RequestDispatcher rd=request.getRequestDispatcher("solve.jsp?code="+code+"&exam="+exam+"&number="+number);
					rd.include(request, response);
				}
			}
			else
			{
				out.println("answer can not be added");
			}
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
