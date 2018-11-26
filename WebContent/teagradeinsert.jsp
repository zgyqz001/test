<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>未录入成绩界面</title>
</head>
<body>
<%! String cname,scno; Integer id;%>
<% 
Connection con;
Statement sql;  
ResultSet rs;  
con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=stsystem", "sa", "123"); 
sql=con.createStatement();
String name=(String)session.getAttribute("name");//重新获取登入者名
String t="select * from yxcourse where tname in (select tname from teacher  where tcode='"+name+"')";
rs=sql.executeQuery(t);
%>
<table align="center"     boder="30"   bgcolor="#258467"> 
<tr><td align="center" colspan="4"><b>请将学生成绩录入</b></td></tr>
<% 
while(rs.next()){
	   id=rs.getInt("id");
	  cname =rs.getString("name");
	  scno=rs.getString("score");
	 
	  
%>
<tr><td><%=scno %></td><td><%=cname %></td><td>请录入成绩</td><td><a href="Luqu.jsp?id1=<%=id%>">录入</a></td></tr>
<%
}
%>
<tr><td><a href="teacherindex.html">返回</a></td></tr>
</table>
</body>
</html>