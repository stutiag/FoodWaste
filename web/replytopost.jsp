<%-- 
    Document   : replytopost
    Created on : Jun 16, 2019, 1:25:25 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Post your reply</title>
    </head>
    <%@page  import="java.sql.*"%>
     <%@page import="java.lang.System.*"%>
    <body>
        <%!
            int topic_id=0;
            int post_id=0;
            String topic_title,post_text,post_owner;
            %>
         <%

            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/food-waste","root","");
                Statement smt=con.createStatement();
                post_id=Integer.parseInt(request.getParameter("post_id"));
                //still have to verify topic and post
                String q1 = "select ft.topic_id, ft.topic_title from forum_posts as fp left join forum_topics as ft on fp.topic_id = ft.topic_id where fp.post_id = '"+post_id+"'";
                ResultSet rs=smt.executeQuery(q1);
     /*int rowCount = rs.getRow();
     if (rowCount < 1) {
        //this post or topic does not exist
        response.sendRedirect("topicslist.jsp");
     } 
     else {*/
         //get the topic id and title
         while(rs.next())
         {
       topic_id = rs.getInt("topic_id");
       topic_title = rs.getString("topic_title");
         }
       out.println("<h1>Post Your Reply in "+topic_title+"</h1>");
out.println("<form method=post action=addreply.jsp?id="+topic_id+">");
%>
<p><strong>Your E-Mail Address:</strong><br>
 <input type="text" name="post_owner" size=40 maxlength=150>
<p><strong>Post Text:</strong><br>
<textarea name="post_text" rows=8 cols=40 wrap=virtual></textarea>
<p><input type="submit" name="submit" value="Add Post"></p>
</form>
<%
}

    catch(Exception ex)
            {
                out.println(ex);
}
%>
    </body>
</html>
