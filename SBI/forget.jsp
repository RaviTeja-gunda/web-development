<%@page import="java.sql.*"%>
<%
	String email=request.getParameter("email");
    session.setAttribute("email",email);
    try{
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","password");
 PreparedStatement ps=con.prepareStatement("select email from Register where email=?");
 ps.setString(1,email);
 ResultSet rs= ps.executeQuery();
 if(rs.next() && rs.getString(1).equals(email))
 {
     response.sendRedirect("newpass.html");
 }
 else{%>
    <script>
            alert("Non-existent mail entered... Please try again");
            window.location.replace("forget.html");
    </script>
 <%}
}
catch(Exception e)
{
 out.println(e.toString());
}
%>