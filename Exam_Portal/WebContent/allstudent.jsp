<head>
<title>MEDI-CAPS</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<%@include file="db.jsp" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page errorPage="err.jsp" %>
<%
	String qr="select * from student order by studentid";
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery(qr);
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
		String stream=rs.getString("stream");
		String sem=rs.getString("sem");
		%>
		<tr><td><%=studentid %></td><td><%=clas %></td><td><%=stream %></td><td><%=sem %></td></tr>
	<%
	}while(rs.next());
		%></table>
		<form action="adminhome.html">
		<input class="btn" type="submit" value="back" style="float:right">
		</form>
		
		<%
	}

%>