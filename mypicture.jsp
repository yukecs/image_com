<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/1/2
  Time: 19:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="servies.comservie"  %>
<%@page import="dao.sqlpinfo" %>
<%@ page import="com.alibaba.fastjson.JSONArray" %>
<link rel="stylesheet" href="imagecomstyle.css">

<%
    String uid=request.getParameter("uid");
    System.out.println(uid);
    JSONArray pjsonarray=new comservie().getuploadpicture(uid);
    int num=pjsonarray.size();
    System.out.println("图片数："+pjsonarray.size());
    for(int i=0;i<num;i++){
        System.out.println("图片id"+i+"的json："+pjsonarray.get(i));
    }
%>

<html>
<head>
    <title>Title</title>
    <script>
        window.onload=function () {
            var container=document.getElementsByClassName("container").item(0);
            for (var i=0;i< <%=num%>+0;i++){
                var newdiv=document.createElement("div");
                newdiv.className="item";
                container.appendChild(newdiv);
            }

            var ja=<%=pjsonarray%>;
            for(var i=0;i< <%=num%>;i++){
                var item = document.getElementsByClassName("item").item(0+i); //获得dom对象
                console.log(ja[i].psrc);
                var newimg = document.createElement("img");
                newimg.src="upload/"+ja[i].psrc;
                item.appendChild(newimg);  	//为dom添加子元素img
                var newh2=document.createElement("h2");
                newh2.innerHTML =ja[i].ptype;
                item.appendChild(newh2);
                var newp=document.createElement("p");
                newp.innerHTML =ja[i].pname;
                item.appendChild(newp);
            }

            // imgframe.innerText="<img src=\"upload/"+"9LVEdaQuLV.jpg"+"\">";

        }
    </script>
</head>
    <div class="container">

    </div>
<body>

</body>
</html>
