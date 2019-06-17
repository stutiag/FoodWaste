<%-- 
    Document   : addreply
    Created on : Jun 16, 2019, 3:34:39 PM
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
    <body>
        <%!
            int topic_id=0;
            %>
        <%
            topic_id=Integer.parseInt(request.getParameter("id"));
            String post_text=request.getParameter("post_text");
            String post_owner=request.getParameter("post_owner");
            
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/food-waste","root","");
                Statement smt=con.createStatement();
                String q2 = "insert into forum_posts(topic_id,post_text,post_create_time,post_owner) values ('"+topic_id+"','"+post_text+"', now(), '"+post_owner+"')";
                int j=smt.executeUpdate(q2);
                if(j>0)
                {
                    response.sendRedirect("showtopics.jsp?id="+topic_id+"");
                }
                else
                {
                    out.println("record not inserted");
                }
                            
                }
            catch(Exception ex)
            {
                out.println(ex);
}
%>
    </body>
</html>
