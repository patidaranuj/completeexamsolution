

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
	<%@page errorPage="err.jsp" %>
	<div style="height:400px;
	width:100%;
	background-color:cyan;
	float:left;
	padding-top:50px;">
<%
String sem=request.getParameter("sem");
%>
<font style="text-align:center" size="+2">
View Result for <%=studentid%>
sem is <%=sem %>
</font>
<pre>
<font size="+2">
<a href="Subres.jsp?sem=<%=sem%>">View subject wise result</a>
</font>
<% 
String query="select * from visible";
Statement stat=con.createStatement();
ResultSet result=st.executeQuery(qr);
result.next();
result.next();
result.next();
String resulted=result.getString("visibility");
if(resulted.equals("yes"))
{
	%>
<font size="+2">
<a href="Completeres.jsp?sem=<%=sem%>">view complete result </a>
</font>
<% 			
}

%>

</pre>
</div>


