<%@include file="db.jsp" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>

<div style="width:60%;margin:0 auto">
	<div style="border-left:2px solid black; height:800px" >
	<div style="border-right:2px solid black;height:800px ">
	<div style="border-top:2px solid black; ">
	
	

<% String sem=request.getParameter("sem");
	String studentid=(String)session.getAttribute("studentid");
	String query="select * from student where studentid=? ";
	PreparedStatement p=con.prepareStatement(query);
	p.setString(1,studentid);
	ResultSet result=p.executeQuery();
	result.next();
	String clas=result.getString("class");
	String stream=result.getString("stream");
	String studentname=result.getString("name");
	%>
	
	<div style="float:left">
    <img  src="images/demo/gallery/logo.jpeg" style="height:70px;margin-left:200px" >
    </div><h1 align="left">Medi-Caps University</h1>
    	<h2 align="center">Grade Card</h2>
	
	<hr>
	<div style="padding-left:50px;padding-top:30px">
	<font size=+1 >
	<br>
	<br>
	<b>Student name<%=studentname %></b><br>
	<b>Studentid :-<%=studentid %></b><br>
	<b>sem :- <%=sem %></b><br>
	<b>Class :-  <%=clas %></b><br>
	<b>Stream :-  <%=stream %></b><br>
	</font>
	<br>
	<br>
	</div>
	<hr>
	<hr>
	<%
	
		
	int totalgained=0;
	int totaloutof=0;
	String qr="select * from sem_"+sem+"_registration where studentid=?";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1,studentid);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		%>
		<table border=1 style="width:90%; margin-left:35px;margin-top:20px">
		<tr><th style="height:50px">Subject</th><th style="height:50px">Code</th><th style="height:50px">grade</th></tr>
		<%
		for(int i=1;i<=10;i++)
		{
			
			String sub=rs.getString("sub"+i);
			if(!sub.equals("null"))
			{
				String name="null",code="null";
				int iofus=sub.indexOf("_");//taking out index of underscore from subname_code
				if(iofus!=-1)
				{
					 name=sub.substring(0,iofus);
					code=sub.substring(iofus+1); 
					//out.println("name"+name);
					//out.println("code"+code);
					String q="select * from "+sub+" where studentid=?";
					PreparedStatement pes=con.prepareStatement(q);
					pes.setString(1,studentid);
					ResultSet r=pes.executeQuery();
					
					if(r.next())
					{
						int subtotal=0;
						int outof=100;
						totaloutof=totaloutof+100;
						int midsem1=Integer.parseInt(r.getString("midsem1"));
						int midsem2=Integer.parseInt(r.getString("midsem2"));
						int endsem=Integer.parseInt(r.getString("endsem"));
						int temp=midsem1+midsem2;
						 subtotal=temp+endsem;
						 totalgained=totalgained+subtotal;
						 double per=(subtotal*100)/outof;
						 if(per>=90 && per<100)
						 {
							 %>
							 <tr><td style="height:40px"><%=name %></td><td style="height:40px"><%=code %></td><td style="height:40px">O</td></tr>
							 <% 
						 }
						 if(per>=80 && per<90)
						 {
							 %>
							 <tr><td style="height:40px"><%=name %></td><td style="height:40px"><%=code %></td><td style="height:40px">A</td></tr>
							 <%
							 
						 }
						 if(per>=70 && per<80)
						 {
							 %>
							 <tr><td style="height:40px"><%=name %></td><td style="height:40px"><%=code %></td><td style="height:40px">B</td></tr>
							 <%
							 
						 }
						 else if(per>=60 && per<70)
						 {
							 %>
							 <tr><td style="height:40px"><%=name %></td><td style="height:40px"><%=code %></td><td style="height:40px">C</td></tr>
							 <%
						 }
						 if(per>=50 && per<60)
						 {
							 %>
							 <tr><td style="height:40px"><%=name %></td><td style="height:40px"><%=code %></td><td style="height:40px">D</td></tr>
							 <%
						 }
						 if(per>=40 && per<50)
						 {
							 %>
							 <tr><td><%=name %></td><td><%=code %></td><td>E</td></tr>
							 <%
						 }
						 if(per<40)
						 {
							 %>
							 <tr><td><%=name %></td><td><%=code %></td><td>F</td></tr>
							 <%
							 
						 }	
					}
				}
			}
		}
		%>
		</table>
		<%
		double totalper=(totalgained*100)/totaloutof;
		double sgpa=totalper/9.5;
		String s=String.format("%.2f",sgpa);
	%>
	<div style="float:right; margin-right:50px; margin-bottom:50px">
	<br>
	<br>
	<br>
	<br>
	<font size=+2>
	<b> CGPA</b><br>
	<%=s %>
	</font>
	</div>
	
	<% 
	}
	%>
	</div>
	</div>
	</div>
	<div style="border-top:2px solid black; ">
	</div>
	</div>
	<form action="Result.jsp">
	<input style="float:right; width:50px; margin-left:200px" type="submit" name="back" value="back">
	</form>
	