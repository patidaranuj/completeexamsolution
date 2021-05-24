<%@include file="db.jsp" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page errorPage="err.jsp" %>
<%
	String st=request.getParameter("stream");
	String qr="select * from student where stream=? order by studentid";
	PreparedStatement stat=con.prepareStatement(qr);
	stat.setString(1,st);
	ResultSet rs=stat.executeQuery();
	if(rs.next())
	{
		%>
		<div style="height:80px;
	width:100%;
	background-color:cyan;
	margin:0px ">
	<h3 align="center" style="padding-top:30">Medi-Caps University Student View Section</h3>
	</div>
		<table border=1 style="width:800px;
		margin-left:250px;
		margin-top:30px">
		<tr><th>Student id</th><th>Class</th><th>Stream</th><th>Semester</th></tr>
		<%
	do{
		String studentid=rs.getString("studentid");
		String clas=rs.getString("class");
		String sem=rs.getString("sem");
		
		%>
		<tr><td><%=studentid %></td><td><%=clas %></td><td><%=st %></td><td><%=sem %></td></tr>
	<%
	}while(rs.next());
		%></table>
		<%
	}

%>