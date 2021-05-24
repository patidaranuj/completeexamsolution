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
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row0">
  <div id="topbar" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <div class="fl_left">
      <ul class="nospace">
        <li><a href="index.html"><i class="fas fa-home fa-lg"></i></a></li>
      </ul>
    </div>
    <div class="fl_right">
      <ul class="nospace">
        
        <li><i class="fas fa-envelope rgtspace-5"></i> Admin</li>
      	 <li> <a href="#">logout</a></li>
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
      <h1 class="logoname"><a href="index.html"><span>Medi-Caps University </span>Exam Portal</a></h1>
    </div>
  
    <!-- ################################################################################################ -->
  </header>
 </div>
  <div style="width:100%;
	background-color:cyan;
	float:left;
	padding-top:50px;" > 
  
  <%
	String code=request.getParameter("code");
	String sub=request.getParameter("sub");
	String exam=request.getParameter("exam");
	%>
<form action="Questiontable?number=1">
<pre>
<font style="font-size:25px; align:center">

code :-   <%=code %><input type="hidden" name="code" value=<%=code %>>
sub  :-   <%=sub %><input type="hidden" name="sub" value=<%=sub %>>
exam :-   <%=exam %><input type="hidden" name="exam" value=<%=exam %>>
 </font>
 <input class="btn" type="submit" name="next" value="next">

</pre>
</form>
  
  </div>
  </body>
  </html>