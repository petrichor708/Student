<%--
  Created by IntelliJ IDEA.
  User: 大皙瓜
  Date: 2020/8/31
  Time: 22:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath=request.getScheme()+"://"+
            request.getServerName()+":"+request.getServerPort()+
            request.getContextPath()+"/";
%>
<html>
<head>
    <title>注册学生</title>
    <base href="<%=basePath%>"/>
</head>
<body>
<div align="center">
    <form action="student/addStudent.do">
        <table>
            <tr>
                <td>姓名：</td><td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>邮箱：</td><td><input type="text" name="email"></td>
            </tr>
            <tr>
                <td>年龄：</td><td><input type="text" name="age"></td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><input type="submit" value="注册"></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
