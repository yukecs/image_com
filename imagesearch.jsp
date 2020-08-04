<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/1/2
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="servies.comservie"  %>
<%@page import="dao.sqlpinfo" %>
<%@ page import="com.alibaba.fastjson.JSONArray" %>
<link rel="stylesheet" href="imagecomstyle.css">

<%
    String Stype ="all";
    String pname=(String)request.getParameter("pname");
    String ptype=(String)request.getParameter("ptype");
    if(ptype.equals("all")){
        System.out.println("ptype是all");
    }else if (ptype.equals("person")){
        System.out.println("ptype是person");
        Stype ="person";
    }else if (ptype.equals("scenery")){
        System.out.println("ptype是scenery");
        Stype ="scenery";
    }else if (ptype.equals("animal")){
        System.out.println("ptype是animal");
        Stype ="animal";
    }else if (ptype.equals("abstract")){
        System.out.println("ptype是abstract");
        Stype ="abstract";
    }
    System.out.println("图片名:"+pname);
    System.out.println("类型:"+ptype);

    JSONArray pjsonarray=new comservie().getsomepicture(pname, Stype);
    int num=pjsonarray.size();
    System.out.println("图片数："+pjsonarray.size());
    for(int i=0;i<num;i++){
        System.out.println("图片id"+i+"的json："+pjsonarray.get(i));
    }
%>



<html>
<head>
    <title>查找</title>

    <script>
        window.onload=function () {

            var searchbtn=document.getElementById("searchbtn");
            var searchfrom=document.getElementById("searchform");

            searchbtn.addEventListener("click", function () {
                searchfrom.submit();
            })

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
<body>
<div class="navigationdiv">
    <div>
        <form action="imagesearch.jsp" id="searchform">

            <div class="selectdiv">
                <a href="upload.jsp">上传</a>
                <div class="select" tabindex="1">
                    <input class="selectopt" name="ptype" type="radio" id="opt1" value="all" checked>
                    <label for="opt1" class="option">所有</label>
                    <input class="selectopt" name="ptype" type="radio" id="opt2" value="person">
                    <label for="opt2" class="option">人物</label>
                    <input class="selectopt" name="ptype" type="radio" id="opt3" value="scenery">
                    <label for="opt3" class="option">风景</label>
                    <input class="selectopt" name="ptype" type="radio" id="opt4" value="animal">
                    <label for="opt4" class="option">动物</label>
                    <input class="selectopt" name="ptype" type="radio" id="opt5" value="abstract">
                    <label for="opt5" class="option">抽象</label>
                </div>
            </div>
            <input id="searchin" name="pname" type="text" placeholder="请输入想要搜索的内容">
        </form>

        <div class="rightdiv">
            <p id="searchbtn">搜索</p>
            <div class="indiv">
                <div class="login">
                    <a class="ac" href="register.html">sign in</a>
                </div>
                <div class="sign">
                    <a class="ac" href="login.html">login </a>
                </div>
            </div>
        </div>

    </div>

</div>


<div class="slidershow middle">

    <div class="slides">
        <input type="radio" name="r" id="r1" checked>
        <input type="radio" name="r" id="r2">
        <input type="radio" name="r" id="r3">
        <input type="radio" name="r" id="r4">
        <input type="radio" name="r" id="r5">
        <div class="slide s1">
            <img src="img/1.jpg" alt="">
        </div>
        <div class="slide">
            <img src="img/2.jpg" alt="">
        </div>
        <div class="slide">
            <img src="img/3.jpg" alt="">
        </div>
        <div class="slide">
            <img src="img/4.jpg" alt="">
        </div>
        <div class="slide">
            <img src="img/5.jpg" alt="">
        </div>
    </div>

    <div class="navigation">
        <label for="r1" class="bar"></label>
        <label for="r2" class="bar"></label>
        <label for="r3" class="bar"></label>
        <label for="r4" class="bar"></label>
        <label for="r5" class="bar"></label>
    </div>
</div>

<div class="container">

</div>

</body>
</html>
