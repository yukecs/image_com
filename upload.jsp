<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/30
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="uploadstyle.css" type="text/css" rel="stylesheet">

<%
    HttpSession se = request.getSession();
    String id = (String) se.getAttribute("id");
%>

<html>
<head>
    <title>上传</title>
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <script>
            var uploadlimit=false;

            // function upload() {
            //     //	通过form表单的id获得form表单的对象（也就是把form表单转换成对象）
            //     if (document.getElementById("pimg").files.length == 0||uploadlimit==false) {
            //         alert("提示：请选择图片!");
            //         return false;
            //     }
            // }
            $(function () {

            //---
                var id="<%=id%>";
                if(id=="null"){
                    alert("请先登录!!");
                    window.location.href="login.html";
                }

                var test=document.getElementById("test");
                test.addEventListener("click", function () {
                    var uid_h=document.getElementById("uid_h");
                    alert(uid_h.value);
                })



                //

            var uploadsubmit=document.getElementById("uploadsubmit");
            // uploadsubmit.addEventListener("click",upload());
            var submitdiv=document.getElementById("submitdiv");
            var pimg = document.getElementById("pimg");
            var showimg = document.getElementById("showimg");
            pimg.addEventListener("change",function(){
                var reader = new FileReader();
                var file = pimg.files[0];
                alert((file.type).indexOf("image/"));
                if((file.type).indexOf("image/")==0)
                //测试是否为图片
                {
                    reader.readAsDataURL(pimg.files[0]);//发起异步请求
                    reader.onload = function(){
                        /*  alert(inputBox.files[0]);*/
                        //读取完成后，数据保存在对象的result属性中
                        alert("读取完成");
                        //测试是否为图片,是则显示
                        showimg.src = this.result;
                        // // uploadlimit=true;
                        // uploadsubmit.removeEventListener("click", upload());
                        uploadsubmit.type="submit";
                }
                }else{
                    alert("提示：请上传图片!");
                    // uploadlimit=false;
                    uploadsubmit.type="button";
                }

            })
        })


    </script>
</head>
<body>




<div class="userinfo">
    <img id="uimg">
    <p id="uid_p" >账号:<%=id%>
    </p>
</div>

<form action="mypicture.jsp">
    <input type="hidden" name="uid" value="<%=id%>">
    <input type="submit" value="我的图片">
</form>

<div class="imagecom"><a href="imagecom.jsp">返回主页</a></div>

<div class="uploaddiv">
    <form action="uploadservlet" enctype="multipart/form-data" method="post" id="pform">
        图片名:<input name="pname" value="imagename">
        分类:<select name="ptype">
        <option value="person">人物</option>
        <option value="scenery">风景</option>
        <option value="animal">动物</option>
        <option value="abstract">抽象</option>
        <option value="other">其他</option>
    </select>
        <input name="uid" id="uid_h"  value="<%=id%>" type="hidden">
        <input name="pimg" id="pimg" type="file">
        <div id="submitdiv" ><input id="uploadsubmit" type="button" value="上传" ></div>
    </form>
    <img src="" id="showimg">
</div>

<input value="查看id值" type="button" id="test">


</body>
</html>
