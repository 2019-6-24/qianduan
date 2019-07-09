<%--
  Created by IntelliJ IDEA.
  User: 雷蕾
  Date: 2019/7/7
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <script>

        if(window.addEventListener){
            window.addEventListener("load",ajaxHouse,false);
        }
        else{
            window.attachEvent("onload",ajaxHouse());
        }

        function ajaxHouse() {
            var tarProvince = '<%=request.getParameter("province")%>';
            var tarCity = '<%=request.getParameter("city")%>';
            var tarArea = '<%=request.getParameter("area")%>';
            var keyWords = '<%=request.getParameter("keywords")%>';
            //TODO pageNum从本页面获取
            var pageNum = '<%=request.getParameter("pageNum")%>';
            //TODO test
            //alert("info_nei参数：" + tarProvince.value + tarCity.value + tarArea.value + keyWords.value+pageNum.value);
            alert("info_nei参数：" + tarProvince + tarCity + tarArea + keyWords + pageNum);

            if (tarCity.value != "城市") {//用户已经选择到了城市

                 $.ajax({
                    dataType: "json",
                    type: "POST",
                    data: {
                        province: tarProvince,
                        city: tarCity,
                        area: tarArea,
                        keywords: keyWords
                        //TODO 赋值pageNum
                    },
                    url: "http://localhost:8080/searchPage",
                    success: function (data) {
                        //TODO test
                        alert(data.toString());

                        //alert("成功匹配");
                        //跳转城市图表页面，传参
                        //window.location.href='/info_city.jsp?target='+chartsCity.value;
                    },
                    error: function () {
                        alert("请求出错");
                    }

                });
            } else {
                //用户没有选择到城市
                alert("请选择城市");
            }
        }
    </script>


    <title>搜索房源</title>
    <link rel="stylesheet" href="css/info_nei.css" media="all">
    <script type="text/javascript" src="Jquery/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src='Jquery/info_city.js'></script>
    <script type="text/javascript" src="Jquery/echarts.min.js"></script>
</head>
<body>
<div class="nav">
    <div class="nav_li">
        <ul>
            <li><a href="index.jsp">首页</a></li>
            <li><a href="info_city.jsp">信息查询</a></li>
            <li><a href="">预测分析</a></li>
            <li><a href="">关于我们</a></li>
        </ul>
    </div>
</div>

<!--筛选框-->
<div class="filter">
    <div class="container">
        <div class="box">
            <div class="title-h">按条件筛选</div>
            <dl>
                <dt>售价</dt>
                <dd>
                    <a href="#" rel="" name="price" class="all on">全部</a>
                    <a href="#" rel="80万以下" name="price" class="sx_child">80万以下</a>
                    <a href="#" rel="80-100万" name="price" class="sx_child">80-100万</a>
                    <a href="#" rel="100-150万" name="price" class="sx_child">100-150万</a>
                    <a href="#" rel="150-200万" name="price" class="sx_child">150-200万</a>
                    <a href="#" rel=" 200-300万" name="price" class="sx_child">200-300万</a>
                    <a href="#" rel=" 300万以上" name="price" class="sx_child">300万以上</a>
                </dd>
            </dl>
            <dl>
                <dt>房型</dt>
                <dd>
                    <a href="#" rel="" name="type" class="all on">全部</a>
                    <a href="#" rel="一室" name="type" class="sx_child">一室</a>
                    <a href="#" rel="二室" name="type" class="sx_child">二室</a>
                    <a href="#" rel="三室" name="type" class="sx_child">三室</a>
                    <a href="#" rel="四室" name="type" class="sx_child">四室</a>
                    <a href="#" rel="五室" name="type" class="sx_child">五室</a>
                </dd>
            </dl>
            <dl>
                <dt>面积</dt>
                <dd>
                    <a href="#" rel="" name="square" class="all on">全部</a>
                    <a href="#" rel="60㎡以下" name="square" class="sx_child">60㎡以下</a>
                    <a href="#" rel="60-90㎡" name="square" class="sx_child">60-90㎡</a>
                    <a href="#" rel="90-120㎡" name="square" class="sx_child">90-120㎡</a>
                    <a href="#" rel="120-140㎡" name="square" class="sx_child">120-140㎡</a>
                    <a href="#" rel="140-200㎡" name="square" class="sx_child">140-200㎡</a>
                    <a href="#" rel="200-300㎡" name="square" class="sx_child">200-300㎡</a>
                </dd>
            </dl>
            <dl>
                <dt>朝向</dt>
                <dd>
                    <a href="#" rel="" name="faceto" class="all on">全部</a>
                    <a href="#" rel="南北" name="faceto" class="sx_child">南北</a>
                    <a href="#" rel="朝南" name="faceto" class="sx_child">朝南</a>
                    <a href="#" rel="朝北" name="faceto" class="sx_child">朝东</a>
                    <a href="#" rel="朝西" name="faceto" class="sx_child">朝西</a>
                </dd>
            </dl>
        </div>
    </div>
