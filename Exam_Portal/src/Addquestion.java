

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class Addquestion
 */
@WebServlet("/Addquestion")
public class Addquestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addquestion() {
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
		String number= request.getParameter("number");
		String question=request.getParameter("question");
		String a=request.getParameter("a");
		String b=request.getParameter("b");
		String c=request.getParameter("c");
		String d=request.getParameter("d");
		String answer=request.getParameter("answer");
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal","root","patidar");
			String qr="insert into "+code+"_"+exam+" values(?,?,?,?,?,?,?)";
			String q=qr;
			
			PreparedStatement ps=con.prepareStatement(q);
			ps.setString(1,number);
			ps.setString(2,question);
			ps.setString(3,a);
			ps.setString(4,b);
			ps.setString(5,c);
			ps.setString(6,d);
			ps.setString(7,answer);
			int i=ps.executeUpdate();
			
			if(i>0)
			{
				String qs="alter table "+code+"_"+exam+"_response add _"+number+" varchar(50)";
				Statement st=con.createStatement();
				i=st.executeUpdate(qs);
				
				int temp=Integer.parseInt(number);
				temp=temp+1;
				String z="select * from paper where code=? and exam=?";
				ps=con.prepareStatement(z);
				ps.setString(1, code);
				ps.setString(2, exam);
				ResultSet x=ps.executeQuery();
				if(x.next())
				{
					int total=x.getInt("total");
					if(temp<=total)
					{
						RequestDispatcher rd=request.getRequestDispatcher("Addquestion.jsp?number="+temp);
						rd.include(request, response);
					}
					else
					{
						out.println("<script>window.alert('paper added succesfully')</script>");
						RequestDispatcher rd=request.getRequestDispatcher("adminhome.html");
						rd.include(request, response);
					}
				}
				
			}
			else
			{
				out.println("can not add question");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		
		
	}

}
