<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>


<title>Insert title here</title>
</head>
<body>
<%
String id=(String)request.getParameter("id"); 
String scno=(String)request.getParameter("scno"); //获取学号
String cname=(String)request.getParameter("cname"); //获取课程
String score1=(String)request.getParameter("score1"); //获取分数
String score2=(String)request.getParameter("score2");
String score3=(String)request.getParameter("score3");
String score4=(String)request.getParameter("score4");

try{

String s="第二学期";
Connection con;
Statement sql;  
ResultSet rs;  
con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=stsystem", "sa", "123"); 
sql=con.createStatement();

/*sql.executeUpdate("insert into semester(id,time)  values('"+id+"','"+s+"')");*/

/*sql.executeUpdate("insert into course values('"+id+"','"+id+"','"+cname+"','null','null')");*/
/*sql.executeUpdate("insert into course_class  values('"+id+"','"+id+"','"+id+"','50','1')");*/
/*sql.executeUpdate("delete from yxcourse where id='"+id+"'");*/
sql.executeUpdate("insert into  classgrade(id,score,cname,grade) values('"+id+"','"+scno+"','"+cname+"','"+score4+"')");
out.print("录入成绩成功！");
}
catch(Exception e){
	out.print(e);
}

%>
<a href="teacherindex.html">返回</a>
</body>
</html>