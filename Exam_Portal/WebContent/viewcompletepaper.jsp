<%@include file="db.jsp" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%
	String name=request.getParameter("name");
	String code=request.getParameter("code");
	String exam=request.getParameter("exam");
	String maxmarks=request.getParameter("maxmarks");
	String duration=request.getParameter("duration");
	String qr="select * from "+code+"_"+exam;
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery(qr);
	%>
	<div style="height:100px;
			width:100%;
			background-color:cyan;
			margin:0px ">
			<h3 align="center" style="margin-bottom:0px">Medi-Caps University Result Section</h3>
			<hr>
			<h4 style="float:left;margin-top:0px ">SUBJECT:<%=name %></h4>   <h4 style="float:left;margin-left:500px;margin-top:0px">CODE:<%=code %></h4><h4 style="float:left;margin-left:500px;margin-top:0px">EXAM:<%=exam %></h4>
			</div>
			<table border=1 style="width:1200px; heigth:1200px ">
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<%
			if(rs.next())
			{
				int i=1;
				do{
					String number= rs.getString("number");
					String question =rs.getString("question");
					String a=rs.getString("a");
					String b=rs.getString("b");
					String c=rs.getString("c");
					String d=rs.getString("d");
					String answer=rs.getString("answer");
					
					%>
					<tr><td>Q<%=number%></td><td><b><%=question%></b></td></tr>
					<tr><td>a</td><td><%=a %></td></tr>
					<tr><td>b</td><td><%=b %></td></tr>
					<tr><td>c</td><td><%=c %></td></tr>
					<tr><td>d</td><td><%=d %></td></tr>
					<tr><td></td><td>Correct answer :<b><%=answer%></b></td></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<% 
					i++;
				}while(rs.next());
			}
		%>
		</table>
		<form action="viewpaper.jsp">
		<input  type="submit" value="Back" style="float:right;width:200px;margin-right:150px ">
		</form>

