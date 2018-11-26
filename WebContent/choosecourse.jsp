<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>选课界面</title>
</head>
<body>

  <%! String name1,cname,ctime,name2,teacher;
   Integer score,teacher_id,peop,id;
%>
<% 
try{
String name=(String)session.getAttribute("name");
Connection con;
Statement sql;  
ResultSet rs;  

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=stsystem", "sa", "123"); 
sql=con.createStatement();
String t="select* from selectcourse where score='"+name+"'";
rs=sql.executeQuery(t);
%>

<form  action="choosesucced.jsp" method="post" name="form">
<table  align="center" >
<tr><td  align="center" colspan="6">欢迎前来选课！</td></tr>
<tr><td align="center">选择</td><td align="center">课程</td><td align="center">学分</td><td align="center">授课老师</td></tr>
<% 
while(rs.next()){
       id=rs.getInt("id");
	  name1 =rs.getString("name");
	  cname =rs.getString("tname");
	
	  score =rs.getInt("cgrade");
	  teacher=rs.getString("tname");
	 %> <tr><td><input type="radio" value="<%=id%>" name="r"> </td><td align="center"><%=name1%></td><td align="center"><%=score%></td><td align="center"><%=cname%></td></tr>
	  
	 
	<% 	/*  Connection con1;
      Statement sql1;  
      ResultSet rs1;  
      con1=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/stsystem","root","111111"); 
      sql1=con1.createStatement();
      String t1="select* from teacher where tcode='"+teacher_id+"'";
      rs1=sql1.executeQuery(t1);
      if(rs1.next()){
      name2=rs1.getString("tname");
      }
      */
%>
    
   
    
<% 

 };    
%>


<tr><td colspan="6"  align="center"><input type="submit"  name="submit" value="提交"></td>
<td>
<a  href="studentindex.html">返回</a>
</td>
</tr>
</table>
</form>



<% 
//查询已选课程
String t2="select * from yxcourse  where score='"+name+"' ";
ResultSet rs1=sql.executeQuery(t2);
%>
 
<table align="center"     boder="30"   bgcolor="#258467"> 
<tr><td align="center" colspan="3"><b>已选课课程</b></td></tr>
<% 
while(rs1.next()){
	Integer idd=rs1.getInt("id");
	String name22=rs1.getString("name");
	String cname11=rs1.getString("tname");
%>
	<tr><td  bgcolor="white" width="120"height="60"><%=idd%></td><td  width="120" bgcolor="white"height="60"><%=name22%></td><td><td  bgcolor="white" width="120"height="60"><%=cname11%></td></tr>
	
<%
   }



}
catch(Exception e)
{out.println(e);}

%>
</table>
</body>
</html>