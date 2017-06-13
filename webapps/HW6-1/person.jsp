<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@page language="java" import="java.sql.*"%>
<jsp:useBean id="database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.49.205"/>
  <jsp:setProperty property="port" name="database" value="3306"/>
  <jsp:setProperty property="db" name="database" value="4104029034"/>
  <jsp:setProperty property="user" name="database" value="4104029034"/>
  <jsp:setProperty property="password" name="database" value="Ss4104029034!"/>
</jsp:useBean>
<%
 request.setCharacterEncoding("UTF-8");
 String url = "";
 String driver = "com.mysql.jdbc.Driver";
 ResultSet rs = null;
 String account = (String)session.getAttribute("account");
 String password = (String)session.getAttribute("password");
 String name = (String)session.getAttribute("name");
 String birth = (String)session.getAttribute("birth");
 int x = 0;int y = 0;
 String message="";
 if(account !=null && password !=null && name !=null && birth !=null){
   try{
     database.connectDB();
     String sql = "select * from ps;";
     database.query(sql);
     rs = database.getRS();
     if(rs!=null){
       while(rs.next()){
         String acct = rs.getString("account");
         if(account.equals(acct)){
           y+=1;
           break;
         }
       }
       if(y!=0){
         message="註冊失敗";
       }else{
         database.insertData(account,password,name,birth);
         message="註冊成功";
         }
       }
     }catch(Exception ex){
       out.println(ex);
     }finally{
       try { rs.close(); } catch (Exception e) { /* ignored */ }
     }
   }else{
    message="登入成功";
  }
  try{
    database.connectDB();
    String sql = "select * from ps;";
    database.query(sql);
    rs = database.getRS();
  }catch(Exception ex){
    out.println(ex);
  }
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>個人</title>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="script.js"></script>
    <link rel="stylesheet" href="hw6.css">
  </head>
  <body>
    <div class="container">
      <section id="content">
        <h1 id="result"><%=message%></h1>
        <form action="regis.jsp" method="post">
          <% if(rs!=null && y==0){
               while(rs.next()){
                 if(account == rs.getString("account")){

                   if(password==rs.getString("password")){
                     String name1=rs.getString("name");
                     String birth1=rs.getString("birth"); %>
          <h3>會員</h3>
          姓名 <%=name1%>
          <br>
          生日 <%=birth1%>
          <br>
          <input type="button" id="login" onclick="window.open('index.jsp','_self')" value="返回登入頁面"/>
          <% x+=1;
                 break; }}}} %>
              <% if(x==0 && y==0){ %>
              <script>
                 $("#result").html("登入失敗");
              </script>
              <p>帳號或密碼錯誤</p>
              <input type="button" onclick="window.open('regis.jsp','_self')" value="創建新帳號"/>
              <% } %>
              <% if(y!=0){ %>
              <p>帳號名重複</p>
              <br>
              <input type="button" onclick="history.back()" value="返回註冊頁面"/>
              <input type="button" onclick="window.open('index.jsp','_self')" value="返回登入頁面"/>
              <% } %>
            </form>
          </section>
        </div>
      </body>
  </html>
