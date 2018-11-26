<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>课程菜单</title>
</head>
<body>

<form    action="tongji.jsp" method="post" name="form">
<table  align="center" width="300" height="150"><tr><td   align="center">请选择查询的课程</td></tr>
<tr>
<td  align="center"> <select name="userselect">
          <option value="0">需求工程</option>
          <option value="1">大型数据库技术</option>
          
          </select>
    </td>
    
</tr>
<tr><td align="center"><input type="submit"name="submit" value="确定" ></td><td><a href="teacherindex.html">返回</td></tr>
</table>

</form>
</body>
</html>