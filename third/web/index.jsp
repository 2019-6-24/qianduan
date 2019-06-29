<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/6/28
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <meta content="text/html;charset=utf-8">
    <title>珞珈山中介房价查询</title>
    <link rel="stylesheet" type="text/css" href="../css/index.css">
</head>
<body>
<form action="SearchAction.do" method="post">
    <div id="index">
    <img id="logo" src="../res/logo.jpg"  width="250" >
    <br><br>
        <li>
            <label>城市</label>
            <select name="city" id="city" onchange="showArea(this.value)">
                <option value="武汉">武汉</option>
                <option value="北京">北京</option>
                <option value="上海">上海</option>
                <option value="广州">广州</option>
                <option value="深圳">深圳</option>
            </select>
<!--
            <label>区域</label>
            <select name="area" id="area">
            <option value="d">武汉</option>
            <option value="d">北京</option>
            <option value="d">上海</option>
            <option value="d">广州</option>
            <option value="d">深圳</option>
            </select>

           <script type="text/javascript">
               function showArea(str) {
                   var xmlhttp;
                   if(str=="")
                   {
                       document.getElementById("area").innerHTML="";
                       return;
                   }
                   if(window.XMLHttpRequest)
                   {
                       xmlhttp=new XMLHttpRequest();
                   }
                   else
                   {
                       xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                   }
                   xmlhttp.onreadystatechange=function () {
                       if(xmlhttp.readyState==4&xmlhttp.status==200)
                       {
                           document.getElementById("area").innerHTML=xmlhttp.responseText;
                       }
                   }
                   xmlhttp.open("GET","/ajax/getArea.asp?q="+str,true);
                   xmlhttp.send();
               }
           </script>
-->

        </li>
    <input type="text" name="neibor" id="neibor" class="searchBox" >
    <br><br>
    <input class="a-upload" id="submit" type="submit" value="搜索">
    </div>
</form>
<%
    Object message =request.getAttribute("message");
    if(message!=null && !"".equals(message)){
        %>
<script type="text/javascript">
    alert("<%=message%>");
    </script>
<%} %>
</body>
</html>
