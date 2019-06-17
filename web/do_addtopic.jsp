<%-- 
    Document   : do_addtopic
    Created on : Jun 15, 2019, 8:18:03 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%@page  import="java.sql.*"%>
    <%
    //connect to server and select database
         try
        {
          Class.forName("com.mysql.jdbc.Driver");
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost/food-waste","root","");
          //
          String topic_title=request.getParameter("topic_title");
          String topic_owner=request.getParameter("topic_owner");
          String post_text=request.getParameter("post_text");
          String q1="insert into forum_topics(topic_title,topic_create_time,topic_owner) values ('"+topic_title+"',now(), '"+topic_owner+"')";
          PreparedStatement ps = con.prepareStatement(q1,Statement.RETURN_GENERATED_KEYS);
          ps.execute();
          ResultSet rs = ps.getGeneratedKeys();
          int generatedKey = 0;
          if (rs.next()) {
            generatedKey = rs.getInt(1);
          }
          
          String q2="insert into forum_posts(topic_id,post_text,post_create_time,post_owner) values ('"+generatedKey+"','"+post_text+"', now(), '"+topic_owner+"')";
          Statement smt=con.createStatement();
          int j=smt.executeUpdate(q2);
          if(j>0)
          {
              response.sendRedirect("topicslist.jsp");
          }
          else
          {
              out.println("Data not successfully inserted!");
          }
        }
          catch(Exception ex)
          {
          out.println(ex);
          }
          %>
          <body>
    </body>
</html>   
   