<%@page import="java.sql.*"%>
<%
	int amount=Integer.parseInt(request.getParameter("amount"));
	String acc=request.getParameter("acc");
	String nam=request.getParameter("nam");
	int bal;
try{
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","password");
 String sq="select accountno from Register where accountno=? and name=?";
 PreparedStatement st=con.prepareStatement(sq);
 st.setString(1,acc);
 st.setString(2,nam);
 ResultSet rs=st.executeQuery();
 if(!(rs.next()))
{ %>
	<script>
		alert("Invalid Name or Account number");
		location.replace("deposit.html");
	</script>
 <%}
 else
 {
	String sql="select balance from Register where accountno=? and name=?";
	st=con.prepareStatement(sql);
	st.setString(1,acc);
	st.setString(2,nam);
	rs=st.executeQuery();
	rs.next();
	bal=rs.getInt(1);
	if(amount<0){%>
		<script>
			alert("Invalid amount......Retry");
			location.replace("deposit.html");
		</script>
	<%}
	else{
		bal=bal+amount;
		String s="update Register set balance=? where accountno=? and name=?";
		st=con.prepareStatement(s);
		st.setInt(1,bal);
		st.setString(2,acc);
		st.setString(3,nam);
		rs=st.executeQuery();
		rs.next();
		response.sendRedirect("deposit add.html");
	}
 }
 con.close();
}
catch(Exception e)
{
 out.println(e.toString());
}
%>