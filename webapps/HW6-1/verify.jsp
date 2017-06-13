<%@page contentType="text/html;charset=big5"%>
<%@page import="java.util.*"%>
<%
String logint = (String)
  session.getAttribute("login_t");
if(logint=="ok"){
  
}else{
  response.sendRedirect("index.jsp");
}
%>