</div>
<script src="Jquery/tagSelect.js"></script>
<script>
    $(function(){
        new SelectTag({
            child : ".sx_child", //所有筛选范围内的子类
            over : 'on', //选中状态样式名称
            all : ".all"
        });
    })
</script>





<div class="show" id="show1">
    <div class="img_nei">

    </div>

    <div class="name">
        保利城
    </div>
    <div class="type">
        <div class="pic"></div> 三室两厅
    </div>
    <div class="square">
        <div class="square_num">100</div>
        <div class="ping">平</div>
    </div>
    <div class="info">
        南XXXXX
    </div>
    <div class="price_all">
        <div class="total">1300</div>
        <div class="wan">万</div>
    </div>
    <div class="price_unit">
        <div class="one">12345</div>
        <div class="wanping">万/平</div>
    </div>
</div>

<div class="show" id="show2">
    <div class="img_nei">

    </div>

    <div class="name">
        清江山水
    </div>
    <div class="type">
        <div class="pic"></div> 三室两厅
    </div>
    <div class="info">
        南XXXXX
    </div>
    <div class="square">
        <div class="square_num">100</div>
        <div class="ping">平</div>
    </div>
    <div class="price_all">
        <div class="total">1300</div>
        <div class="wan">万</div>
    </div>
    <div class="price_unit">
        <div class="one">54321</div>
        <div class="wanping">万/平</div>
    </div>

</div>

<div class="show" id="show3">
    <div class="img_nei">

    </div>

    <div class="name">
        保利城
    </div>
    <div class="type">
        <div class="pic"></div> 三室两厅
    </div>
    <div class="square">
        <div class="square_num">100</div>
        <div class="ping">平</div>
    </div>
    <div class="info">
        南XXXXX
    </div>
    <div class="price_all">
        <div class="total">1300</div>
        <div class="wan">万</div>
    </div>
    <div class="price_unit">
        <div class="one">12345</div>
        <div class="wanping">万/平</div>
    </div>
</div>

<div class="show" id="show4">
    <div class="img_nei">

    </div>

    <div class="name">
        保利城
    </div>
    <div class="type">
        <div class="pic"></div> 三室两厅
    </div>
    <div class="square">
        <div class="square_num">100</div>
        <div class="ping">平</div>
    </div>
    <div class="info">
        南XXXXX
    </div>
    <div class="price_all">
        <div class="total">1300</div>
        <div class="wan">万</div>
    </div>
    <div class="price_unit">
        <div class="one">12345</div>
        <div class="wanping">万/平</div>
    </div>
</div>

<div class="show" id="show5">
    <div class="img_nei">

    </div>

    <div class="name">
        保利城
    </div>
    <div class="type">
        <div class="pic"></div> 三室两厅
    </div>
    <div class="square">
        <div class="square_num">100</div>
        <div class="ping">平</div>
    </div>
    <div class="info">
        南XXXXX
    </div>
    <div class="price_all">
        <div class="total">1300</div>
        <div class="wan">万</div>
    </div>
    <div class="price_unit">
        <div class="one">12345</div>
        <div class="wanping">万/平</div>
    </div>
</div>

<div class="show" id="show6">
    <div class="img_nei">

    </div>

    <div class="name">
        保利城
    </div>
    <div class="type">
        <div class="pic"></div> 三室两厅
    </div>
    <div class="square">
        <div class="square_num">100</div>
        <div class="ping">平</div>
    </div>
    <div class="info">
        南XXXXX
    </div>
    <div class="price_all">
        <div class="total">1300</div>
        <div class="wan">万</div>
    </div>
    <div class="price_unit">
        <div class="one">12345</div>
        <div class="wanping">万/平</div>
    </div>
</div>

<div class="show" id="show7">
    <div class="img_nei">

    </div>

    <div class="name">
        保利城
    </div>
    <div class="type">
        <div class="pic"></div> 三室两厅
    </div>
    <div class="square">
        <div class="square_num">100</div>
        <div class="ping">平</div>
    </div>
    <div class="info">
        南XXXXX
    </div>
    <div class="price_all">
        <div class="total">1300</div>
        <div class="wan">万</div>
    </div>
    <div class="price_unit">
        <div class="one">12345</div>
        <div class="wanping">万/平</div>
    </div>
</div>

<div class="show" id="show8">
    <div class="img_nei">

    </div>

    <div class="name">
        保利城
    </div>
    <div class="type">
        <div class="pic"></div> 三室两厅
    </div>
    <div class="square">
        <div class="square_num">100</div>
        <div class="ping">平</div>
    </div>
    <div class="info">
        南XXXXX
    </div>
    <div class="price_all">
        <div class="total">1300</div>
        <div class="wan">万</div>
    </div>
    <div class="price_unit">
        <div class="one">12345</div>
        <div class="wanping">万/平</div>
    </div>
</div>

<div class="show" id="show9">
    <div class="img_nei">

    </div>

    <div class="name">
        保利城
    </div>
    <div class="type">
        <div class="pic"></div> 三室两厅
    </div>
    <div class="square">
        <div class="square_num">100</div>
        <div class="ping">平</div>
    </div>
    <div class="info">
        南XXXXX
    </div>
    <div class="price_all">
        <div class="total">1300</div>
        <div class="wan">万</div>
    </div>
    <div class="price_unit">
        <div class="one">12345</div>
        <div class="wanping">万/平</div>
    </div>
