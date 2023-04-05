<%@ page import="java.sql.*"%>
<%
String acc=request.getParameter("acc");
try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","password");
    PreparedStatement ps=con.prepareStatement("delete from Register where accountno=?");
    ps.setString(1,acc);
    int i=ps.executeUpdate();
    if(i>=0){%>
        <script>
            alert("Employee Deleted Successfully.....");
            location.replace("thanku.html");
        </script>
    <%}
}
catch(Exception e)
{
 out.println(e.toString());
}
%>