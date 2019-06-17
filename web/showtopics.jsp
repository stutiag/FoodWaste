<%-- 
    Document   : showtopics
    Created on : Jun 15, 2019, 11:24:41 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Topics|Forum</title>
    </head>
    <%@page  import="java.sql.*"%>
    <body>
        <h1>Posts in Topic</h1>
            <%!
                    int id=0,post_id=0;
                    String topic_title,post_text, post_create_time,post_owner;
                    %>
             <%

            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/food-waste","root","");
                Statement smt=con.createStatement();
                id=Integer.parseInt(request.getParameter("id"));
                
                Statement smt2=con.createStatement();
                String q1="select topic_title from forum_topics where topic_id ='"+id+"'";
                ResultSet rs=smt.executeQuery(q1);
                while(rs.next())
                {
                    topic_title=rs.getString("topic_title");
                }
                out.println("<p>Showing posts for the <strong>"+topic_title+"</strong> topic:</p>");
                String q2= "select post_id, post_text, post_create_time,post_owner from forum_posts where topic_id ='"+id+"'order by post_create_time asc";
                ResultSet rs2=smt2.executeQuery(q2);
                while(rs2.next())
                {
                    post_id=rs2.getInt("post_id");
                    post_text=rs2.getString("post_text");
                    post_create_time=rs2.getString("post_create_time");
                    post_owner=rs2.getString("post_owner");
                    %>
                <table width=100% cellpadding=3 cellspacing=1 border=1>
                <tr>
                <th>AUTHOR</th>
                <th>POST</th>
                </tr>
                <tr>
                <%out.println("<td width=35% valign=top>"+post_owner+"<br>"+post_create_time+"</td>");%>
                <%out.println("<td width=65% valign=top>"+post_text+"<br><br>");%>
                <%out.println("<a href=replytopost.jsp?post_id="+post_id+"><strong>REPLY TO POST</strong></a>");%>
                <%out.println("</td>");%>
                <%out.println("</tr>");%>
                </table>
                <%
                    }

                
            }
            catch(Exception ex)
            {
                out.println(ex);
            }
%>
    </body>
</html>
