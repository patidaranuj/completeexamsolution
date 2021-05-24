

<!DOCTYPE html>
<html lang="">
<!-- To declare your language - read more here: https://www.w3.org/International/questions/qa-html-language-declarations -->
<head>
<title>MEDI-CAPS</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top">
<%@include file="db.jsp" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%
request.getSession();
String studentid = (String)session.getAttribute("studentid");
%>

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row0">
  <div id="topbar" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <div class="fl_left">
      <ul class="nospace">
        <li><a href="studenthome.jsp"><i class="fas fa-home fa-lg"></i></a></li>
      </ul>
    </div>
    <div class="fl_right">
      <ul class="nospace">
        
        <li><img src="images/demo/avatar.png" style="height:20px"> <%=studentid %></li>
      	 <li> <a href="studentlogout.jsp">logout</a></li>
      </ul>
       
    </div>
    <!-- ################################################################################################ -->
  </div>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row1">
  <header id="header" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <div id="logo" class="one_half first">
      <h1 class="logoname"><span>Medi-Caps University </span>Exam Portal</h1>
    </div>
  	<div style="float:right">
    <img  src="images/demo/gallery/logo.jpeg" style="height:100px" >
    </div>
    <!-- ################################################################################################ -->
  </header>
  <nav id="mainav" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <ul class="clear">
      <li class="active"><a href="studenthome.jsp">Home</a></li>
      <li><a  href="Todayexam.jsp">click to see todays exam</a>
        
      </li>
      <li><a  href="Result.jsp">click to see result</a>
       
          
      </li>
      <% 
	String query="select * from visible";
	Statement st=con.createStatement();
	ResultSet result=st.executeQuery(query);
	if(result.next())
	{
		String registration=result.getString("visibility");
		if(registration.equals("yes"))
		{
			%>

		 <li><a href="Registration.jsp">click to here to register</a></li>
     <% 			
		}
		result.next();
		String slip=result.getString("visibility");
		if(slip.equals("yes"))
		{
			%>

<li><a href="#">Get Registration Slip</a></li>

	<% 				
		}
	}
	%>
    </ul>
    <!-- ################################################################################################ -->
  </nav>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
	<div style="width:100%;
	background-color:cyan;
	float:left;
	padding-top:50px;" > 
 <div class="tabledisplay">
 	<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page errorPage="err.jsp" %>


<%

Class.forName("com.mysql.jdbc.Driver");
Connection connect=DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal","root","patidar");
String qr="select * from paper ";
Statement ps=connect.createStatement();
ResultSet rs=ps.executeQuery(qr);
%>
<table border="1">
<tr><th>Exam</th><th>Sub</th><th>Code</th><th>Duration</th><th>Maxmarks</th><th>Status</th></tr>	
<%	
if(rs.next())
{
	do{
		String exam=rs.getString("exam");
		String sub=rs.getString("sub");
		String code=rs.getString("code");
		String duration=rs.getString("duration");
		String maxmarks=rs.getString("maxmarks");
		if(rs.getString("visible").equals("Yes"))
		{
			String q="select * from "+sub+"_"+code+" where studentid=?";
			PreparedStatement pr=con.prepareStatement(q);
			pr.setString(1,studentid);
			ResultSet r=pr.executeQuery();
			if(r.next())
			{
				String qes="select * from "+code+"_"+exam+"_response where studentid=?";
				PreparedStatement pes=con.prepareStatement(qes);
				pes.setString(1,studentid);
				ResultSet res=pes.executeQuery();
			%>			
				<tr>
				<td><%=exam%></td>
				<td><%=sub%></td>
				<td><%=code%></td>
				<td><%=duration%></td>
				<td><%=maxmarks%></td>
			<%
				if(res.next())
				{
	%>
					<td>paper done</td>
	<% 
				}
			else{
	%>
				<td><a href="attempt.jsp?code=<%=code%>&subname=<%=sub%>&exam=<%=exam%>">Attempt</a></td>
	<%			}
	%></tr><%
			}
		}
	}while(rs.next());
%></table>	
<% 			
}
else
{
%>no data found
<%
}
 %>
 	
 </div>
 </div>


<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
