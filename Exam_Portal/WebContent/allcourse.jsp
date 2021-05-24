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
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row0">
  <div id="topbar" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <div class="fl_left">
      <ul class="nospace">
        <li><a href="adminhome.html"><i class="fas fa-home fa-lg"></i></a></li>
      </ul>
    </div>
    <div class="fl_right">
      <ul class="nospace">
        
        <li><img src="images/demo/avatar.png" style="height:20px"> Admin</li>
      	 <li> <a href="index.html">logout</a></li>
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
      <li class="active"><a href="adminhome.html">Home</a></li>
      <li><a class="drop" href="#">View</a>
        <ul>
          <li><a class="drop" href="#">view courses</a>
          <ul>
              <li><a href="allcourse.jsp">All Courses</a></li>
              <li><a href="coursestream.jsp">Stream-Wise</a></li>
          </ul>
          </li>
          <li><a class="drop" href="#">view student</a>
          	<ul>
              <li><a href="allstudent.jsp">All Student</a></li>
              <li><a href="studentsem.jsp">Semester Wise</a></li>
              <li><a href="studentstream.jsp">Stream</a></li>
              <li><a href="studentenroll.jsp">Enroll Wise</a></li>
           </ul>
           </li>
          <li><a href="viewpaper.jsp">View Paper</a></li>
        </ul>
      </li>
      <li><a class="drop">Add/Delete </a>
        <ul>
          <li><a href="Addsub.jsp">Add Course</a></li>
          <li><a class="drop" href="#">Paper</a>
            <ul>
              <li><a href="addpaper.html">Add Paper</a></li>
              
              <li><a href="deletepaper.jsp">delete Paper</a></li>
 
            </ul>
          </li>
          <li><a href="addstudent.jsp">Add Student</a></li>
        </ul>
      </li>
      <li><a href="visible.jsp">Change Visibility setting for paper</a></li>
      <li><a href="display.jsp">display result/start course regist.</a></li>
    </ul>
    <!-- ################################################################################################ -->
  </nav>
</div>

  
<div style="background-color:cyan;
		width:100%;
		margin-top:20px;
		padding-top:100px">

	<%@include file="db.jsp" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page errorPage="err.jsp" %>
<%
	String qr="select * from course";
	Statement stat=con.createStatement();
	ResultSet rs=stat.executeQuery(qr);
	if(rs.next())
	{
		%>
		
		<table >
		<tr><th>SUBJECT-NAME</th><th>SUBJECT-CODE</th><th>STREAM</th></tr>
		<%
	do{
		String subname=rs.getString("subname");
		String subcode=rs.getString("subcode");
		String stream=rs.getString("stream");
		%>
		<tr><td><%=subname %></td><td><%=subcode %></td><td><%=stream %></td></tr>
	<%
	}while(rs.next());
		%></table>
		<%
	}

%>
	</div>
	
