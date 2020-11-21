<%--
  Created by IntelliJ IDEA.
  User: 大皙瓜
  Date: 2020/9/1
  Time: 0:18
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
    <title>查询学生ajax</title>
    <base href="<%=basePath%>"/>
</head>
<body>
<script type="text/javascript">
    function ChaXun() {
        var xml = new XMLHttpRequest();
        xml.onreadystatechange = function () {
            if (xml.readyState == 3 && xml.status == 200) {
                //获得返回内容
                var data = xml.responseText;
                var data1;
                var jsonObj = eval("(" + data + ")");
                data=""
                for (var i=0;i<jsonObj.length;i++){
                    data1="<tr><td>"+jsonObj[i].id+"</td>"+"<td>"+jsonObj[i].name+"</td>"+"<td>"+jsonObj[i].email+"</td>"+"<td>"+jsonObj[i].age+"</td></tr>";
                    data=data+data1;
                    document.getElementById("info").innerHTML=data;
                }
            }
        }
        xml.open("get", "student/queryStudent.do" , true);
        xml.send();
    }
</script>
<div align="center">
    <table  border="1" cellspacing="0">
        <thead>
            <tr>
                <td>id</td>><td>姓名</td><td>邮件</td><td>年龄</td>
            </tr>
        </thead>
        <tbody id="info">

        </tbody>
    </table>
        <input type="button" id="id1" value="查询" onclick="ChaXun()"/>
</div>
</body>
</html>
