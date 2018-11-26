<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>选课查询</title>
</head>
<body>
<% 
try{
String name=(String)session.getAttribute("name");
Connection con;
Statement sql;  
ResultSet rs;  
con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=stsystem", "sa", "123"); 
sql=con.createStatement();
//查询已选课程
String t="select* from yxcourse where score='"+name+"'";
rs=sql.executeQuery(t);
%>

<table align="center"     boder="30"   bgcolor="#258467"> 
<tr><td align="center" colspan="4"><b>已选课课程</b></td></tr>
<% 
while(rs.next()){
	Integer idd=rs.getInt("id");
	String name22=rs.getString("name");
	String cname11=rs.getString("tname");
%>
	<tr><td  bgcolor="white" width="120"height="60"><%=idd%></td><td  width="120" bgcolor="white"height="60"><%=name22%></td><td><td  bgcolor="white" width="120"height="60"><%=cname11%></td><td bgcolor="white"><a href="tuixuan.jsp?id=<%=idd %>">退选</a></td></tr>
<%
   }


}
catch(Exception e)
{out.println(e);}

%>
<tr>
<td  bgcolor="white">
<a  href="studentindex.html">返回</a>
</td>
</tr>
</table>
</body>
</html>