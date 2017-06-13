<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.49.205"/>
  <jsp:setProperty property="port" name="database" value="3306"/>
  <jsp:setProperty property="db" name="database" value="4104029034"/>
  <jsp:setProperty property="user" name="database" value="4104029034"/>
  <jsp:setProperty property="password" name="database" value="Ss4104029034!"/>
</jsp:useBean>
<%
 database.connectDB();
 request.setCharacterEncoding("UTF-8");
 String account = request.getParameter("account");
 String password = request.getParameter("password");
 database.query("select * from ps;");
 ResultSet rs = database.getRS();
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>查詢</title>
    <link rel="stylesheet" href="hw6.css">
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.2.4.min.js"></script>
  </head>
  <body>
    <div>
     <table>
       <tr>
        <td>帳號</td>
        <td>密碼</td>
        <td>姓名</td>
        <td>生日</td>
       </tr>
       <% if(rs !=null){
            while(rs.next()){
              request.setCharacterEncoding("UTF-8");
              String account1=rs.getString("account");
              String password1=rs.getString("password");
              String name=rs.getString("name");
              String birth=rs.getString("birth");
        %>
        <tr>
          <td><%=account1%></td>
          <td><%=password1%></td>
          <td><%=name%></td>
          <td><%=birth%></td>
        </tr>
        <%}}%>
      </table>
    </div>
    <input type="button" onclick="window.open('index.jsp','_self')" value="返回登入頁面"/>
  </body>
</html>
