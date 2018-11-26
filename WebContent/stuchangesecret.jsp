<%@ page language="java" contentType="text/html; charset=utf-8"%>

<html>
<head>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script language="javascript" type="text/javascript">
$(function(){
  	$("#password1").blur(function(){
  		var pw1=$("#password1").val();
  		if(pw1=="")
  			alert("密码不能为空");
  		
  		
  	})
     $("#password2").blur(function(){
    	 var pwd2= $("#password2").val();
    	 var pw=$("#password1").val();
    	 
    	 if(pwd2!=pw)
    		 alert("两次密码不一致,请重新输入");
     })

})


</script>
<title>密码修改界面</title>
</head>
<body>
<table  width="80%"height="80%" bgcolor="green" boder="2">
<tr><td rowspan="7" bgcolor="white" align="center"> 
<form name="form" mehtod="post"  action="stumesssucced.jsp">
<table align="center" boder="20" bgcolor="white" >
<caption><font size="6"><b>修改密码</b></caption>
<tr ><td >输入新密码：</td><td ><input type="password" id="password1"    ></td></tr>
<tr><td>再次输入密码：</td><td><input type="password" id="password2"  ></td></tr>
<tr><td><input type="submit"value="确定" name="submit" ></td></tr>
</table>
</form>   
</td> <td bgcolor="#00509F" width="20%" height="40">学生选课系统</td></tr>
<tr><td bgcolor="white" width="20%" height="60">*<a href="studmesssel.jsp">学生信息</a></td></tr>
<tr><td bgcolor="white" width="20%" height="60">*<a href="gradeselect.jsp">成绩查询</a></td></tr>
<tr><td bgcolor="white" width="20%" height="60">*<a href="choosecourse.jsp">选课</a></td></tr>
<tr><td bgcolor="white" width="20%" height="60">*<a href="courseselect.jsp">选课查询及退选</a></td></tr>
<tr><td bgcolor="white" width="20%" height="60">*<a href="stuchangesecret.jsp">密码修改</a></td></tr>
<tr><td bgcolor="white" width="20%" height="60">*<a href="zhuxiao.jsp">返回登录界面</a></td></tr>
</table>







</body>
</html>