

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
	Class.forName("com.mysql.jdbc.Driver");
	Connection connect=DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal","root","patidar");
	String qr="select total from paper where code=? and exam=?" ;
	PreparedStatement ps=connect.prepareStatement(qr);
	ps.setString(1, code);
	ps.setString(2, exam);
	ResultSet rs=ps.executeQuery();
	int attempt=0;
	if(rs.next())
	{
		String total=rs.getString("total");
		int com=Integer.parseInt(total);
		
		for(int i=1;i<=com;i++)
		{	
			String q="select _"+i+" from "+code+"_"+exam+"_response where studentid=?";
			ps=con.prepareStatement(q);
			ps.setString(1,studentid);
			ResultSet r=ps.executeQuery();
			String f="_"+i;
			if(r.next())
			{
				String ans=r.getString(f);
				String ch=ans;
				if(ch.equals("null"))
				{
					attempt=attempt+0;
				}
				else
				{
					attempt++;
				}
			}
		}
		int unanswered=com-attempt;
		%>
		<pre>
		<font size="+2">
		Total number of question :- <%=com %>
		NUMBER of question answered :- <%=attempt %>
		unanswered question :-<%=unanswered %> 
		Once submitting paper you wont be able to reattempt are you sure you want to submit
		</font>
		</pre>
		<form action="Submit?code=<%=code %>&exam="<%=exam %>>
		<input type="hidden" name="code" value=<%=code %>>
		<input type="submit" name="submit" value="submit" >
		</form>
		<%
	}

	%>




<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
