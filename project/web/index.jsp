<%--
  Created by IntelliJ IDEA.
  User: 雷蕾
  Date: 2019/7/2
  Time: 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>首页</title>
    <script type="text/javascript" src="./Jquery/jquery-3.3.1.min.js"></script>


  </head>
  <body id="by" style="overflow-y: hidden;">
  <style>
      * {
          margin: 0;
          padding: 0;
      }
      li {
          list-style: none
      }

      .clear {
           clear: both
       }

      .menus {
            width: 1300px;
            margin-top: 40px;
            margin-left: 100px;
        }

      .menus ul {
             width: 1300px;
             border-bottom: 2px solid #ff9900;
             position:relative;
             float:left
      }

      .menus li{
          float:left;
          width:150px;
          height:40px;
          line-height:40px;
          text-align:center;
          cursor:pointer;
          -webkit-transition:all .5s;
          -moz-transition:all .5s;
          -o-transition:all .5s;
          transition:all .5s
      }

      .menus li:nth-child(2){
          color:#fff
      }
      .bg {
          width: 150px;
          height: 40px;
          position: absolute;
          left: 0;
          top: 0;
          background: #ff9900;
          z-index:-1;
          -webkit-transition:all .5s;
          -moz-transition:all .5s;
          -o-transition:all .5s;
          transition:all .5s
      }

      .tab{
          width:1300px;
          height:650px;
          border:0px;
          margin-top: 20px;
          font-size: 40px;
          line-height: 500px;
          text-align: center;
          color: #888;
          font-weight:700;
          display:none
      }

      .show{
          display:block
      }

      .img{
          width: 1300px;
          height:650px;
          opacity: 0.9;
          position: relative;
      }

      .logo{
          width: 100px;
          height: 100px;
          vertical-align: middle;
          position: center;
          padding-top: 20px;

      }


      .searchBox:after {content:""; clear:both; display:table}
      .searchBox form {
          width: auto;
          float: right;
          margin-left:0px;
      }
      .searchBox input {
          width: 300px;
          height: 42px;
          padding-left: 15px;
          padding-right: 25px;
          border-radius: 42px;
          border: 2px solid #888888;
          opacity: 0.5;
          outline: none;
          position: relative;
          transition: .3s linear;
      }
      .searchBox input:focus {
          width: 350px;
      }
      .searchBox button {
          width: 42px;
          height: 50px;
          background:none;
          border: none;
          position: absolute;
          top: -7px;
          right: 0;
          cursor: pointer;
      }
      .searchBox button:before{
          content: "\f002";
          font-family: FontAwesome;
          background-image: url("images/search.png");
          background-size: 23px 23px;
          background-repeat: no-repeat;
          padding-right: 10px;
          z-index: 4;

      }


      form {
          position: relative;
      }


  </style>

  <script >
      $(function() {
          $('.menus0 li').each(function() {
              $('.menus0 li').mouseover(function() {
                  var index = $(this).index();
                  $('.menus0 .bg').css('left', (index - 1) * 150 + 'px');
                  $('.menus0 li').css('color', '#000');
                  $(this).css('color', '#fff');
              });
              $('.menus0 li').mouseout(function() {
                  $('.menus0 li').css('color', '#000');
                  $('.menus0 .bg').css('left', '0');
                  $('.menus0 li').eq(0).css('color', '#fff');
              });
          })
          $('.menus1 li').each(function() {
              var flag = 0;
              var i = 0;
              $('.menus1 li').mouseover(function() {
                  var index = $(this).index();
                  $('.menus1 .bg').css('left', (index - 1) * 150 + 'px');
                  $('.menus1 li').css('color', '#000');
                  $(this).css('color', '#fff');
                  $('.menus1 li').click(function() {
                      $('.menus1 .bg').css('left', (index - 1) * 150 + 'px');
                      flag = (index - 1) * 150;
                      i = $(this).index() - 1;
                      $(this).css('color', '#fff');
                  })
                  $('.menus1 li').mouseout(function() {
                      $('.menus1 .bg').css('left', flag + 'px');
                      $('.menus1 li').css('color', '#000');
                      $('.menus1 li').eq(i).css('color', '#fff');
                  });
              });
          })
          $('.menus2 li').each(function() {
              var flag = 0;
              var i = 0;
              $('.menus2 li').mouseover(function() {
                  var index = $(this).index();
                  $('.menus2 .bg').css('left', (index - 1) * 150 + 'px');
                  $('.menus2 li').css('color', '#000');
                  $(this).css('color', '#fff');
                  $('.menus2 li').click(function() {
                      $('.menus2 .bg').css('left', (index - 1) * 150 + 'px');
                      flag = (index - 1) * 150;
                      i = $(this).index() - 1;
                      $(this).css('color', '#fff');
                      $('.menus2 .menus-list').removeClass('show')
                      $('.menus2 .menus-list').eq(index - 1).addClass('show')
                      $('.tab1').removeClass('show')
                      $('.tab1').eq(index - 1).addClass('show')
                  })
                  $('.menus2 li').mouseout(function() {
                      $('.menus2 .bg').css('left', flag + 'px');
                      $('.menus2 li').css('color', '#000');
                      $('.menus2 li').eq(i).css('color', '#fff');
                  });
              });
          })
          $('.menus3 li').each(function() {
              $('.menus3 li').mouseover(function() {
                  var index = $(this).index();
                  $('.menus3 .bg').css('left', (index - 1) * 150 + 'px');
                  $('.menus3 li').css('color', '#000');
                  $(this).css('color', '#fff');
                  $('.tab2').removeClass('show')
                  $('.tab2').eq(index - 1).addClass('show')
              });
          })
      })
  </script>

  <div class="menus menus3">
      <ul>
          <div class="bg"></div>
          <li><span style="font-family: '微软雅黑'">信息查询</span></li>
          <li><span style="font-family: '微软雅黑'">搜索房源</span></li>
          <li><span style="font-family: '微软雅黑'">预测分析</span></li>
      </ul>
      <div class="clear"></div>
      <div class="tab tab2 show" style="position: relative">
          <div style="position: absolute;z-index:1">
              <img class="img" src="images/background3.jpg">
          </div>
          <div style="position: relative;z-index: 2;">

              <div style="width: 200px;height: 200px;position:absolute;">
                  <img class="logo" src="images/logo.png" >
              </div>

              <div style="width:500px;height: 200px; margin-left:0px;margin-top: 0px;position:absolute;z-index: 3;padding-top:0;">
                  <div style="margin-top: 0;margin-left: 0;width: 650px;height: 100px;font-family: 'Bradley Hand ITC';font-size: 50px">
                      Open the New World.
                  </div>
              </div>

              <div  class="search searchBox" style="margin-top:350px;width:250px;height:350px;position:absolute;text-align:center;padding-left: 250px; vertical-align:middle;">
                      <form>
                          <input type="text" placeholder="搜索从这里开始...">
                          <button type="submit"></button>
                      </form>

              </div>


          </div>

      </div>
      <div class="tab tab2" style="position: relative">
          <div style="position: absolute;z-index:1">
              <img class="img" src="images/background4.jpg">
          </div>
          <div style="position: relative;z-index: 2;">

              <div style="width: 200px;height: 200px;position:absolute;">
                  <img class="logo" src="images/logo.png" >
              </div>

              <div style="width:500px;height: 50px; margin-left:0px;margin-top: -40px;position:absolute;z-index: 3;padding-top:0;">
                  <div style="margin-top: 0;margin-left: 290px;width: 650px;height: 50px;font-family: 'Bradley Hand ITC';font-size: 50px">
                      Start your New Life.
                  </div>
              </div>

              <div  class="search searchBox" style="margin-top:280px;width:580px;height:350px;position:absolute;text-align:center;padding-left: 220px; vertical-align:middle;">
                  <form>
                      <input type="text" placeholder="搜索从这里开始...">
                      <button type="submit"></button>
                  </form>

              </div>
      </div>
      </div>
      <div class="tab tab2">
          <img class="img" src="images/background1.jpg">
      </div>

