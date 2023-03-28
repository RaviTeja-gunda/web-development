<%@ page import="java.sql.*"%>
<%
String user=request.getParameter("uname");
String pass=request.getParameter("pass");
try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","password");
    PreparedStatement ps=con.prepareStatement("select *from Admin where username=? and password=?");
    ps.setString(1,user);
    ps.setString(2,pass);
    ResultSet rs=ps.executeQuery();
    if(!(rs.next())){%>
        <script>
            window.alert("Invalid Credentials");
            location.replace("login.html");
        </script>
	<%}				 
    else{
        //out.print("login Sucessfully Completed....");
        response.sendRedirect("adminpage.jsp");
    }
}
catch(Exception e){
    out.println(e.toString());
}
%>