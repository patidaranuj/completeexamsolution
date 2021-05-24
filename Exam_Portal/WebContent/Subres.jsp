

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
        <li><a href="stundethome.jsp"><i class="fas fa-home fa-lg"></i></a></li>
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
	<div style="
	width:100%;
	background-color:cyan;
	float:left;
	padding-top:50px;" > 
 <div class="tabledisplay"  > 
 
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>

<% String sem=request.getParameter("sem");
	
	%>
	<h3>
	studentid=<%=studentid %><br>
	sem=<%=sem %>
	</h3>
	
	<%
	String qr="select * from sem_"+sem+"_registration where studentid=?";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1,studentid);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
%>
		<table border=1>
		<tr><th>Sub</th><th>code</th><th>exam</th><th>marks</th><th>max-marks</th><th>detailed</th></tr>
<%	
		for(int i=1;i<=10;i++)
		{
			String sub=rs.getString("sub"+i);
			int iofus=sub.indexOf("_");//taking out index of underscore from subname_code
			if(iofus!=-1)
			{
				String name=sub.substring(0,iofus);
				String code=sub.substring(iofus+1); 
				String q="select * from "+sub+" where studentid=?";
				PreparedStatement p=con.prepareStatement(q);
				p.setString(1,studentid);
				ResultSet rm=p.executeQuery();
				if(rm.next())
				{	
					String midsem1=rm.getString("midsem1");
					if(midsem1!=null)
					{
						String que="select * from paper where code=? and exam=?";
						PreparedStatement prep=con.prepareStatement(que);
						prep.setString(1,code);
						prep.setString(2,"midsem1");
						ResultSet res=prep.executeQuery();
						res.next();
						String maxmarks=res.getString("maxmarks");
						String duration=res.getString("duration");
				%>
						<tr><td><%=name %></td><td><%=code%></td><td>midsem1</td><td><%=midsem1%></td><td><%=maxmarks%></td><td><a href="detailres.jsp?code=<%=code%>&name=<%=name%>&marks=<%=midsem1 %>&maxmarks=<%=maxmarks%>&duration=<%=duration%>&exam=midsem1">view</a></td></tr>
				<% 		
					}
					String midsem2=rm.getString("midsem2");
					if(midsem2!=null)
					{
						String que="select * from paper where code=? and exam=?";
					PreparedStatement prep=con.prepareStatement(que);
					prep.setString(1,code);
					prep.setString(2,"midsem2");
					ResultSet res=prep.executeQuery();
					res.next();
					String maxmarks=res.getString("maxmarks");
					String duration=res.getString("duration");
			%>
					<tr><td><%=name %></td><td><%=code%></td><td>midsem2</td><td><%=midsem2%></td><td><%=maxmarks%></td><td><a href="detailres.jsp?code=<%=code%>&name=<%=name%>&marks=<%=midsem2%>&maxmarks=<%=maxmarks%>&duration=<%=duration%>&exam=midsem2">view</a></td></tr>
			<% 		
					}
					String endsem=rm.getString("endsem");
					if(endsem!=null)
					{
				String que="select * from paper where code=? and exam=?";
						PreparedStatement prep=con.prepareStatement(que);
						prep.setString(1,code);
						prep.setString(2,"endsem");
						ResultSet res=prep.executeQuery();
						res.next();
						String maxmarks=res.getString("maxmarks");
						String duration=res.getString("duration");
				%>
						<tr><td><%=name %></td><td><%=code%></td><td>endsem</td><td><%=endsem%></td><td><%=maxmarks%></td><td><a href="detailres.jsp?code=<%=code%>&name=<%=name%>&marks=<%=endsem%>&maxmarks=<%=maxmarks%>&duration=<%=duration%>&exam=endsem">view</a></td></tr>
				<% 			
					}
     			 }
			}
		}
	}
	%>
	</table>
	



 	
 	
 </div>
 </div>


<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
