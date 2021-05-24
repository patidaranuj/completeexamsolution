

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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Submit
 */
@WebServlet("/Submit")
public class Submit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Submit() {
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
		//out.println("came on submit.java\n");
		String code=request.getParameter("code");
		HttpSession session =request.getSession();
		String studentid = (String)session.getAttribute("studentid");
		HttpSession papersession =request.getSession();
		String subname=(String)papersession.getAttribute("subname");
		String exam=(String)papersession.getAttribute("exam");
		String submit=request.getParameter("submit");
		int marks=0;
		if(submit.equals("submit"))
		{
			//out.println("********exam name"+exam+"**********");
			//out.println("entered in if");
			
			try {
				
				Class.forName("com.mysql.jdbc.Driver");
				Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal","root","patidar");
				String qr="select * from paper where code=? and exam=?";
				PreparedStatement ps = con.prepareStatement(qr);
				ps.setString(1, code);
				ps.setString(2, exam);
				ResultSet rs=ps.executeQuery();
				if(rs.next())
				{
					int noofques=Integer.parseInt(rs.getString("total"));
					int maxmarks=Integer.parseInt(rs.getString("maxmarks"));
					int onequesmark=maxmarks/noofques;
				//	out.println("no of question ="+noofques);
					qr="select * from "+code+"_"+exam;
					Statement st=con.createStatement();
					ResultSet r=st.executeQuery(qr);
					//out.println("got the teachers ans");
					String q="select * from "+code+"_"+exam+"_response where studentid=?";
					ps=con.prepareStatement(q);
					ps.setString(1, studentid);
					rs=ps.executeQuery();
					//out.println("got the student  ans");
					if(rs.next())
					{
						//out.println("starting check");
						for(int i=1;i<=noofques;i++)
						{
							if(r.next())
							{
								//out.println("********entered in the second if*******");
								String studentmark=rs.getString("_"+i);
								String teachermark=r.getString("answer");
								//out.println("student response"+studentmark);
								//out.println("teacher resposne ="+teachermark);
								if(studentmark.equals(teachermark))
								{
									
									marks=marks+onequesmark;
								}
							}
						}
					}
					
					q="update "+subname+"_"+code+" set "+exam+"=? where studentid=?";
					
					ps=con.prepareStatement(q);
					ps.setInt(1, marks);
					ps.setString(2, studentid);
					int j=ps.executeUpdate();
					if(j>0)
					{
						out.println("<script> window.alert('exam submited succesfully')</script>");
					}
					
				}
				
				
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			out.println("entered in submit section");
			
			RequestDispatcher rd=request.getRequestDispatcher("Todayexam.jsp?studentid="+studentid);
			rd.include(request, response);
		}
	}

}
