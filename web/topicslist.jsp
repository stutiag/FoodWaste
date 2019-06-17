<%-- 
    Document   : topicslist
    Created on : Jun 15, 2019, 11:26:23 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Topicslist</title>
    </head>
    <%@page  import="java.sql.*"%>
    <body>
        <%! 
            String topic_id,topic_title,topic_create_time,topic_owner;
            int num_posts=0; 
     
        %>
        <%
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/food-waste","root","");
                Statement smt=con.createStatement();
                Statement smt2=con.createStatement();
                String q1="select * from forum_topics order by topic_create_time desc";
                
                ResultSet rs=smt.executeQuery(q1); 
                    while (rs.next()) {
                    topic_id = rs.getString("topic_id");
                    topic_title =rs.getString("topic_title");
                    topic_create_time = rs.getString("topic_create_time");
                    topic_owner = rs.getString("topic_owner");
                    //out.println(" <textarea>"+topic_title+"</textarea>");
                    String q2= "select count(post_id) from forum_posts where topic_id = '"+topic_id+"'";
                    ResultSet rs2=smt2.executeQuery(q2);
                    while(rs2.next())
                    {
                        num_posts=rs2.getInt("count(post_id)");
                    }
                    %>
                    <table cellpadding=3 cellspacing=1 border=1>
                   <tr>
                   <th>TOPIC TITLE</th>
                   <th># of POSTS</th>
                   </tr>
                   <tr>
                   <td>
                    
                    <%out.println("<a href=showtopics.jsp?id="+topic_id+"><strong>"+topic_title+"</strong></a>");%>
                    <br>
                    <%out.println("Created on "+topic_create_time+" by "+topic_owner+"");%>
                   </td>
                    <td align=center>
                    <%out.println(num_posts);%>
                    </td>
                   </tr>
                    
                    </table>
                    <%
                    }
                
            }
            catch(Exception ex)
            {
                out.println(ex);
            }
            %>
            <p>Would you like to <a href="addtopic.jsp">add a topic</a>?</p>
    </body>
</html>
  