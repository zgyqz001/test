<%@ page language="java" contentType="text/html; charset=utf-8"%>

<html>
<head>
<script language="javascript" type="text/javascript">

function gettrue(){
	if(document.form.password1.value=="")
		{
		alert("密码不能为空！");
		
		return false;
		 
		}
	else if(document.form.password2.value=="")
		{
		alert("请再次输入密码！");
		
		return false;
		}
	else if(document.form.password1.value!=document.form.password2.value)
		{
		alert("两次密码输入不同！");
	
		return false;

		}
	 
}
</script>
<title>密码修改界面</title>
</head>
<body>
<table  width="80%"height="80%" bgcolor="red" boder="2">
<tr><td rowspan="7" bgcolor="green" align="center"> 
<form name="form" mehtod="post"  action="teamesssucced.jsp">
<table align="center" boder="20" bgcolor="white" >
<caption><font size="6"><b>修改密码</b></caption>
<tr ><td >输入新密码：</td><td ><input type="password" name="password1"    ></td></tr>
<tr><td>再次输入密码：</td><td><input type="password" name="password2"  ></td></tr>
<tr><td><input type="submit"value="确定" name="submit" onClick="return gettrue(); "></td></tr>
</table>
</form>   
</td> 
<tr bgcolor="white" width="20%" height="60"><td bgcolor="" >教师管理系统</tr>
<tr><td bgcolor="white" width="20%" height="60">*<a href="teamesssel.jsp">个人信息</a></td></tr>
<tr><td bgcolor="white" width="20%" height="60">*<a href="teacourselect.jsp">课程信息</a></td></tr>
<tr><td bgcolor="white" width="20%" height="60">*<a href="teagradeinsert.jsp">录入成绩</a></td></tr>
<tr><td bgcolor="white" width="20%" height="60">*<a href="teagreadselect.jsp">成绩查询</a></td></tr>
<tr><td bgcolor="white" width="20%" height="60">*<a href="teacherchangesecret.jsp">密码修改</a></td></tr>*<a href="tzhuxiao.jsp">返回</a></td></tr>
</table>







</body>
</html>