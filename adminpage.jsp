<%@ page import="java.sql.*"%>
<%
try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","password");
    PreparedStatement ps=con.prepareStatement("select name from Admin");
    ResultSet rs=ps.executeQuery();
    rs.next();
%>
<html>
    <style>
        div{
            background-color: rgba(192, 50, 119, 0.577);
            padding-left: 45%;
            padding-bottom:5px;
        }
        div p{
            padding-top: 15px;
            font-size: 20px;
            color:rgba(21, 23, 23, 0.718);
        }
        div a{
            text-decoration: none;
        }
        .labels{
            font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            background-color: rgb(248, 207, 157);
        }
        .values{
            font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            background-color: rgba(245, 245, 220, 0.612);
        }
        .d{
            background-color:rgba(228, 109, 109, 0.916);
            text-decoration: none;
            color: black;
            font-size: 20px;
        }
    </style>
    <body>
        <div>
            <table width="100%">
                <tr colspan="2">
                    <td><p>ADMIN PAGE</p></td>
                    <td align="center"><p><%=rs.getString(1)%> &nbsp&nbsp&nbsp&nbsp <a href="thanku.html">Logout</p></td>
                </tr>
            </table>
        </div>
        <br>
        <table border="2px">
            
            <tr height="50px" class="labels">
                <th width="10%">Branch</th>
                <th width="10%">Name</th>
                <th width="10%">Father Name</th>
                <th width="8%">Contact</th>
                <th width="8%">Account Number</th>
                <th width="10%">Email</th>
                <th width="10%">Address</th>
                <th width="10%">Username</th>
                <th width="10%">Password</th>
                <th width="5%">Balance</th>
                <th width="10%">Delete</th>
            </tr>
            <% 
            ps=con.prepareStatement("select *from Register");
            //ps=con.prepareStatement("select *from sample");
            rs=ps.executeQuery();
            while(rs.next()){%>
            <tr class="values">
                   <td height="40px"><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><%=rs.getString(6)%></td>
                    <td><%=rs.getString(7)%></td>
                    <td><%=rs.getString(8)%></td>
                    <td><%=rs.getString(9)%></td>
                    <td align="center"><%=rs.getString(10)%></td>
                    <td align="center"><a href="delete_emp.html" class="d">DELETE</td>
            </tr><%}%>
        </table>
    </body>
</html>
<% }
catch(Exception e)
{
 out.println(e.toString());
}
%>