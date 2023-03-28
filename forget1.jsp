<%@page import="java.sql.*"%>
<script src="login.html">
</script>
<%
	String mail="<script>mail</script>";
    String user=request.getParameter("uname");
	String pass=request.getParameter("pass");
    try{
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","password");
 PreparedStatement ps=con.prepareStatement("select email from Register where username=? and password=?");
 ps.setString(1,user);
 ps.setString(2,pass);
 ResultSet rs= ps.executeQuery();
 rs.next();
    if(rs.getString(1).equals(mail))
    {
        response.sendRedirect("forget.html");
    }
    else{%>
            <script>
                 alert("Invalid email-id...");
                location.replace("login.html");
            </script>
    <%}
}
catch(Exception e)
{
 out.println(e.toString());
}
%>
