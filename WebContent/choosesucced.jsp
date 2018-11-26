<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>

<title>选课成功界面</title>
</head>
<body>
<%! String tname,name1,name2,cname1;
    Integer id1,id2;
%>
<% 
try{
	String a=request.getParameter("r");
	String name=(String)session.getAttribute("name");
	 
Connection con;
Statement sql;  
ResultSet rs;  
con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=stsystem", "sa", "123"); 
sql=con.createStatement();
   //获得要选课程
String t="select * from selectcourse  where id= '"+a+"'";
rs=sql.executeQuery(t);
if(rs.next()){
	id1=rs.getInt("id");
	name1=rs.getString("name");
	  tname =rs.getString("tname");
	  String t1="insert into  yxcourse(id,score,name,tname) values('"+id1+"','"+name+"','"+name1+"','"+tname+"')";
	  sql.executeUpdate(t1);
	}
   //添加要选课程


  //查询选课后课程
String t2="select * from yxcourse  where  name='"+name1+"' ";
ResultSet rs1=sql.executeQuery(t2);
%>
 
<table align="center"     boder="30"   bgcolor="#258467"> 
<tr><td align="center" colspan="3"><b>更新选课信息后</b></td></tr>
<% 
while(rs1.next()){
	id2=rs1.getInt("id");
	name2=rs1.getString("name");
	cname1=rs1.getString("tname");
%>
	<tr><td  bgcolor="white" width="120"height="60"><%=id2%></td><td  width="120" bgcolor="white"height="60"><%=name2%></td><td><td  bgcolor="white" width="120"height="60"><%=cname1%></td></tr>
	
	<%
   }

 }

catch(Exception e)
{out.println("课程已经选满或未选择课程！");}
%>


<a  href="choosecourse.jsp">返回</a>
</td>
</tr>
</table>
</body>
</html>