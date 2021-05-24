

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
        
        <li><img src="images/demo/avatar.png" style="height:20px"> <%=studentid %>
        
        </li>
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
      <li class="active"><a href="studenthome.html">Home</a></li>
      <li><a  href="Todayexam.jsp">click to see todays exam</a>
        
      </li>
      <li><a class="drop" href="Result.jsp">click to see result</a>
        
      </li>
      <% 
	String qr="select * from visible";
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery(qr);
	if(rs.next())
	{
		String registration=rs.getString("visibility");
		if(registration.equals("yes"))
		{
			%>

		 <li><a href="Registration.jsp">click to here to register</a></li>
     <% 			
		}
		rs.next();
		String slip=rs.getString("visibility");
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
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page errorPage="err.jsp" %>

<%

String code=request.getParameter("code");
String subname=request.getParameter("subname");
String exam=request.getParameter("exam");
HttpSession papersession =request.getSession();
papersession.setAttribute("code",code);
papersession.setAttribute("exam",exam);
papersession.setAttribute("subname",subname);
Class.forName("com.mysql.jdbc.Driver");
Connection connect=DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal","root","patidar");
String query="insert into "+code+"_"+exam+"_response(studentid) values(?)";
PreparedStatement ps=connect.prepareStatement(query);
ps.setString(1,studentid);
int i=ps.executeUpdate();
qr="select total from paper where code=? and exam=?" ;
 ps=con.prepareStatement(qr);
ps.setString(1, code);
ps.setString(2, exam);
ResultSet result=ps.executeQuery();
result.next();
int total=Integer.parseInt(result.getString("total"));
for(int j=1;j<=total;j++)
{
qr="update "+code+"_"+exam+"_response set _"+j+"=? where studentid=?";
ps=con.prepareStatement(qr);
ps.setString(1,"null");
ps.setString(2,studentid);
ps.executeUpdate();
}
if(i>0)
{
%> 
	<div style="width:100%;
	background-color:cyan;
	float:left;
	
	padding-top:50px;">
	<h3>
	here are rules and regulation of exams    ---  Good luck -----
	<a href="solve.jsp?code=<%=code%>&exam=<%=exam%>&number=1">Start</a>
	</h3>
	</div>
<%	
}
else{
	%>oops!!! Some error occured 
	<%
}
%>





<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
