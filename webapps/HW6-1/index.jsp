<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>登入</title>
    <link rel="stylesheet" href="hw6.css">
  </head>
  <body>
    <div class="login">
      <div class="login-screen">
      <section id="content">
        <div class="app-title">
          <h1>登入</h1>
        </div>
        <div class="login-form">
          <form action="login.jsp" method="post">
				  <div class="control-group">
            <input type="text" name="account" id="username" placeholder="帳號" class="login-field" autocomplete="off" autofocus required/>
            <label class="login-field-icon fui-user" for="login-name"></label>
				  </div>

          <div class="control-group">
            <input type="password" name="password" id="password" placeholder="密碼" class="login-field"/>
            <label class="login-field-icon fui-lock" for="login-pass"></label>
				  </div>

          <input type="submit" value="登入" class="btn btn-primary btn-large btn-block"/></br>
          <input type="button" onclick="window.open('regis.jsp','_self')" value="註冊" class="btn btn-primary btn-large btn-block"/></br>
          <input type="button" onclick="window.open('search.jsp','_self')" value="查詢" class="btn btn-primary btn-large btn-block"/>
        </form>
      </div>
      </section>
      </div>
    </div>
  </body>
</html>
