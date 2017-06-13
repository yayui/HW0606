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
 request.setCharacterEncoding("UTF-8");
 String url = "";
 String driver = "com.mysql.jdbc.Driver";
 ResultSet rs = null;
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
     <title>註冊</title>
     <link rel="stylesheet" href="hw6.css">
   </head>
   <body>
     <div class="container">
       <section id="content">
         <h1>註冊</h1>
         <form action="person.jsp" method="post" name="regF">
           <input name="account" type="text" placeholder="帳號" onblur="checkExist()" autofocus required/><span id="isE"></span>
           <br>
           <input name="password" id="password" type="password" placeholder="密碼" required/>
           <br>
           <input name="name" type="text" placeholder="姓名" autocomplete="off"/>
           <br>
           <input name="birth" type="text" placeholder="生日" autocomplete="off"/>
           <br>
           <div>
             <input type="submit" id="submit" value="提交"/>
           </div>
         </form>
       </section>
     </div>
     <script language="JavaScript">
     function checkExist(){
             var xmlhttp = new XMLHttpRequest();
             var account = document.forms["regF"]["account"].value;
             var url = "exists.jsp?account=" + account;
             xmlhttp.onreadystatechange = function(){
                 if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
                     if(xmlhttp.responseText.length == 13)
                         document.getElementById("isE").style.color = "red";
                     else
                         document.getElementById("isE").style.color = "green";
                     document.getElementById("isE").innerHTML = xmlhttp.responseText;
                 }
             };
             try{
             xmlhttp.open("GET",url,true);
             xmlhttp.send();
         }catch(e){alert("unable to connect to server");
         }
      }
     </script>
   </body>
 </html>
