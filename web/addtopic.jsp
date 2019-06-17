<%-- 
    Document   : addtopic
    Created on : Jun 15, 2019, 8:16:17 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add a topic</title>
    </head>
    <body>
        
   <h1>Add a Topic</h1>
   <form method=post action="do_addtopic.jsp">
   <p><strong>Your E-Mail Address:</strong><br>
   <input type="text" name="topic_owner" size=40 maxlength=150 required>
  <p><strong>Topic Title:</strong><br>
  <input type="text" name="topic_title" size=40 maxlength=150 required>
  <P><strong>Post Text:</strong></p><br>
  <textarea name="post_text" rows=8 cols=40 wrap=virtual required></textarea>
  <P><input type="submit" name="submit" value="Add Topic"></p>
  </form>
  </body>
  </html>
    </body>
</html>
