<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<script language="javascript" type="text/javascript">

function gettrue(){
	if(document.form.scno.value=="")
		{
		alert("请输入学号！");
		
		return false;
		 
		}
	else if(document.form.score1.value==""||document.form.score2.value==""||document.form.score4.value==""||document.form.score3.value=="")
		
		{
		alert("请正确输入成绩");
		
		return false;
		}
	else if(document.form.score1.value>100||document.form.score2.value>100||document.form.score3.value>100||document.form.score4.value>100)
	{
	alert("成绩不能大于100");
	
	return false;
	}
	else if(document.form.score1.value<0||document.form.score2.value<0||document.form.score3.value<0||document.form.score4.value<0)
	{
	alert("成绩不能小于0");
	
	return false;
	}
	 
}
</script>
<title>成绩录入</title>
</head>
<body>
<%! String cname,scno0,id; %>
<%
try{
 id=(String)request.getParameter("id1"); //

Connection con;
Statement sql;  
ResultSet rs;  
con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=stsystem", "sa", "123"); 
sql=con.createStatement();

String t="select * from yxcourse  where id='"+id+"' ";
rs=sql.executeQuery(t);


   if(rs.next()){
	  cname =rs.getString("name");
	  scno0=rs.getString("score");
         }
   
}
catch(Exception e){
	out.print(e);
}
%>
   <form action="Luru_succed.jsp"  name="form">
      <table align="center"     boder="30"   bgcolor="#258467">
       <tr><td align="center" colspan="8"><b>请输入学生与成绩</b></td></tr>
	  <tr><td colspan="4" align="center" >学号:</td><td  colspan="4"><input type="text" name="scno"  value="<%=scno0%>"></td><td><input type="hidden" name="cname"  value="<%=cname%>"></td><td><input type="hidden" name="id"  value="<%=id%>"></td></tr>
	  <tr><td>平时成绩:</td><td><input type="text" name="score1"  ></td><td>理论成绩:</td><td><input type="text" name="score2"  ></td>
	      <td>实践成绩:</td><td><input type="text" name="score3"  ></td><td>总成绩:</td><td><input type="text" name="score4"  ></td></tr>
	  <tr><td  colspan="8"><input type="submit" name="submit" value="提交"  onClick="return gettrue();" ></td><td><a href="teagradeinsert.jsp">返回</a></td></tr>
   
</table>
</form>
</body>
</html>