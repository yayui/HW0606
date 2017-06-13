<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@page language="java" import="java.sql.*"%>
<%-- <jsp:useBean id="database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.49.205"/>
  <jsp:setProperty property="port" name="database" value="3306"/>
  <jsp:setProperty property="db" name="database" value="4104029034"/>
  <jsp:setProperty property="user" name="database" value="4104029034"/>
  <jsp:setProperty property="password" name="database" value="Ss4104029034!"/>
</jsp:useBean> --%>
<%
// private String ip="";
// private String port="";
// private String url="";
// private String db="";
// private String user="";
    try{
        // url="jdbc:mysql://"+"140.120.49.205"+":"+"3306"+"/"+"4104029034"+"?useUnicode=true&characterEncoding=utf-8";
        Class.forName("com.mysql.jdbc.Driver");
        Connection con =(Connection) DriverManager.getConnection("jdbc:mysql://140.120.49.205:3306/4104029034","4104029034","Ss4104029034!");
            PreparedStatement pps = con.prepareStatement("SELECT  * FROM ps WHERE " +
                    "account = ?");
            pps.setString(1,request.getParameter("account"));
            ResultSet rs = pps.executeQuery();
            if(rs.first()){
                out.print("帳號已存在");
            }else{
                out.print("帳號可使用!");
            }
        }catch (Exception e){
            System.out.println(e);
        }
%>
