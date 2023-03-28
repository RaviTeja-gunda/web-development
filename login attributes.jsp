<%@page import="java.sql.*"%>
<%
	String userid=request.getParameter("uname");
	String npass=request.getParameter("pass");
try{
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","password");
 String sql="select * from Register where username=? and password=?";
 PreparedStatement stmt=con.prepareStatement(sql);
 stmt.setString(1,userid);
 stmt.setString(2,npass);
 ResultSet rs=stmt.executeQuery();
%>
<html>
<head>
	
					
	<meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
	<style>
		.bg{background-color: burlywood;}
		button:active{transform:translateY(10px); }
		button:hover{background-color:cadetblue; font-size:25;}
		button{background-color:cornflowerblue; border-radius:30px; font-size:20; font-family: 'Lucida Sans';}
	</style>
</head>
<body style="background-color:#FEE3EC">
	<div style="background-color:#FEE3EC"><center><h1>SUPER BANK OF INDIA<h1></center>
		<center style="font-family:papyrus"><h2>-Pure Banking Nothing Else</h2></center><br>
	</div>
	<div class="bg">
	<table align="center">
		<tr>
			<td colspan='2' align="center"><h2><u>ACCOUNT HOLDER DETAILS</u></h2></td>
		</tr>
		<tr colspan='2'>
			
				<%
					if(!(rs.next())){ %>
					<script>
						window.alert("Invalid Credentials");
						location.replace("sbinocash.html");
					</script>
					 
				<%	
					}
					else{
				%>
				
			<td colspan='2' align="center"><h3>HI <%=rs.getString(2) %>... WELCOME,
			        HERE ARE YOUR FEW DETAILS....!<h3></td>
		</tr>
		<tr>
			<td align="right">NAME :</td>	
			<td><%=rs.getString(2)%></td>
		</tr>
		<tr>
			<td align="right">ACCOUNT NUMBER  :</td>
		<td><%=rs.getString(5)%></td>
		</tr>
		<tr>
			<td align="right">PHONE NUMBER :</td>
			
		<td><%=rs.getString(4)%></td>
			
		</tr>
		<tr>
			<td align="right">EMAIL ID :</td>
			
		<td><%=rs.getString(6)%></td>
			
		</tr>
		<tr>
			<td align="right">ADDRESS :</td>
			
		<td><%=rs.getString(7)%></td>	
		</tr>
		<tr>
			<td align="right">BALANCE :</td>
			<td><%=rs.getString(10)%></td>	
		</tr>
		<% } %>
	</table><br><br></div><br><br>
	</div>
	<center><form action="withdrawl.html">
		<font><big><b>TO WITHDRAWL MONEY, CLICK HERE...</b></big></font>
		<img src="arrow.gif" height=25px width=55px>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button type="submit">Withdrawl</button><br>
	</form><br>
	<form action="deposit.html">
		<font><big><b>TO DEPOSIT MONEY, CLICK HERE...</b></big></font>
		<img src="arrow.gif" height=25px width=55px style="border-radius:100px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button type="submit">Deposit</button><br><br><br>
	</form></center>
</body>
</html>
<% }
catch(Exception e)
{
 out.println(e.toString());
}
%>