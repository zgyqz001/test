<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>查询成绩</title>
</head>
<body>
<%! Integer score,practice_score,paper_score,gpa_score,student_id,course_class_id,course_id,semester_id; 
    String name1,scode,grade, gender, name2 ,number,cname;
%>
<% 
try{
	
	Connection con;
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=stsystem", "sa", "123"); 
    String name=(String)session.getAttribute("name");//重新获取登入者名
    String t="select * from classgrade where score ='"+name+"'"; //查询
    Statement sql=con.createStatement();
    ResultSet rs=sql.executeQuery(t);
   %>
    <table align="center"   boder="30" bgcolor="yellow" width="1000" >
    <tr><td colspan="6"  align="center"><font>您好！您的成绩信息为：</font></td></tr>
    <tr><td align="center">学号</td><td align="center">课程名</td><td  align="center">总成绩</td></tr>
   <%
     while (rs.next()){
    	 name1=rs.getString("score");             //姓名
    	     
    	 cname=rs.getString("cname");           
    	 grade= rs.getString("grade");        
    	  
    	                //总成绩
     
  
    	  
    /*	  Connection con1;
          Statement sql1;  
          ResultSet rs1;  
          con1=DriverManager.getConnection("jdbc:sqlserver://127.0.0.1:1433;DatabaseName=student","bb","123"); 
        String t1="select * from student where id='"+student_id+"'";//查询学生信息
        
        sql1=con1.createStatement();
       rs1=sql1.executeQuery(t1);
       if(rs1.next()){
   	   	 
 	       
 	       scode=rs1.getString("scode");   //学号
 	        gender= rs1.getString("gender");  //性别
  }
    
     Connection con2;
     Statement sql2;  
     ResultSet rs2;  
     con2=DriverManager.getConnection("jdbc:sqlserver://127.0.0.1:1433;DatabaseName=student","bb","123"); 
     String t2="select * from course_class  where id='"+course_class_id+"'";//课程开班信息
     
       sql2=con2.createStatement();
       rs2=sql2.executeQuery(t2);
     if(rs2.next()){
    	 semester_id =rs2.getInt("semester_id");  //学期号 //外键
    	 course_id  =rs2.getInt("course_id");    //课程    //外键
     }
     
     Connection con3;
     Statement sql3;  
     ResultSet rs3;  
     con3=DriverManager.getConnection("jdbc:sqlserver://127.0.0.1:1433;DatabaseName=student","bb","123"); 
     String t3="select * from  semester where id='"+semester_id+"'";//学期信息
     sql3=con3.createStatement();
      rs3=sql3.executeQuery(t3);
     if(rs3.next()){
    	 name2 =rs3.getString("name");  //学期 
    	 
     }
     
     Connection con4;
     Statement sql4;  
     ResultSet rs4;  
     con4=DriverManager.getConnection("jdbc:sqlserver://127.0.0.1:1433;DatabaseName=student","bb","123"); 
     String t4="select * from course  where id='"+course_id+"'";//课程信息
     sql4=con4.createStatement();
      rs4=sql4.executeQuery(t4);
     if(rs4.next()){
    	 number =rs4.getString("number");  //课程号
    	 cname  =rs4.getString("cname");    //课程名称
    	 
    	 }*/
    %>
    <tr>
        <td bgcolor="white"><%=name1%></td><td bgcolor="white"><%=cname %></td><td bgcolor="white"><%=grade %></td>
       
    </tr>
    <% 
    
   }
}

catch(Exception e){
	out.println(e);}
%>

 
<tr><td  align="right" colspan="6"><a href="studentindex.html">返回</a></td></tr>
</table>


</body>
</html>