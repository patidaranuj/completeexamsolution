<!DOCTYPE html>

<html lang="">
<!-- To declare your language - read more here: https://www.w3.org/International/questions/qa-html-language-declarations -->
<head>
<title>MEDI-CAPS</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/question.css" rel="stylesheet" type="text/css" media="all">
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
        
        <li><i class="fas fa-envelope rgtspace-5"></i> Admin</li>
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
 </div>
 
 <%
	String code=request.getParameter("code");
	String exam=request.getParameter("exam");
	String number=request.getParameter("number");
	%>
	<div style="height:75px;
	width:100%;
	background-color:cyan;
	float:left;">
	<hr>
	<font style="font-size:15px">
	
Course:<%=code %>
<br>
Exam:<%=exam %>
</font>
<hr>
</div>
<form action="Addquestion">
<pre>
<input type="hidden" name="code" value=<%=code %>>
<input type="hidden" name="exam" value=<%=exam %>>
<br>
Number <b><%=number %></b><input type="hidden" name="number" value=<%=number %>>	
	<label >Q.</label><input style="width:600px; float:left; margin-left:5px" type="text" name="question"><br>
		<label>a).</label><input style="width:300px; float:left;margin-left:5px" type="text" name="a"><br>
		<label >b).</label><input style="width:300px; float:left;align:left;" type="text" name="b"><br>
		<label >c).</label><input style="width:300px; float:left; align:left; " type="text" name="c"><br>
		<label >d).</label><input style="width:300px; float:left;align:left ;" type="text" name="d"><br>
		
	
	<label>Answer</label><input style="width:300px; float:left" type="text" name="answer">
	<input class="btn" type="submit" name="submit" value="next">
</pre>
</form>

  
  </body>
  </html>