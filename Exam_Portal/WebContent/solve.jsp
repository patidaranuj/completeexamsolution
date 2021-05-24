

<!DOCTYPE html>
<html lang="">
<!-- To declare your language - read more here: https://www.w3.org/International/questions/qa-html-language-declarations -->
<head>
<title>MEDI-CAPS</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/solve.css" rel="stylesheet" type="text/css" media="all">
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
        <li><h4><i>Medi-Caps Univerity Exam Portal</i></h4></li>
      </ul>
    </div>
    <div class="fl_right">
      <ul class="nospace">
        
        <li>EXAMINEE:- <%=studentid %></li>
      	 
      </ul>
       
    </div>
    <!-- ################################################################################################ -->
  </div>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="paperdisplay">
</div>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page errorPage="err.jsp" %>

<%
String code=request.getParameter("code");
String exam=request.getParameter("exam");
int number=Integer.parseInt(request.getParameter("number"));
Class.forName("com.mysql.jdbc.Driver");
Connection connect=DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal","root","patidar");
String qr="Select * from "+code+"_"+exam+" where number=?";
PreparedStatement ps=connect.prepareStatement(qr);
ps.setInt(1,number);
ResultSet rs=ps.executeQuery();
if(rs.next())
{
	String question=rs.getString("question");
	String a=rs.getString("a");
	String b=rs.getString("b");
	String c=rs.getString("c");
	String d=rs.getString("d");
	String A=a.replace(' ','_');
	String B=b.replace(' ','_');
	String C=c.replace(' ','_');
	String D=d.replace(' ','_');
	%>
	<hr>
	<hr style="height:2px;color:black" />
	<div class="some-class" style="width:80%; float:left">
	<form action="Markanswer">
	<input type="hidden" name="number" value=<%=number%>>
	<input type="hidden" name="code" value=<%=code%>>
	<input type="hidden" name="exam" value=<%=exam%>>
	<pre>
	
	<label>Q<%=number%> <%=question%></label><br>
	<input  type="radio" name="answer" value=<%=A %>><label>a)<%=a %></label>
	
	<input type="radio" name="answer" value=<%=B %>><label>b)<%=b %></label>
	
	<input type="radio" name="answer" value=<%=C %>><label>c)<%=c %></label>
	
	<input type="radio" name="answer" value=<%=D %>><label>d)<%=d %></label>
	
	<input type="hidden" name="answer" value="null">
	<input type="submit" name="submit" value="next">    <input type="submit" name="submit" value="submit">
	
	</pre>
	</form>
	</div>
	<div style="width:20%; float:left">
	<div style="border-left:5px solid cyan; height:300px">
	<div style="border-top:5px solid cyan; height:300px">
	
	<div style="border-bottom:5px solid cyan; height:300px">
	<div style="border-right:5px solid cyan; height:300px">
	<h4>Navigation Panel</h4>
	<hr>
	<%
	String query="select * from paper where code=? and exam=?";
	PreparedStatement prep=con.prepareStatement(query);
	prep.setString(1,code);
	prep.setString(2,exam);
	ResultSet result=prep.executeQuery();
	if(result.next())
	{
		
		int tot=result.getInt("total");
		for(int j=1;j<=tot;j++)
		{
			if(j%5!=0)
			{
			%>
			<form action="solve.jsp?code=<%=code%>&exam=<%=exam%>&number=<%=j %>">
			<input style="float:left" type="submit" name="number" value=<%=j %>>
			</form>
			<% 
			}
			else
			{
			%>
			
			<form action="solve.jsp?code=<%=code %>&exam=<%=exam %>&number=<%=j %>">
			<input style="margin-left:0px" type="submit" name="number" value=<%=j %>>
			</form>
			<% 
			}
		}
		
	}
	%>
	</div>
	</div>
	</div>
	</div>
	</div>
	<% 
}
%>



<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
