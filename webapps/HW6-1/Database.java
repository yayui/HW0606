package com.database;
import java.sql.*;
public class Database{
  private Connection con=null;
  private ResultSet rs=null;
  private Statement stmt=null;
  private String ip="";
  private String port="";
  private String url="";
  private String db="";
  private String user="";
  private String password="";
  private String driver="com.mysql.jdbc.Driver";

  public Database(){

  }
  public void connectDB(){
	try{
    url="jdbc:mysql://"+ip+":"+port+"/"+db+"?useUnicode=true&characterEncoding=utf-8";
    Class.forName(driver);
	  con=DriverManager.getConnection(url,user,password);
	  stmt=con.createStatement();
  }catch(Exception ex){
    System.out.println(ex);
  }
}
public void closeDB(){
  try{
    con.close();
    stmt.close();
  }catch(Exception ex){
    System.out.println(ex);
  }
}
public void insertData(String account,String password,String name,String birth){
  try{
    String sql = "insert into ps(account,password,name,birth) value(?,?,?,?)";
    PreparedStatement pst = con.prepareStatement(sql);
    pst.setString(1,account);
    pst.setString(2,password);
    pst.setString(3,name);
    pst.setString(4,birth);
    int a = pst.executeUpdate();
  }catch(Exception ex){
    System.out.println(ex);
  }
}
public void query(String sql){
try{
  rs=stmt.executeQuery(sql);
  //close
}catch(Exception ex){
  System.out.println(ex);
}
}
public Connection getCon(){
  return con;
}
public ResultSet getRS(){
return rs;
}
public void setIp(String ip){
this.ip=ip;
}
public void setPort(String port){
this.port=port;
}
public void setUrl(String ip, String port){
this.url="jdbc:mysql://"+ip+":"+port+"/";
}
public void setDb(String dbName){
this.db=dbName;
}
public void setUser(String username){
this.user=username;
}
public void setPassword(String password){
this.password=password;
}
public void setDriver(String driver){
this.driver=driver;
}
}
