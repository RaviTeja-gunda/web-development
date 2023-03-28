<%@page import="java.sql.*"%>
<%
	String pass=request.getParameter("newpass");
   String mail=(String)session.getAttribute("email");
   try{
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","password");
 PreparedStatement ps=con.prepareStatement("update Register set password=? where email=?");
 ps.setString(1,pass);
 ps.setString(2,mail);
 ps.executeUpdate();%>
 <script>
    alert("Password is successfully is updated...");
    location.replace("login.html");
 </script>
 <%
}
catch(Exception e)
{
 out.println(e.toString());
}
%>