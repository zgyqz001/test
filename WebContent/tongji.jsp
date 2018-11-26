<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<html>
<head>
<title>统计分数情况</title>
</head>
<body>
<center><font align="center" size="8">查询学生成绩</font></center>
<%! Double sum, avg,max,min;String cname,score,select;int counter=0;%>
<%
try{
	
	
/*	select=(String)request.getParameter("userselect");*/
	String name=(String)session.getAttribute("name");//重新获取登入者名
	Connection con;
	Statement sql;  
	ResultSet rs;  
	con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=stsystem", "sa", "123"); 
	sql=con.createStatement();
	
	String t=("select * from classgrade where cname in (select name from selectcourse where tname in(select tname from teacher where tcode='"+name+"') )");
	rs=sql.executeQuery(t);
	ArrayList <String> list;
	list=new ArrayList<String>();
	out.print("\t");
	out.print("学号"+"&nbsp&nbsp&nbsp&nbsp&nbsp");out.print("   课程名          ");out.print("   分数          "+"<br>");
	
	
    while(rs.next()){
    	String n=rs.getString("grade");
    	 cname=rs.getString("cname");
    	 score=rs.getString("score");
         out.print(score+"  ");
         out.print(cname+"  ");
         out.println(n+"<br>");
       
		list.add(n);
		
    }
    /*ResultSet rs2=sql.executeQuery("select * from  classgrade where cname='"+select+"'");
   	if(rs2.next()){
   		cname=rs2.getString("cname");
   	}*/
    min=Double.parseDouble(list.get(0));
    for(int i=0;i<list.size();i++){  	 
 		if(min>Double.parseDouble(list.get(i)))
 			min=Double.parseDouble(list.get(i));	 
 	} 
    
    max=Double.parseDouble(list.get(0));
  
     for(int i=0;i<list.size();i++){
    	 
 		if(max<Double.parseDouble(list.get(i)))
 			max=Double.parseDouble(list.get(i));   	 
 	}
     sum=0.0;
	for(int i=0;i<list.size();i++){
		
		Double a=Double.parseDouble(list.get(i));
		sum+=a;
	}
	
	
	
	counter=list.size();avg=sum/(double)counter;
	

}
catch(Exception e){
  out.print(e);
	}

%>

<table align ="center" boder="60" bgcolor="#008589">
<tr><td colspan="5"  align="center">成绩统计结果</td></tr>
<tr><td align ="center">课程名</td><td >选课人数</td><td align ="center">最高分</td><td align ="center">最低分</td><td>平均分</td></tr>

<tr><td align ="center" bgcolor="white"><%=cname%></td></td><td align ="center"bgcolor="white"><%=counter %></td><td align ="center" bgcolor="white"><%=max%></td><td align ="center" bgcolor="white"><%=min%></td><td  align ="center"bgcolor="white"><%=avg%></td></tr>
<tr><td><a href="coursechaxun.jsp">返回</td></tr>



</table>
</body>
</html>