</div>

<div class="show" id="show10">
    <div class="img_nei">

    </div>

    <div class="name">
        保利城
    </div>
    <div class="type">
        <div class="pic"></div> 三室两厅
    </div>
    <div class="square">
        <div class="square_num">100</div>
        <div class="ping">平</div>
    </div>
    <div class="info">
        南XXXXX
    </div>
    <div class="price_all">
        <div class="total">1300</div>
        <div class="wan">万</div>
    </div>
    <div class="price_unit">
        <div class="one">12345</div>
        <div class="wanping">万/平</div>
    </div>
</div>

<script>
    $(document).ready(function(){
        $(window).on('scroll',function(){
            var b=$(window).scrollTop();//获取滚动的高度
            var a=$("#show1").offset().top;//获取元素距离顶部的距离
            var c=a-400;
            if(c<b){
                $("#show1").animate({//标题动画
                    left:'350px',
                    opacity:'1',
                },'slow');
            }
        });
    });

    $(document).ready(function(){
        $(window).on('scroll',function(){
            var b=$(window).scrollTop();//获取滚动的高度
            var a=$("#show2").offset().top;//获取元素距离顶部的距离
            var c=a-600;
            if(c<b){
                $("#show2").animate({//标题动画
                    right:'350px',
                    opacity:'1',
                },'slow');
            }
        });
    });

    $(document).ready(function(){
        $(window).on('scroll',function(){
            var b=$(window).scrollTop();//获取滚动的高度
            var a=$("#show3").offset().top;//获取元素距离顶部的距离
            var c=a-600;
            if(c<b){
                $("#show3").animate({//标题动画
                    left:'350px',
                    opacity:'1',
                },'slow');
            }
        });
    });

    $(document).ready(function(){
        $(window).on('scroll',function(){
            var b=$(window).scrollTop();//获取滚动的高度
            var a=$("#show4").offset().top;//获取元素距离顶部的距离
            var c=a-600;
            if(c<b){
                $("#show4").animate({//标题动画
                    right:'350px',
                    opacity:'1',
                },'slow');
            }
        });
    });

    $(document).ready(function(){
        $(window).on('scroll',function(){
            var b=$(window).scrollTop();//获取滚动的高度
            var a=$("#show5").offset().top;//获取元素距离顶部的距离
            var c=a-600;
            if(c<b){
                $("#show5").animate({//标题动画
                    left:'350px',
                    opacity:'1',
                },'slow');
            }
        });
    });

    $(document).ready(function(){
        $(window).on('scroll',function(){
            var b=$(window).scrollTop();//获取滚动的高度
            var a=$("#show6").offset().top;//获取元素距离顶部的距离
            var c=a-600;
            if(c<b){
                $("#show6").animate({//标题动画
                    right:'350px',
                    opacity:'1',
                },'slow');
            }
        });
    });

    $(document).ready(function(){
        $(window).on('scroll',function(){
            var b=$(window).scrollTop();//获取滚动的高度
            var a=$("#show7").offset().top;//获取元素距离顶部的距离
            var c=a-600;
            if(c<b){
                $("#show7").animate({//标题动画
                    left:'350px',
                    opacity:'1',
                },'slow');
            }
        });
    });

    $(document).ready(function(){
        $(window).on('scroll',function(){
            var b=$(window).scrollTop();//获取滚动的高度
            var a=$("#show8").offset().top;//获取元素距离顶部的距离
            var c=a-600;
            if(c<b){
                $("#show8").animate({//标题动画
                    right:'350px',
                    opacity:'1',
                },'slow');
            }
        });
    });

    $(document).ready(function(){
        $(window).on('scroll',function(){
            var b=$(window).scrollTop();//获取滚动的高度
            var a=$("#show9").offset().top;//获取元素距离顶部的距离
            var c=a-600;
            if(c<b){
                $("#show9").animate({//标题动画
                    right:'350px',
                    opacity:'1',
                },'slow');
            }
        });
    });

    $(document).ready(function(){
        $(window).on('scroll',function(){
            var b=$(window).scrollTop();//获取滚动的高度
            var a=$("#show10").offset().top;//获取元素距离顶部的距离
            var c=a-600;
            if(c<b){
                $("#show10").animate({//标题动画
                    right:'350px',
                    opacity:'1',
                },'slow');
            }
        });
    });


</script>

<!--翻页-->
<script src="Jquery/page.js"></script>
<div class="zxy_pagediv" style="text-align: center"></div>
<script type="text/javascript">
    //翻页
    $(".zxy_pagediv").createPage({
        //pageNum: 20,
        pageNum: '<%=request.getParameter("pageNum")%>',
            /*
                尖括号%=request.getAttribute("num",变量名); %> 传参设定页面数
             */

        current: 1,
        backfun: function(e) {
            //console.log(e);//回调
        }
    });
</script>




<script src="Jquery/bgLine.js">  </script>
</body>
</html>
