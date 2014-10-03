<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:wb="http://open.weibo.com/wb">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--在页面中引入wb.js-->5
<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js?appkey=1106131078&debug=true" type="text/javascript" charset="utf-8"></script>
<script src="js/d3.js"></script>
<script src="js/d3.layout.cloud.js"></script>
<script>
function drawcloud(){
	var canvas=document.getElementById("main");//云区域
	var myHeight = canvas.scrollHeight; //高度
	var myWidth = canvas.scrollWidth; //宽度
	var colors = [ "rgb(9, 147, 134)", "rgb(255, 171, 32)",
				"rgb(97, 84, 255)" ];
				
	
	alert("高度："+myHeight+" "+"宽度："+myWidth+" "+"颜色："+colors[0]);
	
	var fill = d3.scale.category20();

  d3.layout.cloud().size([myWidth, myHeight])
      .words([
        "Hello", "world", "normally", "you", "want", "more", "words",
        "than", "this"].map(function(d) {
        return {text: d, size: 10 + Math.random() * 90};
      }))
      .padding(5)
      .rotate(function() { return ~~(Math.random() * 2) * 90; })
      .font("Impact")
      .fontSize(function(d) { return d.size; })
      .on("end", draw)
      .start();
	}
	
	
	  function draw(words) {
    d3.select("#main").append("svg")
        .attr("width", myWidth)
        .attr("height", myHeight)
      .append("g")
        .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")")
      .selectAll("text")
        .data(words)
      .enter().append("text")
        .style("font-size", function(d) { return d.size + "px"; })
        .style("font-family", "Impact")
        .style("fill", function(d, i) { return fill(i); })
        .attr("text-anchor", "middle")
        .attr("transform", function(d) {
          return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
        })
        .text(function(d) { return d.text; });
  }
</script>

<title>微词云主页</title>
<!-- 页面 CSS -->
    <link href="css/layout.css" rel="stylesheet">
<!-- Bootstrap core CSS -->
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/starter-template.css" rel="stylesheet">
    
	<link rel="icon" href="images/favicon.ico">
	
</head>

<body>
<!-- logo展示区 -->
<div id="container">
	<div id="header">
	  <div id="logo">
	    <img src="images/headbk.jpg">
	  </div>
	</div>
	<p id="fill">&nbsp;</p>
	<!-- 导航栏 -->

	<div id="nav">

	  <div class="nav_main">
	  <ul>
	    <li><a href="#"><span>首页</span></a></li>
		<li><a href="#"><span>词汇云</span></a></li>
		<li><a href="#"><span style="border-right:1px solid #000099">表情墙</span></a></li>
	  </ul>
	  </div>
	</div>
	<p id="fill">&nbsp;</p>
	<!-- 主要区域 -->
	<div id="maincontent">
	<!--生成区 -->
		<div id="main">
		<p id="fill">&nbsp;</p>
          <div id="main_produce">
	         <img src="images/main.png">
	      </div>
		 
		</div>
		<!-- 侧边栏区 -->
		<div id="side">
		   <div class="imagekuang">
		     
			 <div id="choose">
             <ul class="nav nav-pills">
                 <div id="wb_connect_btn" ></div>
                 <script>
    WB2.anyWhere(function (W) {
    W.widget.connectButton({
        id: "wb_connect_btn",
        type: '3,2',
        callback: {
            login: function (o) { //登录后的回调函数
                alert("login: " + o.screen_name)
            },
            logout: function () { //退出后的回调函数
                alert('logout');
            }
        }
    });
});</script>
                <input type=button onclick="window.open('https://api.weibo.com/2/oauth2/authorize?client_id=1106131078&response_type=code&redirect_uri=http://a.com:8080/weiciyun/newPage.jsp')" value="授权" class="btn btn-primary btn-lg">
                 <button id="wb_selector" type="button" class="btn btn-info">选择好友</button>
                 
                 <script>WB2.anyWhere(function(W){
    				W.widget.selector({
       				 id : "wb_selector",
		       		 limit:1		 
    				});
				});
					
					
					</script>
					
					
             </ul>
             <ul><% 
						
						if(request.getParameter("code")==null){
						out.print("未取得code");
					}else{
						out.print(request.getParameter("code"));
						session.setAttribute("code", request.getParameter("code"));
						}
					%></ul>
			 </div>
             <div id="firsta" class="btn-group">
		          <button type="button" id="generate" onclick="drawcloud()" class="btn btn-primary btn-lg" title="点我生成微词云">生成</button>
		         
				  <button type="button" id="share" class="btn btn-primary btn-lg" title="点我保存微词云">分享</button>
				  <wb:share-button type="button" size="middle"> </wb:share-button>
		     </div>
		     
			 
		  </div>
		
           
		 
		  
		 

		</div>
    </div>
	
<!-- 底部 -->	
<div id="footer">
<center>
            <p> 2013-2014 thunlp, all rights reserved. 南京航空航天大学<strong> · </strong>经济与管理学院
            </p>
            <p><a href="">团队介绍</a>      
			   <a href="" target="_blank">联系我们</a>
			</p>
			</center>
</div>
  </div>
</body>
</html>