</div>

  <script>

      !
          function() {
              function n(n, e, t) {
                  return n.getAttribute(e) || t
              }
              function e(n) {
                  return document.getElementsByTagName(n)
              }
              function t() {
                  var t = e("script"),
                      o = t.length,
                      i = t[o - 1];
                  return {
                      l: o,
                      z: n(i, "zIndex", -1),
                      o: n(i, "opacity", .8),
                      c: n(i, "color", "0,0,0"),
                      n: n(i, "count", 200)
                  }
              }
              function o() {
                  a = m.width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth,
                      c = m.height = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight
              }
              function i() {
                  r.clearRect(0, 0, a, c);
                  var n, e, t, o, m, l;
                  s.forEach(function(i, x) {
                      for (i.x += i.xa, i.y += i.ya, i.xa *= i.x > a || i.x < 0 ? -1 : 1, i.ya *= i.y > c || i.y < 0 ? -1 : 1, r.fillRect(i.x - .5, i.y - .5, 1, 1), e = x + 1; e < u.length; e++) n = u[e],
                      null !== n.x && null !== n.y && (o = i.x - n.x, m = i.y - n.y, l = o * o + m * m, l < n.max && (n === y && l >= n.max / 2 && (i.x -= .03 * o, i.y -= .03 * m), t = (n.max - l) / n.max, r.beginPath(), r.lineWidth = t / 2, r.strokeStyle = "rgba(" + d.c + "," + (t + .2) + ")", r.moveTo(i.x, i.y), r.lineTo(n.x, n.y), r.stroke()))
                  }),
                      x(i)
              }
              var a, c, u, m = document.createElement("canvas"),
                  d = t(),
                  l = "c_n" + d.l,
                  r = m.getContext("2d"),
                  x = window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || window.oRequestAnimationFrame || window.msRequestAnimationFrame ||
                      function(n) {
                          window.setTimeout(n, 1e3 / 45)
                      },
                  w = Math.random,
                  y = {
                      x: null,
                      y: null,
                      max: 2e4
                  };
              m.id = l,
                  m.style.cssText = "position:fixed;top:0;left:0;z-index:" + d.z + ";opacity:" + d.o,
                  e("body")[0].appendChild(m),
                  o(),
                  window.onresize = o,
                  window.onmousemove = function(n) {
                      n = n || window.event,
                          y.x = n.clientX,
                          y.y = n.clientY
                  },
                  window.onmouseout = function() {
                      y.x = null,
                          y.y = null
                  };
              for (var s = [], f = 0; d.n > f; f++) {
                  var h = w() * a,
                      g = w() * c,
                      v = 2 * w() - 1,
                      p = 2 * w() - 1;
                  s.push({
                      x: h,
                      y: g,
                      xa: v,
                      ya: p,
                      max: 6e3
                  })
              }
              u = s.concat([y]),
                  setTimeout(function() {
                          i()
                      },
                      100)
          } ();
  </script>
  </body>
</html>
