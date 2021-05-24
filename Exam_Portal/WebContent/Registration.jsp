

<!DOCTYPE html>
<html lang="">
<!-- To declare your language - read more here: https://www.w3.org/International/questions/qa-html-language-declarations -->
<head>
<title>MEDI-CAPS</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/paper.css" rel="stylesheet" type="text/css" media="all">
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
	<div style="height:600px;
	width:100%;
	background-color:cyan;
	float:left;
	padding-top:50px;" > 


 	<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page errorPage="err.jsp" %>


<%
	
	String q="select stream  from student where studentid=?";
	PreparedStatement ps=con.prepareStatement(q);
	ps.setString(1,studentid);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		String stream=rs.getString("stream");
		String qr="select * from course where stream=?";
		ps=con.prepareStatement(qr);
		ps.setString(1,stream);
		rs=ps.executeQuery();
		if(rs.next())
		{
		%><form action="Registration">
			<table border="1">
			
			<tr><th style="width:150px">Subject Name</th><th style="width:150px">Subject Code</th><th style="width:50px"></th></tr>
				
		<%
		int j=1;
		do{
			
			String subname=rs.getString("subname");
			String subcode=rs.getString("subcode");
		%>
			<tr>
			<td><%=subname%></td>
			<td><%=subcode%></td>
			<td><input type=checkbox name="sub" value="<%=subname%>_<%=subcode %>"></td>
			
			</tr>
		<%
		j=j+1;
		}while(rs.next());
		%>
		
		<% 
		}
		else{
			out.println("no data found");
		}
		con.close();
		%>
		
		</table>
		<input style="margin-left:600px" class="btn"  type="submit" name=submit>
		</form>
		<%
	}
	
%>
 	
 </div>



<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
