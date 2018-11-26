<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>教师个人信息</title>
</head>
<body>
<%!
String  tcode,name1,gender,title,intro;int a;
%>
<% 
try{
	
	Connection con;
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=stsystem", "sa", "123"); 
    
    String name=(String)session.getAttribute("name");//重新获取登入者名
    String t="select * from teacher where tcode='"+name+"'"; //查询教师信息
     
     Statement sql=con.createStatement();
     ResultSet rs=sql.executeQuery(t);
     if(rs.next()){
    	 
    	   tcode=rs.getString("tcode");
    	   name1=rs.getString("tname");
    	
    	   gender=rs.getString("gender");
    	   intro=rs.getString("introduction");
    	 title= rs.getString("title");
    	 if(tcode.equals("001"))
    	 { a=1;}
    	 else a=2;
     }
    
}  
catch(Exception e){
	out.println(e);}
%>
<table  width="80%"height="80%" bgcolor="red" boder="20">
<tr><td rowspan="7" bgcolor="white" align="center"> 
<table boder="20" bgcolor="blue"height="300" width="200">
<tr><td align="center"  colspan="2">教师个人信息</td></tr>
<tr><td  bgcolor="white"><font  size="4">工号</font></td><td width="70%" bgcolor="white"><font size="3"><%=tcode%></font></td></tr>
<tr><td  bgcolor="white"><font  size="4">姓名</font></td><td width="70%" bgcolor="white"><font size="3"><%=name1%></font></td></tr>
<tr><td  bgcolor="white"><font  size="4">性别</font></td><td width="70%" bgcolor="white"><font size="3"><%=gender%></font></td></tr>
<tr><td  bgcolor="white"><font  size="4">职称</font></td><td width="70%" bgcolor="white"><font size="3"><%=title%></font></td></tr>
<tr><td  bgcolor="white"><font  size="4">所在部门</font></td><td  width="70%" bgcolor="white"><font size="3"><%=intro%></font></td></tr>

</table>

</td> <td bgcolor="#00509F" width="20%" height="20">教师管理系统</td></tr>

<tr><td bgcolor="white" width="20%" height="15"><img src="wwl.jpg"  style="width:150px;height:150px;"></img></td></tr>



<tr><td bgcolor="white" width="20%" height="60">*欢迎<p color="red"><%=name1 %></p>老师登录</a></td></tr>
<tr><td bgcolor="white" width="20%" height="60">*<a href="teagradeinsert.jsp">录入成绩</a></td></tr>
<tr><td bgcolor="white" width="20%" height="60">*<a href="coursechaxun.jsp">成绩查询</a></td></tr>
<tr><td bgcolor="white" width="20%" height="60">*<a href="teacherchangesecret.jsp">密码修改</a></td></tr>
<tr><td bgcolor="white" width="20%" height="60">*<a href="tzhuxiao.jsp">注销</a></td></tr>
</table>

</body>
</html>