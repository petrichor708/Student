<%--
  Created by IntelliJ IDEA.
  User: 大皙瓜
  Date: 2020/11/21
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改信息</title>
</head>
<body>
<script type="text/javascript">
    onload = function ChaXun() {
        var xml = new XMLHttpRequest();
        xml.onreadystatechange = function () {
            if (xml.readyState == 3 && xml.status == 200) {
                //获得返回内容
                var data = xml.responseText;
                var data1;
                var jsonObj = eval("(" + data + ")");
                data = ""
                for (var i = 0; i < jsonObj.length; i++) {
                    data1 = "<tr><td>" + jsonObj[i].id + "</td>" + "<td>" + jsonObj[i].name + "</td>" + "<td>" + jsonObj[i].email + "</td>" + "<td>" + jsonObj[i].age + "</td>" + "<td>" + "<a href=\"/ssm/student/deleteStudent.do?id="+jsonObj[i].id+"\">删除</a>"+"</td></tr>"
                    data = data + data1
                    document.getElementById("info").innerHTML = data
                }
            }
        }
        xml.open("get", "student/queryStudent.do", true);
        xml.send();
    }


    function ChaXun1() {
        var xml = new XMLHttpRequest();
        xml.onreadystatechange = function () {
            if (xml.readyState == 3 && xml.status == 200) {
                //获得返回内容
                var data = xml.responseText;
                var data1;
                var jsonObj = eval("(" + data + ")");
                document.getElementById("id").value=jsonObj.id
                document.getElementById("name").value=jsonObj.name
                document.getElementById("email").value=jsonObj.email
                document.getElementById("age").value=jsonObj.age
            }
        }
        xml.open("get", "student/queryStudentOne.do?id="+document.getElementById("id3").value, true);
        xml.send();
    }
</script>
<div align="center">

        <table  border="1" cellspacing="0">
            <thead>
            <tr>
                <td>id</td>
                <td>姓名</td>
                <td>邮件</td>
                <td>年龄</td>
                <td>操作</td>
            </tr>
            </thead>
            <tbody id="info">
            </tbody>
        </table>

    <input type="button" id="id1" value="刷新" onclick="ChaXun()"/>
    <br><br><br><br><br><br><br>
    输入你要修改的目标id：<input type="text" id="id3"/><input type="button" id="id2" value="查找" onclick="ChaXun1()"/>
    <form action="/ssm/student/updateStudent.do">
        id：<input type="text" id="id" name="id" readonly/>姓名：<input type="text" id="name" name="name"/>邮件：<input type="text" id="email" name="email"/>年龄：<input type="text" id="age" name="age"/>
        <input type="submit" value="修改"/>
    </form>
</div>
</body>
</html>
