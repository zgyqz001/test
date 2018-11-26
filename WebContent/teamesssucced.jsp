<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>密码修改成功</title>
</head>
<body>
<%! String name,tpass; %>
<%
Connection con;
Statement sql;
ResultSet rs;
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433","sa","123"); 
String Name=(String)session.getAttribute("name"); 
String passw=(String)request.getParameter("password1"); //获取新密码
//sql语句调用executeupdate方法实现更新
String t="update teacher set teacherPwd ='"+passw+"'where tcode='"+Name+"'";
sql=con.createStatement();
sql.executeUpdate(t);       
  String n="select * from teacher where tcode='"+Name+"'";  //查询验证
rs=sql.executeQuery(n);
if(rs.next()){
	name=rs.getString("tname");
    tpass=rs.getString("teacherPwd");
	
}
%>
<table align="center"     boder="30"   bgcolor="#258467"> 
<tr><td align="center" colspan="4"><b>更改密码后信息</b></td></tr>
<tr><td> <b>姓名：</b></td><td  bgcolor="white" width="120"height="60"><%=name%></td><td>密码：</td><td  width="120" bgcolor="white"height="60"><%=tpass%></td>
<td>
<a  href="teacherindex.html">返回</a>
</td>
</tr>
</table>
</body>
</html>
