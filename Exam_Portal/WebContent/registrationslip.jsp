<%@include file="db.jsp" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>

<div style="width:60%;margin:0 auto">
	<div style="border-left:2px solid black; height:800px" >
	<div style="border-right:2px solid black;height:800px ">
	<div style="border-top:2px solid black; ">
	
	

<%
	String studentid=(String)session.getAttribute("studentid");
	String query="select * from student where studentid=? ";
	PreparedStatement p=con.prepareStatement(query);
	p.setString(1,studentid);
	ResultSet result=p.executeQuery();
	result.next();
	String clas=result.getString("class");
	String stream=result.getString("stream");
	String studentname=result.getString("name");
	 String sem=result.getString("sem");
	%>
	
	<div style="float:left">
    <img  src="images/demo/gallery/logo.jpeg" style="height:70px;margin-left:200px" >
    </div><h1 align="left">Medi-Caps University</h1>
    	<h2 align="center">Registration Slip</h2>
	
	<hr>
	<div style="padding-left:50px;padding-top:30px">
	<font size=+1 >
	<br>
	<br>
	<b>Student name:-<%=studentname %></b><br>
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
	String qr="select * from sem_"+sem+"_registration where studentid=?";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1,studentid);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		%>
		<table border=1 style="width:90%; margin-left:35px;margin-top:20px">
		<tr><th style="height:50px">Subject</th><th style="height:50px">Code</th></tr>
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
					
							 %>
							 <tr><td style="height:40px"><%=name %></td><td style="height:40px"><%=code %></td></tr>
							 <% 
						
				}
			}
		}
		%>
		</table>
	<% 
	}
	%>
	</div>
	</div>
	</div>
	<div style="border-top:2px solid black; ">
	</div>
	</div>
	<form action="studenthome.jsp">
	<input style="float:right; width:50px; margin-left:200px" type="submit" name="back" value="back">
	</form>
	