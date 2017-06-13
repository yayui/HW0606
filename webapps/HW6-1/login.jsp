<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%-- <jsp:useBean id="database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.49.205"/>
  <jsp:setProperty property="port" name="database" value="3306"/>
  <jsp:setProperty property="db" name="database" value="4104029034"/>
  <jsp:setProperty property="user" name="database" value="4104029034"/>
  <jsp:setProperty property="password" name="database" value="Ss4104029034!"/>
</jsp:useBean> --%>
<%
   String account = request.getParameter("account");
   String password = request.getParameter("password");
   Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://140.120.49.205:3306/4104029034","4104029034","Ss4104029034!");
      Statement st =con.createStatement();
      ResultSet rs;
      rs = st.executeQuery("select * from ps where account='"+ account+"' and password='" + password + "'");
      if(rs.next()){
        session.setAttribute("account",account);
        out.println("登入成功");
        response.setHeader("Refresh","1; URL=person.jsp");
      }else{
        out.println("帳號密碼輸入錯誤");
        response.setHeader("Refresh","1; URL=index.jsp");
      }
      rs.close();
      st.close();
      con.close();
      %>
