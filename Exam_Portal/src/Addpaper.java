

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class Addpaper
 */
@WebServlet("/Addpaper")
public class Addpaper extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addpaper() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			PrintWriter out =response.getWriter();
			response.setContentType("text/HTML");
			String exam=request.getParameter("exam");
			String sub=request.getParameter("sub");
			String code=request.getParameter("code");
			String classsec=request.getParameter("classsec");
			String duration=request.getParameter("duration");
			String maxmarks=request.getParameter("maxmarks");
			String total=request.getParameter("total");
			String visible=request.getParameter("visible");
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal","root","patidar");
				String qr ="insert into paper values(?,?,?,?,?,?,?,?)";
				PreparedStatement ps=con.prepareStatement(qr);
				ps.setString(1,exam);
				ps.setString(2,sub);
				ps.setString(3,code);
				ps.setString(4, classsec);
				ps.setString(5,duration);
				ps.setString(6,maxmarks);
				ps.setString(7,total);
				ps.setString(8,visible);
				int i=ps.executeUpdate();
				
				if(i>0)
				{
					RequestDispatcher rd=request.getRequestDispatcher("Questiontable.jsp");
					rd.include(request, response);
				}
				else
				{
					out.println("can not add paper at moment");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
	}

}
