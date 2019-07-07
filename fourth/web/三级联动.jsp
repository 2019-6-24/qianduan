<%--
  Created by IntelliJ IDEA.
  User: 雷蕾
  Date: 2019/7/5
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <script type="text/javascript">
        //在jsp加载时调用函数
        if(window.addEventListener){
            //window.addEventListener("load",GetQueryString,false);
            window.addEventListener("load",getCity,false);
        }
        else{
            //window.attachEvent("onload",GetQueryString);
            window.attachEvent("onload",getCity());
        }

        /***
        function GetQueryString(name)
        {
            alert("计算");
            var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if(r!=null)return  unescape(r[2]); return null;

        }
         ****/
        //获取主页传来的城市参数，并向chartsCity发出ajax请求
        //根据servlet返回的值给控件赋值
        function getCity() {
            var target='<%=request.getParameter("target")%>'
            alert(target.toString());
            if(target !=null && target.toString().length>1)
            {
                $("#show").text(target.toString());
            }
        }
    </script>




    <title>全国城市三级联动</title>
    <style type="text/css">
        body{ background:#EEEEEE;margin:0; padding:0; font-family:"微软雅黑", Arial, Helvetica, sans-serif; }
        a{ color:#006600; text-decoration:none;}
        a:hover{color:#990000;}
        .top{ margin:5px auto; color:#990000; text-align:center;}
        .info select{ border:1px #993300 solid; background:#FFFFFF;}
        .info{ margin:5px; text-align:center;}
        .info #show{ color:#3399FF; }
        .bottom{ text-align:right; font-size:12px; color:#CCCCCC; width:1000px;}
    </style>
</head>
<body>
<div class="top">
    <h1>全国城市三级联动</h1>
</div>
<div class="info">
    <div>
        <select id="s_province" name="s_province"></select>
        <select id="s_city" name="s_city" ></select>
        <select id="s_county" name="s_county"></select>
        <script class="resources library" src="Jquery/area.js" type="text/javascript"></script>

        <script type="text/javascript">_init_area();</script>
    </div>

</div>
<output id="show">

</output>
<script type="text/javascript">
    var Gid  = document.getElementById ;
    var showArea = function(){
        Gid('show').innerHTML = "<h3>省" + Gid('s_province').value + " - 市" +
            Gid('s_city').value + " - 县/区" +
            Gid('s_county').value + "</h3>"
    }
    Gid('s_county').setAttribute('onchange','showArea()');
</script>




</body>


</html>